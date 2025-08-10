export PM_irand_timesync
code
proc PM_irand_timesync 8 4
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\bg_saber.c"
line 9
;1:#include "q_shared.h"
;2:#include "bg_public.h"
;3:#include "bg_local.h"
;4:#if JK2_CGAME
;5:#include "../cgame/cg_local.h"
;6:#endif
;7:
;8:int PM_irand_timesync(int val1, int val2,qboolean useDefault, int defaultValue)
;9:{
line 12
;10:	int i;
;11:
;12:	if (useDefault) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $95
line 19
;13://#ifdef DEBUG
;14://		// find bad calls: PM_irand_timesync\s*\([^,]+,\s*([^,\s]+)\s*,[^,]+,\s*\1\s*\)
;15://		if (defaultValue >= val2 || defaultValue < val1) {
;16://			Com_Printf("PM_irand_timesync(%d,%d,%d,%d), bad call", val1, val2, useDefault, defaultValue);
;17://		}
;18://#endif
;19:		return defaultValue;
ADDRFP4 12
INDIRI4
RETI4
ADDRGP4 $94
JUMPV
LABELV $95
line 22
;20:	}
;21:
;22:	i = (val1-1) + (Q_random( &pml.seed )*(val2 - val1)) + 1;
ADDRGP4 pml+1164
ARGP4
ADDRLP4 4
ADDRGP4 Q_random
CALLF4
ASGNF4
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1
SUBI4
CVIF4 4
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 23
;23:	if (i < val1)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
GEI4 $98
line 24
;24:	{
line 25
;25:		i = val1;
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
line 26
;26:	}
LABELV $98
line 27
;27:	if (i > val2)
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LEI4 $100
line 28
;28:	{
line 29
;29:		i = val2;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 30
;30:	}
LABELV $100
line 32
;31:
;32:	return i;
ADDRLP4 0
INDIRI4
RETI4
LABELV $94
endproc PM_irand_timesync 8 4
export BG_GetMovePhysics
proc BG_GetMovePhysics 0 0
line 36
;33:}
;34:
;35:int BG_GetMovePhysics(playerState_t* ps)
;36:{
line 37
;37:	if (!ps)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $103
line 38
;38:		return MV_JK2;
CNSTI4 0
RETI4
ADDRGP4 $102
JUMPV
LABELV $103
line 40
;39:#if JK2_GAME
;40:	if (ps->stats[STAT_RACEMODE])
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 0
EQI4 $105
line 41
;41:		return (ps->stats[STAT_MOVEMENTSTYLE]);
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
RETI4
ADDRGP4 $102
JUMPV
LABELV $105
line 59
;42:	//else if ((g_movementStyle.integer >= MV_SIEGE && g_movementStyle.integer <= MV_WSW) || g_movementStyle.integer == MV_SP)
;43:	//	return (g_movementStyle.integer);
;44:	//else if (g_movementStyle.integer < MV_SIEGE)
;45:	//	return 0;
;46:	//else if (g_movementStyle.integer >= MV_NUMSTYLES)
;47:	//	return MV_JK2;
;48:#elif JK2_CGAME
;49:	if (cgs.isJK2Pro) {
;50:		return ps->stats[STAT_MOVEMENTSTYLE];
;51:	}
;52:	if (cgs.isTommyTernal && ps->stats[STAT_RACEMODE]) {
;53:		if (!ps) return MV_JK2; // not sure why this is needed. from japro.
;54:		return ps->stats[STAT_MOVEMENTSTYLE];
;55:	}
;56:	//if (cgs.gametype == GT_SIEGE)
;57:	//	return MV_SIEGE;
;58:#endif
;59:	return MV_JK2; // this can happen when we die in racemode too!
CNSTI4 0
RETI4
LABELV $102
endproc BG_GetMovePhysics 0 0
export BG_ForcePowerDrain
proc BG_ForcePowerDrain 20 4
line 63
;60:}
;61:
;62:void BG_ForcePowerDrain( playerState_t *ps, forcePowers_t forcePower, int overrideAmt )
;63:{
line 65
;64:	//take away the power
;65:	int	drain = overrideAmt;
ADDRLP4 0
ADDRFP4 8
INDIRI4
ASGNI4
line 66
;66:	int moveStyle = BG_GetMovePhysics(ps);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BG_GetMovePhysics
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 76
;67:
;68:	/*
;69:	if (ps->powerups[PW_FORCE_BOON])
;70:	{
;71:		return;
;72:	}
;73:	*/
;74:	//No longer grant infinite force with boon.
;75:
;76:	if ( !drain )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $108
line 77
;77:	{
line 78
;78:		drain = forcePowerNeeded[ps->fd.forcePowerLevel[forcePower]][forcePower];
ADDRLP4 12
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 72
ADDRLP4 12
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 944
ADDP4
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
ADDP4
INDIRI4
ASGNI4
line 79
;79:	}
LABELV $108
line 80
;80:	if ( !drain )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $110
line 81
;81:	{
line 82
;82:		return;
ADDRGP4 $107
JUMPV
LABELV $110
line 85
;83:	}
;84:
;85:	if (forcePower == FP_LEVITATION && moveStyle != MV_CHARGEJUMP)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $112
ADDRLP4 4
INDIRI4
CNSTI4 12
EQI4 $112
line 86
;86:	{ //special case
line 87
;87:		int jumpDrain = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 89
;88:
;89:		if (ps->velocity[2] > 250)
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1132068864
LEF4 $114
line 90
;90:		{
line 91
;91:			jumpDrain = 20;
ADDRLP4 12
CNSTI4 20
ASGNI4
line 92
;92:		}
ADDRGP4 $115
JUMPV
LABELV $114
line 93
;93:		else if (ps->velocity[2] > 200)
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1128792064
LEF4 $116
line 94
;94:		{
line 95
;95:			jumpDrain = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
line 96
;96:		}
ADDRGP4 $117
JUMPV
LABELV $116
line 97
;97:		else if (ps->velocity[2] > 150)
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1125515264
LEF4 $118
line 98
;98:		{
line 99
;99:			jumpDrain = 12;
ADDRLP4 12
CNSTI4 12
ASGNI4
line 100
;100:		}
ADDRGP4 $119
JUMPV
LABELV $118
line 101
;101:		else if (ps->velocity[2] > 100)
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1120403456
LEF4 $120
line 102
;102:		{
line 103
;103:			jumpDrain = 8;
ADDRLP4 12
CNSTI4 8
ASGNI4
line 104
;104:		}
ADDRGP4 $121
JUMPV
LABELV $120
line 105
;105:		else if (ps->velocity[2] > 50)
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1112014848
LEF4 $122
line 106
;106:		{
line 107
;107:			jumpDrain = 6;
ADDRLP4 12
CNSTI4 6
ASGNI4
line 108
;108:		}
ADDRGP4 $123
JUMPV
LABELV $122
line 109
;109:		else if (ps->velocity[2] > 0)
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $124
line 110
;110:		{
line 111
;111:			jumpDrain = 4;
ADDRLP4 12
CNSTI4 4
ASGNI4
line 112
;112:		}
LABELV $124
LABELV $123
LABELV $121
LABELV $119
LABELV $117
LABELV $115
line 114
;113:
;114:		if (jumpDrain)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $126
line 115
;115:		{
line 116
;116:			jumpDrain /= ps->fd.forcePowerLevel[FP_LEVITATION];
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 948
ADDP4
INDIRI4
DIVI4
ASGNI4
line 117
;117:		}
LABELV $126
line 119
;118:
;119:		ps->fd.forcePower -= jumpDrain;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 120
;120:		if ( ps->fd.forcePower < 0 )
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
GEI4 $107
line 121
;121:		{
line 122
;122:			ps->fd.forcePower = 0;
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 0
ASGNI4
line 123
;123:		}
line 125
;124:
;125:		return;
ADDRGP4 $107
JUMPV
LABELV $112
line 128
;126:	}
;127:
;128:	ps->fd.forcePower -= drain;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 129
;129:	if ( ps->fd.forcePower < 0 )
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 0
GEI4 $130
line 130
;130:	{
line 131
;131:		ps->fd.forcePower = 0;
ADDRFP4 0
INDIRP4
CNSTI4 932
ADDP4
CNSTI4 0
ASGNI4
line 132
;132:	}
LABELV $130
line 133
;133:}
LABELV $107
endproc BG_ForcePowerDrain 20 4
export BG_EnoughForcePowerForMove
proc BG_EnoughForcePowerForMove 0 4
line 136
;134:
;135:qboolean BG_EnoughForcePowerForMove(int cost)
;136:{
line 137
;137:	if (pm->ps->fd.forcePower < cost)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
GEI4 $133
line 138
;138:	{
line 139
;139:		PM_AddEvent(EV_NOAMMO);
CNSTI4 22
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 140
;140:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $132
JUMPV
LABELV $133
line 143
;141:	}
;142:
;143:	return qtrue;
CNSTI4 1
RETI4
LABELV $132
endproc BG_EnoughForcePowerForMove 0 4
data
export saberMoveData
align 4
LABELV saberMoveData
address $135
byte 4 571
byte 4 1
byte 4 1
byte 4 0
byte 4 350
byte 4 0
byte 4 0
byte 4 0
byte 4 0
address $136
byte 4 573
byte 4 1
byte 4 1
byte 4 0
byte 4 350
byte 4 2
byte 4 1
byte 4 22
byte 4 0
address $137
byte 4 587
byte 4 1
byte 4 1
byte 4 2
byte 4 350
byte 4 0
byte 4 1
byte 4 22
byte 4 0
address $138
byte 4 588
byte 4 1
byte 4 1
byte 4 2
byte 4 350
byte 4 0
byte 4 1
byte 4 22
byte 4 0
address $139
byte 4 141
byte 4 4
byte 4 0
byte 4 10
byte 4 100
byte 4 1
byte 4 25
byte 4 25
byte 4 200
address $140
byte 4 139
byte 4 5
byte 4 1
byte 4 10
byte 4 100
byte 4 1
byte 4 26
byte 4 26
byte 4 200
address $141
byte 4 143
byte 4 6
byte 4 2
byte 4 10
byte 4 50
byte 4 1
byte 4 27
byte 4 27
byte 4 200
address $142
byte 4 142
byte 4 0
byte 4 4
byte 4 10
byte 4 100
byte 4 1
byte 4 28
byte 4 28
byte 4 200
address $143
byte 4 140
byte 4 1
byte 4 5
byte 4 10
byte 4 100
byte 4 1
byte 4 29
byte 4 29
byte 4 200
address $144
byte 4 144
byte 4 2
byte 4 6
byte 4 10
byte 4 100
byte 4 1
byte 4 30
byte 4 30
byte 4 200
address $145
byte 4 138
byte 4 3
byte 4 7
byte 4 10
byte 4 100
byte 4 1
byte 4 31
byte 4 31
byte 4 200
address $146
byte 4 564
byte 4 1
byte 4 1
byte 4 10
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $147
byte 4 565
byte 4 1
byte 4 1
byte 4 10
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $148
byte 4 570
byte 4 1
byte 4 1
byte 4 10
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $149
byte 4 569
byte 4 7
byte 4 3
byte 4 10
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $150
byte 4 568
byte 4 3
byte 4 7
byte 4 10
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $151
byte 4 567
byte 4 1
byte 4 3
byte 4 10
byte 4 100
byte 4 1
byte 4 1
byte 4 51
byte 4 200
address $152
byte 4 566
byte 4 5
byte 4 1
byte 4 10
byte 4 100
byte 4 1
byte 4 1
byte 4 40
byte 4 200
address $153
byte 4 190
byte 4 1
byte 4 4
byte 4 10
byte 4 100
byte 4 1
byte 4 4
byte 4 4
byte 4 200
address $154
byte 4 188
byte 4 1
byte 4 5
byte 4 10
byte 4 100
byte 4 1
byte 4 5
byte 4 5
byte 4 200
address $155
byte 4 192
byte 4 1
byte 4 6
byte 4 10
byte 4 100
byte 4 1
byte 4 6
byte 4 6
byte 4 200
address $156
byte 4 191
byte 4 1
byte 4 0
byte 4 10
byte 4 100
byte 4 1
byte 4 7
byte 4 7
byte 4 200
address $157
byte 4 189
byte 4 1
byte 4 1
byte 4 10
byte 4 100
byte 4 1
byte 4 8
byte 4 8
byte 4 200
address $158
byte 4 193
byte 4 1
byte 4 2
byte 4 10
byte 4 100
byte 4 1
byte 4 9
byte 4 9
byte 4 200
address $159
byte 4 187
byte 4 1
byte 4 3
byte 4 10
byte 4 100
byte 4 1
byte 4 10
byte 4 10
byte 4 200
address $160
byte 4 198
byte 4 0
byte 4 1
byte 4 2
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $161
byte 4 196
byte 4 1
byte 4 1
byte 4 2
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $162
byte 4 200
byte 4 2
byte 4 1
byte 4 2
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $163
byte 4 197
byte 4 4
byte 4 1
byte 4 2
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $164
byte 4 195
byte 4 5
byte 4 1
byte 4 2
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $165
byte 4 199
byte 4 6
byte 4 1
byte 4 2
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $166
byte 4 194
byte 4 7
byte 4 1
byte 4 2
byte 4 100
byte 4 1
byte 4 1
byte 4 1
byte 4 200
address $167
byte 4 145
byte 4 0
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 26
byte 4 8
byte 4 150
address $168
byte 4 172
byte 4 0
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 9
byte 4 150
address $169
byte 4 173
byte 4 0
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 10
byte 4 150
address $170
byte 4 146
byte 4 0
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 28
byte 4 4
byte 4 150
address $171
byte 4 147
byte 4 0
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 29
byte 4 5
byte 4 150
address $172
byte 4 148
byte 4 0
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 30
byte 4 6
byte 4 150
address $173
byte 4 174
byte 4 1
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 25
byte 4 7
byte 4 150
address $174
byte 4 149
byte 4 1
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 9
byte 4 150
address $175
byte 4 175
byte 4 1
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 10
byte 4 150
address $176
byte 4 150
byte 4 1
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 28
byte 4 4
byte 4 150
address $177
byte 4 151
byte 4 1
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 29
byte 4 5
byte 4 150
address $178
byte 4 152
byte 4 1
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 30
byte 4 6
byte 4 150
address $179
byte 4 153
byte 4 2
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 25
byte 4 7
byte 4 150
address $180
byte 4 176
byte 4 2
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 26
byte 4 8
byte 4 150
address $181
byte 4 177
byte 4 2
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 10
byte 4 150
address $182
byte 4 154
byte 4 2
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 28
byte 4 4
byte 4 150
address $183
byte 4 155
byte 4 2
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 29
byte 4 5
byte 4 150
address $184
byte 4 156
byte 4 2
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 30
byte 4 6
byte 4 150
address $185
byte 4 157
byte 4 3
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 25
byte 4 7
byte 4 150
address $186
byte 4 158
byte 4 3
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 26
byte 4 8
byte 4 150
address $187
byte 4 159
byte 4 3
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 9
byte 4 150
address $188
byte 4 160
byte 4 3
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 28
byte 4 4
byte 4 150
address $189
byte 4 161
byte 4 3
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 29
byte 4 5
byte 4 150
address $190
byte 4 162
byte 4 3
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 30
byte 4 6
byte 4 150
address $191
byte 4 163
byte 4 4
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 25
byte 4 7
byte 4 150
address $192
byte 4 178
byte 4 4
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 26
byte 4 8
byte 4 150
address $193
byte 4 179
byte 4 4
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 9
byte 4 150
address $194
byte 4 180
byte 4 4
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 10
byte 4 150
address $195
byte 4 181
byte 4 4
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 29
byte 4 5
byte 4 150
address $196
byte 4 164
byte 4 4
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 30
byte 4 6
byte 4 150
address $197
byte 4 165
byte 4 5
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 25
byte 4 7
byte 4 150
address $198
byte 4 166
byte 4 5
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 26
byte 4 8
byte 4 150
address $199
byte 4 182
byte 4 5
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 9
byte 4 150
address $200
byte 4 183
byte 4 5
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 10
byte 4 150
address $201
byte 4 167
byte 4 5
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 28
byte 4 4
byte 4 150
address $202
byte 4 184
byte 4 5
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 30
byte 4 6
byte 4 150
address $203
byte 4 168
byte 4 6
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 25
byte 4 7
byte 4 150
address $204
byte 4 169
byte 4 6
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 26
byte 4 8
byte 4 150
address $205
byte 4 170
byte 4 6
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 9
byte 4 150
address $206
byte 4 185
byte 4 6
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 10
byte 4 150
address $207
byte 4 186
byte 4 6
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 28
byte 4 4
byte 4 150
address $208
byte 4 171
byte 4 6
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 29
byte 4 5
byte 4 150
address $209
byte 4 201
byte 4 0
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 25
byte 4 33
byte 4 150
address $210
byte 4 202
byte 4 1
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 26
byte 4 42
byte 4 150
address $211
byte 4 203
byte 4 2
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 47
byte 4 150
address $212
byte 4 204
byte 4 3
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 55
byte 4 150
address $213
byte 4 205
byte 4 4
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 28
byte 4 58
byte 4 150
address $214
byte 4 206
byte 4 5
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 29
byte 4 63
byte 4 150
address $215
byte 4 207
byte 4 6
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 30
byte 4 70
byte 4 150
address $216
byte 4 208
byte 4 0
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 25
byte 4 33
byte 4 150
address $217
byte 4 209
byte 4 1
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 26
byte 4 42
byte 4 150
address $218
byte 4 210
byte 4 2
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 47
byte 4 150
address $219
byte 4 204
byte 4 3
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 55
byte 4 150
address $220
byte 4 211
byte 4 4
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 28
byte 4 58
byte 4 150
address $221
byte 4 212
byte 4 5
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 29
byte 4 63
byte 4 150
address $222
byte 4 213
byte 4 6
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 30
byte 4 70
byte 4 150
address $223
byte 4 214
byte 4 7
byte 4 7
byte 4 10
byte 4 100
byte 4 0
byte 4 27
byte 4 55
byte 4 150
address $224
byte 4 534
byte 4 0
byte 4 0
byte 4 10
byte 4 100
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $225
byte 4 535
byte 4 1
byte 4 1
byte 4 10
byte 4 100
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $226
byte 4 536
byte 4 2
byte 4 2
byte 4 10
byte 4 100
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $227
byte 4 537
byte 4 3
byte 4 3
byte 4 10
byte 4 100
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $228
byte 4 538
byte 4 4
byte 4 4
byte 4 10
byte 4 100
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $229
byte 4 539
byte 4 5
byte 4 5
byte 4 10
byte 4 100
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $230
byte 4 540
byte 4 6
byte 4 6
byte 4 10
byte 4 100
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $231
byte 4 541
byte 4 7
byte 4 7
byte 4 10
byte 4 100
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $232
byte 4 542
byte 4 3
byte 4 7
byte 4 10
byte 4 50
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $233
byte 4 543
byte 4 2
byte 4 6
byte 4 10
byte 4 50
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $234
byte 4 544
byte 4 4
byte 4 0
byte 4 10
byte 4 50
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $235
byte 4 545
byte 4 6
byte 4 2
byte 4 10
byte 4 50
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $236
byte 4 546
byte 4 7
byte 4 3
byte 4 10
byte 4 50
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $237
byte 4 547
byte 4 0
byte 4 4
byte 4 10
byte 4 50
byte 4 0
byte 4 1
byte 4 1
byte 4 150
address $238
byte 4 528
byte 4 1
byte 4 3
byte 4 10
byte 4 50
byte 4 2
byte 4 27
byte 4 50
byte 4 150
address $239
byte 4 529
byte 4 1
byte 4 2
byte 4 10
byte 4 50
byte 4 2
byte 4 27
byte 4 45
byte 4 150
address $240
byte 4 530
byte 4 1
byte 4 4
byte 4 10
byte 4 50
byte 4 2
byte 4 28
byte 4 60
byte 4 150
address $241
byte 4 531
byte 4 1
byte 4 6
byte 4 10
byte 4 50
byte 4 2
byte 4 25
byte 4 72
byte 4 150
address $242
byte 4 533
byte 4 1
byte 4 0
byte 4 10
byte 4 50
byte 4 2
byte 4 30
byte 4 33
byte 4 150
address $243
byte 4 523
byte 4 1
byte 4 3
byte 4 10
byte 4 50
byte 4 2
byte 4 27
byte 4 10
byte 4 150
address $244
byte 4 524
byte 4 1
byte 4 4
byte 4 10
byte 4 50
byte 4 2
byte 4 27
byte 4 9
byte 4 150
address $245
byte 4 525
byte 4 1
byte 4 2
byte 4 10
byte 4 50
byte 4 2
byte 4 28
byte 4 4
byte 4 150
address $246
byte 4 526
byte 4 1
byte 4 0
byte 4 10
byte 4 50
byte 4 2
byte 4 25
byte 4 7
byte 4 150
address $247
byte 4 527
byte 4 1
byte 4 6
byte 4 10
byte 4 50
byte 4 2
byte 4 30
byte 4 6
byte 4 150
address $248
byte 4 523
byte 4 1
byte 4 3
byte 4 10
byte 4 50
byte 4 2
byte 4 27
byte 4 10
byte 4 300
address $249
byte 4 525
byte 4 1
byte 4 2
byte 4 10
byte 4 50
byte 4 2
byte 4 28
byte 4 4
byte 4 300
address $250
byte 4 524
byte 4 1
byte 4 4
byte 4 10
byte 4 50
byte 4 2
byte 4 27
byte 4 9
byte 4 300
address $251
byte 4 527
byte 4 1
byte 4 6
byte 4 10
byte 4 50
byte 4 2
byte 4 30
byte 4 6
byte 4 300
address $252
byte 4 526
byte 4 1
byte 4 0
byte 4 10
byte 4 50
byte 4 2
byte 4 25
byte 4 7
byte 4 300
address $253
byte 4 905
byte 4 1
byte 4 4
byte 4 10
byte 4 100
byte 4 1
byte 4 1
byte 4 4
byte 4 200
address $254
byte 4 906
byte 4 1
byte 4 2
byte 4 10
byte 4 100
byte 4 1
byte 4 1
byte 4 9
byte 4 200
export transitionMove
align 4
LABELV transitionMove
byte 4 0
byte 4 32
byte 4 33
byte 4 34
byte 4 35
byte 4 36
byte 4 37
byte 4 0
byte 4 38
byte 4 0
byte 4 39
byte 4 40
byte 4 41
byte 4 42
byte 4 43
byte 4 0
byte 4 44
byte 4 45
byte 4 0
byte 4 46
byte 4 47
byte 4 48
byte 4 49
byte 4 0
byte 4 50
byte 4 51
byte 4 52
byte 4 0
byte 4 53
byte 4 54
byte 4 55
byte 4 0
byte 4 56
byte 4 57
byte 4 58
byte 4 59
byte 4 0
byte 4 60
byte 4 61
byte 4 0
byte 4 62
byte 4 63
byte 4 64
byte 4 65
byte 4 66
byte 4 0
byte 4 67
byte 4 0
byte 4 68
byte 4 69
byte 4 70
byte 4 71
byte 4 72
byte 4 73
byte 4 0
byte 4 0
byte 4 68
byte 4 32
byte 4 33
byte 4 34
byte 4 35
byte 4 36
byte 4 37
byte 4 0
export PM_AttackMoveForQuad
code
proc PM_AttackMoveForQuad 4 0
line 396
;144:}
;145:
;146:// Silly, but I'm replacing these macros so they are shorter!
;147:#define AFLAG_IDLE	(SETANIM_FLAG_NORMAL)
;148:#define AFLAG_ACTIVE (/*SETANIM_FLAG_OVERRIDE | */SETANIM_FLAG_HOLD | SETANIM_FLAG_HOLDLESS)
;149:#define AFLAG_WAIT (SETANIM_FLAG_HOLD | SETANIM_FLAG_HOLDLESS)
;150:#define AFLAG_FINISH (SETANIM_FLAG_HOLD)
;151:
;152:saberMoveData_t	saberMoveData[LS_MOVE_MAX] = {//							NB:randomized
;153:	// name			anim				startQ	endQ	setanimflag		blend,	blocking	chain_idle		chain_attack	trailLen
;154:	{"None",		BOTH_STAND1,		Q_R,	Q_R,	AFLAG_IDLE,		350,	BLK_NO,		LS_NONE,		LS_NONE,		0	},	// LS_NONE		= 0,
;155:
;156:	// General movements with saber
;157:	{"Ready",		BOTH_STAND2,		Q_R,	Q_R,	AFLAG_IDLE,		350,	BLK_WIDE,	LS_READY,		LS_S_R2L,		0	},	// LS_READY,
;158:	{"Draw",		BOTH_STAND1TO2,		Q_R,	Q_R,	AFLAG_FINISH,	350,	BLK_NO,		LS_READY,		LS_S_R2L,		0	},	// LS_DRAW,
;159:	{"Putaway",		BOTH_STAND2TO1,		Q_R,	Q_R,	AFLAG_FINISH,	350,	BLK_NO,		LS_READY,		LS_S_R2L,		0	},	// LS_PUTAWAY,
;160:
;161:	// Attacks
;162:	//UL2LR
;163:	{"TL2BR Att",	BOTH_A1_TL_BR,		Q_TL,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_R_TL2BR,		LS_R_TL2BR,		200	},	// LS_A_TL2BR
;164:	//SLASH LEFT
;165:	{"L2R Att",		BOTH_A1__L__R,		Q_L,	Q_R,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_R_L2R,		LS_R_L2R,		200 },	// LS_A_L2R
;166:	//LL2UR
;167:	{"BL2TR Att",	BOTH_A1_BL_TR,		Q_BL,	Q_TR,	AFLAG_ACTIVE,	50,		BLK_TIGHT,	LS_R_BL2TR,		LS_R_BL2TR,		200	},	// LS_A_BL2TR
;168:	//LR2UL
;169:	{"BR2TL Att",	BOTH_A1_BR_TL,		Q_BR,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_R_BR2TL,		LS_R_BR2TL,		200	},	// LS_A_BR2TL
;170:	//SLASH RIGHT
;171:	{"R2L Att",		BOTH_A1__R__L,		Q_R,	Q_L,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_R_R2L,		LS_R_R2L,		200 },// LS_A_R2L
;172:	//UR2LL
;173:	{"TR2BL Att",	BOTH_A1_TR_BL,		Q_TR,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_R_TR2BL,		LS_R_TR2BL,		200	},	// LS_A_TR2BL
;174:	//SLASH DOWN
;175:	{"T2B Att",		BOTH_A1_T__B_,		Q_T,	Q_B,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_R_T2B,		LS_R_T2B,		200	},	// LS_A_T2B
;176:	//special attacks
;177:	{"Back Stab",	BOTH_A2_STABBACK1,	Q_R,	Q_R,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_A_BACKSTAB
;178:	{"Back Att",	BOTH_ATTACK_BACK,	Q_R,	Q_R,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_A_BACK
;179:	{"CR Back Att",	BOTH_CROUCHATTACKBACK1,Q_R,	Q_R,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_A_BACK_CR
;180:	{"Lunge Att",	BOTH_LUNGE2_B__T_,	Q_B,	Q_T,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_A_LUNGE
;181:	{"Jump Att",	BOTH_FORCELEAP2_T__B_,Q_T,	Q_B,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_A_JUMP_T__B_
;182:	{"Flip Stab",	BOTH_JUMPFLIPSTABDOWN,Q_R,	Q_T,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_READY,		LS_T1_T___R,	200	},	// LS_A_FLIP_STAB
;183:	{"Flip Slash",	BOTH_JUMPFLIPSLASHDOWN1,Q_L,Q_R,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_READY,		LS_T1__R_T_,	200	},	// LS_A_FLIP_SLASH
;184:
;185:	//starts
;186:	{"TL2BR St",	BOTH_S1_S1_TL,		Q_R,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_A_TL2BR,		LS_A_TL2BR,		200	},	// LS_S_TL2BR
;187:	{"L2R St",		BOTH_S1_S1__L,		Q_R,	Q_L,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_A_L2R,		LS_A_L2R,		200	},	// LS_S_L2R
;188:	{"BL2TR St",	BOTH_S1_S1_BL,		Q_R,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_A_BL2TR,		LS_A_BL2TR,		200	},	// LS_S_BL2TR
;189:	{"BR2TL St",	BOTH_S1_S1_BR,		Q_R,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_A_BR2TL,		LS_A_BR2TL,		200	},	// LS_S_BR2TL
;190:	{"R2L St",		BOTH_S1_S1__R,		Q_R,	Q_R,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_A_R2L,		LS_A_R2L,		200	},	// LS_S_R2L
;191:	{"TR2BL St",	BOTH_S1_S1_TR,		Q_R,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_A_TR2BL,		LS_A_TR2BL,		200	},	// LS_S_TR2BL
;192:	{"T2B St",		BOTH_S1_S1_T_,		Q_R,	Q_T,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_A_T2B,		LS_A_T2B,		200	},	// LS_S_T2B
;193:	
;194:	//returns
;195:	{"TL2BR Ret",	BOTH_R1_BR_S1,		Q_BR,	Q_R,	AFLAG_FINISH,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_R_TL2BR
;196:	{"L2R Ret",		BOTH_R1__R_S1,		Q_R,	Q_R,	AFLAG_FINISH,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_R_L2R
;197:	{"BL2TR Ret",	BOTH_R1_TR_S1,		Q_TR,	Q_R,	AFLAG_FINISH,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_R_BL2TR
;198:	{"BR2TL Ret",	BOTH_R1_TL_S1,		Q_TL,	Q_R,	AFLAG_FINISH,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_R_BR2TL
;199:	{"R2L Ret",		BOTH_R1__L_S1,		Q_L,	Q_R,	AFLAG_FINISH,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_R_R2L
;200:	{"TR2BL Ret",	BOTH_R1_BL_S1,		Q_BL,	Q_R,	AFLAG_FINISH,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_R_TR2BL
;201:	{"T2B Ret",		BOTH_R1_B__S1,		Q_B,	Q_R,	AFLAG_FINISH,	100,	BLK_TIGHT,	LS_READY,		LS_READY,		200	},	// LS_R_T2B
;202:
;203:	//Transitions
;204:	{"BR2R Trans",	BOTH_T1_BR__R,		Q_BR,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_L2R,		LS_A_R2L,		150	},	//# Fast arc bottom right to right
;205:	{"BR2TR Trans",	BOTH_T1_BR_TR,		Q_BR,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_TR2BL,		150	},	//# Fast arc bottom right to top right		(use: BOTH_T1_TR_BR)
;206:	{"BR2T Trans",	BOTH_T1_BR_T_,		Q_BR,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_T2B,		150	},	//# Fast arc bottom right to top			(use: BOTH_T1_T__BR)
;207:	{"BR2TL Trans",	BOTH_T1_BR_TL,		Q_BR,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BR2TL,		LS_A_TL2BR,		150	},	//# Fast weak spin bottom right to top left
;208:	{"BR2L Trans",	BOTH_T1_BR__L,		Q_BR,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_R2L,		LS_A_L2R,		150	},	//# Fast weak spin bottom right to left
;209:	{"BR2BL Trans",	BOTH_T1_BR_BL,		Q_BR,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TR2BL,		LS_A_BL2TR,		150	},	//# Fast weak spin bottom right to bottom left
;210:	{"R2BR Trans",	BOTH_T1__R_BR,		Q_R,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TL2BR,		LS_A_BR2TL,		150	},	//# Fast arc right to bottom right			(use: BOTH_T1_BR__R)
;211:	{"R2TR Trans",	BOTH_T1__R_TR,		Q_R,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_TR2BL,		150	},	//# Fast arc right to top right
;212:	{"R2T Trans",	BOTH_T1__R_T_,		Q_R,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_T2B,		150	},	//# Fast ar right to top				(use: BOTH_T1_T___R)
;213:	{"R2TL Trans",	BOTH_T1__R_TL,		Q_R,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BR2TL,		LS_A_TL2BR,		150	},	//# Fast arc right to top left
;214:	{"R2L Trans",	BOTH_T1__R__L,		Q_R,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_R2L,		LS_A_L2R,		150	},	//# Fast weak spin right to left
;215:	{"R2BL Trans",	BOTH_T1__R_BL,		Q_R,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TR2BL,		LS_A_BL2TR,		150	},	//# Fast weak spin right to bottom left
;216:	{"TR2BR Trans",	BOTH_T1_TR_BR,		Q_TR,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TL2BR,		LS_A_BR2TL,		150	},	//# Fast arc top right to bottom right
;217:	{"TR2R Trans",	BOTH_T1_TR__R,		Q_TR,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_L2R,		LS_A_R2L,		150	},	//# Fast arc top right to right			(use: BOTH_T1__R_TR)
;218:	{"TR2T Trans",	BOTH_T1_TR_T_,		Q_TR,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_T2B,		150	},	//# Fast arc top right to top				(use: BOTH_T1_T__TR)
;219:	{"TR2TL Trans",	BOTH_T1_TR_TL,		Q_TR,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BR2TL,		LS_A_TL2BR,		150	},	//# Fast arc top right to top left
;220:	{"TR2L Trans",	BOTH_T1_TR__L,		Q_TR,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_R2L,		LS_A_L2R,		150	},	//# Fast arc top right to left
;221:	{"TR2BL Trans",	BOTH_T1_TR_BL,		Q_TR,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TR2BL,		LS_A_BL2TR,		150	},	//# Fast weak spin top right to bottom left
;222:	{"T2BR Trans",	BOTH_T1_T__BR,		Q_T,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TL2BR,		LS_A_BR2TL,		150	},	//# Fast arc top to bottom right
;223:	{"T2R Trans",	BOTH_T1_T___R,		Q_T,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_L2R,		LS_A_R2L,		150	},	//# Fast arc top to right
;224:	{"T2TR Trans",	BOTH_T1_T__TR,		Q_T,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_TR2BL,		150	},	//# Fast arc top to top right
;225:	{"T2TL Trans",	BOTH_T1_T__TL,		Q_T,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BR2TL,		LS_A_TL2BR,		150	},	//# Fast arc top to top left
;226:	{"T2L Trans",	BOTH_T1_T___L,		Q_T,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_R2L,		LS_A_L2R,		150	},	//# Fast arc top to left
;227:	{"T2BL Trans",	BOTH_T1_T__BL,		Q_T,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TR2BL,		LS_A_BL2TR,		150	},	//# Fast arc top to bottom left
;228:	{"TL2BR Trans",	BOTH_T1_TL_BR,		Q_TL,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TL2BR,		LS_A_BR2TL,		150	},	//# Fast weak spin top left to bottom right
;229:	{"TL2R Trans",	BOTH_T1_TL__R,		Q_TL,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_L2R,		LS_A_R2L,		150	},	//# Fast arc top left to right			(use: BOTH_T1__R_TL)
;230:	{"TL2TR Trans",	BOTH_T1_TL_TR,		Q_TL,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_TR2BL,		150	},	//# Fast arc top left to top right			(use: BOTH_T1_TR_TL)
;231:	{"TL2T Trans",	BOTH_T1_TL_T_,		Q_TL,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_T2B,		150	},	//# Fast arc top left to top				(use: BOTH_T1_T__TL)
;232:	{"TL2L Trans",	BOTH_T1_TL__L,		Q_TL,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_R2L,		LS_A_L2R,		150	},	//# Fast arc top left to left				(use: BOTH_T1__L_TL)
;233:	{"TL2BL Trans",	BOTH_T1_TL_BL,		Q_TL,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TR2BL,		LS_A_BL2TR,		150	},	//# Fast arc top left to bottom left
;234:	{"L2BR Trans",	BOTH_T1__L_BR,		Q_L,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TL2BR,		LS_A_BR2TL,		150	},	//# Fast weak spin left to bottom right
;235:	{"L2R Trans",	BOTH_T1__L__R,		Q_L,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_L2R,		LS_A_R2L,		150	},	//# Fast weak spin left to right
;236:	{"L2TR Trans",	BOTH_T1__L_TR,		Q_L,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_TR2BL,		150	},	//# Fast arc left to top right			(use: BOTH_T1_TR__L)
;237:	{"L2T Trans",	BOTH_T1__L_T_,		Q_L,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_T2B,		150	},	//# Fast arc left to top				(use: BOTH_T1_T___L)
;238:	{"L2TL Trans",	BOTH_T1__L_TL,		Q_L,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BR2TL,		LS_A_TL2BR,		150	},	//# Fast arc left to top left
;239:	{"L2BL Trans",	BOTH_T1__L_BL,		Q_L,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TR2BL,		LS_A_BL2TR,		150	},	//# Fast arc left to bottom left			(use: BOTH_T1_BL__L)
;240:	{"BL2BR Trans",	BOTH_T1_BL_BR,		Q_BL,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TL2BR,		LS_A_BR2TL,		150	},	//# Fast weak spin bottom left to bottom right
;241:	{"BL2R Trans",	BOTH_T1_BL__R,		Q_BL,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_L2R,		LS_A_R2L,		150	},	//# Fast weak spin bottom left to right
;242:	{"BL2TR Trans",	BOTH_T1_BL_TR,		Q_BL,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_TR2BL,		150	},	//# Fast weak spin bottom left to top right
;243:	{"BL2T Trans",	BOTH_T1_BL_T_,		Q_BL,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_A_T2B,		150	},	//# Fast arc bottom left to top			(use: BOTH_T1_T__BL)
;244:	{"BL2TL Trans",	BOTH_T1_BL_TL,		Q_BL,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BR2TL,		LS_A_TL2BR,		150	},	//# Fast arc bottom left to top left		(use: BOTH_T1_TL_BL)
;245:	{"BL2L Trans",	BOTH_T1_BL__L,		Q_BL,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_R2L,		LS_A_L2R,		150	},	//# Fast arc bottom left to left
;246:
;247:	//Bounces
;248:	{"Bounce BR",	BOTH_B1_BR___,		Q_BR,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TL2BR,		LS_T1_BR_TR,	150	},	
;249:	{"Bounce R",	BOTH_B1__R___,		Q_R,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_L2R,		LS_T1__R__L,	150	},	
;250:	{"Bounce TR",	BOTH_B1_TR___,		Q_TR,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_T1_TR_TL,	150	},	
;251:	{"Bounce T",	BOTH_B1_T____,		Q_T,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_T1_T__BL,	150	},	
;252:	{"Bounce TL",	BOTH_B1_TL___,		Q_TL,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BR2TL,		LS_T1_TL_TR,	150	},	
;253:	{"Bounce L",	BOTH_B1__L___,		Q_L,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_R2L,		LS_T1__L__R,	150	},	
;254:	{"Bounce BL",	BOTH_B1_BL___,		Q_BL,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TR2BL,		LS_T1_BL_TR,	150	},	
;255:
;256:	//Deflected attacks (like bounces, but slide off enemy saber, not straight back)
;257:	{"Deflect BR",	BOTH_D1_BR___,		Q_BR,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TL2BR,		LS_T1_BR_TR,	150	},	
;258:	{"Deflect R",	BOTH_D1__R___,		Q_R,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_L2R,		LS_T1__R__L,	150	},	
;259:	{"Deflect TR",	BOTH_D1_TR___,		Q_TR,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_T1_TR_TL,	150	},	
;260:	{"Deflect T",	BOTH_B1_T____,		Q_T,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_T1_T__BL,	150	},	
;261:	{"Deflect TL",	BOTH_D1_TL___,		Q_TL,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BR2TL,		LS_T1_TL_TR,	150	},	
;262:	{"Deflect L",	BOTH_D1__L___,		Q_L,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_R2L,		LS_T1__L__R,	150	},	
;263:	{"Deflect BL",	BOTH_D1_BL___,		Q_BL,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_TR2BL,		LS_T1_BL_TR,	150	},	
;264:	{"Deflect B",	BOTH_D1_B____,		Q_B,	Q_B,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_R_BL2TR,		LS_T1_T__BL,	150	},	
;265:
;266:	//Reflected attacks
;267:	{"Reflected BR",BOTH_V1_BR_S1,		Q_BR,	Q_BR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_READY,		LS_READY,	150	},//	LS_V1_BR
;268:	{"Reflected R",	BOTH_V1__R_S1,		Q_R,	Q_R,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_READY,		LS_READY,	150	},//	LS_V1__R
;269:	{"Reflected TR",BOTH_V1_TR_S1,		Q_TR,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_READY,		LS_READY,	150	},//	LS_V1_TR
;270:	{"Reflected T",	BOTH_V1_T__S1,		Q_T,	Q_T,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_READY,		LS_READY,	150	},//	LS_V1_T_
;271:	{"Reflected TL",BOTH_V1_TL_S1,		Q_TL,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_READY,		LS_READY,	150	},//	LS_V1_TL
;272:	{"Reflected L",	BOTH_V1__L_S1,		Q_L,	Q_L,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_READY,		LS_READY,	150	},//	LS_V1__L
;273:	{"Reflected BL",BOTH_V1_BL_S1,		Q_BL,	Q_BL,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_READY,		LS_READY,	150	},//	LS_V1_BL
;274:	{"Reflected B",	BOTH_V1_B__S1,		Q_B,	Q_B,	AFLAG_ACTIVE,	100,	BLK_NO,	LS_READY,		LS_READY,	150	},//	LS_V1_B_
;275:
;276:	// Broken parries
;277:	{"BParry Top",	BOTH_H1_S1_T_,		Q_T,	Q_B,	AFLAG_ACTIVE,	50,		BLK_NO,	LS_READY,		LS_READY,		150	},	// LS_PARRY_UP,
;278:	{"BParry UR",	BOTH_H1_S1_TR,		Q_TR,	Q_BL,	AFLAG_ACTIVE,	50,		BLK_NO,	LS_READY,		LS_READY,		150	},	// LS_PARRY_UR,
;279:	{"BParry UL",	BOTH_H1_S1_TL,		Q_TL,	Q_BR,	AFLAG_ACTIVE,	50,		BLK_NO,	LS_READY,		LS_READY,		150	},	// LS_PARRY_UL,
;280:	{"BParry LR",	BOTH_H1_S1_BL,		Q_BL,	Q_TR,	AFLAG_ACTIVE,	50,		BLK_NO,	LS_READY,		LS_READY,		150	},	// LS_PARRY_LR,
;281:	{"BParry Bot",	BOTH_H1_S1_B_,		Q_B,	Q_T,	AFLAG_ACTIVE,	50,		BLK_NO,	LS_READY,		LS_READY,		150	},	// LS_PARRY_LL
;282:	{"BParry LL",	BOTH_H1_S1_BR,		Q_BR,	Q_TL,	AFLAG_ACTIVE,	50,		BLK_NO,	LS_READY,		LS_READY,		150	},	// LS_PARRY_LL
;283:
;284:	// Knockaways
;285:	{"Knock Top",	BOTH_K1_S1_T_,		Q_R,	Q_T,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BL2TR,		LS_T1_T__BR,		150	},	// LS_PARRY_UP,
;286:	{"Knock UR",	BOTH_K1_S1_TR,		Q_R,	Q_TR,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BL2TR,		LS_T1_TR__R,		150	},	// LS_PARRY_UR,
;287:	{"Knock UL",	BOTH_K1_S1_TL,		Q_R,	Q_TL,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BR2TL,		LS_T1_TL__L,		150	},	// LS_PARRY_UL,
;288:	{"Knock LR",	BOTH_K1_S1_BL,		Q_R,	Q_BL,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_TL2BR,		LS_T1_BL_TL,		150	},	// LS_PARRY_LR,
;289:	{"Knock LL",	BOTH_K1_S1_BR,		Q_R,	Q_BR,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_TR2BL,		LS_T1_BR_TR,		150	},	// LS_PARRY_LL
;290:
;291:	// Parry
;292:	{"Parry Top",	BOTH_P1_S1_T_,		Q_R,	Q_T,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BL2TR,		LS_A_T2B,		150	},	// LS_PARRY_UP,
;293:	{"Parry UR",	BOTH_P1_S1_TR,		Q_R,	Q_TL,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BL2TR,		LS_A_TR2BL,		150	},	// LS_PARRY_UR,
;294:	{"Parry UL",	BOTH_P1_S1_TL,		Q_R,	Q_TR,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BR2TL,		LS_A_TL2BR,		150	},	// LS_PARRY_UL,
;295:	{"Parry LR",	BOTH_P1_S1_BL,		Q_R,	Q_BR,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_TL2BR,		LS_A_BR2TL,		150	},	// LS_PARRY_LR,
;296:	{"Parry LL",	BOTH_P1_S1_BR,		Q_R,	Q_BL,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_TR2BL,		LS_A_BL2TR,		150	},	// LS_PARRY_LL
;297:
;298:	// Reflecting a missile
;299:	{"Reflect Top",	BOTH_P1_S1_T_,		Q_R,	Q_T,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BL2TR,		LS_A_T2B,		300	},	// LS_PARRY_UP,
;300:	{"Reflect UR",	BOTH_P1_S1_TL,		Q_R,	Q_TR,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BR2TL,		LS_A_TL2BR,		300	},	// LS_PARRY_UR,
;301:	{"Reflect UL",	BOTH_P1_S1_TR,		Q_R,	Q_TL,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_BL2TR,		LS_A_TR2BL,		300	},	// LS_PARRY_UL,
;302:	{"Reflect LR",	BOTH_P1_S1_BR,		Q_R,	Q_BL,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_TR2BL,		LS_A_BL2TR,		300	},	// LS_PARRY_LR
;303:	{"Reflect LL",	BOTH_P1_S1_BL,		Q_R,	Q_BR,	AFLAG_ACTIVE,	50,		BLK_WIDE,	LS_R_TL2BR,		LS_A_BR2TL,		300	},	// LS_PARRY_LL,
;304:
;305:	// JKA cartwheels
;306:	{ "DualJumpAtkL_A",BOTH_ARIAL_LEFT,	Q_R,	Q_TL,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_READY,		LS_A_TL2BR,		200 },	// LS_JUMPATTACK_ARIAL_LEFT
;307:	{ "DualJumpAtkR_A",BOTH_ARIAL_RIGHT,Q_R,	Q_TR,	AFLAG_ACTIVE,	100,	BLK_TIGHT,	LS_READY,		LS_A_TR2BL,		200 },	// LS_JUMPATTACK_ARIAL_RIGHT
;308:};
;309:
;310:
;311:int transitionMove[Q_NUM_QUADS][Q_NUM_QUADS] = 
;312:{
;313:	{
;314:		LS_NONE,	//Can't transition to same pos!
;315:		LS_T1_BR__R,//40
;316:		LS_T1_BR_TR,
;317:		LS_T1_BR_T_,
;318:		LS_T1_BR_TL,
;319:		LS_T1_BR__L,
;320:		LS_T1_BR_BL,
;321:		LS_NONE,	//No transitions to bottom, and no anims start there, so shouldn't need any
;322:	},
;323:	{
;324:		LS_T1__R_BR,//46
;325:		LS_NONE,	//Can't transition to same pos!
;326:		LS_T1__R_TR,
;327:		LS_T1__R_T_,
;328:		LS_T1__R_TL,
;329:		LS_T1__R__L,
;330:		LS_T1__R_BL,
;331:		LS_NONE,	//No transitions to bottom, and no anims start there, so shouldn't need any
;332:	},
;333:	{
;334:		LS_T1_TR_BR,//52
;335:		LS_T1_TR__R,
;336:		LS_NONE,	//Can't transition to same pos!
;337:		LS_T1_TR_T_,
;338:		LS_T1_TR_TL,
;339:		LS_T1_TR__L,
;340:		LS_T1_TR_BL,
;341:		LS_NONE,	//No transitions to bottom, and no anims start there, so shouldn't need any
;342:	},
;343:	{
;344:		LS_T1_T__BR,//58
;345:		LS_T1_T___R,
;346:		LS_T1_T__TR,
;347:		LS_NONE,	//Can't transition to same pos!
;348:		LS_T1_T__TL,
;349:		LS_T1_T___L,
;350:		LS_T1_T__BL,
;351:		LS_NONE,	//No transitions to bottom, and no anims start there, so shouldn't need any
;352:	},
;353:	{
;354:		LS_T1_TL_BR,//64
;355:		LS_T1_TL__R,
;356:		LS_T1_TL_TR,
;357:		LS_T1_TL_T_,
;358:		LS_NONE,	//Can't transition to same pos!
;359:		LS_T1_TL__L,
;360:		LS_T1_TL_BL,
;361:		LS_NONE,	//No transitions to bottom, and no anims start there, so shouldn't need any
;362:	},
;363:	{
;364:		LS_T1__L_BR,//70
;365:		LS_T1__L__R,
;366:		LS_T1__L_TR,
;367:		LS_T1__L_T_,
;368:		LS_T1__L_TL,
;369:		LS_NONE,	//Can't transition to same pos!
;370:		LS_T1__L_BL,
;371:		LS_NONE,	//No transitions to bottom, and no anims start there, so shouldn't need any
;372:	},
;373:	{
;374:		LS_T1_BL_BR,//76
;375:		LS_T1_BL__R,
;376:		LS_T1_BL_TR,
;377:		LS_T1_BL_T_,
;378:		LS_T1_BL_TL,
;379:		LS_T1_BL__L,
;380:		LS_NONE,	//Can't transition to same pos!
;381:		LS_NONE,	//No transitions to bottom, and no anims start there, so shouldn't need any
;382:	},
;383:	{
;384:		LS_T1_BL_BR,//NOTE: there are no transitions from bottom, so re-use the bottom right transitions
;385:		LS_T1_BR__R,
;386:		LS_T1_BR_TR,
;387:		LS_T1_BR_T_,
;388:		LS_T1_BR_TL,
;389:		LS_T1_BR__L,
;390:		LS_T1_BR_BL,
;391:		LS_NONE		//No transitions to bottom, and no anims start there, so shouldn't need any
;392:	}
;393:};
;394:
;395:saberMoveName_t PM_AttackMoveForQuad( int quad )
;396:{
line 397
;397:	switch ( quad )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $256
ADDRLP4 0
INDIRI4
CNSTI4 7
GTI4 $256
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $265
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $265
address $258
address $259
address $260
address $261
address $262
address $263
address $264
address $258
code
line 398
;398:	{
LABELV $258
line 401
;399:	case Q_B:
;400:	case Q_BR:
;401:		return LS_A_BR2TL;
CNSTI4 7
RETI4
ADDRGP4 $255
JUMPV
line 402
;402:		break;
LABELV $259
line 404
;403:	case Q_R:
;404:		return LS_A_R2L;
CNSTI4 8
RETI4
ADDRGP4 $255
JUMPV
line 405
;405:		break;
LABELV $260
line 407
;406:	case Q_TR:
;407:		return LS_A_TR2BL;
CNSTI4 9
RETI4
ADDRGP4 $255
JUMPV
line 408
;408:		break;
LABELV $261
line 410
;409:	case Q_T:
;410:		return LS_A_T2B;
CNSTI4 10
RETI4
ADDRGP4 $255
JUMPV
line 411
;411:		break;
LABELV $262
line 413
;412:	case Q_TL:
;413:		return LS_A_TL2BR;
CNSTI4 4
RETI4
ADDRGP4 $255
JUMPV
line 414
;414:		break;
LABELV $263
line 416
;415:	case Q_L:
;416:		return LS_A_L2R;
CNSTI4 5
RETI4
ADDRGP4 $255
JUMPV
line 417
;417:		break;
LABELV $264
line 419
;418:	case Q_BL:
;419:		return LS_A_BL2TR;
CNSTI4 6
RETI4
ADDRGP4 $255
JUMPV
line 420
;420:		break;
LABELV $256
line 422
;421:	}
;422:	return LS_NONE;
CNSTI4 0
RETI4
LABELV $255
endproc PM_AttackMoveForQuad 4 0
export PM_SaberAnimTransitionAnim
proc PM_SaberAnimTransitionAnim 48 8
line 428
;423:}
;424:
;425:qboolean PM_SaberKataDone(int curmove, int newmove);
;426:
;427:int PM_SaberAnimTransitionAnim( int curmove, int newmove )
;428:{
line 429
;429:	int retmove = newmove;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 430
;430:	if (curmove == LS_READY || !pm->modParms.raceMode && pm->mineSwitchFix &&BG_SaberInIdle(curmove)) // in racemode we stay on vanilla behavior always. prolly irrelevant but eh
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $269
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
NEI4 $267
ADDRLP4 8
INDIRP4
CNSTI4 568
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $267
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_SaberInIdle
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $267
LABELV $269
line 431
;431:	{//just standing there
line 432
;432:		switch ( newmove )
ADDRLP4 20
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 4
LTI4 $268
ADDRLP4 20
INDIRI4
CNSTI4 10
GTI4 $268
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $273-16
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $273
address $272
address $272
address $272
address $272
address $272
address $272
address $272
code
line 433
;433:		{
LABELV $272
line 442
;434:		case LS_A_TL2BR:
;435:		case LS_A_L2R:
;436:		case LS_A_BL2TR:
;437:		case LS_A_BR2TL:
;438:		case LS_A_R2L:
;439:		case LS_A_TR2BL:
;440:		case LS_A_T2B:
;441:			//transition is the start
;442:			retmove = LS_S_TL2BR + (newmove-LS_A_TL2BR);
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 4
SUBI4
CNSTI4 18
ADDI4
ASGNI4
line 443
;443:			break;
line 445
;444:		}
;445:	}
ADDRGP4 $268
JUMPV
LABELV $267
line 447
;446:	else
;447:	{
line 448
;448:		switch ( newmove )
ADDRLP4 20
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
LTI4 $275
ADDRLP4 20
INDIRI4
CNSTI4 10
GTI4 $275
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $313-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $313
address $277
address $275
address $275
address $283
address $283
address $283
address $283
address $283
address $283
address $283
code
line 449
;449:		{
LABELV $277
line 452
;450:		//transitioning to ready pose
;451:		case LS_READY:
;452:			switch ( curmove )
ADDRLP4 24
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 4
LTI4 $276
ADDRLP4 24
INDIRI4
CNSTI4 10
GTI4 $276
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $281-16
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $281
address $280
address $280
address $280
address $280
address $280
address $280
address $280
code
line 453
;453:			{
LABELV $280
line 463
;454:			//transitioning from an attack
;455:			case LS_A_TL2BR:
;456:			case LS_A_L2R:
;457:			case LS_A_BL2TR:
;458:			case LS_A_BR2TL:
;459:			case LS_A_R2L:
;460:			case LS_A_TR2BL:
;461:			case LS_A_T2B:
;462:				//transition is the return
;463:				retmove = LS_R_TL2BR + (newmove-LS_A_TL2BR);
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 4
SUBI4
CNSTI4 25
ADDI4
ASGNI4
line 464
;464:				break;
line 466
;465:			}
;466:			break;
ADDRGP4 $276
JUMPV
LABELV $283
line 475
;467:		//transitioning to an attack
;468:		case LS_A_TL2BR:
;469:		case LS_A_L2R:
;470:		case LS_A_BL2TR:
;471:		case LS_A_BR2TL:
;472:		case LS_A_R2L:
;473:		case LS_A_TR2BL:
;474:		case LS_A_T2B:
;475:			if ( newmove == curmove && jk2gameplay != VERSION_1_02 )
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $284
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $284
line 476
;476:			{
line 478
;477:				//going into an attack
;478:				if ( PM_SaberKataDone( curmove, newmove ) )
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 PM_SaberKataDone
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $286
line 479
;479:				{//done with this kata, must return to ready before attack again
line 480
;480:					retmove = LS_R_TL2BR + (newmove-LS_A_TL2BR);
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 4
SUBI4
CNSTI4 25
ADDI4
ASGNI4
line 481
;481:				}
ADDRGP4 $276
JUMPV
LABELV $286
line 483
;482:				else
;483:				{//okay to chain to another attack
line 484
;484:					retmove = transitionMove[saberMoveData[curmove].endQuad][saberMoveData[newmove].startQuad];
ADDRLP4 32
CNSTI4 40
ASGNI4
ADDRLP4 0
ADDRLP4 32
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRI4
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 transitionMove
ADDP4
ADDP4
INDIRI4
ASGNI4
line 485
;485:				}
line 486
;486:			}
ADDRGP4 $276
JUMPV
LABELV $284
line 487
;487:			else if ( saberMoveData[curmove].endQuad == saberMoveData[newmove].startQuad )
ADDRLP4 28
CNSTI4 40
ASGNI4
ADDRLP4 28
INDIRI4
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
NEI4 $290
line 488
;488:			{//new move starts from same quadrant
line 489
;489:				retmove = newmove;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 490
;490:			}
ADDRGP4 $276
JUMPV
LABELV $290
line 492
;491:			else
;492:			{
line 493
;493:				switch ( curmove )
ADDRLP4 32
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 4
LTI4 $276
ADDRLP4 32
INDIRI4
CNSTI4 31
GTI4 $308
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $309-16
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $309
address $299
address $299
address $299
address $299
address $299
address $299
address $299
address $276
address $276
address $276
address $276
address $276
address $276
address $276
address $276
address $276
address $276
address $276
address $276
address $276
address $276
address $305
address $305
address $305
address $305
address $305
address $305
address $305
code
LABELV $308
ADDRLP4 36
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 81
LTI4 $276
ADDRLP4 36
INDIRI4
CNSTI4 117
GTI4 $276
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $311-324
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $311
address $296
address $296
address $296
address $296
address $296
address $296
address $296
address $296
address $302
address $302
address $302
address $302
address $302
address $302
address $302
address $302
address $302
address $302
address $302
address $302
address $276
address $302
address $302
address $302
address $302
address $302
address $302
address $305
address $305
address $305
address $305
address $305
address $305
address $305
address $305
address $305
address $305
code
line 494
;494:				{
LABELV $296
line 504
;495:				//transitioning from an attack
;496:				case LS_D1_BR:
;497:				case LS_D1__R:
;498:				case LS_D1_TR:
;499:				case LS_D1_T_:
;500:				case LS_D1_TL:
;501:				case LS_D1__L:
;502:				case LS_D1_BL:
;503:				case LS_D1_B_:
;504:					if ( jk2gameplay == VERSION_1_02 ) break;
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $297
ADDRGP4 $276
JUMPV
LABELV $297
LABELV $299
line 512
;505:				case LS_A_TL2BR:
;506:				case LS_A_L2R:
;507:				case LS_A_BL2TR:
;508:				case LS_A_BR2TL:
;509:				case LS_A_R2L:
;510:				case LS_A_TR2BL:
;511:				case LS_A_T2B:
;512:					retmove = transitionMove[saberMoveData[curmove].endQuad][saberMoveData[newmove].startQuad];
ADDRLP4 40
CNSTI4 40
ASGNI4
ADDRLP4 0
ADDRLP4 40
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
INDIRI4
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 transitionMove
ADDP4
ADDP4
INDIRI4
ASGNI4
line 513
;513:					break;
ADDRGP4 $276
JUMPV
LABELV $302
line 533
;514:				//transitioning from a return
;515:				case LS_K1_T_:
;516:				case LS_K1_TR:
;517:				case LS_K1_TL:
;518:				case LS_K1_BR:
;519:				case LS_K1_BL:
;520:				case LS_V1_BR:
;521:				case LS_V1__R:
;522:				case LS_V1_TR:
;523:				case LS_V1_T_:
;524:				case LS_V1_TL:
;525:				case LS_V1__L:
;526:				case LS_V1_BL:
;527:				case LS_V1_B_:
;528:				case LS_H1_T_:
;529:				case LS_H1_TR:
;530:				case LS_H1_TL:
;531:				case LS_H1_BR:
;532:				case LS_H1_BL:
;533:					if ( jk2gameplay == VERSION_1_02 ) break;
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $303
ADDRGP4 $276
JUMPV
LABELV $303
LABELV $305
line 570
;534:				case LS_R_TL2BR:
;535:				case LS_R_L2R:
;536:				case LS_R_BL2TR:
;537:				case LS_R_BR2TL:
;538:				case LS_R_R2L:
;539:				case LS_R_TR2BL:
;540:				case LS_R_T2B:
;541:				//transitioning from a bounce
;542:				/*
;543:				case LS_BOUNCE_UL2LL:
;544:				case LS_BOUNCE_LL2UL:
;545:				case LS_BOUNCE_L2LL:
;546:				case LS_BOUNCE_L2UL:
;547:				case LS_BOUNCE_UR2LR:
;548:				case LS_BOUNCE_LR2UR:
;549:				case LS_BOUNCE_R2LR:
;550:				case LS_BOUNCE_R2UR:
;551:				case LS_BOUNCE_TOP:
;552:				case LS_OVER_UR2UL:
;553:				case LS_OVER_UL2UR:
;554:				case LS_BOUNCE_UR:
;555:				case LS_BOUNCE_UL:
;556:				case LS_BOUNCE_LR:
;557:				case LS_BOUNCE_LL:
;558:				*/
;559:				//transitioning from a parry/reflection/knockaway/broken parry
;560:				case LS_PARRY_UP:
;561:				case LS_PARRY_UR:
;562:				case LS_PARRY_UL:
;563:				case LS_PARRY_LR:
;564:				case LS_PARRY_LL:
;565:				case LS_REFLECT_UP:
;566:				case LS_REFLECT_UR:
;567:				case LS_REFLECT_UL:
;568:				case LS_REFLECT_LR:
;569:				case LS_REFLECT_LL:
;570:					retmove = transitionMove[saberMoveData[curmove].endQuad][saberMoveData[newmove].startQuad];
ADDRLP4 44
CNSTI4 40
ASGNI4
ADDRLP4 0
ADDRLP4 44
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 44
INDIRI4
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 transitionMove
ADDP4
ADDP4
INDIRI4
ASGNI4
line 571
;571:					break;
line 574
;572:				//NB: transitioning from transitions is fine
;573:				}
;574:			}
line 575
;575:			break;
LABELV $275
LABELV $276
line 578
;576:		//transitioning to any other anim is not supported
;577:		}
;578:	}
LABELV $268
line 580
;579:
;580:	if ( retmove == LS_NONE )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $315
line 581
;581:	{
line 582
;582:		return newmove;
ADDRFP4 4
INDIRI4
RETI4
ADDRGP4 $266
JUMPV
LABELV $315
line 585
;583:	}
;584:
;585:	return retmove;
ADDRLP4 0
INDIRI4
RETI4
LABELV $266
endproc PM_SaberAnimTransitionAnim 48 8
export PM_SaberMoveQuadrantForMovement
proc PM_SaberMoveQuadrantForMovement 0 0
line 589
;586:}
;587:
;588:int PM_SaberMoveQuadrantForMovement( usercmd_t *ucmd )
;589:{
line 590
;590:	if ( ucmd->rightmove > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $318
line 591
;591:	{//moving right
line 592
;592:		if ( ucmd->forwardmove > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $320
line 593
;593:		{//forward right = TL2BR slash
line 594
;594:			return Q_TL;
CNSTI4 4
RETI4
ADDRGP4 $317
JUMPV
LABELV $320
line 596
;595:		}
;596:		else if ( ucmd->forwardmove < 0 )
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $322
line 597
;597:		{//backward right = BL2TR uppercut
line 598
;598:			return Q_BL;
CNSTI4 6
RETI4
ADDRGP4 $317
JUMPV
LABELV $322
line 601
;599:		}
;600:		else
;601:		{//just right is a left slice
line 602
;602:			return Q_L;
CNSTI4 5
RETI4
ADDRGP4 $317
JUMPV
LABELV $318
line 605
;603:		}
;604:	}
;605:	else if ( ucmd->rightmove < 0 )
ADDRFP4 0
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $324
line 606
;606:	{//moving left
line 607
;607:		if ( ucmd->forwardmove > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $326
line 608
;608:		{//forward left = TR2BL slash
line 609
;609:			return Q_TR;
CNSTI4 2
RETI4
ADDRGP4 $317
JUMPV
LABELV $326
line 611
;610:		}
;611:		else if ( ucmd->forwardmove < 0 )
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $328
line 612
;612:		{//backward left = BR2TL uppercut
line 613
;613:			return Q_BR;
CNSTI4 0
RETI4
ADDRGP4 $317
JUMPV
LABELV $328
line 616
;614:		}
;615:		else
;616:		{//just left is a right slice
line 617
;617:			return Q_R;
CNSTI4 1
RETI4
ADDRGP4 $317
JUMPV
LABELV $324
line 621
;618:		}
;619:	}
;620:	else
;621:	{//not moving left or right
line 622
;622:		if ( ucmd->forwardmove > 0 )
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $330
line 623
;623:		{//forward= T2B slash
line 624
;624:			return Q_T;
CNSTI4 3
RETI4
ADDRGP4 $317
JUMPV
LABELV $330
line 626
;625:		}
;626:		else if ( ucmd->forwardmove < 0 )
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $332
line 627
;627:		{//backward= T2B slash	//or B2T uppercut?
line 628
;628:			return Q_T;
CNSTI4 3
RETI4
ADDRGP4 $317
JUMPV
LABELV $332
line 631
;629:		}
;630:		else
;631:		{//Not moving at all
line 632
;632:			return Q_R;
CNSTI4 1
RETI4
LABELV $317
endproc PM_SaberMoveQuadrantForMovement 0 0
export PM_SaberInBounce
proc PM_SaberInBounce 8 0
line 639
;633:		}
;634:	}
;635:}
;636:
;637://===================================================================
;638:qboolean PM_SaberInBounce( int move )
;639:{
line 640
;640:	if ( move >= LS_B1_BR && move <= LS_B1_BL )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 74
LTI4 $335
ADDRLP4 0
INDIRI4
CNSTI4 80
GTI4 $335
line 641
;641:	{
line 642
;642:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $334
JUMPV
LABELV $335
line 644
;643:	}
;644:	if ( move >= LS_D1_BR && move <= LS_D1_BL )
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 81
LTI4 $337
ADDRLP4 4
INDIRI4
CNSTI4 87
GTI4 $337
line 645
;645:	{
line 646
;646:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $334
JUMPV
LABELV $337
line 648
;647:	}
;648:	return qfalse;
CNSTI4 0
RETI4
LABELV $334
endproc PM_SaberInBounce 8 0
export PM_SaberInTransition
proc PM_SaberInTransition 4 0
line 652
;649:}
;650:
;651:qboolean PM_SaberInTransition( int move )
;652:{
line 653
;653:	if ( move >= LS_T1_BR__R && move <= LS_T1_BL__L )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $340
ADDRLP4 0
INDIRI4
CNSTI4 73
GTI4 $340
line 654
;654:	{
line 655
;655:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $339
JUMPV
LABELV $340
line 657
;656:	}
;657:	return qfalse;
CNSTI4 0
RETI4
LABELV $339
endproc PM_SaberInTransition 4 0
data
export saberMoveTransitionAngle
align 4
LABELV saberMoveTransitionAngle
byte 4 0
byte 4 45
byte 4 90
byte 4 135
byte 4 180
byte 4 215
byte 4 270
byte 4 45
byte 4 45
byte 4 0
byte 4 45
byte 4 90
byte 4 135
byte 4 180
byte 4 215
byte 4 90
byte 4 90
byte 4 45
byte 4 0
byte 4 45
byte 4 90
byte 4 135
byte 4 180
byte 4 135
byte 4 135
byte 4 90
byte 4 45
byte 4 0
byte 4 45
byte 4 90
byte 4 135
byte 4 180
byte 4 180
byte 4 135
byte 4 90
byte 4 45
byte 4 0
byte 4 45
byte 4 90
byte 4 135
byte 4 215
byte 4 180
byte 4 135
byte 4 90
byte 4 45
byte 4 0
byte 4 45
byte 4 90
byte 4 270
byte 4 215
byte 4 180
byte 4 135
byte 4 90
byte 4 45
byte 4 0
byte 4 45
byte 4 45
byte 4 90
byte 4 135
byte 4 180
byte 4 135
byte 4 90
byte 4 45
byte 4 0
export PM_SaberAttackChainAngle
code
proc PM_SaberAttackChainAngle 8 0
line 745
;658:}
;659:
;660:int saberMoveTransitionAngle[Q_NUM_QUADS][Q_NUM_QUADS] = 
;661:{
;662:	{
;663:		0,//Q_BR,Q_BR,
;664:		45,//Q_BR,Q_R,
;665:		90,//Q_BR,Q_TR,
;666:		135,//Q_BR,Q_T,
;667:		180,//Q_BR,Q_TL,
;668:		215,//Q_BR,Q_L,
;669:		270,//Q_BR,Q_BL,
;670:		45,//Q_BR,Q_B,
;671:	},
;672:	{
;673:		45,//Q_R,Q_BR,
;674:		0,//Q_R,Q_R,
;675:		45,//Q_R,Q_TR,
;676:		90,//Q_R,Q_T,
;677:		135,//Q_R,Q_TL,
;678:		180,//Q_R,Q_L,
;679:		215,//Q_R,Q_BL,
;680:		90,//Q_R,Q_B,
;681:	},
;682:	{
;683:		90,//Q_TR,Q_BR,
;684:		45,//Q_TR,Q_R,
;685:		0,//Q_TR,Q_TR,
;686:		45,//Q_TR,Q_T,
;687:		90,//Q_TR,Q_TL,
;688:		135,//Q_TR,Q_L,
;689:		180,//Q_TR,Q_BL,
;690:		135,//Q_TR,Q_B,
;691:	},
;692:	{
;693:		135,//Q_T,Q_BR,
;694:		90,//Q_T,Q_R,
;695:		45,//Q_T,Q_TR,
;696:		0,//Q_T,Q_T,
;697:		45,//Q_T,Q_TL,
;698:		90,//Q_T,Q_L,
;699:		135,//Q_T,Q_BL,
;700:		180,//Q_T,Q_B,
;701:	},
;702:	{
;703:		180,//Q_TL,Q_BR,
;704:		135,//Q_TL,Q_R,
;705:		90,//Q_TL,Q_TR,
;706:		45,//Q_TL,Q_T,
;707:		0,//Q_TL,Q_TL,
;708:		45,//Q_TL,Q_L,
;709:		90,//Q_TL,Q_BL,
;710:		135,//Q_TL,Q_B,
;711:	},
;712:	{
;713:		215,//Q_L,Q_BR,
;714:		180,//Q_L,Q_R,
;715:		135,//Q_L,Q_TR,
;716:		90,//Q_L,Q_T,
;717:		45,//Q_L,Q_TL,
;718:		0,//Q_L,Q_L,
;719:		45,//Q_L,Q_BL,
;720:		90,//Q_L,Q_B,
;721:	},
;722:	{
;723:		270,//Q_BL,Q_BR,
;724:		215,//Q_BL,Q_R,
;725:		180,//Q_BL,Q_TR,
;726:		135,//Q_BL,Q_T,
;727:		90,//Q_BL,Q_TL,
;728:		45,//Q_BL,Q_L,
;729:		0,//Q_BL,Q_BL,
;730:		45,//Q_BL,Q_B,
;731:	},
;732:	{
;733:		45,//Q_B,Q_BR,
;734:		90,//Q_B,Q_R,
;735:		135,//Q_B,Q_TR,
;736:		180,//Q_B,Q_T,
;737:		135,//Q_B,Q_TL,
;738:		90,//Q_B,Q_L,
;739:		45,//Q_B,Q_BL,
;740:		0//Q_B,Q_B,
;741:	}
;742:};
;743:
;744:int PM_SaberAttackChainAngle( int move1, int move2 )
;745:{
line 746
;746:	if ( move1 == -1 || move2 == -1 )
ADDRLP4 0
CNSTI4 -1
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $345
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $343
LABELV $345
line 747
;747:	{
line 748
;748:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $342
JUMPV
LABELV $343
line 750
;749:	}
;750:	return saberMoveTransitionAngle[saberMoveData[move1].endQuad][saberMoveData[move2].startQuad];
ADDRLP4 4
CNSTI4 40
ASGNI4
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 saberMoveTransitionAngle
ADDP4
ADDP4
INDIRI4
RETI4
LABELV $342
endproc PM_SaberAttackChainAngle 8 0
export PM_SaberKataDone_1_02
proc PM_SaberKataDone_1_02 32 16
line 754
;751:}
;752:
;753:qboolean PM_SaberKataDone_1_02( void )
;754:{
line 755
;755:	if ( (pm->ps->fd.saberAnimLevel >= FORCE_LEVEL_3 && pm->ps->saberAttackChainCount > PM_irand_timesync( 0, 1 + pml.randomAdd, pm->modParms.raceMode, 0 )) ||
ADDRLP4 0
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
LTI4 $354
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 pml+1168
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
GTI4 $353
LABELV $354
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 24
CNSTI4 2
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $349
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 pml+1168
INDIRI4
CNSTI4 5
ADDI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 28
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
LEI4 $349
LABELV $353
line 757
;756:		( pm->ps->fd.saberAnimLevel == FORCE_LEVEL_2 && pm->ps->saberAttackChainCount > PM_irand_timesync( 2, 5 + pml.randomAdd, pm->modParms.raceMode, 4) ) )
;757:	{
line 758
;758:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $348
JUMPV
LABELV $349
line 760
;759:	}
;760:	return qfalse;
CNSTI4 0
RETI4
LABELV $348
endproc PM_SaberKataDone_1_02 32 16
export PM_SaberKataDone
proc PM_SaberKataDone 28 16
line 764
;761:}
;762:
;763:qboolean PM_SaberKataDone(int curmove, int newmove)
;764:{
line 765
;765:	if ( pm->ps->fd.saberAnimLevel == FORCE_LEVEL_3 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
NEI4 $356
line 766
;766:	{
line 767
;767:		if ( curmove == LS_NONE || newmove == LS_NONE )
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $360
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $358
LABELV $360
line 768
;768:		{
line 769
;769:			if ( pm->ps->fd.saberAnimLevel >= FORCE_LEVEL_3 && pm->ps->saberAttackChainCount > PM_irand_timesync( 0, 1 + pml.randomAdd, pm->modParms.raceMode, 0) )
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
LTI4 $357
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 pml+1168
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $357
line 770
;770:			{
line 771
;771:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $355
JUMPV
line 773
;772:			}
;773:		}
LABELV $358
line 774
;774:		else if ( pm->ps->saberAttackChainCount > PM_irand_timesync( 2, 3 + pml.randomAdd, pm->modParms.raceMode, 2) )
ADDRLP4 4
CNSTI4 2
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 pml+1168
INDIRI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $364
line 775
;775:		{
line 776
;776:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $355
JUMPV
LABELV $364
line 778
;777:		}
;778:		else if ( pm->ps->saberAttackChainCount > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
CNSTI4 0
LEI4 $357
line 779
;779:		{
line 780
;780:			int chainAngle = PM_SaberAttackChainAngle( curmove, newmove );
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 PM_SaberAttackChainAngle
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 781
;781:			if ( chainAngle < 135 || chainAngle > 215 )
ADDRLP4 24
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 135
LTI4 $371
ADDRLP4 24
INDIRI4
CNSTI4 215
LEI4 $369
LABELV $371
line 782
;782:			{//if trying to chain to a move that doesn't continue the momentum
line 783
;783:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $355
JUMPV
LABELV $369
line 785
;784:			}
;785:			else if ( chainAngle == 180 )
ADDRLP4 16
INDIRI4
CNSTI4 180
NEI4 $372
line 786
;786:			{//continues the momentum perfectly, allow it to chain 66% of the time
line 787
;787:				if ( pm->ps->saberAttackChainCount > 1 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
CNSTI4 1
LEI4 $357
line 788
;788:				{
line 789
;789:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $355
JUMPV
line 791
;790:				}
;791:			}
LABELV $372
line 793
;792:			else
;793:			{//would continue the movement somewhat, 50% chance of continuing
line 794
;794:				if ( pm->ps->saberAttackChainCount > 2 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
CNSTI4 2
LEI4 $357
line 795
;795:				{
line 796
;796:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $355
JUMPV
line 798
;797:				}
;798:			}
line 799
;799:		}
line 800
;800:	}
LABELV $356
line 802
;801:	else 
;802:	{//Perhaps have chainAngle influence fast and medium chains as well? For now, just do level 3.
line 803
;803:		if (newmove == LS_A_TL2BR ||
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
EQI4 $384
ADDRLP4 0
INDIRI4
CNSTI4 5
EQI4 $384
ADDRLP4 0
INDIRI4
CNSTI4 6
EQI4 $384
ADDRLP4 0
INDIRI4
CNSTI4 7
EQI4 $384
ADDRLP4 0
INDIRI4
CNSTI4 8
EQI4 $384
ADDRLP4 0
INDIRI4
CNSTI4 9
NEI4 $378
LABELV $384
line 809
;804:			newmove == LS_A_L2R ||
;805:			newmove == LS_A_BL2TR ||
;806:			newmove == LS_A_BR2TL ||
;807:			newmove == LS_A_R2L ||
;808:			newmove == LS_A_TR2BL )
;809:		{ //lower chaining tolerance for spinning saber anims
line 812
;810:			int chainTolerance;
;811:
;812:			if (pm->ps->fd.saberAnimLevel == FORCE_LEVEL_1)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 1
NEI4 $385
line 813
;813:			{
line 814
;814:				chainTolerance = 5;
ADDRLP4 4
CNSTI4 5
ASGNI4
line 815
;815:			}
ADDRGP4 $386
JUMPV
LABELV $385
line 817
;816:			else
;817:			{
line 818
;818:				chainTolerance = 3;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 819
;819:			}
LABELV $386
line 821
;820:
;821:			if (pm->ps->saberAttackChainCount >= chainTolerance && PM_irand_timesync(1, pm->ps->saberAttackChainCount + pml.randomAdd, pm->modParms.raceMode, pm->ps->saberAttackChainCount-1) > chainTolerance)
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $387
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ADDRGP4 pml+1168
INDIRI4
ADDI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ARGI4
ADDRLP4 20
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $387
line 822
;822:			{
line 823
;823:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $355
JUMPV
LABELV $387
line 825
;824:			}
;825:		}
LABELV $378
line 826
;826:		if ( pm->ps->fd.saberAnimLevel == FORCE_LEVEL_2 && pm->ps->saberAttackChainCount > PM_irand_timesync( 2, 5 + pml.randomAdd, pm->modParms.raceMode, 4) )
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $390
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 pml+1168
INDIRI4
CNSTI4 5
ADDI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 16
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
LEI4 $390
line 827
;827:		{
line 828
;828:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $355
JUMPV
LABELV $390
line 830
;829:		}
;830:	}
LABELV $357
line 831
;831:	return qfalse;
CNSTI4 0
RETI4
LABELV $355
endproc PM_SaberKataDone 28 16
export PM_SetAnimFrame
proc PM_SetAnimFrame 0 0
line 835
;832:}
;833:
;834:void PM_SetAnimFrame( playerState_t *gent, int frame, qboolean torso, qboolean legs )
;835:{
line 836
;836:	gent->saberLockFrame = frame;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 837
;837:}
LABELV $393
endproc PM_SetAnimFrame 0 0
export PM_SaberLockBreak
proc PM_SaberLockBreak 84 16
line 840
;838:
;839:void PM_SaberLockBreak( playerState_t *genemy, qboolean victory )
;840:{
line 841
;841:	int	winAnim = BOTH_STAND1;
ADDRLP4 0
CNSTI4 571
ASGNI4
line 843
;842:	// int loseAnim = BOTH_STAND1;
;843:	qboolean punishLoser = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 845
;844:
;845:	switch ( (pm->ps->torsoAnim&~ANIM_TOGGLEBIT) )
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 16
CNSTI4 550
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $398
ADDRLP4 8
INDIRI4
CNSTI4 553
EQI4 $401
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $395
LABELV $410
ADDRLP4 8
INDIRI4
CNSTI4 560
EQI4 $404
ADDRLP4 8
INDIRI4
CNSTI4 561
EQI4 $407
ADDRGP4 $395
JUMPV
line 846
;846:	{
LABELV $398
line 848
;847:	case BOTH_BF2LOCK:
;848:		pm->ps->saberMove = LS_A_T2B;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 10
ASGNI4
line 849
;849:		winAnim = BOTH_A3_T__B_;
ADDRLP4 0
CNSTI4 292
ASGNI4
line 850
;850:		if ( !victory )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $399
line 851
;851:		{//no-one won
line 852
;852:			genemy->saberMove = LS_A_T2B;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 10
ASGNI4
line 854
;853:			// loseAnim = winAnim;
;854:		}
ADDRGP4 $396
JUMPV
LABELV $399
line 856
;855:		else
;856:		{
line 857
;857:			punishLoser = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 858
;858:		}
line 859
;859:		break;
ADDRGP4 $396
JUMPV
LABELV $401
line 861
;860:	case BOTH_BF1LOCK:
;861:		pm->ps->saberMove = LS_K1_T_;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 103
ASGNI4
line 862
;862:		winAnim = BOTH_K1_S1_T_;
ADDRLP4 0
CNSTI4 528
ASGNI4
line 863
;863:		if ( !victory )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $402
line 864
;864:		{//no-one won
line 865
;865:			genemy->saberMove = LS_K1_T_;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 103
ASGNI4
line 867
;866:			// loseAnim = winAnim;
;867:		}
ADDRGP4 $396
JUMPV
LABELV $402
line 869
;868:		else
;869:		{
line 870
;870:			punishLoser = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 871
;871:		}
line 872
;872:		break;
ADDRGP4 $396
JUMPV
LABELV $404
line 874
;873:	case BOTH_CWCIRCLELOCK:
;874:		winAnim = BOTH_CWCIRCLEBREAK;
ADDRLP4 0
CNSTI4 558
ASGNI4
line 875
;875:		if ( !victory )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $405
line 876
;876:		{//no-one won
line 878
;877:			// loseAnim = winAnim;
;878:		}
ADDRGP4 $396
JUMPV
LABELV $405
line 880
;879:		else
;880:		{
line 881
;881:			genemy->saberMove = LS_H1_BL;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 102
ASGNI4
line 882
;882:			genemy->saberBlocked = BLOCKED_PARRY_BROKEN;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 2
ASGNI4
line 883
;883:			punishLoser = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 884
;884:		}
line 885
;885:		break;
ADDRGP4 $396
JUMPV
LABELV $407
line 887
;886:	case BOTH_CCWCIRCLELOCK:
;887:		winAnim = BOTH_CCWCIRCLEBREAK;
ADDRLP4 0
CNSTI4 559
ASGNI4
line 888
;888:		if ( !victory )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $408
line 889
;889:		{//no-one won
line 891
;890:			// loseAnim = winAnim;
;891:		}
ADDRGP4 $396
JUMPV
LABELV $408
line 893
;892:		else
;893:		{
line 894
;894:			genemy->saberMove = LS_H1_BR;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 100
ASGNI4
line 895
;895:			genemy->saberBlocked = BLOCKED_PARRY_BROKEN;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 2
ASGNI4
line 896
;896:			punishLoser = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 897
;897:		}
line 898
;898:		break;
LABELV $395
LABELV $396
line 900
;899:	}
;900:	PM_SetAnim( SETANIM_BOTH, winAnim, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, -1 );
ADDRLP4 24
CNSTI4 3
ASGNI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 902
;901:
;902:	if (punishLoser)
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $411
line 903
;903:	{ //someone lost the lock, so punish them by knocking them down
line 906
;904:		vec3_t oppDir;
;905:
;906:		int strength = 8;
ADDRLP4 40
CNSTI4 8
ASGNI4
line 908
;907:
;908:		VectorSubtract(genemy->origin, pm->ps->origin, oppDir);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
CNSTI4 20
ASGNI4
ADDRLP4 52
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56
CNSTI4 24
ASGNI4
ADDRLP4 28+4
ADDRLP4 44
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 60
CNSTI4 28
ASGNI4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 909
;909:		VectorNormalize(oppDir);
ADDRLP4 28
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 911
;910:
;911:		genemy->forceHandExtend = HANDEXTEND_KNOCKDOWN;
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 8
ASGNI4
line 912
;912:		genemy->forceHandExtendTime = pm->cmd.serverTime + 1100;
ADDRFP4 0
INDIRP4
CNSTI4 1252
ADDP4
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1100
ADDI4
ASGNI4
line 913
;913:		genemy->forceDodgeAnim = 0; //this toggles between 1 and 0, when it's 1 we should play the get up anim
ADDRFP4 0
INDIRP4
CNSTI4 1260
ADDP4
CNSTI4 0
ASGNI4
line 915
;914:
;915:		genemy->otherKiller = pm->ps->clientNum;
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 916
;916:		genemy->otherKillerTime = pm->cmd.serverTime + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 764
ADDP4
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 917
;917:		genemy->otherKillerDebounceTime = pm->cmd.serverTime + 100;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 919
;918:
;919:		genemy->velocity[0] = oppDir[0]*(strength*40);
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 28
INDIRF4
CNSTI4 40
ADDRLP4 40
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 920
;920:		genemy->velocity[1] = oppDir[1]*(strength*40);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 28+4
INDIRF4
CNSTI4 40
ADDRLP4 40
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 921
;921:		genemy->velocity[2] = 100;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1120403456
ASGNF4
line 923
;922:
;923:		pm->checkDuelLoss = genemy->clientNum+1;
ADDRGP4 pm
INDIRP4
CNSTI4 452
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 924
;924:	}
ADDRGP4 $412
JUMPV
LABELV $411
line 926
;925:	else
;926:	{ //If no one lost, then shove each player away from the other
line 929
;927:		vec3_t oppDir;
;928:
;929:		int strength = 4;
ADDRLP4 40
CNSTI4 4
ASGNI4
line 931
;930:
;931:		VectorSubtract(genemy->origin, pm->ps->origin, oppDir);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
CNSTI4 20
ASGNI4
ADDRLP4 52
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
INDIRP4
ADDRLP4 48
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56
CNSTI4 24
ASGNI4
ADDRLP4 28+4
ADDRLP4 44
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 60
CNSTI4 28
ASGNI4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 932
;932:		VectorNormalize(oppDir);
ADDRLP4 28
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 933
;933:		genemy->velocity[0] = oppDir[0]*(strength*40);
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 28
INDIRF4
CNSTI4 40
ADDRLP4 40
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 934
;934:		genemy->velocity[1] = oppDir[1]*(strength*40);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 28+4
INDIRF4
CNSTI4 40
ADDRLP4 40
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 935
;935:		genemy->velocity[2] = 150;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1125515264
ASGNF4
line 937
;936:
;937:		VectorSubtract(pm->ps->origin, genemy->origin, oppDir);
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 20
ASGNI4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 64
INDIRP4
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 76
CNSTI4 24
ASGNI4
ADDRLP4 28+4
ADDRLP4 64
INDIRP4
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
ADDRLP4 76
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 80
CNSTI4 28
ASGNI4
ADDRLP4 28+8
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 938
;938:		VectorNormalize(oppDir);
ADDRLP4 28
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 939
;939:		pm->ps->velocity[0] = oppDir[0]*(strength*40);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 28
INDIRF4
CNSTI4 40
ADDRLP4 40
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 940
;940:		pm->ps->velocity[1] = oppDir[1]*(strength*40);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 28+4
INDIRF4
CNSTI4 40
ADDRLP4 40
INDIRI4
MULI4
CVIF4 4
MULF4
ASGNF4
line 941
;941:		pm->ps->velocity[2] = 150;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1125515264
ASGNF4
line 943
;942:
;943:		genemy->forceHandExtend = HANDEXTEND_WEAPONREADY;
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 6
ASGNI4
line 944
;944:	}
LABELV $412
line 946
;945:
;946:	pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 947
;947:	genemy->weaponTime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 949
;948:
;949:	pm->ps->saberLockTime = genemy->saberLockTime = 0;
ADDRLP4 28
CNSTI4 524
ASGNI4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 28
INDIRI4
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 950
;950:	pm->ps->saberLockFrame = genemy->saberLockFrame = 0;
ADDRLP4 36
CNSTI4 532
ASGNI4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 36
INDIRI4
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 951
;951:	pm->ps->saberLockEnemy = genemy->saberLockEnemy = 0;
ADDRLP4 44
CNSTI4 528
ASGNI4
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 953
;952:
;953:	pm->ps->forceHandExtend = HANDEXTEND_WEAPONREADY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1248
ADDP4
CNSTI4 6
ASGNI4
line 955
;954:
;955:	PM_AddEvent( EV_JUMP );
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 956
;956:	if ( !victory )
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $422
line 957
;957:	{//no-one won
line 958
;958:		BG_AddPredictableEventToPlayerstate(EV_JUMP, 0, genemy);
CNSTI4 14
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 959
;959:	}
ADDRGP4 $423
JUMPV
LABELV $422
line 961
;960:	else
;961:	{
line 962
;962:		if ( (jk2gameplay == VERSION_1_02 ? Q_irand( 0, 1 + pml.randomAdd, pm->modParms.raceMode, 0) : PM_irand_timesync( 0, 1 + pml.randomAdd, pm->modParms.raceMode, 0)) )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $429
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 pml+1168
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 52
ADDRLP4 60
INDIRI4
ASGNI4
ADDRGP4 $430
JUMPV
LABELV $429
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 pml+1168
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 52
ADDRLP4 68
INDIRI4
ASGNI4
LABELV $430
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $424
line 963
;963:		{
line 964
;964:			BG_AddPredictableEventToPlayerstate(EV_JUMP, PM_irand_timesync( 0, 75 + pml.randomAdd, pm->modParms.raceMode, 74), genemy); // what is this eventparm? doesnt seem used for anything?
CNSTI4 0
ARGI4
ADDRGP4 pml+1168
INDIRI4
CNSTI4 75
ADDI4
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
CNSTI4 74
ARGI4
ADDRLP4 72
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
CNSTI4 14
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 965
;965:		}
LABELV $424
line 966
;966:	}
LABELV $423
line 967
;967:}
LABELV $394
endproc PM_SaberLockBreak 84 16
export PM_SaberLocked
proc PM_SaberLocked 88 16
line 971
;968:
;969:extern qboolean ValidAnimFileIndex ( int index );
;970:void PM_SaberLocked( void )
;971:{
line 972
;972:	int	remaining = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 974
;973:
;974:	playerState_t *genemy = pm->bgClients[pm->ps->saberLockEnemy];
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 324
ADDP4
ADDP4
INDIRP4
ASGNP4
line 975
;975:	if ( !genemy )
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $433
line 976
;976:	{
line 977
;977:		return;
ADDRGP4 $432
JUMPV
LABELV $433
line 979
;978:	}
;979:	if ( ( (pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF2LOCK ||
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 550
EQI4 $439
ADDRLP4 12
INDIRI4
CNSTI4 553
EQI4 $439
ADDRLP4 12
INDIRI4
CNSTI4 560
EQI4 $439
ADDRLP4 12
INDIRI4
CNSTI4 561
NEI4 $435
LABELV $439
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 550
EQI4 $442
ADDRLP4 16
INDIRI4
CNSTI4 553
EQI4 $442
ADDRLP4 16
INDIRI4
CNSTI4 560
EQI4 $442
ADDRLP4 16
INDIRI4
CNSTI4 561
NEI4 $435
LABELV $442
line 988
;980:			(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF1LOCK ||
;981:			(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CWCIRCLELOCK ||
;982:			(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CCWCIRCLELOCK )
;983:		&& ( (genemy->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF2LOCK ||
;984:			(genemy->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF1LOCK ||
;985:			(genemy->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CWCIRCLELOCK ||
;986:			(genemy->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CCWCIRCLELOCK )
;987:		)
;988:	{
line 989
;989:		float dist = 0;
ADDRLP4 20
CNSTF4 0
ASGNF4
line 991
;990:
;991:		pm->ps->torsoTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 0
ASGNI4
line 992
;992:		pm->ps->weaponTime = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 993
;993:		genemy->torsoTimer = 0;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 0
ASGNI4
line 994
;994:		genemy->weaponTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 996
;995:
;996:		dist = DistanceSquared(pm->ps->origin,genemy->origin);
ADDRLP4 24
CNSTI4 20
ASGNI4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 DistanceSquared
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 28
INDIRF4
ASGNF4
line 997
;997:		if ( dist < 64 || dist > 6400 )
ADDRLP4 32
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1115684864
LTF4 $445
ADDRLP4 32
INDIRF4
CNSTF4 1170735104
LEF4 $443
LABELV $445
line 998
;998:		{//between 8 and 80 from each other
line 999
;999:			PM_SaberLockBreak( genemy, qfalse );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 PM_SaberLockBreak
CALLV
pop
line 1000
;1000:			return;
ADDRGP4 $432
JUMPV
LABELV $443
line 1002
;1001:		}
;1002:		if ( (pm->cmd.buttons & BUTTON_ATTACK) || pm->ps->saberLockAdvance )
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
CNSTI4 0
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 40
INDIRI4
NEI4 $448
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
EQI4 $436
LABELV $448
line 1003
;1003:		{//holding attack
line 1006
;1004:			animation_t *anim;
;1005:
;1006:			if (pm->ps->saberLockAdvance)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 540
ADDP4
INDIRI4
CNSTI4 0
EQI4 $432
line 1007
;1007:			{//tapping
line 1011
;1008:				animation_t *anim;
;1009:				float		currentFrame;
;1010:				int			curFrame;
;1011:				int			strength = 1;
ADDRLP4 48
CNSTI4 1
ASGNI4
line 1013
;1012:
;1013:				pm->ps->saberLockAdvance = qfalse;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 0
ASGNI4
line 1015
;1014:
;1015:				anim = &pm->animations[pm->ps->torsoAnim&~ANIM_TOGGLEBIT];
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 52
CNSTI4 28
ADDRLP4 64
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRLP4 64
INDIRP4
CNSTI4 260
ADDP4
INDIRP4
ADDP4
ASGNP4
line 1017
;1016:	
;1017:				currentFrame = pm->ps->saberLockFrame;
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1019
;1018:
;1019:				strength = NONETWORK_FORCEPOWERLEVEL(pm->ps,FP_SABERATTACK)+1;
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1004
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1021
;1020:
;1021:				if ( (pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CCWCIRCLELOCK ||
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 561
EQI4 $453
ADDRLP4 68
INDIRI4
CNSTI4 550
NEI4 $451
LABELV $453
line 1023
;1022:					(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF2LOCK )
;1023:				{
line 1024
;1024:					curFrame = floor( currentFrame )-strength;
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 floor
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 72
INDIRF4
ADDRLP4 48
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
line 1026
;1025:					//drop my frame one
;1026:					if ( curFrame <= anim->firstFrame )
ADDRLP4 56
INDIRI4
ADDRLP4 52
INDIRP4
INDIRI4
GTI4 $454
line 1027
;1027:					{//I won!  Break out
line 1028
;1028:						PM_SaberLockBreak( genemy, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 PM_SaberLockBreak
CALLV
pop
line 1029
;1029:						return;
ADDRGP4 $432
JUMPV
LABELV $454
line 1032
;1030:					}
;1031:					else
;1032:					{
line 1033
;1033:						PM_SetAnimFrame( pm->ps, curFrame, qtrue, qtrue );
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 76
CNSTI4 1
ASGNI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 PM_SetAnimFrame
CALLV
pop
line 1034
;1034:						remaining = curFrame-anim->firstFrame;
ADDRLP4 4
ADDRLP4 56
INDIRI4
ADDRLP4 52
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 1035
;1035:					}
line 1036
;1036:				}
ADDRGP4 $452
JUMPV
LABELV $451
line 1038
;1037:				else
;1038:				{
line 1039
;1039:					curFrame = ceil( currentFrame )+strength;
ADDRLP4 60
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 ceil
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 72
INDIRF4
ADDRLP4 48
INDIRI4
CVIF4 4
ADDF4
CVFI4 4
ASGNI4
line 1041
;1040:					//advance my frame one
;1041:					if ( curFrame >= anim->firstFrame+anim->numFrames )
ADDRLP4 76
ADDRLP4 52
INDIRP4
ASGNP4
ADDRLP4 56
INDIRI4
ADDRLP4 76
INDIRP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
LTI4 $456
line 1042
;1042:					{//I won!  Break out
line 1043
;1043:						PM_SaberLockBreak( genemy, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 PM_SaberLockBreak
CALLV
pop
line 1044
;1044:						return;
ADDRGP4 $432
JUMPV
LABELV $456
line 1047
;1045:					}
;1046:					else
;1047:					{
line 1048
;1048:						PM_SetAnimFrame( pm->ps, curFrame, qtrue, qtrue );
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 80
CNSTI4 1
ASGNI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 PM_SetAnimFrame
CALLV
pop
line 1049
;1049:						remaining = anim->firstFrame+anim->numFrames-curFrame;
ADDRLP4 84
ADDRLP4 52
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 84
INDIRP4
INDIRI4
ADDRLP4 84
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ADDRLP4 56
INDIRI4
SUBI4
ASGNI4
line 1050
;1050:					}
line 1051
;1051:				}
LABELV $452
line 1052
;1052:				if ( !(jk2gameplay == VERSION_1_02 ? Q_irand( 0, 2 + pml.randomAdd, pm->modParms.raceMode, 1) : PM_irand_timesync( 0, 2 + pml.randomAdd, pm->modParms.raceMode, 1)) )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $463
CNSTI4 0
ARGI4
ADDRGP4 pml+1168
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 76
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
ADDRGP4 $464
JUMPV
LABELV $463
CNSTI4 0
ARGI4
ADDRGP4 pml+1168
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 80
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 80
INDIRI4
ASGNI4
LABELV $464
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $450
line 1053
;1053:				{
line 1054
;1054:					PM_AddEvent( EV_JUMP );
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1055
;1055:				}
line 1056
;1056:			}
line 1058
;1057:			else
;1058:			{
line 1059
;1059:				return;
LABELV $450
line 1062
;1060:			}
;1061:
;1062:			anim = &pm->animations[(genemy->torsoAnim&~ANIM_TOGGLEBIT)];
ADDRLP4 44
CNSTI4 28
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
MULI4
ADDRGP4 pm
INDIRP4
CNSTI4 260
ADDP4
INDIRP4
ADDP4
ASGNP4
line 1064
;1063:
;1064:			if ( (genemy->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CWCIRCLELOCK ||
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 560
EQI4 $467
ADDRLP4 48
INDIRI4
CNSTI4 553
NEI4 $465
LABELV $467
line 1066
;1065:				(genemy->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF1LOCK )
;1066:			{
line 1067
;1067:				if ( !(jk2gameplay == VERSION_1_02 ? Q_irand( 0, 2 + pml.randomAdd, pm->modParms.raceMode, 1) : PM_irand_timesync( 0, 2 + pml.randomAdd, pm->modParms.raceMode, 1)) )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $473
CNSTI4 0
ARGI4
ADDRGP4 pml+1168
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 56
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 52
ADDRLP4 56
INDIRI4
ASGNI4
ADDRGP4 $474
JUMPV
LABELV $473
CNSTI4 0
ARGI4
ADDRGP4 pml+1168
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 60
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 52
ADDRLP4 60
INDIRI4
ASGNI4
LABELV $474
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $468
line 1068
;1068:				{
line 1069
;1069:					BG_AddPredictableEventToPlayerstate(EV_PAIN, floor((float)80/100*100.0f), genemy);
CNSTF4 1117782016
ARGF4
ADDRLP4 64
ADDRGP4 floor
CALLF4
ASGNF4
CNSTI4 77
ARGI4
ADDRLP4 64
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 1070
;1070:				}
LABELV $468
line 1071
;1071:				PM_SetAnimFrame( genemy, anim->firstFrame+remaining, qtrue, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ARGI4
ADDRLP4 64
CNSTI4 1
ASGNI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 PM_SetAnimFrame
CALLV
pop
line 1072
;1072:			}
ADDRGP4 $436
JUMPV
LABELV $465
line 1074
;1073:			else
;1074:			{
line 1075
;1075:				PM_SetAnimFrame( genemy, anim->firstFrame+anim->numFrames-remaining, qtrue, qtrue );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRLP4 44
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
ADDRLP4 4
INDIRI4
SUBI4
ARGI4
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 PM_SetAnimFrame
CALLV
pop
line 1076
;1076:			}
line 1077
;1077:		}
line 1078
;1078:	}
ADDRGP4 $436
JUMPV
LABELV $435
line 1080
;1079:	else
;1080:	{//something broke us out of it
line 1081
;1081:		PM_SaberLockBreak( genemy, qfalse );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 PM_SaberLockBreak
CALLV
pop
line 1082
;1082:	}
LABELV $436
line 1083
;1083:}
LABELV $432
endproc PM_SaberLocked 88 16
export PM_SaberInBrokenParry
proc PM_SaberInBrokenParry 8 0
line 1086
;1084:
;1085:qboolean PM_SaberInBrokenParry( int move )
;1086:{
line 1087
;1087:	if ( move >= LS_V1_BR && move <= LS_V1_B_ && jk2gameplay != VERSION_1_02)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 89
LTI4 $476
ADDRLP4 0
INDIRI4
CNSTI4 96
GTI4 $476
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $476
line 1088
;1088:	{
line 1089
;1089:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $475
JUMPV
LABELV $476
line 1091
;1090:	}
;1091:	if ( move >= LS_H1_T_ && move <= LS_H1_BL )
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 97
LTI4 $478
ADDRLP4 4
INDIRI4
CNSTI4 102
GTI4 $478
line 1092
;1092:	{
line 1093
;1093:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $475
JUMPV
LABELV $478
line 1095
;1094:	}
;1095:	return qfalse;
CNSTI4 0
RETI4
LABELV $475
endproc PM_SaberInBrokenParry 8 0
export PM_BrokenParryForParry
proc PM_BrokenParryForParry 12 0
line 1100
;1096:}
;1097:
;1098:
;1099:int PM_BrokenParryForParry( int move )
;1100:{
line 1101
;1101:	switch ( move )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $488
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $481
LABELV $489
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 108
LTI4 $481
ADDRLP4 8
INDIRI4
CNSTI4 112
GTI4 $481
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $490-432
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $490
address $483
address $484
address $485
address $486
address $487
code
line 1102
;1102:	{
LABELV $483
line 1104
;1103:	case LS_PARRY_UP:
;1104:		return LS_H1_T_;
CNSTI4 97
RETI4
ADDRGP4 $480
JUMPV
line 1105
;1105:		break;
LABELV $484
line 1107
;1106:	case LS_PARRY_UR:
;1107:		return LS_H1_TR;
CNSTI4 98
RETI4
ADDRGP4 $480
JUMPV
line 1108
;1108:		break;
LABELV $485
line 1110
;1109:	case LS_PARRY_UL:
;1110:		return LS_H1_TL;
CNSTI4 99
RETI4
ADDRGP4 $480
JUMPV
line 1111
;1111:		break;
LABELV $486
line 1113
;1112:	case LS_PARRY_LR:
;1113:		return LS_H1_BL;
CNSTI4 102
RETI4
ADDRGP4 $480
JUMPV
line 1114
;1114:		break;
LABELV $487
line 1116
;1115:	case LS_PARRY_LL:
;1116:		return LS_H1_BR;
CNSTI4 100
RETI4
ADDRGP4 $480
JUMPV
line 1117
;1117:		break;
LABELV $488
line 1119
;1118:	case LS_READY:
;1119:		return LS_H1_B_;
CNSTI4 101
RETI4
ADDRGP4 $480
JUMPV
line 1120
;1120:		break;
LABELV $481
line 1122
;1121:	}
;1122:	return LS_NONE;
CNSTI4 0
RETI4
LABELV $480
endproc PM_BrokenParryForParry 12 0
lit
align 4
LABELV $493
byte 4 3245342720
byte 4 3245342720
byte 4 3238002688
align 4
LABELV $494
byte 4 1097859072
byte 4 1097859072
byte 4 1090519040
export PM_CanBackstab
code
proc PM_CanBackstab 1152 28
line 1128
;1123:}
;1124:
;1125:#define BACK_STAB_DISTANCE 128
;1126:
;1127:qboolean PM_CanBackstab(void)
;1128:{
line 1132
;1129:	trace_t tr;
;1130:	vec3_t flatAng;
;1131:	vec3_t fwd, back;
;1132:	vec3_t trmins = {-15, -15, -8};
ADDRLP4 1116
ADDRGP4 $493
INDIRB
ASGNB 12
line 1133
;1133:	vec3_t trmaxs = {15, 15, 8};
ADDRLP4 1128
ADDRGP4 $494
INDIRB
ASGNB 12
line 1135
;1134:
;1135:	VectorCopy(pm->ps->viewangles, flatAng);
ADDRLP4 1104
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 1136
;1136:	flatAng[PITCH] = 0;
ADDRLP4 1104
CNSTF4 0
ASGNF4
line 1138
;1137:
;1138:	AngleVectors(flatAng, fwd, 0, 0);
ADDRLP4 1104
ARGP4
ADDRLP4 1080
ARGP4
ADDRLP4 1140
CNSTP4 0
ASGNP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRLP4 1140
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1140
;1139:
;1140:	back[0] = pm->ps->origin[0] - fwd[0]*BACK_STAB_DISTANCE;
ADDRLP4 1092
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 1080
INDIRF4
MULF4
SUBF4
ASGNF4
line 1141
;1141:	back[1] = pm->ps->origin[1] - fwd[1]*BACK_STAB_DISTANCE;
ADDRLP4 1092+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 1080+4
INDIRF4
MULF4
SUBF4
ASGNF4
line 1142
;1142:	back[2] = pm->ps->origin[2] - fwd[2]*BACK_STAB_DISTANCE;
ADDRLP4 1092+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1124073472
ADDRLP4 1080+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 1144
;1143:
;1144:	pm->rawtrace(&tr, pm->ps->origin, trmins, trmaxs, back, pm->ps->clientNum, MASK_PLAYERSOLID);
ADDRLP4 0
ARGP4
ADDRLP4 1144
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1148
ADDRLP4 1144
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1116
ARGP4
ADDRLP4 1128
ARGP4
ADDRLP4 1092
ARGP4
ADDRLP4 1148
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRLP4 1144
INDIRP4
CNSTI4 472
ADDP4
INDIRP4
CALLV
pop
line 1146
;1145:
;1146:	if (tr.fraction != 1.0 && tr.entityNum >= 0 && tr.entityNum < MAX_CLIENTS)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $499
ADDRLP4 0+52
INDIRI4
CNSTI4 0
LTI4 $499
ADDRLP4 0+52
INDIRI4
CNSTI4 32
GEI4 $499
line 1147
;1147:	{ //We don't have real entity access here so we can't do an indepth check. But if it's a client and it's behind us, I guess that's reason enough to stab backward
line 1148
;1148:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $492
JUMPV
LABELV $499
line 1151
;1149:	}
;1150:
;1151:	return qfalse;
CNSTI4 0
RETI4
LABELV $492
endproc PM_CanBackstab 1152 28
export PM_SaberFlipOverAttackMove
proc PM_SaberFlipOverAttackMove 64 16
line 1155
;1152:}
;1153:
;1154:saberMoveName_t PM_SaberFlipOverAttackMove(trace_t *tr)
;1155:{
line 1157
;1156:	vec3_t fwdAngles, jumpFwd;
;1157:	float zDiff = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 1160
;1158:	playerState_t *psData;
;1159:
;1160:	VectorCopy( pm->ps->viewangles, fwdAngles );
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 1161
;1161:	fwdAngles[PITCH] = fwdAngles[ROLL] = 0;
ADDRLP4 32
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 32
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 32
INDIRF4
ASGNF4
line 1162
;1162:	AngleVectors( fwdAngles, jumpFwd, NULL, NULL );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
CNSTP4 0
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1163
;1163:	VectorScale( jumpFwd, 50, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1112014848
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1112014848
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1112014848
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 1164
;1164:	pm->ps->velocity[2] = 400;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1137180672
ASGNF4
line 1166
;1165:
;1166:	psData = pm->bgClients[tr->entityNum];
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
CNSTI4 324
ADDP4
ADDP4
INDIRP4
ASGNP4
line 1169
;1167:
;1168:	//go higher for enemies higher than you, lower for those lower than you
;1169:	if (psData)
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $508
line 1170
;1170:	{
line 1171
;1171:		zDiff = psData->origin[2] - pm->ps->origin[2];
ADDRLP4 40
CNSTI4 28
ASGNI4
ADDRLP4 24
ADDRLP4 28
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1172
;1172:	}
ADDRGP4 $509
JUMPV
LABELV $508
line 1174
;1173:	else
;1174:	{
line 1175
;1175:		zDiff = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 1176
;1176:	}
LABELV $509
line 1177
;1177:	pm->ps->velocity[2] += (zDiff)*1.5f;
ADDRLP4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1069547520
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 1180
;1178:
;1179:	//clamp to decent-looking values
;1180:	if ( zDiff <= 0 && pm->ps->velocity[2] < 200 )
ADDRLP4 24
INDIRF4
CNSTF4 0
GTF4 $510
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1128792064
GEF4 $510
line 1181
;1181:	{//if we're on same level, don't let me jump so low, I clip into the ground
line 1182
;1182:		pm->ps->velocity[2] = 200;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1128792064
ASGNF4
line 1183
;1183:	}
ADDRGP4 $511
JUMPV
LABELV $510
line 1184
;1184:	else if ( pm->ps->velocity[2] < 100 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1120403456
GEF4 $512
line 1185
;1185:	{
line 1186
;1186:		pm->ps->velocity[2] = 100;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1120403456
ASGNF4
line 1187
;1187:	}
ADDRGP4 $513
JUMPV
LABELV $512
line 1188
;1188:	else if ( pm->ps->velocity[2] > 400 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1137180672
LEF4 $514
line 1189
;1189:	{
line 1190
;1190:		pm->ps->velocity[2] = 400;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1137180672
ASGNF4
line 1191
;1191:	}
LABELV $514
LABELV $513
LABELV $511
line 1193
;1192:
;1193:	PM_SetForceJumpZStart(pm->ps->origin[2]);//so we don't take damage if we land at same height
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRGP4 PM_SetForceJumpZStart
CALLV
pop
line 1195
;1194:
;1195:	PM_AddEvent( EV_JUMP );
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1196
;1196:	pm->ps->fd.forceJumpSound = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1100
ADDP4
CNSTI4 1
ASGNI4
line 1197
;1197:	pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 1199
;1198:
;1199:	if ( ((jk2gameplay == VERSION_1_02 && !pm->unlockRandom) ? Q_irand( 0, 1, pm->modParms.raceMode, 0) : PM_irand_timesync( 0, 1 + pml.randomAdd, pm->modParms.raceMode, 0)) ) // if we unlock random make sure we are synced. normally just 0 always anyway so nothing changes (except for esoteric qvm random propagation which for our little experiment we'll ignore)
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $520
ADDRGP4 pm
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
CNSTI4 0
NEI4 $520
ADDRLP4 48
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 Q_irand
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 52
INDIRI4
ASGNI4
ADDRGP4 $521
JUMPV
LABELV $520
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 pml+1168
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 60
INDIRI4
ASGNI4
LABELV $521
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $516
line 1200
;1200:	{
line 1201
;1201:		return LS_A_FLIP_STAB;
CNSTI4 16
RETI4
ADDRGP4 $504
JUMPV
LABELV $516
line 1204
;1202:	}
;1203:	else
;1204:	{
line 1205
;1205:		return LS_A_FLIP_SLASH;
CNSTI4 17
RETI4
LABELV $504
endproc PM_SaberFlipOverAttackMove 64 16
lit
align 4
LABELV $523
byte 4 3245342720
byte 4 3245342720
byte 4 3238002688
align 4
LABELV $524
byte 4 1097859072
byte 4 1097859072
byte 4 1090519040
export PM_SomeoneInFront
code
proc PM_SomeoneInFront 80 28
line 1212
;1206:	}
;1207:}
;1208:
;1209:#define FLIPHACK_DISTANCE 200
;1210:
;1211:qboolean PM_SomeoneInFront(trace_t *tr)
;1212:{ //Also a very simplified version of the sp counterpart
line 1215
;1213:	vec3_t flatAng;
;1214:	vec3_t fwd, back;
;1215:	vec3_t trmins = {-15, -15, -8};
ADDRLP4 36
ADDRGP4 $523
INDIRB
ASGNB 12
line 1216
;1216:	vec3_t trmaxs = {15, 15, 8};
ADDRLP4 48
ADDRGP4 $524
INDIRB
ASGNB 12
line 1218
;1217:
;1218:	VectorCopy(pm->ps->viewangles, flatAng);
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 1219
;1219:	flatAng[PITCH] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 1221
;1220:
;1221:	AngleVectors(flatAng, fwd, 0, 0);
ADDRLP4 24
ARGP4
ADDRLP4 0
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
ADDRGP4 AngleVectors
CALLV
pop
line 1223
;1222:
;1223:	back[0] = pm->ps->origin[0] + fwd[0]*FLIPHACK_DISTANCE;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1128792064
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 1224
;1224:	back[1] = pm->ps->origin[1] + fwd[1]*FLIPHACK_DISTANCE;
ADDRLP4 12+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1128792064
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1225
;1225:	back[2] = pm->ps->origin[2] + fwd[2]*FLIPHACK_DISTANCE;
ADDRLP4 12+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1128792064
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1227
;1226:
;1227:	pm->trace(tr, pm->ps->origin, trmins, trmaxs, back, pm->ps->clientNum, MASK_PLAYERSOLID);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 64
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 273
ARGI4
ADDRLP4 64
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 1229
;1228:
;1229:	if (tr->fraction != 1.0 && tr->entityNum >= 0 && tr->entityNum < MAX_CLIENTS)
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1065353216
EQF4 $529
ADDRLP4 76
ADDRLP4 72
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
LTI4 $529
ADDRLP4 76
INDIRI4
CNSTI4 32
GEI4 $529
line 1230
;1230:	{
line 1231
;1231:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $522
JUMPV
LABELV $529
line 1234
;1232:	}
;1233:
;1234:	return qfalse;
CNSTI4 0
RETI4
LABELV $522
endproc PM_SomeoneInFront 80 28
export PM_SaberLungeAttackMove
proc PM_SaberLungeAttackMove 32 16
line 1238
;1235:}
;1236:
;1237:saberMoveName_t PM_SaberLungeAttackMove( void )
;1238:{
line 1241
;1239:	vec3_t fwdAngles, jumpFwd;
;1240:
;1241:	VectorCopy( pm->ps->viewangles, fwdAngles );
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 1242
;1242:	fwdAngles[PITCH] = fwdAngles[ROLL] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
ASGNF4
line 1244
;1243:	//do the lunge
;1244:	AngleVectors( fwdAngles, jumpFwd, NULL, NULL );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 28
CNSTP4 0
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1245
;1245:	VectorScale( jumpFwd, 150, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1125515264
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1125515264
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1125515264
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 1246
;1246:	PM_AddEvent( EV_JUMP );
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1248
;1247:
;1248:	return LS_A_LUNGE;
CNSTI4 14
RETI4
LABELV $531
endproc PM_SaberLungeAttackMove 32 16
export PM_SaberJumpAttackMove
proc PM_SaberJumpAttackMove 32 16
line 1252
;1249:}
;1250:
;1251:saberMoveName_t PM_SaberJumpAttackMove( void )
;1252:{
line 1255
;1253:	vec3_t fwdAngles, jumpFwd;
;1254:
;1255:	VectorCopy( pm->ps->viewangles, fwdAngles );
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 156
ADDP4
INDIRB
ASGNB 12
line 1256
;1256:	fwdAngles[PITCH] = fwdAngles[ROLL] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
ASGNF4
line 1257
;1257:	AngleVectors( fwdAngles, jumpFwd, NULL, NULL );
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 28
CNSTP4 0
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1261
;1258:
;1259:	// TODO MAYBE jaPRO thingie
;1260:
;1261:	VectorScale( jumpFwd, 300, pm->ps->velocity );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1133903872
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1133903872
ADDRLP4 12+4
INDIRF4
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1133903872
ADDRLP4 12+8
INDIRF4
MULF4
ASGNF4
line 1262
;1262:	pm->ps->velocity[2] = 280;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1133248512
ASGNF4
line 1263
;1263:	PM_SetForceJumpZStart(pm->ps->origin[2]);//so we don't take damage if we land at same height
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ARGF4
ADDRGP4 PM_SetForceJumpZStart
CALLV
pop
line 1265
;1264:
;1265:	PM_AddEvent( EV_JUMP );
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1266
;1266:	pm->ps->fd.forceJumpSound = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1100
ADDP4
CNSTI4 1
ASGNI4
line 1267
;1267:	pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 30
ADDP4
CNSTI1 0
ASGNI1
line 1269
;1268:
;1269:	return LS_A_JUMP_T__B_;
CNSTI4 15
RETI4
LABELV $535
endproc PM_SaberJumpAttackMove 32 16
export PM_GroundDistance
proc PM_GroundDistance 1108 28
line 1273
;1270:}
;1271:
;1272:float PM_GroundDistance(void)
;1273:{
line 1277
;1274:	trace_t tr;
;1275:	vec3_t down;
;1276:
;1277:	VectorCopy(pm->ps->origin, down);
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1279
;1278:
;1279:	down[2] -= 4096;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 1281
;1280:
;1281:	pm->trace(&tr, pm->ps->origin, pm->mins, pm->maxs, down, pm->ps->clientNum, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRLP4 1092
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 1096
ADDRLP4 1092
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 1092
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRLP4 1092
INDIRP4
CNSTI4 232
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1096
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1092
INDIRP4
CNSTI4 300
ADDP4
INDIRP4
CALLV
pop
line 1283
;1282:
;1283:	VectorSubtract(pm->ps->origin, tr.endpos, down);
ADDRLP4 1100
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1100
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 12+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1100
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 12+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 12+12+8
INDIRF4
SUBF4
ASGNF4
line 1285
;1284:
;1285:	return VectorLength(down);
ADDRLP4 0
ARGP4
ADDRLP4 1104
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 1104
INDIRF4
RETF4
LABELV $539
endproc PM_GroundDistance 1108 28
export PM_SaberAttackForMovement
proc PM_SaberAttackForMovement 1112 16
line 1294
;1286:}
;1287:
;1288:#define SABER_ALT_ATTACK_POWER		50//75?
;1289:#define SABER_ALT_ATTACK_POWER_LR	10//30?
;1290:#define SABER_ALT_ATTACK_POWER_FB	25//30/50?
;1291:
;1292:
;1293:saberMoveName_t PM_SaberAttackForMovement(saberMoveName_t curmove)
;1294:{
line 1295
;1295:	saberMoveName_t newmove = LS_INVALID;
ADDRLP4 0
CNSTI4 -1
ASGNI4
line 1297
;1296:
;1297:	if ( pm->cmd.rightmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $549
line 1298
;1298:	{//moving right
line 1300
;1299:		if (//!noSpecials
;1300:			(pm->modParms.runFlags & RFL_CLIMBTECH)
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $551
ADDRLP4 4
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1101004800
LEF4 $551
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $551
ADDRLP4 12
ADDRGP4 PM_GroundDistance
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 1116471296
GEF4 $551
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
GTI4 $553
ADDRLP4 16
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 20
INDIRI4
EQI4 $551
LABELV $553
CNSTI4 10
ARGI4
ADDRLP4 24
ADDRGP4 BG_EnoughForcePowerForMove
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $551
line 1308
;1301:			//&& overrideJumpRightAttackMove != LS_NONE
;1302:			&& pm->ps->velocity[2] > 20.0f //pm->ps->groundEntityNum != ENTITYNUM_NONE//on ground
;1303:			&& (pm->cmd.buttons & BUTTON_ATTACK)//hitting attack
;1304:			&& PM_GroundDistance() < 70.0f //not too high above ground
;1305:			&& (pm->cmd.upmove > 0 || (pm->ps->pm_flags & PMF_JUMP_HELD))//focus-holding player
;1306:			&& BG_EnoughForcePowerForMove(SABER_ALT_ATTACK_POWER_LR)//have enough power
;1307:			)
;1308:		{//cartwheel right
line 1310
;1309:			//if (allowCartwheels || (pm->ps->fd.saberAnimLevel == SS_STAFF)) { //dunno why do this if they cant cart..?
;1310:				BG_ForcePowerDrain(pm->ps, FP_GRIP, SABER_ALT_ATTACK_POWER_LR);
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1318
;1311:			//}
;1312:			//if (overrideJumpRightAttackMove != LS_INVALID)
;1313:			//{//overridden with another move
;1314:			//	return overrideJumpRightAttackMove;
;1315:			//}
;1316:			//else 
;1317:			//if (allowCartwheels || (pm->ps->fd.saberAnimLevel == SS_STAFF))
;1318:			{
line 1321
;1319:				vec3_t right, fwdAngles;
;1320:
;1321:				VectorSet(fwdAngles, 0.0f, pm->ps->viewangles[YAW], 0.0f);
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 40+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 40+8
CNSTF4 0
ASGNF4
line 1323
;1322:
;1323:				AngleVectors(fwdAngles, NULL, right, NULL);
ADDRLP4 40
ARGP4
ADDRLP4 52
CNSTP4 0
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1324
;1324:				pm->ps->velocity[0] = pm->ps->velocity[1] = 0.0f;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 56
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 56
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 60
INDIRF4
ASGNF4
line 1325
;1325:				VectorMA(pm->ps->velocity, 190.0f, right, pm->ps->velocity);
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
CNSTF4 1128136704
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
CNSTF4 1128136704
ADDRLP4 28+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
CNSTF4 1128136704
ADDRLP4 28+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1333
;1326:				//if (pm->ps->fd.saberAnimLevel == SS_STAFF)
;1327:				//{
;1328:				//	newmove = LS_BUTTERFLY_RIGHT;
;1329:				//	pm->ps->velocity[2] = 350.0f;
;1330:				//}
;1331:				//else 
;1332:				//if (allowCartwheels)
;1333:				{
line 1335
;1334:					//PM_SetJumped( JUMP_VELOCITY, qtrue );
;1335:					PM_AddEvent(EV_JUMP);
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1336
;1336:					pm->ps->velocity[2] = 300.0f;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1133903872
ASGNF4
line 1340
;1337:
;1338:					//if ( !Q_irand( 0, 1 ) )
;1339:					//if (PM_GroundDistance() >= 25.0f)
;1340:					if (1)
line 1341
;1341:					{
line 1342
;1342:						newmove = LS_JUMPATTACK_ARIAL_RIGHT;
ADDRLP4 0
CNSTI4 119
ASGNI4
line 1343
;1343:					}
line 1348
;1344:					//else
;1345:					//{
;1346:					//	newmove = LS_JUMPATTACK_CART_RIGHT;
;1347:					//}
;1348:				}
line 1349
;1349:			}
line 1350
;1350:		} 
ADDRGP4 $550
JUMPV
LABELV $551
line 1351
;1351:		else if ( pm->cmd.forwardmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $560
line 1352
;1352:		{//forward right = TL2BR slash
line 1353
;1353:			newmove = LS_A_TL2BR;
ADDRLP4 0
CNSTI4 4
ASGNI4
line 1354
;1354:		}
ADDRGP4 $550
JUMPV
LABELV $560
line 1355
;1355:		else if ( pm->cmd.forwardmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $562
line 1356
;1356:		{//backward right = BL2TR uppercut
line 1357
;1357:			newmove = LS_A_BL2TR;
ADDRLP4 0
CNSTI4 6
ASGNI4
line 1358
;1358:		}
ADDRGP4 $550
JUMPV
LABELV $562
line 1360
;1359:		else
;1360:		{//just right is a left slice
line 1361
;1361:			newmove = LS_A_L2R;
ADDRLP4 0
CNSTI4 5
ASGNI4
line 1362
;1362:		}
line 1363
;1363:	}
ADDRGP4 $550
JUMPV
LABELV $549
line 1364
;1364:	else if ( pm->cmd.rightmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $564
line 1365
;1365:	{//moving left
line 1367
;1366:		if (//!noSpecials
;1367:			(pm->modParms.runFlags & RFL_CLIMBTECH)
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $566
ADDRLP4 4
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1101004800
LEF4 $566
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 8
INDIRI4
EQI4 $566
ADDRLP4 12
ADDRGP4 PM_GroundDistance
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
CNSTF4 1116471296
GEF4 $566
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRLP4 16
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 20
INDIRI4
GTI4 $568
ADDRLP4 16
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRLP4 20
INDIRI4
EQI4 $566
LABELV $568
CNSTI4 10
ARGI4
ADDRLP4 24
ADDRGP4 BG_EnoughForcePowerForMove
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $566
line 1375
;1368:			//&& overrideJumpLeftAttackMove != LS_NONE
;1369:			&& pm->ps->velocity[2] > 20.0f //pm->ps->groundEntityNum != ENTITYNUM_NONE//on ground
;1370:			&& (pm->cmd.buttons & BUTTON_ATTACK)//hitting attack
;1371:			&& PM_GroundDistance() < 70.0f //not too high above ground
;1372:			&& (pm->cmd.upmove > 0 || (pm->ps->pm_flags & PMF_JUMP_HELD))//focus-holding player
;1373:			&& BG_EnoughForcePowerForMove(SABER_ALT_ATTACK_POWER_LR)//have enough power
;1374:			)
;1375:		{//cartwheel left
line 1377
;1376:			//if (allowCartwheels || (pm->ps->fd.saberAnimLevel == SS_STAFF)) { //dunno why do this if they cant cart..?
;1377:				BG_ForcePowerDrain(pm->ps, FP_GRIP, SABER_ALT_ATTACK_POWER_LR);
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1386
;1378:			//}
;1379:
;1380:			//if (overrideJumpLeftAttackMove != LS_INVALID)
;1381:			//{//overridden with another move
;1382:			//	return overrideJumpLeftAttackMove;
;1383:			//}
;1384:			//else 
;1385:			//if (allowCartwheels || (pm->ps->fd.saberAnimLevel == SS_STAFF))
;1386:			{
line 1389
;1387:				vec3_t right, fwdAngles;
;1388:
;1389:				VectorSet(fwdAngles, 0.0f, pm->ps->viewangles[YAW], 0.0f);
ADDRLP4 40
CNSTF4 0
ASGNF4
ADDRLP4 40+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ASGNF4
ADDRLP4 40+8
CNSTF4 0
ASGNF4
line 1390
;1390:				AngleVectors(fwdAngles, NULL, right, NULL);
ADDRLP4 40
ARGP4
ADDRLP4 52
CNSTP4 0
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1391
;1391:				pm->ps->velocity[0] = pm->ps->velocity[1] = 0.0f;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 60
CNSTF4 0
ASGNF4
ADDRLP4 56
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 60
INDIRF4
ASGNF4
ADDRLP4 56
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 60
INDIRF4
ASGNF4
line 1392
;1392:				VectorMA(pm->ps->velocity, -190.0f, right, pm->ps->velocity);
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRF4
CNSTF4 3275620352
ADDRLP4 28
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRF4
CNSTF4 3275620352
ADDRLP4 28+4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
CNSTF4 3275620352
ADDRLP4 28+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1400
;1393:				//if (pm->ps->fd.saberAnimLevel == SS_STAFF)
;1394:				//{
;1395:				//	newmove = LS_BUTTERFLY_LEFT;
;1396:				//	pm->ps->velocity[2] = 250.0f;
;1397:				//}
;1398:				//else 
;1399:				//if (allowCartwheels)
;1400:				{
line 1402
;1401:					//PM_SetJumped( JUMP_VELOCITY, qtrue );
;1402:					PM_AddEvent(EV_JUMP);
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1403
;1403:					pm->ps->velocity[2] = 350.0f;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1135542272
ASGNF4
line 1407
;1404:
;1405:					//if ( !Q_irand( 0, 1 ) )
;1406:					//if (PM_GroundDistance() >= 25.0f)
;1407:					if (1)
line 1408
;1408:					{
line 1409
;1409:						newmove = LS_JUMPATTACK_ARIAL_LEFT;
ADDRLP4 0
CNSTI4 118
ASGNI4
line 1410
;1410:					}
line 1415
;1411:					//else
;1412:					//{
;1413:					//	newmove = LS_JUMPATTACK_CART_LEFT;
;1414:					//}
;1415:				}
line 1416
;1416:			}
line 1417
;1417:		}
ADDRGP4 $565
JUMPV
LABELV $566
line 1418
;1418:		else if ( pm->cmd.forwardmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $575
line 1419
;1419:		{//forward left = TR2BL slash
line 1420
;1420:			newmove = LS_A_TR2BL;
ADDRLP4 0
CNSTI4 9
ASGNI4
line 1421
;1421:		}
ADDRGP4 $565
JUMPV
LABELV $575
line 1422
;1422:		else if ( pm->cmd.forwardmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $577
line 1423
;1423:		{//backward left = BR2TL uppercut
line 1424
;1424:			newmove = LS_A_BR2TL;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 1425
;1425:		}
ADDRGP4 $565
JUMPV
LABELV $577
line 1427
;1426:		else
;1427:		{//just left is a right slice
line 1428
;1428:			newmove = LS_A_R2L;
ADDRLP4 0
CNSTI4 8
ASGNI4
line 1429
;1429:		}
line 1430
;1430:	}
ADDRGP4 $565
JUMPV
LABELV $564
line 1432
;1431:	else
;1432:	{//not moving left or right
line 1433
;1433:		if ( pm->cmd.forwardmove > 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $579
line 1434
;1434:		{//forward= T2B slash
line 1435
;1435:			if (pm->ps->fd.saberAnimLevel == FORCE_LEVEL_2 &&
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
NEI4 $581
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1120403456
LEF4 $581
ADDRLP4 8
ADDRGP4 PM_GroundDistance
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 1107296256
GEF4 $581
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $581
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $583
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $581
LABELV $583
line 1440
;1436:				pm->ps->velocity[2] > 100 &&
;1437:				PM_GroundDistance() < 32 &&
;1438:				!BG_InSpecialJump(pm->ps->legsAnim, pm->modParms.runFlags) &&
;1439:				(!BG_SaberInSpecialAttack(pm->ps->torsoAnim) || jk2gameplay != VERSION_1_04))
;1440:			{ //FLIP AND DOWNWARD ATTACK
line 1443
;1441:				trace_t tr;
;1442:
;1443:				if (PM_SomeoneInFront(&tr))
ADDRLP4 24
ARGP4
ADDRLP4 1104
ADDRGP4 PM_SomeoneInFront
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
EQI4 $580
line 1444
;1444:				{
line 1445
;1445:					newmove = PM_SaberFlipOverAttackMove(&tr);
ADDRLP4 24
ARGP4
ADDRLP4 1108
ADDRGP4 PM_SaberFlipOverAttackMove
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1108
INDIRI4
ASGNI4
line 1446
;1446:				}
line 1447
;1447:			}
ADDRGP4 $580
JUMPV
LABELV $581
line 1449
;1448:			else if (
;1449:				(pm->modParms.runFlags & RFL_CLIMBTECH) &&
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $586
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 3
NEI4 $586
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 1120403456
LEF4 $586
ADDRLP4 32
ADDRGP4 PM_GroundDistance
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1107296256
GEF4 $586
ADDRLP4 36
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $586
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $586
CNSTI4 25
ARGI4
ADDRLP4 48
ADDRGP4 BG_EnoughForcePowerForMove
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $586
line 1457
;1450:				pm->ps->fd.saberAnimLevel == FORCE_LEVEL_3 &&
;1451:				pm->ps->velocity[2] > 100 &&
;1452:				PM_GroundDistance() < 32 &&
;1453:				!BG_InSpecialJump(pm->ps->legsAnim, pm->modParms.runFlags) &&
;1454:				!BG_SaberInSpecialAttack(pm->ps->torsoAnim) 
;1455:				&& BG_EnoughForcePowerForMove(SABER_ALT_ATTACK_POWER_FB)
;1456:				)
;1457:			{ //DFA (JKA)
line 1458
;1458:				{
line 1459
;1459:					newmove = PM_SaberJumpAttackMove();
ADDRLP4 52
ADDRGP4 PM_SaberJumpAttackMove
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 52
INDIRI4
ASGNI4
line 1460
;1460:					if (newmove != LS_A_T2B
ADDRLP4 56
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 10
EQI4 $580
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $580
line 1462
;1461:						&& newmove != LS_NONE)
;1462:					{
line 1463
;1463:						BG_ForcePowerDrain(pm->ps, FP_GRIP, SABER_ALT_ATTACK_POWER_FB);
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
CNSTI4 25
ARGI4
ADDRGP4 BG_ForcePowerDrain
CALLV
pop
line 1464
;1464:					}
line 1465
;1465:				}
line 1466
;1466:			}
ADDRGP4 $580
JUMPV
LABELV $586
line 1467
;1467:			else if (pm->ps->fd.saberAnimLevel == FORCE_LEVEL_1 &&
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 1
NEI4 $590
ADDRLP4 52
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $592
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $590
LABELV $592
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 60
INDIRI4
EQI4 $590
ADDRLP4 56
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
GTI4 $590
ADDRLP4 56
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $593
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $590
LABELV $593
line 1472
;1468:				(pm->ps->groundEntityNum != ENTITYNUM_NONE || jk2gameplay != VERSION_1_04) &&
;1469:				(pm->ps->pm_flags & PMF_DUCKED) &&
;1470:				pm->ps->weaponTime <= 0 &&
;1471:				(!BG_SaberInSpecialAttack(pm->ps->torsoAnim) || jk2gameplay != VERSION_1_04))
;1472:			{ //LUNGE (weak)
line 1473
;1473:				newmove = PM_SaberLungeAttackMove();
ADDRLP4 68
ADDRGP4 PM_SaberLungeAttackMove
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 68
INDIRI4
ASGNI4
line 1474
;1474:			}
ADDRGP4 $580
JUMPV
LABELV $590
line 1476
;1475:			else
;1476:			{
line 1477
;1477:				newmove = LS_A_T2B;
ADDRLP4 0
CNSTI4 10
ASGNI4
line 1478
;1478:			}
line 1479
;1479:		}
ADDRGP4 $580
JUMPV
LABELV $579
line 1480
;1480:		else if ( pm->cmd.forwardmove < 0 )
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $594
line 1481
;1481:		{//backward= T2B slash//B2T uppercut?
line 1482
;1482:			if (PM_CanBackstab() && (!BG_SaberInSpecialAttack(pm->ps->torsoAnim) || jk2gameplay != VERSION_1_04))
ADDRLP4 4
ADDRGP4 PM_CanBackstab
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $596
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $598
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 4
EQI4 $596
LABELV $598
line 1483
;1483:			{ //BACKSTAB (attack varies by level)
line 1484
;1484:				if (pm->ps->fd.saberAnimLevel >= FORCE_LEVEL_2)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 2
LTI4 $599
line 1485
;1485:				{//medium and higher attacks
line 1486
;1486:					if ( (pm->ps->pm_flags&PMF_DUCKED) || pm->cmd.upmove < 0 )
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 12
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRLP4 16
INDIRI4
NEI4 $603
ADDRLP4 12
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 16
INDIRI4
GEI4 $601
LABELV $603
line 1487
;1487:					{
line 1488
;1488:						newmove = LS_A_BACK_CR;
ADDRLP4 0
CNSTI4 13
ASGNI4
line 1489
;1489:					}
ADDRGP4 $595
JUMPV
LABELV $601
line 1491
;1490:					else
;1491:					{
line 1492
;1492:						newmove = LS_A_BACK;
ADDRLP4 0
CNSTI4 12
ASGNI4
line 1493
;1493:					}
line 1494
;1494:				}
ADDRGP4 $595
JUMPV
LABELV $599
line 1496
;1495:				else
;1496:				{ //weak attack
line 1497
;1497:					newmove = LS_A_BACKSTAB;
ADDRLP4 0
CNSTI4 11
ASGNI4
line 1498
;1498:				}
line 1499
;1499:			}
ADDRGP4 $595
JUMPV
LABELV $596
line 1501
;1500:			else
;1501:			{
line 1502
;1502:				newmove = LS_A_T2B;
ADDRLP4 0
CNSTI4 10
ASGNI4
line 1503
;1503:			}
line 1504
;1504:		}
ADDRGP4 $595
JUMPV
LABELV $594
line 1505
;1505:		else if ( PM_SaberInBounce( curmove ) )
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $604
line 1506
;1506:		{//bounces should go to their default attack if you don't specify a direction but are attacking
line 1507
;1507:			if ( jk2gameplay != VERSION_1_02 ) newmove = saberMoveData[curmove].chain_attack;
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $606
ADDRLP4 0
CNSTI4 40
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 saberMoveData+32
ADDP4
INDIRI4
ASGNI4
LABELV $606
line 1509
;1508:
;1509:			if ( (jk2gameplay != VERSION_1_02 && PM_SaberKataDone(curmove, newmove)) || (jk2gameplay == VERSION_1_02 && PM_SaberKataDone_1_02()) )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $612
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 PM_SaberKataDone
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $611
LABELV $612
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $609
ADDRLP4 12
ADDRGP4 PM_SaberKataDone_1_02
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $609
LABELV $611
line 1510
;1510:			{
line 1511
;1511:				newmove = saberMoveData[curmove].chain_idle;
ADDRLP4 0
CNSTI4 40
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 saberMoveData+28
ADDP4
INDIRI4
ASGNI4
line 1512
;1512:			}
ADDRGP4 $605
JUMPV
LABELV $609
line 1514
;1513:			else
;1514:			{
line 1515
;1515:				newmove = saberMoveData[curmove].chain_attack;
ADDRLP4 0
CNSTI4 40
ADDRFP4 0
INDIRI4
MULI4
ADDRGP4 saberMoveData+32
ADDP4
INDIRI4
ASGNI4
line 1516
;1516:			}
line 1517
;1517:		}
ADDRGP4 $605
JUMPV
LABELV $604
line 1518
;1518:		else if ( curmove == LS_READY )
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $615
line 1519
;1519:		{//Not moving at all, shouldn't have gotten here...?
line 1526
;1520:			//for now, just pick a random attack
;1521:			//newmove = Q_irand( LS_A_TL2BR, LS_A_T2B );
;1522:			//rww - If we don't seed with a "common" value, the client and server will get mismatched
;1523:			//prediction values. Under laggy conditions this will cause the appearance of rapid swing
;1524:			//sequence changes.
;1525:			
;1526:			if ( jk2gameplay == VERSION_1_02 ) newmove = PM_irand_timesync(LS_A_TL2BR, LS_A_T2B + pml.randomAdd, pm->modParms.raceMode, LS_A_TL2BR);
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $617
ADDRLP4 8
CNSTI4 4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 pml+1168
INDIRI4
CNSTI4 10
ADDI4
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRGP4 $618
JUMPV
LABELV $617
line 1527
;1527:			else							   newmove = LS_A_T2B; //decided we don't like random attacks when idle, use an overhead instead.
ADDRLP4 0
CNSTI4 10
ASGNI4
LABELV $618
line 1528
;1528:		}
LABELV $615
LABELV $605
LABELV $595
LABELV $580
line 1529
;1529:	}
LABELV $565
LABELV $550
line 1531
;1530:
;1531:	return newmove;
ADDRLP4 0
INDIRI4
RETI4
LABELV $548
endproc PM_SaberAttackForMovement 1112 16
export PM_WeaponLightsaber
proc PM_WeaponLightsaber 116 16
line 1544
;1532:}
;1533:/*
;1534:=================
;1535:PM_WeaponLightsaber
;1536:
;1537:Consults a chart to choose what to do with the lightsaber.
;1538:While this is a little different than the Quake 3 code, there is no clean way of using the Q3 code for this kind of thing.
;1539:=================
;1540:*/
;1541:// Ultimate goal is to set the sabermove to the proper next location
;1542:// Note that if the resultant animation is NONE, then the animation is essentially "idle", and is set in WP_TorsoAnim
;1543:void PM_WeaponLightsaber(void)
;1544:{
line 1546
;1545:	int			addTime;
;1546:	qboolean	delayed_fire = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 1547
;1547:	int			anim=-1, curmove, newmove=LS_NONE;
ADDRLP4 12
CNSTI4 -1
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1549
;1548:
;1549:	qboolean checkOnlyWeap = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1551
;1550:
;1551: 	if ( pm->ps->saberLockTime > pm->cmd.serverTime )
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 524
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LEI4 $621
line 1552
;1552:	{
line 1553
;1553:		pm->ps->saberMove = LS_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 0
ASGNI4
line 1554
;1554:		PM_SaberLocked();
ADDRGP4 PM_SaberLocked
CALLV
pop
line 1555
;1555:		return;
ADDRGP4 $620
JUMPV
LABELV $621
line 1558
;1556:	}
;1557:	else
;1558:	{
line 1559
;1559:		if ( ( (pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF2LOCK ||
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 550
EQI4 $628
ADDRLP4 32
INDIRI4
CNSTI4 553
EQI4 $628
ADDRLP4 32
INDIRI4
CNSTI4 560
EQI4 $628
ADDRLP4 32
INDIRI4
CNSTI4 561
EQI4 $628
ADDRLP4 28
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
EQI4 $623
LABELV $628
line 1565
;1560:				(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF1LOCK ||
;1561:				(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CWCIRCLELOCK ||
;1562:				(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CCWCIRCLELOCK ||
;1563:				pm->ps->saberLockFrame )
;1564:			)
;1565:		{
line 1566
;1566:			if (pm->ps->saberLockEnemy < ENTITYNUM_NONE &&
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 1023
GEI4 $629
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $629
line 1568
;1567:				pm->ps->saberLockEnemy >= 0)
;1568:			{
line 1571
;1569:				playerState_t *en;
;1570:
;1571:				en = pm->bgClients[pm->ps->saberLockEnemy];
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 44
INDIRP4
CNSTI4 324
ADDP4
ADDP4
INDIRP4
ASGNP4
line 1573
;1572:
;1573:				if (en)
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $631
line 1574
;1574:				{
line 1575
;1575:					PM_SaberLockBreak(en, qfalse);
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 PM_SaberLockBreak
CALLV
pop
line 1576
;1576:					return;
ADDRGP4 $620
JUMPV
LABELV $631
line 1578
;1577:				}
;1578:			}
LABELV $629
line 1580
;1579:
;1580:			if ( ( (pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF2LOCK ||
ADDRLP4 40
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 550
EQI4 $638
ADDRLP4 44
INDIRI4
CNSTI4 553
EQI4 $638
ADDRLP4 44
INDIRI4
CNSTI4 560
EQI4 $638
ADDRLP4 44
INDIRI4
CNSTI4 561
EQI4 $638
ADDRLP4 40
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
EQI4 $633
LABELV $638
line 1586
;1581:					(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_BF1LOCK ||
;1582:					(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CWCIRCLELOCK ||
;1583:					(pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == BOTH_CCWCIRCLELOCK ||
;1584:					pm->ps->saberLockFrame )
;1585:				)
;1586:			{
line 1587
;1587:				pm->ps->torsoTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 0
ASGNI4
line 1588
;1588:				PM_SetAnim(SETANIM_TORSO,BOTH_STAND1,SETANIM_FLAG_OVERRIDE, 100);
ADDRLP4 48
CNSTI4 1
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
CNSTI4 571
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1589
;1589:				pm->ps->saberLockFrame = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 1590
;1590:			}
LABELV $633
line 1591
;1591:		}
LABELV $623
line 1592
;1592:	}
line 1594
;1593:
;1594:	if (pm->ps->saberHolstered)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1312
ADDP4
INDIRI4
CNSTI4 0
EQI4 $639
line 1595
;1595:	{
line 1596
;1596:		if (pm->ps->saberMove != LS_READY)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 1
EQI4 $641
line 1597
;1597:		{
line 1598
;1598:			PM_SetSaberMove( LS_READY );
CNSTI4 1
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1599
;1599:		}
LABELV $641
line 1601
;1600:
;1601:		if ((pm->ps->legsAnim & ~ANIM_TOGGLEBIT) != (pm->ps->torsoAnim & ~ANIM_TOGGLEBIT))
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 -2049
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
BANDI4
ADDRLP4 28
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
BANDI4
EQI4 $643
line 1602
;1602:		{
line 1603
;1603:			PM_SetAnim(SETANIM_TORSO,(pm->ps->legsAnim & ~ANIM_TOGGLEBIT),SETANIM_FLAG_OVERRIDE, 100);
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1604
;1604:		}
LABELV $643
line 1606
;1605:
;1606:		if (BG_InSaberStandAnim(pm->ps->torsoAnim))
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_InSaberStandAnim
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $645
line 1607
;1607:		{
line 1608
;1608:			PM_SetAnim(SETANIM_TORSO,BOTH_STAND1,SETANIM_FLAG_OVERRIDE, 100);
ADDRLP4 40
CNSTI4 1
ASGNI4
ADDRLP4 40
INDIRI4
ARGI4
CNSTI4 571
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1609
;1609:		}
LABELV $645
line 1611
;1610:
;1611:		if (pm->ps->weaponTime < 1 && ((pm->cmd.buttons & BUTTON_ALT_ATTACK) || (pm->cmd.buttons & BUTTON_ATTACK)))
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 1
ASGNI4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
GEI4 $647
ADDRLP4 48
ADDRLP4 40
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 52
INDIRI4
NEI4 $649
ADDRLP4 48
INDIRI4
ADDRLP4 44
INDIRI4
BANDI4
ADDRLP4 52
INDIRI4
EQI4 $647
LABELV $649
line 1612
;1612:		{
line 1613
;1613:			if (pm->ps->duelTime < pm->cmd.serverTime || pm->modParms.raceMode)// && !pm->modParms.raceMode) // is this the correct way to account for racemode?
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
INDIRP4
CNSTI4 1300
ADDP4
INDIRI4
ADDRLP4 56
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $652
ADDRLP4 56
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
CNSTI4 0
EQI4 $650
LABELV $652
line 1614
;1614:			{
line 1615
;1615:				pm->ps->saberHolstered = qfalse;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1312
ADDP4
CNSTI4 0
ASGNI4
line 1616
;1616:				PM_AddEvent(EV_SABER_UNHOLSTER);
CNSTI4 29
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1617
;1617:			}
LABELV $650
line 1618
;1618:		}
LABELV $647
line 1620
;1619:
;1620:		if ( pm->ps->weaponTime > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $653
line 1621
;1621:		{
line 1622
;1622:			pm->ps->weaponTime -= pml.msec;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1623
;1623:		}
LABELV $653
line 1625
;1624:
;1625:		checkOnlyWeap = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 1626
;1626:		goto weapChecks;
ADDRGP4 $656
JUMPV
LABELV $639
line 1629
;1627:	}
;1628:
;1629:	if ((pm->cmd.buttons & BUTTON_ALT_ATTACK) &&
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 128
BANDI4
ADDRLP4 32
INDIRI4
EQI4 $657
ADDRLP4 36
ADDRLP4 28
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 1
GEI4 $657
ADDRLP4 36
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $657
ADDRLP4 36
INDIRP4
CNSTI4 932
ADDP4
INDIRI4
CNSTI4 72
ADDRLP4 36
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 68
ADDP4
INDIRI4
LTI4 $657
ADDRLP4 28
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 BG_HasYsalamiri
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $657
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
CNSTI4 17
ARGI4
ADDRLP4 48
ADDRGP4 BG_CanUseFPNow
CALLI4
ASGNI4
ADDRLP4 52
CNSTI4 0
ASGNI4
ADDRLP4 48
INDIRI4
ADDRLP4 52
INDIRI4
EQI4 $657
ADDRGP4 pm
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
NEI4 $657
line 1637
;1630:		pm->ps->weaponTime < 1 &&
;1631:		pm->ps->saberCanThrow &&
;1632:		pm->ps->fd.forcePower >= forcePowerNeeded[NONETWORK_FORCEPOWERLEVEL(pm->ps,FP_SABERTHROW)][FP_SABERTHROW] &&
;1633:		!BG_HasYsalamiri(pm->gametype, pm->ps) &&
;1634:		BG_CanUseFPNow(pm->gametype, pm->ps, pm->cmd.serverTime, FP_SABERTHROW) &&
;1635:		!pm->modParms.raceMode // don't throw sabers in racemode, its unpredictable what they will do, and they will affect our force power
;1636:		)
;1637:	{ //might as well just check for a saber throw right here
line 1639
;1638:		//This will get set to false again once the saber makes it back to its owner game-side
;1639:		if (!pm->ps->saberInFlight)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
NEI4 $659
line 1640
;1640:		{
line 1641
;1641:			pm->ps->fd.forcePower -= forcePowerNeeded[NONETWORK_FORCEPOWERLEVEL(pm->ps, FP_SABERTHROW)][FP_SABERTHROW];
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
CNSTI4 932
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 72
ADDRLP4 56
INDIRP4
CNSTI4 1012
ADDP4
INDIRI4
MULI4
ADDRGP4 forcePowerNeeded
INDIRP4
ADDP4
CNSTI4 68
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1642
;1642:		}
LABELV $659
line 1644
;1643:
;1644:		pm->ps->saberInFlight = qtrue;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 1645
;1645:	}
LABELV $657
line 1647
;1646:	
;1647:	if ( pm->ps->saberInFlight )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 0
EQI4 $661
line 1648
;1648:	{//guiding saber
line 1649
;1649:		PM_SetAnim(SETANIM_TORSO, BOTH_SABERPULL, SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 100);
CNSTI4 1
ARGI4
CNSTI4 1052
ARGI4
CNSTI4 3
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1650
;1650:		pm->ps->torsoTimer = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 1
ASGNI4
line 1651
;1651:		return;
ADDRGP4 $620
JUMPV
LABELV $661
line 1656
;1652:	}
;1653:
;1654:   // don't allow attack until all buttons are up
;1655:	//This is bad. It freezes the attack state and the animations if you hold the button after respawning, and it looks strange.
;1656:	if ( pm->ps->pm_flags & PMF_RESPAWNED && jk2gameplay == VERSION_1_02 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $663
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $663
line 1657
;1657:		return;
ADDRGP4 $620
JUMPV
LABELV $663
line 1661
;1658:	}
;1659:
;1660:	// check for dead player
;1661:	if ( pm->ps->stats[STAT_HEALTH] <= 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
GTI4 $665
line 1662
;1662:		return;
ADDRGP4 $620
JUMPV
LABELV $665
line 1665
;1663:	}
;1664:
;1665:	if (pm->ps->weaponstate == WEAPON_READY ||
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $669
ADDRLP4 56
INDIRI4
CNSTI4 6
NEI4 $667
LABELV $669
line 1667
;1666:		pm->ps->weaponstate == WEAPON_IDLE)
;1667:	{
line 1668
;1668:		if (pm->ps->saberMove != LS_READY && pm->ps->weaponTime <= 0 && !pm->ps->saberBlocked)
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 1
EQI4 $670
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
GTI4 $670
ADDRLP4 60
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRLP4 64
INDIRI4
NEI4 $670
line 1669
;1669:		{
line 1670
;1670:			PM_SetSaberMove( LS_READY );
CNSTI4 1
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1671
;1671:		}
LABELV $670
line 1672
;1672:	}
LABELV $667
line 1674
;1673:
;1674:	if( (pm->ps->torsoAnim & ~ANIM_TOGGLEBIT) == BOTH_RUN2 ||
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 836
EQI4 $674
ADDRLP4 60
INDIRI4
CNSTI4 833
NEI4 $672
LABELV $674
line 1676
;1675:		(pm->ps->torsoAnim & ~ANIM_TOGGLEBIT) == BOTH_RUN1 )
;1676:	{
line 1677
;1677:		if ((pm->ps->torsoAnim & ~ANIM_TOGGLEBIT) != (pm->ps->legsAnim & ~ANIM_TOGGLEBIT))
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 -2049
ASGNI4
ADDRLP4 64
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
BANDI4
ADDRLP4 64
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
BANDI4
EQI4 $675
line 1678
;1678:		{
line 1679
;1679:			PM_SetAnim(SETANIM_TORSO,(pm->ps->legsAnim & ~ANIM_TOGGLEBIT),SETANIM_FLAG_OVERRIDE, 100);
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1680
;1680:		}
LABELV $675
line 1681
;1681:	}
LABELV $672
line 1684
;1682:
;1683:	// make weapon function
;1684:	if ( pm->ps->weaponTime > 0 ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $677
line 1685
;1685:		pm->ps->weaponTime -= pml.msec;
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1687
;1686:
;1687:		if (pm->ps->saberBlocked && pm->ps->torsoAnim != saberMoveData[pm->ps->saberMove].animToUse)
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $678
ADDRLP4 68
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 40
ADDRLP4 68
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
EQI4 $678
line 1688
;1688:		{ //rww - keep him in the blocking pose until he can attack again
line 1689
;1689:			PM_SetAnim(SETANIM_TORSO,saberMoveData[pm->ps->saberMove].animToUse,saberMoveData[pm->ps->saberMove].animSetFlags|SETANIM_FLAG_HOLD, saberMoveData[pm->ps->saberMove].blendTime);
CNSTI4 1
ARGI4
ADDRLP4 72
CNSTI4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ADDRGP4 saberMoveData+16
ADDP4
INDIRU4
CNSTU4 2
BORU4
CVUI4 4
ARGI4
ADDRLP4 72
INDIRI4
ADDRGP4 saberMoveData+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1690
;1690:			return;
ADDRGP4 $620
JUMPV
line 1692
;1691:		}
;1692:	}
LABELV $677
line 1694
;1693:	else
;1694:	{
line 1695
;1695:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 1696
;1696:	}
LABELV $678
line 1699
;1697:
;1698:	// Now we react to a block action by the player's lightsaber.
;1699:	if ( pm->ps->saberBlocked )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $686
line 1700
;1700:	{
line 1701
;1701:		int firstSet = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
line 1703
;1702:
;1703:		if (!pm->ps->weaponTime)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
NEI4 $688
line 1704
;1704:		{
line 1705
;1705:			firstSet = 1;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 1706
;1706:		}
LABELV $688
line 1708
;1707:
;1708:		switch ( pm->ps->saberBlocked )
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 1
LTI4 $690
ADDRLP4 68
INDIRI4
CNSTI4 13
GTI4 $690
ADDRLP4 68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $734-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $734
address $693
address $696
address $705
address $724
address $726
address $728
address $730
address $732
address $725
address $727
address $729
address $731
address $733
code
line 1709
;1709:		{
LABELV $693
line 1711
;1710:			case BLOCKED_BOUNCE_MOVE:
;1711:				if ( jk2gameplay != VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $691
line 1712
;1712:				{ //act as a bounceMove and reset the saberMove instead of using a seperate value for it
line 1713
;1713:					PM_SetSaberMove( pm->ps->saberMove );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CVII2 4
CVII4 2
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1714
;1714:					pm->ps->weaponTime = pm->ps->torsoTimer;
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 1715
;1715:					pm->ps->saberBlocked = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1716
;1716:				}
line 1717
;1717:				break;
ADDRGP4 $691
JUMPV
LABELV $696
line 1720
;1718:			case BLOCKED_PARRY_BROKEN:
;1719:				//whatever parry we were is in now broken, play the appropriate knocked-away anim
;1720:				{
line 1723
;1721:					int nextMove;
;1722:
;1723:					if ( PM_SaberInBrokenParry( pm->ps->saberMove ) )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $697
line 1724
;1724:					{//already have one...?
line 1725
;1725:						nextMove = pm->ps->saberMove;
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 1726
;1726:					}
ADDRGP4 $698
JUMPV
LABELV $697
line 1728
;1727:					else
;1728:					{
line 1729
;1729:						nextMove = PM_BrokenParryForParry( pm->ps->saberMove );
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 PM_BrokenParryForParry
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 84
INDIRI4
ASGNI4
line 1730
;1730:					}
LABELV $698
line 1731
;1731:					if ( nextMove != LS_NONE )
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $699
line 1732
;1732:					{
line 1733
;1733:						PM_SetSaberMove( nextMove );
ADDRLP4 76
INDIRI4
CVII2 4
CVII4 2
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1734
;1734:						pm->ps->weaponTime = pm->ps->torsoTimer;
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 1735
;1735:					}
ADDRGP4 $691
JUMPV
LABELV $699
line 1736
;1736:					else if ( jk2gameplay != VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $691
line 1737
;1737:					{//Maybe in a knockaway?
line 1738
;1738:						if (pm->ps->weaponTime <= 0)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $691
line 1739
;1739:						{
line 1740
;1740:							pm->ps->saberBlocked = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1741
;1741:						}
line 1742
;1742:					}
line 1743
;1743:				}
line 1744
;1744:				break;
ADDRGP4 $691
JUMPV
LABELV $705
line 1748
;1745:			case BLOCKED_ATK_BOUNCE:
;1746:				// If there is absolutely no blocked move in the chart, don't even mess with the animation.
;1747:				// OR if we are already in a block or parry.
;1748:				if (pm->ps->saberMove >= LS_T1_BR__R)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 32
LTI4 $706
line 1749
;1749:				{//an actual bounce?  Other bounces before this are actually transitions?
line 1750
;1750:					pm->ps->saberBlocked = BLOCKED_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1751
;1751:				}
ADDRGP4 $691
JUMPV
LABELV $706
line 1753
;1752:				else
;1753:				{
line 1756
;1754:					int bounceMove;
;1755:
;1756:					if ( pm->cmd.buttons & BUTTON_ATTACK )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $708
line 1757
;1757:					{//transition to a new attack
line 1758
;1758:						int newQuad = PM_SaberMoveQuadrantForMovement( &pm->cmd );
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 84
ADDRGP4 PM_SaberMoveQuadrantForMovement
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 84
INDIRI4
ASGNI4
ADDRGP4 $711
JUMPV
LABELV $710
line 1760
;1759:						while ( newQuad == saberMoveData[pm->ps->saberMove].startQuad )
;1760:						{//player is still in same attack quad, don't repeat that attack because it looks bad, 
line 1763
;1761:							//FIXME: try to pick one that might look cool?
;1762:							//newQuad = Q_irand( Q_BR, Q_BL );
;1763:							newQuad = PM_irand_timesync( Q_BR, Q_BL + pml.randomAdd, pm->modParms.raceMode, Q_BR); // idk what else to do meh
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRLP4 88
INDIRI4
ARGI4
ADDRGP4 pml+1168
INDIRI4
CNSTI4 6
ADDI4
ARGI4
ADDRGP4 pm
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 PM_irand_timesync
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 92
INDIRI4
ASGNI4
line 1765
;1764:							//FIXME: sanity check, just in case?
;1765:						}//else player is switching up anyway, take the new attack dir
LABELV $711
line 1759
ADDRLP4 80
INDIRI4
CNSTI4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
EQI4 $710
line 1766
;1766:						bounceMove = transitionMove[saberMoveData[pm->ps->saberMove].startQuad][newQuad];
ADDRLP4 76
ADDRLP4 80
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 transitionMove
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1767
;1767:					}
ADDRGP4 $709
JUMPV
LABELV $708
line 1769
;1768:					else
;1769:					{//return to ready
line 1770
;1770:						if ( saberMoveData[pm->ps->saberMove].startQuad == Q_T )
CNSTI4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 3
NEI4 $716
line 1771
;1771:						{
line 1772
;1772:							bounceMove = LS_R_BL2TR;
ADDRLP4 76
CNSTI4 27
ASGNI4
line 1773
;1773:						}
ADDRGP4 $717
JUMPV
LABELV $716
line 1774
;1774:						else if ( saberMoveData[pm->ps->saberMove].startQuad < Q_T )
CNSTI4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 3
GEI4 $719
line 1775
;1775:						{
line 1776
;1776:							bounceMove = LS_R_TL2BR+saberMoveData[pm->ps->saberMove].startQuad-Q_BR;
ADDRLP4 76
CNSTI4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
line 1777
;1777:						}
ADDRGP4 $720
JUMPV
LABELV $719
line 1779
;1778:						else// if ( saberMoveData[pm->ps->saberMove].startQuad > Q_T )
;1779:						{
line 1780
;1780:							bounceMove = LS_R_BR2TL+saberMoveData[pm->ps->saberMove].startQuad-Q_TL;
ADDRLP4 76
CNSTI4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
CNSTI4 28
ADDI4
CNSTI4 4
SUBI4
ASGNI4
line 1781
;1781:						}
LABELV $720
LABELV $717
line 1782
;1782:					}
LABELV $709
line 1783
;1783:					PM_SetSaberMove( bounceMove );
ADDRLP4 76
INDIRI4
CVII2 4
CVII4 2
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1785
;1784:
;1785:					pm->ps->weaponTime = pm->ps->torsoTimer;//+saberMoveData[bounceMove].blendTime+SABER_BLOCK_DUR;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 1787
;1786:
;1787:				}
line 1788
;1788:				break;
ADDRGP4 $691
JUMPV
LABELV $724
line 1790
;1789:			case BLOCKED_UPPER_RIGHT:
;1790:				PM_SetSaberMove( LS_PARRY_UR );
CNSTI4 109
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1791
;1791:				break;
ADDRGP4 $691
JUMPV
LABELV $725
line 1793
;1792:			case BLOCKED_UPPER_RIGHT_PROJ:
;1793:				PM_SetSaberMove( LS_REFLECT_UR );
CNSTI4 114
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1794
;1794:				break;
ADDRGP4 $691
JUMPV
LABELV $726
line 1796
;1795:			case BLOCKED_UPPER_LEFT:
;1796:				PM_SetSaberMove( LS_PARRY_UL );
CNSTI4 110
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1797
;1797:				break;
ADDRGP4 $691
JUMPV
LABELV $727
line 1799
;1798:			case BLOCKED_UPPER_LEFT_PROJ:
;1799:				PM_SetSaberMove( LS_REFLECT_UL );
CNSTI4 115
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1800
;1800:				break;
ADDRGP4 $691
JUMPV
LABELV $728
line 1802
;1801:			case BLOCKED_LOWER_RIGHT:
;1802:				PM_SetSaberMove( LS_PARRY_LR );
CNSTI4 111
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1803
;1803:				break;
ADDRGP4 $691
JUMPV
LABELV $729
line 1805
;1804:			case BLOCKED_LOWER_RIGHT_PROJ:
;1805:				PM_SetSaberMove( LS_REFLECT_LR );
CNSTI4 116
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1806
;1806:				break;
ADDRGP4 $691
JUMPV
LABELV $730
line 1808
;1807:			case BLOCKED_LOWER_LEFT:
;1808:				PM_SetSaberMove( LS_PARRY_LL );
CNSTI4 112
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1809
;1809:				break;
ADDRGP4 $691
JUMPV
LABELV $731
line 1811
;1810:			case BLOCKED_LOWER_LEFT_PROJ:
;1811:				PM_SetSaberMove( LS_REFLECT_LL);
CNSTI4 117
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1812
;1812:				break;
ADDRGP4 $691
JUMPV
LABELV $732
line 1814
;1813:			case BLOCKED_TOP:
;1814:				PM_SetSaberMove( LS_PARRY_UP );
CNSTI4 108
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1815
;1815:				break;
ADDRGP4 $691
JUMPV
LABELV $733
line 1817
;1816:			case BLOCKED_TOP_PROJ:
;1817:				PM_SetSaberMove( LS_REFLECT_UP );
CNSTI4 113
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1818
;1818:				break;
ADDRGP4 $691
JUMPV
LABELV $690
line 1820
;1819:			default:
;1820:				pm->ps->saberBlocked = BLOCKED_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1821
;1821:				break;
LABELV $691
line 1824
;1822:		}
;1823:
;1824:		if (pm->ps->saberBlocked != BLOCKED_ATK_BOUNCE && pm->ps->saberBlocked != BLOCKED_PARRY_BROKEN && pm->ps->weaponTime < 1)
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 76
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 3
EQI4 $736
ADDRLP4 80
INDIRI4
CNSTI4 2
EQI4 $736
ADDRLP4 76
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 1
GEI4 $736
line 1825
;1825:		{
line 1826
;1826:			pm->ps->torsoTimer = SABER_BLOCK_DUR;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
CNSTI4 150
ASGNI4
line 1827
;1827:			pm->ps->weaponTime = pm->ps->torsoTimer;
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 1828
;1828:		}
LABELV $736
line 1830
;1829:
;1830:		if (firstSet)
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $738
line 1831
;1831:		{
line 1832
;1832:			return;
ADDRGP4 $620
JUMPV
LABELV $738
line 1836
;1833:		}
;1834:
;1835:		// Charging is like a lead-up before attacking again.  This is an appropriate use, or we can create a new weaponstate for blocking
;1836:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 0
ASGNI4
line 1839
;1837:
;1838:		// Done with block, so stop these active weapon branches.
;1839:		return;
ADDRGP4 $620
JUMPV
LABELV $686
LABELV $656
line 1845
;1840:	}
;1841:
;1842:weapChecks:
;1843:	// check for weapon change
;1844:	// can't change if weapon is firing, but can change again if lowering or raising
;1845:	if ( pm->ps->weaponTime <= 0 || pm->ps->weaponstate != WEAPON_FIRING ) {
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $742
ADDRLP4 64
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 3
EQI4 $740
LABELV $742
line 1846
;1846:		if ( pm->ps->weapon != pm->cmd.weapon ) {
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
EQI4 $743
line 1847
;1847:			PM_BeginWeaponChange( pm->cmd.weapon );
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
line 1848
;1848:		}
LABELV $743
line 1849
;1849:	}
LABELV $740
line 1851
;1850:
;1851:	if ( pm->ps->weaponTime > 0 ) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $745
line 1852
;1852:	{
line 1853
;1853:		return;
ADDRGP4 $620
JUMPV
LABELV $745
line 1861
;1854:	}
;1855:
;1856:	// *********************************************************
;1857:	// WEAPON_DROPPING
;1858:	// *********************************************************
;1859:
;1860:	// change weapon if time
;1861:	if ( pm->ps->weaponstate == WEAPON_DROPPING ) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 2
NEI4 $747
line 1862
;1862:		PM_FinishWeaponChange();
ADDRGP4 PM_FinishWeaponChange
CALLV
pop
line 1863
;1863:		return;
ADDRGP4 $620
JUMPV
LABELV $747
line 1870
;1864:	}
;1865:
;1866:	// *********************************************************
;1867:	// WEAPON_RAISING
;1868:	// *********************************************************
;1869:
;1870:	if ( pm->ps->weaponstate == WEAPON_RAISING ) 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 1
NEI4 $749
line 1871
;1871:	{//Just selected the weapon
line 1872
;1872:		pm->ps->weaponstate = WEAPON_IDLE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 6
ASGNI4
line 1873
;1873:		if((pm->ps->legsAnim & ~ANIM_TOGGLEBIT) == BOTH_WALK1 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 822
NEI4 $751
line 1874
;1874:		{
line 1875
;1875:			PM_SetAnim(SETANIM_TORSO,BOTH_WALK1,SETANIM_FLAG_NORMAL, 100);
CNSTI4 1
ARGI4
CNSTI4 822
ARGI4
CNSTI4 0
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1876
;1876:		}
ADDRGP4 $752
JUMPV
LABELV $751
line 1877
;1877:		else if((pm->ps->legsAnim & ~ANIM_TOGGLEBIT) == BOTH_RUN2 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 836
NEI4 $753
line 1878
;1878:		{
line 1879
;1879:			PM_SetAnim(SETANIM_TORSO,BOTH_RUN2,SETANIM_FLAG_NORMAL, 100);
CNSTI4 1
ARGI4
CNSTI4 836
ARGI4
CNSTI4 0
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1880
;1880:		}
ADDRGP4 $754
JUMPV
LABELV $753
line 1881
;1881:		else if((pm->ps->legsAnim & ~ANIM_TOGGLEBIT) == BOTH_WALK2 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 823
NEI4 $755
line 1882
;1882:		{
line 1883
;1883:			PM_SetAnim(SETANIM_TORSO,BOTH_WALK2,SETANIM_FLAG_NORMAL, 100);
CNSTI4 1
ARGI4
CNSTI4 823
ARGI4
CNSTI4 0
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1884
;1884:		}
ADDRGP4 $756
JUMPV
LABELV $755
line 1886
;1885:		else
;1886:		{
line 1887
;1887:			PM_SetAnim(SETANIM_TORSO,PM_GetSaberStance(),SETANIM_FLAG_NORMAL, 100);
ADDRLP4 68
ADDRGP4 PM_GetSaberStance
CALLI4
ASGNI4
CNSTI4 1
ARGI4
ADDRLP4 68
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 1888
;1888:		}
LABELV $756
LABELV $754
LABELV $752
line 1890
;1889:
;1890:		if (pm->ps->weaponstate == WEAPON_RAISING)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 1
NEI4 $757
line 1891
;1891:		{
line 1892
;1892:			return;
ADDRGP4 $620
JUMPV
LABELV $757
line 1895
;1893:		}
;1894:
;1895:	}
LABELV $749
line 1897
;1896:
;1897:	if (checkOnlyWeap)
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $759
line 1898
;1898:	{
line 1899
;1899:		return;
ADDRGP4 $620
JUMPV
LABELV $759
line 1906
;1900:	}
;1901:
;1902:	// *********************************************************
;1903:	// Check for WEAPON ATTACK
;1904:	// *********************************************************
;1905:
;1906:	if(!delayed_fire)
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $761
line 1907
;1907:	{
line 1909
;1908:		// Start with the current move, and cross index it with the current control states.
;1909:		if ( pm->ps->saberMove > LS_NONE && pm->ps->saberMove < LS_MOVE_MAX )
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
LEI4 $763
ADDRLP4 68
INDIRI4
CNSTI4 120
GEI4 $763
line 1910
;1910:		{
line 1911
;1911:			curmove = pm->ps->saberMove;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 1912
;1912:		}
ADDRGP4 $764
JUMPV
LABELV $763
line 1914
;1913:		else
;1914:		{
line 1915
;1915:			curmove = LS_READY;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 1916
;1916:		}
LABELV $764
line 1918
;1917:		// check for fire
;1918:		if ( !(pm->cmd.buttons & (BUTTON_ATTACK)) )
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $765
line 1919
;1919:		{
line 1920
;1920:			if (pm->ps->weaponTime != 0)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
EQI4 $767
line 1921
;1921:			{//Still firing
line 1922
;1922:				pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 3
ASGNI4
line 1923
;1923:			}
ADDRGP4 $768
JUMPV
LABELV $767
line 1924
;1924:			else if ( pm->ps->weaponstate != WEAPON_READY )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 0
EQI4 $769
line 1925
;1925:			{
line 1926
;1926:				pm->ps->weaponstate = WEAPON_IDLE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 6
ASGNI4
line 1927
;1927:			}
LABELV $769
LABELV $768
line 1929
;1928:			//Check for finishing an anim if necc.
;1929:			if ( curmove >= LS_S_TL2BR && curmove <= LS_S_T2B )
ADDRLP4 72
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 18
LTI4 $771
ADDRLP4 72
INDIRI4
CNSTI4 24
GTI4 $771
line 1930
;1930:			{//started a swing, must continue from here
line 1931
;1931:				newmove = LS_A_TL2BR + (curmove-LS_S_TL2BR);
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 18
SUBI4
CNSTI4 4
ADDI4
ASGNI4
line 1932
;1932:			}
ADDRGP4 $772
JUMPV
LABELV $771
line 1933
;1933:			else if ( curmove >= LS_A_TL2BR && curmove <= LS_A_T2B )
ADDRLP4 76
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 4
LTI4 $773
ADDRLP4 76
INDIRI4
CNSTI4 10
GTI4 $773
line 1934
;1934:			{//finished an attack, must continue from here
line 1935
;1935:				newmove = LS_R_TL2BR + (curmove-LS_A_TL2BR);
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 4
SUBI4
CNSTI4 25
ADDI4
ASGNI4
line 1936
;1936:			}
ADDRGP4 $774
JUMPV
LABELV $773
line 1937
;1937:			else if ( PM_SaberInTransition( curmove ) )
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 PM_SaberInTransition
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $775
line 1938
;1938:			{//in a transition, must play sequential attack
line 1939
;1939:				newmove = saberMoveData[curmove].chain_attack;
ADDRLP4 8
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+32
ADDP4
INDIRI4
ASGNI4
line 1940
;1940:			}
ADDRGP4 $776
JUMPV
LABELV $775
line 1941
;1941:			else if ( PM_SaberInBounce( curmove ) )
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $778
line 1942
;1942:			{//in a bounce
line 1943
;1943:				newmove = saberMoveData[curmove].chain_idle;//oops, not attacking, so don't chain
ADDRLP4 8
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+28
ADDP4
INDIRI4
ASGNI4
line 1944
;1944:			}
ADDRGP4 $779
JUMPV
LABELV $778
line 1946
;1945:			else
;1946:			{//FIXME: what about returning from a parry?
line 1947
;1947:				PM_SetSaberMove( LS_READY );
CNSTI4 1
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 1948
;1948:				return;
ADDRGP4 $620
JUMPV
LABELV $779
LABELV $776
LABELV $774
LABELV $772
line 1950
;1949:			}
;1950:		}
LABELV $765
line 1955
;1951:
;1952:		// ***************************************************
;1953:		// Pressing attack, so we must look up the proper attack move.
;1954:
;1955:		if ( pm->ps->weaponTime > 0 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $781
line 1956
;1956:		{	// Last attack is not yet complete.
line 1957
;1957:			pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 3
ASGNI4
line 1958
;1958:			return;
ADDRGP4 $620
JUMPV
LABELV $781
line 1961
;1959:		}
;1960:		else
;1961:		{
line 1962
;1962:			int	both = qfalse;
ADDRLP4 72
CNSTI4 0
ASGNI4
line 1964
;1963:
;1964:			if ( curmove >= LS_PARRY_UP && curmove <= LS_REFLECT_LL )
ADDRLP4 76
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 108
LTI4 $783
ADDRLP4 76
INDIRI4
CNSTI4 117
GTI4 $783
line 1965
;1965:			{//from a parry or deflection, can go directly into an attack (?)
line 1966
;1966:				switch ( saberMoveData[curmove].endQuad )
ADDRLP4 80
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
LTI4 $785
ADDRLP4 80
INDIRI4
CNSTI4 6
GTI4 $785
ADDRLP4 80
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $794
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $794
address $792
address $785
address $790
address $789
address $791
address $785
address $793
code
line 1967
;1967:				{
LABELV $789
line 1969
;1968:				case Q_T:
;1969:					newmove = LS_A_T2B;
ADDRLP4 8
CNSTI4 10
ASGNI4
line 1970
;1970:					break;
ADDRGP4 $786
JUMPV
LABELV $790
line 1972
;1971:				case Q_TR:
;1972:					newmove = LS_A_TL2BR;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 1973
;1973:					break;
ADDRGP4 $786
JUMPV
LABELV $791
line 1975
;1974:				case Q_TL:
;1975:					newmove = LS_A_TR2BL;
ADDRLP4 8
CNSTI4 9
ASGNI4
line 1976
;1976:					break;
ADDRGP4 $786
JUMPV
LABELV $792
line 1978
;1977:				case Q_BR:
;1978:					newmove = LS_A_BR2TL;
ADDRLP4 8
CNSTI4 7
ASGNI4
line 1979
;1979:					break;
ADDRGP4 $786
JUMPV
LABELV $793
line 1981
;1980:				case Q_BL:
;1981:					newmove = LS_A_BL2TR;
ADDRLP4 8
CNSTI4 6
ASGNI4
line 1982
;1982:					break;
LABELV $785
LABELV $786
line 1985
;1983:				//shouldn't be a parry that ends at L, R or B
;1984:				}
;1985:			}
LABELV $783
line 1987
;1986:
;1987:			if ( newmove != LS_NONE )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $795
line 1988
;1988:			{//have a valid, final LS_ move picked, so skip findingt he transition move and just get the anim
line 1989
;1989:				anim = saberMoveData[newmove].animToUse;
ADDRLP4 12
CNSTI4 40
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ASGNI4
line 1990
;1990:			}
LABELV $795
line 1993
;1991:
;1992:			//FIXME: diagonal dirs use the figure-eight attacks from ready pose?
;1993:			if ( anim == -1 )
ADDRLP4 12
INDIRI4
CNSTI4 -1
NEI4 $798
line 1994
;1994:			{
line 1996
;1995:				//FIXME: take FP_SABER_OFFENSE into account here somehow?
;1996:				if ( PM_SaberInTransition( curmove ) )
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 PM_SaberInTransition
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $800
line 1997
;1997:				{//in a transition, must play sequential attack
line 1998
;1998:					newmove = saberMoveData[curmove].chain_attack;
ADDRLP4 8
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+32
ADDP4
INDIRI4
ASGNI4
line 1999
;1999:				}
ADDRGP4 $801
JUMPV
LABELV $800
line 2000
;2000:				else if ( curmove >= LS_S_TL2BR && curmove <= LS_S_T2B )
ADDRLP4 84
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 18
LTI4 $803
ADDRLP4 84
INDIRI4
CNSTI4 24
GTI4 $803
line 2001
;2001:				{//started a swing, must continue from here
line 2002
;2002:					newmove = LS_A_TL2BR + (curmove-LS_S_TL2BR);
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 18
SUBI4
CNSTI4 4
ADDI4
ASGNI4
line 2003
;2003:				}
ADDRGP4 $804
JUMPV
LABELV $803
line 2004
;2004:				else if ( PM_SaberInBrokenParry( curmove ) && jk2gameplay != VERSION_1_02 )
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $805
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $805
line 2005
;2005:				{//broken parries must always return to ready
line 2006
;2006:					newmove = LS_READY;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 2007
;2007:				}
ADDRGP4 $806
JUMPV
LABELV $805
line 2009
;2008:				else//if ( pm->cmd.buttons&BUTTON_ATTACK && !(pm->ps->pm_flags&PMF_ATTACK_HELD) )//only do this if just pressed attack button?
;2009:				{//get attack move from movement command
line 2010
;2010:					if ( jk2gameplay != VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $807
line 2011
;2011:					{
line 2012
;2012:						saberMoveName_t checkMove = PM_SaberAttackForMovement(curmove);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 PM_SaberAttackForMovement
CALLI4
ASGNI4
ADDRLP4 92
ADDRLP4 96
INDIRI4
ASGNI4
line 2013
;2013:						if (checkMove != LS_INVALID)
ADDRLP4 92
INDIRI4
CNSTI4 -1
EQI4 $809
line 2014
;2014:						{
line 2015
;2015:							newmove = checkMove;
ADDRLP4 8
ADDRLP4 92
INDIRI4
ASGNI4
line 2016
;2016:						}
LABELV $809
line 2018
;2017:
;2018:						if ( (PM_SaberInBounce( curmove )||PM_SaberInBrokenParry( curmove ))
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 PM_SaberInBounce
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $815
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
EQI4 $811
LABELV $815
ADDRLP4 108
CNSTI4 40
ASGNI4
ADDRLP4 108
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 saberMoveData+8
ADDP4
INDIRI4
ADDRLP4 108
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+12
ADDP4
INDIRI4
NEI4 $811
line 2020
;2019:							&& saberMoveData[newmove].startQuad == saberMoveData[curmove].endQuad )
;2020:						{//this attack would be a repeat of the last (which was blocked), so don't actually use it, use the default chain attack for this bounce
line 2021
;2021:							newmove = saberMoveData[curmove].chain_attack;
ADDRLP4 8
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+32
ADDP4
INDIRI4
ASGNI4
line 2022
;2022:						}
LABELV $811
line 2024
;2023:
;2024:						if ( PM_SaberKataDone(curmove, newmove) )
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 PM_SaberKataDone
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $808
line 2025
;2025:						{//we came from a bounce and cannot chain to another attack because our kata is done
line 2026
;2026:							newmove = saberMoveData[curmove].chain_idle;
ADDRLP4 8
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+28
ADDP4
INDIRI4
ASGNI4
line 2027
;2027:						}
line 2028
;2028:					}
ADDRGP4 $808
JUMPV
LABELV $807
line 2030
;2029:					else
;2030:					{
line 2031
;2031:						if (pm->modParms.runFlags & RFL_CLIMBTECH) {
ADDRGP4 pm
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $820
line 2033
;2032:							// flip the order so we can trigger the jka dfa
;2033: 							saberMoveName_t checkMove = PM_SaberAttackForMovement(curmove);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 PM_SaberAttackForMovement
CALLI4
ASGNI4
ADDRLP4 92
ADDRLP4 96
INDIRI4
ASGNI4
line 2034
;2034:							if (checkMove != LS_INVALID)
ADDRLP4 92
INDIRI4
CNSTI4 -1
EQI4 $822
line 2035
;2035:							{
line 2036
;2036:								newmove = checkMove;
ADDRLP4 8
ADDRLP4 92
INDIRI4
ASGNI4
line 2037
;2037:							}
LABELV $822
line 2038
;2038:							if (PM_SaberKataDone_1_02())
ADDRLP4 100
ADDRGP4 PM_SaberKataDone_1_02
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $821
line 2039
;2039:							{//we came from a bounce and cannot chain to another attack because our kata is done
line 2040
;2040:								newmove = saberMoveData[curmove].chain_idle;
ADDRLP4 8
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+28
ADDP4
INDIRI4
ASGNI4
line 2041
;2041:							}
line 2042
;2042:						}
ADDRGP4 $821
JUMPV
LABELV $820
line 2043
;2043:						else {
line 2044
;2044:							if (PM_SaberKataDone_1_02())
ADDRLP4 92
ADDRGP4 PM_SaberKataDone_1_02
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
EQI4 $827
line 2045
;2045:							{//we came from a bounce and cannot chain to another attack because our kata is done
line 2046
;2046:								newmove = saberMoveData[curmove].chain_idle;
ADDRLP4 8
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+28
ADDP4
INDIRI4
ASGNI4
line 2047
;2047:							}
ADDRGP4 $828
JUMPV
LABELV $827
line 2049
;2048:							else
;2049:							{
line 2050
;2050:								saberMoveName_t checkMove = PM_SaberAttackForMovement(curmove);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 PM_SaberAttackForMovement
CALLI4
ASGNI4
ADDRLP4 96
ADDRLP4 100
INDIRI4
ASGNI4
line 2051
;2051:								if (checkMove != LS_INVALID)
ADDRLP4 96
INDIRI4
CNSTI4 -1
EQI4 $830
line 2052
;2052:								{
line 2053
;2053:									newmove = checkMove;
ADDRLP4 8
ADDRLP4 96
INDIRI4
ASGNI4
line 2054
;2054:								}
LABELV $830
line 2055
;2055:							}
LABELV $828
line 2056
;2056:						}
LABELV $821
line 2057
;2057:					}
LABELV $808
line 2058
;2058:				}
LABELV $806
LABELV $804
LABELV $801
line 2060
;2059:
;2060:				if ( newmove != LS_NONE )
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $832
line 2061
;2061:				{
line 2063
;2062:					//Now get the proper transition move
;2063:					newmove = PM_SaberAnimTransitionAnim( curmove, newmove );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 PM_SaberAnimTransitionAnim
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 92
INDIRI4
ASGNI4
line 2065
;2064:
;2065:					assert(	bgGlobalAnimations[saberMoveData[newmove].animToUse].firstFrame != 0 || 
line 2068
;2066:							bgGlobalAnimations[saberMoveData[newmove].animToUse].numFrames != 0);
;2067:
;2068:					anim = saberMoveData[newmove].animToUse;
ADDRLP4 12
CNSTI4 40
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ASGNI4
line 2069
;2069:				}
LABELV $832
line 2070
;2070:			}
LABELV $798
line 2072
;2071:
;2072:			if (anim == -1)
ADDRLP4 12
INDIRI4
CNSTI4 -1
NEI4 $835
line 2073
;2073:			{//not side-stepping, pick neutral anim
line 2075
;2074:				// Add randomness for prototype?
;2075:				newmove = saberMoveData[curmove].chain_attack;
ADDRLP4 8
CNSTI4 40
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 saberMoveData+32
ADDP4
INDIRI4
ASGNI4
line 2077
;2076:
;2077:				anim= saberMoveData[newmove].animToUse;
ADDRLP4 12
CNSTI4 40
ADDRLP4 8
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ASGNI4
line 2079
;2078:
;2079:				if ( !pm->cmd.forwardmove && !pm->cmd.rightmove && pm->cmd.upmove >= 0 && pm->ps->groundEntityNum != ENTITYNUM_NONE )
ADDRLP4 80
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 84
INDIRI4
NEI4 $839
ADDRLP4 80
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 84
INDIRI4
NEI4 $839
ADDRLP4 80
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 84
INDIRI4
LTI4 $839
ADDRLP4 80
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $839
line 2080
;2080:				{//not moving at all, so set the anim on entire body
line 2081
;2081:					both = qtrue;
ADDRLP4 72
CNSTI4 1
ASGNI4
line 2082
;2082:				}
LABELV $839
line 2084
;2083:			
;2084:			}
LABELV $835
line 2086
;2085:
;2086:			if ( anim == -1)
ADDRLP4 12
INDIRI4
CNSTI4 -1
NEI4 $841
line 2087
;2087:			{
line 2088
;2088:				if((pm->ps->legsAnim & ~ANIM_TOGGLEBIT) == BOTH_WALK1 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 822
NEI4 $843
line 2089
;2089:				{
line 2090
;2090:					anim = BOTH_WALK1;
ADDRLP4 12
CNSTI4 822
ASGNI4
line 2091
;2091:				}
ADDRGP4 $844
JUMPV
LABELV $843
line 2092
;2092:				else if((pm->ps->legsAnim & ~ANIM_TOGGLEBIT) == BOTH_RUN2 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 836
NEI4 $845
line 2093
;2093:				{
line 2094
;2094:					anim = BOTH_RUN2;
ADDRLP4 12
CNSTI4 836
ASGNI4
line 2095
;2095:				}
ADDRGP4 $846
JUMPV
LABELV $845
line 2096
;2096:				else if((pm->ps->legsAnim & ~ANIM_TOGGLEBIT) == BOTH_WALK2 )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 823
NEI4 $847
line 2097
;2097:				{
line 2098
;2098:					anim = BOTH_WALK2;
ADDRLP4 12
CNSTI4 823
ASGNI4
line 2099
;2099:				}
ADDRGP4 $848
JUMPV
LABELV $847
line 2101
;2100:				else
;2101:				{
line 2102
;2102:					anim = PM_GetSaberStance();
ADDRLP4 80
ADDRGP4 PM_GetSaberStance
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 80
INDIRI4
ASGNI4
line 2103
;2103:				}
LABELV $848
LABELV $846
LABELV $844
line 2105
;2104:
;2105:				if (anim == BOTH_RUN2 && !pm->cmd.forwardmove && !pm->cmd.rightmove && jk2gameplay != VERSION_1_02)
ADDRLP4 12
INDIRI4
CNSTI4 836
NEI4 $849
ADDRLP4 80
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 84
CNSTI4 0
ASGNI4
ADDRLP4 80
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 84
INDIRI4
NEI4 $849
ADDRLP4 80
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 84
INDIRI4
NEI4 $849
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $849
line 2106
;2106:				{ //semi-hacky (if not moving on x-y and still playing the running anim, force the player out of it)
line 2107
;2107:					anim = PM_GetSaberStance();
ADDRLP4 88
ADDRGP4 PM_GetSaberStance
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 88
INDIRI4
ASGNI4
line 2108
;2108:				}
LABELV $849
line 2109
;2109:				newmove = LS_READY;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 2110
;2110:			}
LABELV $841
line 2112
;2111:
;2112:			if ( !pm->ps->saberActive )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
CNSTI4 0
NEI4 $851
line 2113
;2113:			{//turn on the saber if it's not on
line 2114
;2114:				pm->ps->saberActive = qtrue;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 508
ADDP4
CNSTI4 1
ASGNI4
line 2115
;2115:			}
LABELV $851
line 2117
;2116:
;2117:			PM_SetSaberMove( newmove );
ADDRLP4 8
INDIRI4
CVII2 4
CVII4 2
ARGI4
ADDRGP4 PM_SetSaberMove
CALLV
pop
line 2119
;2118:
;2119:			if ( both )
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $853
line 2120
;2120:			{
line 2121
;2121:				PM_SetAnim(SETANIM_LEGS,anim,SETANIM_FLAG_OVERRIDE|SETANIM_FLAG_HOLD, 100);
CNSTI4 2
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
CNSTI4 3
ARGI4
CNSTI4 100
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2122
;2122:			}
LABELV $853
line 2125
;2123:
;2124:			//don't fire again until anim is done
;2125:			pm->ps->weaponTime = pm->ps->torsoTimer;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 2126
;2126:		}
line 2127
;2127:	}
LABELV $761
line 2133
;2128:
;2129:	// *********************************************************
;2130:	// WEAPON_FIRING
;2131:	// *********************************************************
;2132:
;2133:	pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
CNSTI4 3
ASGNI4
line 2135
;2134:
;2135:	addTime = pm->ps->weaponTime;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 2137
;2136:
;2137:	pm->ps->saberAttackSequence = pm->ps->torsoAnim;
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 744
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
ASGNI4
line 2138
;2138:	if ( !addTime )
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $855
line 2139
;2139:	{
line 2140
;2140:		addTime = weaponData[pm->ps->weapon].fireTime;
ADDRLP4 0
CNSTI4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
MULI4
ADDRGP4 weaponData
INDIRP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 2141
;2141:	}
LABELV $855
line 2142
;2142:	pm->ps->weaponTime = addTime;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2143
;2143:}
LABELV $620
endproc PM_WeaponLightsaber 116 16
export PM_SetSaberMove
proc PM_SetSaberMove 84 16
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 2150
;2144:/*
;2145:#ifdef JK2_CGAME
;2146:#include "../cgame/cg_local.h" //ahahahahhahahaha@$!$!
;2147:#endif*/
;2148:
;2149:void PM_SetSaberMove(short newMove)
;2150:{
line 2151
;2151:	unsigned int setflags = saberMoveData[newMove].animSetFlags;
ADDRLP4 8
CNSTI4 40
ADDRFP4 0
INDIRI2
CVII4 2
MULI4
ADDRGP4 saberMoveData+16
ADDP4
INDIRU4
ASGNU4
line 2152
;2152:	int	anim = saberMoveData[newMove].animToUse;
ADDRLP4 0
CNSTI4 40
ADDRFP4 0
INDIRI2
CVII4 2
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ASGNI4
line 2153
;2153:	int parts = SETANIM_TORSO;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2155
;2154:	
;2155:	if ( newMove == LS_READY || ((newMove == LS_A_FLIP_STAB || newMove == LS_A_FLIP_SLASH) &&
ADDRLP4 12
ADDRFP4 0
INDIRI2
CVII4 2
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $862
ADDRLP4 12
INDIRI4
CNSTI4 16
EQI4 $863
ADDRLP4 12
INDIRI4
CNSTI4 17
NEI4 $860
LABELV $863
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $860
LABELV $862
line 2157
;2156:		jk2gameplay != VERSION_1_02) )
;2157:	{//finished with a kata (or in a special move) reset attack counter
line 2158
;2158:		pm->ps->saberAttackChainCount = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
CNSTI4 0
ASGNI4
line 2159
;2159:	}
ADDRGP4 $861
JUMPV
LABELV $860
line 2160
;2160:	else if ( BG_SaberInAttack( newMove ) )
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 16
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $864
line 2161
;2161:	{//continuing with a kata, increment attack counter
line 2162
;2162:		pm->ps->saberAttackChainCount++;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2163
;2163:	}
LABELV $864
LABELV $861
line 2165
;2164:
;2165:	if (pm->ps->saberAttackChainCount > 16)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
INDIRI4
CNSTI4 16
LEI4 $866
line 2166
;2166:	{ //for the sake of being able to send the value over the net within a reasonable bit count
line 2167
;2167:		pm->ps->saberAttackChainCount = 16;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1308
ADDP4
CNSTI4 16
ASGNI4
line 2168
;2168:	}
LABELV $866
line 2170
;2169:
;2170:	if ( jk2gameplay != VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $868
line 2171
;2171:	{
line 2172
;2172:		if ( pm->ps->fd.saberAnimLevel > FORCE_LEVEL_1 &&
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 1
LEI4 $870
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 20
ADDRGP4 BG_SaberInIdle
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $870
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 24
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $870
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 28
ADDRGP4 PM_SaberInKnockaway
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $870
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 32
ADDRGP4 PM_SaberInBrokenParry
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $870
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 36
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $870
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 40
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $870
line 2174
;2173:			 !BG_SaberInIdle( newMove ) && !PM_SaberInParry( newMove ) && !PM_SaberInKnockaway( newMove ) && !PM_SaberInBrokenParry( newMove ) && !PM_SaberInReflect( newMove ) && !BG_SaberInSpecial(newMove))
;2174:		{//readies, parries and reflections have only 1 level 
line 2176
;2175:			//increment the anim to the next level of saber anims
;2176:			anim += (pm->ps->fd.saberAnimLevel-FORCE_LEVEL_1) * SABER_ANIM_GROUP_SIZE;
ADDRLP4 44
CNSTI4 77
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 44
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
MULI4
ADDRLP4 44
INDIRI4
SUBI4
ADDI4
ASGNI4
line 2177
;2177:		}
LABELV $870
line 2178
;2178:	}
LABELV $868
line 2180
;2179:	
;2180:	if ( jk2gameplay == VERSION_1_02 )
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $872
line 2181
;2181:	{
line 2182
;2182:		if ( pm->ps->fd.saberAnimLevel > FORCE_LEVEL_1 &&
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
CNSTI4 1
LEI4 $874
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 20
ADDRGP4 BG_SaberInIdle
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $874
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 24
ADDRGP4 PM_SaberInParry
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $874
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 28
ADDRGP4 PM_SaberInReflect
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $874
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 32
ADDRGP4 BG_SaberInSpecial
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $874
line 2184
;2183:				!BG_SaberInIdle( newMove ) && !PM_SaberInParry( newMove ) && !PM_SaberInReflect( newMove ) && !BG_SaberInSpecial(newMove))
;2184:		{//readies, parries and reflections have only 1 level 
line 2186
;2185:			//increment the anim to the next level of saber anims
;2186:			if ( !PM_SaberInTransition( newMove ) )
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 36
ADDRGP4 PM_SaberInTransition
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $876
line 2187
;2187:			{//FIXME: only have level 1 transitions for now
line 2188
;2188:				anim += (pm->ps->fd.saberAnimLevel-FORCE_LEVEL_1) * SABER_ANIM_GROUP_SIZE;
ADDRLP4 40
CNSTI4 77
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 40
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 1228
ADDP4
INDIRI4
MULI4
ADDRLP4 40
INDIRI4
SUBI4
ADDI4
ASGNI4
line 2189
;2189:			}
LABELV $876
line 2190
;2190:		}
LABELV $874
line 2191
;2191:	}
LABELV $872
line 2194
;2192:
;2193:	// If the move does the same animation as the last one, we need to force a restart...
;2194:	if ( saberMoveData[pm->ps->saberMove].animToUse == anim && newMove > LS_PUTAWAY)
CNSTI4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
MULI4
ADDRGP4 saberMoveData+4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $878
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 3
LEI4 $878
line 2195
;2195:	{
line 2196
;2196:		setflags |= SETANIM_FLAG_RESTART;
ADDRLP4 8
ADDRLP4 8
INDIRU4
CNSTU4 4
BORU4
ASGNU4
line 2197
;2197:	}
LABELV $878
line 2200
;2198:
;2199:	//saber torso anims should always be highest priority (4/12/02 - for special anims only)
;2200:	if ( newMove == LS_A_LUNGE 
ADDRLP4 20
ADDRFP4 0
INDIRI2
CVII4 2
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 14
EQI4 $891
ADDRLP4 20
INDIRI4
CNSTI4 15
EQI4 $891
ADDRLP4 20
INDIRI4
CNSTI4 11
EQI4 $891
ADDRLP4 20
INDIRI4
CNSTI4 12
EQI4 $891
ADDRLP4 20
INDIRI4
CNSTI4 13
EQI4 $891
ADDRLP4 20
INDIRI4
CNSTI4 16
EQI4 $891
ADDRLP4 20
INDIRI4
CNSTI4 17
EQI4 $891
ADDRLP4 20
INDIRI4
CNSTI4 118
EQI4 $891
ADDRLP4 20
INDIRI4
CNSTI4 119
EQI4 $891
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $881
LABELV $891
line 2210
;2201:		|| newMove == LS_A_JUMP_T__B_ 
;2202:		|| newMove == LS_A_BACKSTAB
;2203:		|| newMove == LS_A_BACK
;2204:		|| newMove == LS_A_BACK_CR
;2205:		|| newMove == LS_A_FLIP_STAB
;2206:		|| newMove == LS_A_FLIP_SLASH
;2207:		|| newMove == LS_JUMPATTACK_ARIAL_LEFT // JKA cartwheel
;2208:		|| newMove == LS_JUMPATTACK_ARIAL_RIGHT // JKA cartwheel
;2209:		|| jk2gameplay == VERSION_1_02 )
;2210:	{
line 2211
;2211:		setflags |= SETANIM_FLAG_OVERRIDE;
ADDRLP4 8
ADDRLP4 8
INDIRU4
CNSTU4 1
BORU4
ASGNU4
line 2212
;2212:	}
LABELV $881
line 2214
;2213:
;2214:	if ( BG_InSaberStandAnim(anim) || anim == BOTH_STAND1 )
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_InSaberStandAnim
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $894
ADDRLP4 0
INDIRI4
CNSTI4 571
NEI4 $892
LABELV $894
line 2215
;2215:	{
line 2216
;2216:		anim = (pm->ps->legsAnim & ~ANIM_TOGGLEBIT);
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 2218
;2217:
;2218:		if ((anim >= BOTH_STAND1 && anim <= BOTH_STAND4TOATTACK2) ||
ADDRLP4 0
INDIRI4
CNSTI4 571
LTI4 $898
ADDRLP4 0
INDIRI4
CNSTI4 592
LEI4 $897
LABELV $898
ADDRLP4 0
INDIRI4
CNSTI4 1091
LTI4 $895
ADDRLP4 0
INDIRI4
CNSTI4 1122
GTI4 $895
LABELV $897
line 2220
;2219:			(anim >= TORSO_DROPWEAP1 && anim <= TORSO_WEAPONIDLE12))
;2220:		{ //If standing then use the special saber stand anim
line 2221
;2221:			anim = PM_GetSaberStance();
ADDRLP4 36
ADDRGP4 PM_GetSaberStance
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 36
INDIRI4
ASGNI4
line 2222
;2222:		}
LABELV $895
line 2224
;2223:
;2224:		if (pm->ps->pm_flags & PMF_DUCKED)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $899
line 2225
;2225:		{ //Playing torso walk anims while crouched makes you look like a monkey
line 2226
;2226:			anim = PM_GetSaberStance();
ADDRLP4 36
ADDRGP4 PM_GetSaberStance
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 36
INDIRI4
ASGNI4
line 2227
;2227:		}
LABELV $899
line 2229
;2228:
;2229:		if (anim == BOTH_WALKBACK1 || anim == BOTH_WALKBACK2)
ADDRLP4 0
INDIRI4
CNSTI4 852
EQI4 $903
ADDRLP4 0
INDIRI4
CNSTI4 853
NEI4 $901
LABELV $903
line 2230
;2230:		{ //normal stance when walking backward so saber doesn't look like it's cutting through leg
line 2231
;2231:			anim = PM_GetSaberStance();
ADDRLP4 40
ADDRGP4 PM_GetSaberStance
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 40
INDIRI4
ASGNI4
line 2232
;2232:		}
LABELV $901
line 2234
;2233:
;2234:		parts = SETANIM_TORSO;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 2235
;2235:	}
LABELV $892
line 2237
;2236:
;2237:	if (newMove == LS_JUMPATTACK_ARIAL_RIGHT || // jka cartwheel
ADDRLP4 28
ADDRFP4 0
INDIRI2
CVII4 2
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 119
EQI4 $906
ADDRLP4 28
INDIRI4
CNSTI4 118
NEI4 $904
LABELV $906
line 2239
;2238:		newMove == LS_JUMPATTACK_ARIAL_LEFT)// jka cartwheel
;2239:	{ //force only on legs
line 2240
;2240:		parts = SETANIM_LEGS;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 2241
;2241:	}
ADDRGP4 $905
JUMPV
LABELV $904
line 2242
;2242:	else if ( newMove == LS_A_LUNGE
ADDRLP4 32
ADDRFP4 0
INDIRI2
CVII4 2
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 14
EQI4 $916
ADDRLP4 32
INDIRI4
CNSTI4 15
EQI4 $916
ADDRLP4 32
INDIRI4
CNSTI4 11
EQI4 $916
ADDRLP4 32
INDIRI4
CNSTI4 12
EQI4 $916
ADDRLP4 32
INDIRI4
CNSTI4 13
EQI4 $916
ADDRLP4 32
INDIRI4
CNSTI4 16
EQI4 $916
ADDRLP4 32
INDIRI4
CNSTI4 17
EQI4 $916
ADDRLP4 32
INDIRI4
CNSTI4 118
EQI4 $916
ADDRLP4 32
INDIRI4
CNSTI4 119
NEI4 $907
LABELV $916
line 2251
;2243:		|| newMove == LS_A_JUMP_T__B_ 
;2244:		|| newMove == LS_A_BACKSTAB
;2245:		|| newMove == LS_A_BACK
;2246:		|| newMove == LS_A_BACK_CR
;2247:		|| newMove == LS_A_FLIP_STAB
;2248:		|| newMove == LS_A_FLIP_SLASH 
;2249:		|| newMove == LS_JUMPATTACK_ARIAL_LEFT// jka cartwheel
;2250:		|| newMove == LS_JUMPATTACK_ARIAL_RIGHT)// jka cartwheel
;2251:	{
line 2252
;2252:		parts = SETANIM_BOTH;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 2253
;2253:	}
ADDRGP4 $908
JUMPV
LABELV $907
line 2254
;2254:	else if ( BG_SpinningSaberAnim( anim ) )
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 BG_SpinningSaberAnim
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $917
line 2255
;2255:	{//spins must be played on entire body
line 2256
;2256:		parts = SETANIM_BOTH;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 2257
;2257:	}
ADDRGP4 $918
JUMPV
LABELV $917
line 2258
;2258:	else if ( (!pm->cmd.forwardmove&&!pm->cmd.rightmove&&!pm->cmd.upmove) && jk2gameplay != VERSION_1_02 )
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
CNSTI4 0
ASGNI4
ADDRLP4 40
INDIRP4
CNSTI4 28
ADDP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
NEI4 $919
ADDRLP4 40
INDIRP4
CNSTI4 29
ADDP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
NEI4 $919
ADDRLP4 40
INDIRP4
CNSTI4 30
ADDP4
INDIRI1
CVII4 1
ADDRLP4 44
INDIRI4
NEI4 $919
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
EQI4 $919
line 2259
;2259:	{//not trying to run, duck or jump
line 2260
;2260:		if ( !BG_FlippingAnim( pm->ps->legsAnim ) && 
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
ADDRGP4 BG_FlippingAnim
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $921
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BG_InRoll
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $921
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 PM_InKnockDown
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $921
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 PM_JumpingAnim
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $921
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 BG_InSpecialJump
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $921
ADDRLP4 76
ADDRGP4 PM_GetSaberStance
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 76
INDIRI4
EQI4 $921
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $921
ADDRLP4 80
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $921
line 2268
;2261:			!BG_InRoll( pm->ps, pm->ps->legsAnim ) && 
;2262:			!PM_InKnockDown( pm->ps ) && 
;2263:			!PM_JumpingAnim( pm->ps->legsAnim ) &&
;2264:			!BG_InSpecialJump( pm->ps->legsAnim, pm->modParms.runFlags) &&
;2265:			anim != PM_GetSaberStance() &&
;2266:			pm->ps->groundEntityNum != ENTITYNUM_NONE &&
;2267:			!(pm->ps->pm_flags & PMF_DUCKED))
;2268:		{
line 2269
;2269:			parts = SETANIM_BOTH;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 2270
;2270:		}
LABELV $921
line 2271
;2271:	}
LABELV $919
LABELV $918
LABELV $908
LABELV $905
line 2276
;2272:
;2273:#ifdef JK2_CGAME
;2274:	PM_SetAnim(parts, anim, ((jk2gameplay == VERSION_1_02 && !cg_fixlean.integer) ? (setflags | SETANIM_FLAG_HOLD) : setflags), saberMoveData[newMove].blendTime);
;2275:#else
;2276:	PM_SetAnim(parts, anim, (jk2gameplay == VERSION_1_02 ? (setflags|SETANIM_FLAG_HOLD) : setflags), saberMoveData[newMove].blendTime);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $925
ADDRLP4 48
ADDRLP4 8
INDIRU4
CNSTU4 2
BORU4
ASGNU4
ADDRGP4 $926
JUMPV
LABELV $925
ADDRLP4 48
ADDRLP4 8
INDIRU4
ASGNU4
LABELV $926
ADDRLP4 48
INDIRU4
CVUI4 4
ARGI4
CNSTI4 40
ADDRFP4 0
INDIRI2
CVII4 2
MULI4
ADDRGP4 saberMoveData+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 PM_SetAnim
CALLV
pop
line 2279
;2277:#endif
;2278:
;2279:	if (parts != SETANIM_LEGS && 
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $927
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 905
EQI4 $929
ADDRLP4 52
INDIRI4
CNSTI4 906
NEI4 $927
LABELV $929
line 2282
;2280:		(pm->ps->legsAnim == BOTH_ARIAL_LEFT ||
;2281:			pm->ps->legsAnim == BOTH_ARIAL_RIGHT)) // can this even ever be true?!
;2282:	{
line 2283
;2283:		if (pm->ps->legsTimer > pm->ps->torsoTimer)
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDRLP4 56
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
LEI4 $930
line 2284
;2284:		{
line 2285
;2285:			pm->ps->legsTimer = pm->ps->torsoTimer;
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ASGNI4
line 2286
;2286:		}
LABELV $930
line 2287
;2287:	}
LABELV $927
line 2289
;2288:
;2289:	if ( (pm->ps->torsoAnim&~ANIM_TOGGLEBIT) == anim )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRI4
CNSTI4 -2049
BANDI4
ADDRLP4 0
INDIRI4
NEI4 $932
line 2290
;2290:	{//successfully changed anims
line 2293
;2291:	//special check for *starting* a saber swing
;2292:		//playing at attack
;2293:		if ( BG_SaberInAttack( newMove ) || BG_SaberInSpecialAttack( anim ) )
ADDRFP4 0
INDIRI2
CVII4 2
ARGI4
ADDRLP4 56
ADDRGP4 BG_SaberInAttack
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $936
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 BG_SaberInSpecialAttack
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $934
LABELV $936
line 2294
;2294:		{
line 2295
;2295:			if ( pm->ps->saberMove != newMove )
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ADDRFP4 0
INDIRI2
CVII4 2
EQI4 $937
line 2296
;2296:			{//wasn't playing that attack before
line 2297
;2297:				PM_AddEvent(EV_SABER_ATTACK);
CNSTI4 26
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2298
;2298:			}
LABELV $937
line 2299
;2299:		}
LABELV $934
line 2308
;2300:
;2301:		// just testing this to see if it makes cartwheel climbs easier. eh idk.
;2302:		//if ((runFlags & RFL_CLIMBTECH) && BG_SaberInSpecial(newMove) &&
;2303:		//	pm->ps->weaponTime < pm->ps->torsoTimer)
;2304:		//{ //rww 01-02-03 - I think this will solve the issue of special attacks being interruptable, hopefully without side effects
;2305:		//	pm->ps->weaponTime = pm->ps->torsoTimer;
;2306:		//}
;2307:
;2308:		pm->ps->saberMove = newMove;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRI2
CVII4 2
ASGNI4
line 2309
;2309:		pm->ps->saberBlocking = saberMoveData[newMove].blocking;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 516
ADDP4
CNSTI4 40
ADDRFP4 0
INDIRI2
CVII4 2
MULI4
ADDRGP4 saberMoveData+24
ADDP4
INDIRI4
ASGNI4
line 2311
;2310:
;2311:		pm->ps->torsoAnim = anim;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2313
;2312:
;2313:		if (pm->ps->weaponTime <= 0)
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $940
line 2314
;2314:		{
line 2315
;2315:			pm->ps->saberBlocked = BLOCKED_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 2316
;2316:		}
LABELV $940
line 2317
;2317:	}
LABELV $932
line 2318
;2318:}
LABELV $857
endproc PM_SetSaberMove 84 16
import ValidAnimFileIndex
import PM_SetGroundEntityNum
import PM_SetForceJumpZStart
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
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
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
LABELV $254
byte 1 68
byte 1 117
byte 1 97
byte 1 108
byte 1 74
byte 1 117
byte 1 109
byte 1 112
byte 1 65
byte 1 116
byte 1 107
byte 1 82
byte 1 95
byte 1 65
byte 1 0
align 1
LABELV $253
byte 1 68
byte 1 117
byte 1 97
byte 1 108
byte 1 74
byte 1 117
byte 1 109
byte 1 112
byte 1 65
byte 1 116
byte 1 107
byte 1 76
byte 1 95
byte 1 65
byte 1 0
align 1
LABELV $252
byte 1 82
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $251
byte 1 82
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 76
byte 1 82
byte 1 0
align 1
LABELV $250
byte 1 82
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 85
byte 1 76
byte 1 0
align 1
LABELV $249
byte 1 82
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 85
byte 1 82
byte 1 0
align 1
LABELV $248
byte 1 82
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 84
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $247
byte 1 80
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 32
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $246
byte 1 80
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 32
byte 1 76
byte 1 82
byte 1 0
align 1
LABELV $245
byte 1 80
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 32
byte 1 85
byte 1 76
byte 1 0
align 1
LABELV $244
byte 1 80
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 32
byte 1 85
byte 1 82
byte 1 0
align 1
LABELV $243
byte 1 80
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 32
byte 1 84
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $242
byte 1 75
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $241
byte 1 75
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 76
byte 1 82
byte 1 0
align 1
LABELV $240
byte 1 75
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 85
byte 1 76
byte 1 0
align 1
LABELV $239
byte 1 75
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 85
byte 1 82
byte 1 0
align 1
LABELV $238
byte 1 75
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 32
byte 1 84
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $237
byte 1 66
byte 1 80
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 32
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $236
byte 1 66
byte 1 80
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 32
byte 1 66
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $235
byte 1 66
byte 1 80
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 32
byte 1 76
byte 1 82
byte 1 0
align 1
LABELV $234
byte 1 66
byte 1 80
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 32
byte 1 85
byte 1 76
byte 1 0
align 1
LABELV $233
byte 1 66
byte 1 80
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 32
byte 1 85
byte 1 82
byte 1 0
align 1
LABELV $232
byte 1 66
byte 1 80
byte 1 97
byte 1 114
byte 1 114
byte 1 121
byte 1 32
byte 1 84
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $231
byte 1 82
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 66
byte 1 0
align 1
LABELV $230
byte 1 82
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 66
byte 1 76
byte 1 0
align 1
LABELV $229
byte 1 82
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 76
byte 1 0
align 1
LABELV $228
byte 1 82
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 76
byte 1 0
align 1
LABELV $227
byte 1 82
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 0
align 1
LABELV $226
byte 1 82
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 84
byte 1 82
byte 1 0
align 1
LABELV $225
byte 1 82
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 82
byte 1 0
align 1
LABELV $224
byte 1 82
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 66
byte 1 82
byte 1 0
align 1
LABELV $223
byte 1 68
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 66
byte 1 0
align 1
LABELV $222
byte 1 68
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 66
byte 1 76
byte 1 0
align 1
LABELV $221
byte 1 68
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 76
byte 1 0
align 1
LABELV $220
byte 1 68
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 84
byte 1 76
byte 1 0
align 1
LABELV $219
byte 1 68
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 84
byte 1 0
align 1
LABELV $218
byte 1 68
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 84
byte 1 82
byte 1 0
align 1
LABELV $217
byte 1 68
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 82
byte 1 0
align 1
LABELV $216
byte 1 68
byte 1 101
byte 1 102
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 66
byte 1 82
byte 1 0
align 1
LABELV $215
byte 1 66
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 66
byte 1 76
byte 1 0
align 1
LABELV $214
byte 1 66
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 76
byte 1 0
align 1
LABELV $213
byte 1 66
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 84
byte 1 76
byte 1 0
align 1
LABELV $212
byte 1 66
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 84
byte 1 0
align 1
LABELV $211
byte 1 66
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 84
byte 1 82
byte 1 0
align 1
LABELV $210
byte 1 66
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 82
byte 1 0
align 1
LABELV $209
byte 1 66
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 66
byte 1 82
byte 1 0
align 1
LABELV $208
byte 1 66
byte 1 76
byte 1 50
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $207
byte 1 66
byte 1 76
byte 1 50
byte 1 84
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $206
byte 1 66
byte 1 76
byte 1 50
byte 1 84
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $205
byte 1 66
byte 1 76
byte 1 50
byte 1 84
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $204
byte 1 66
byte 1 76
byte 1 50
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $203
byte 1 66
byte 1 76
byte 1 50
byte 1 66
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $202
byte 1 76
byte 1 50
byte 1 66
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $201
byte 1 76
byte 1 50
byte 1 84
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $200
byte 1 76
byte 1 50
byte 1 84
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $199
byte 1 76
byte 1 50
byte 1 84
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $198
byte 1 76
byte 1 50
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $197
byte 1 76
byte 1 50
byte 1 66
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $196
byte 1 84
byte 1 76
byte 1 50
byte 1 66
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $195
byte 1 84
byte 1 76
byte 1 50
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $194
byte 1 84
byte 1 76
byte 1 50
byte 1 84
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $193
byte 1 84
byte 1 76
byte 1 50
byte 1 84
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $192
byte 1 84
byte 1 76
byte 1 50
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $191
byte 1 84
byte 1 76
byte 1 50
byte 1 66
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $190
byte 1 84
byte 1 50
byte 1 66
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $189
byte 1 84
byte 1 50
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $188
byte 1 84
byte 1 50
byte 1 84
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $187
byte 1 84
byte 1 50
byte 1 84
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $186
byte 1 84
byte 1 50
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $185
byte 1 84
byte 1 50
byte 1 66
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $184
byte 1 84
byte 1 82
byte 1 50
byte 1 66
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $183
byte 1 84
byte 1 82
byte 1 50
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $182
byte 1 84
byte 1 82
byte 1 50
byte 1 84
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $181
byte 1 84
byte 1 82
byte 1 50
byte 1 84
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $180
byte 1 84
byte 1 82
byte 1 50
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $179
byte 1 84
byte 1 82
byte 1 50
byte 1 66
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $178
byte 1 82
byte 1 50
byte 1 66
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $177
byte 1 82
byte 1 50
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $176
byte 1 82
byte 1 50
byte 1 84
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $175
byte 1 82
byte 1 50
byte 1 84
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $174
byte 1 82
byte 1 50
byte 1 84
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $173
byte 1 82
byte 1 50
byte 1 66
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $172
byte 1 66
byte 1 82
byte 1 50
byte 1 66
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $171
byte 1 66
byte 1 82
byte 1 50
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $170
byte 1 66
byte 1 82
byte 1 50
byte 1 84
byte 1 76
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $169
byte 1 66
byte 1 82
byte 1 50
byte 1 84
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $168
byte 1 66
byte 1 82
byte 1 50
byte 1 84
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $167
byte 1 66
byte 1 82
byte 1 50
byte 1 82
byte 1 32
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $166
byte 1 84
byte 1 50
byte 1 66
byte 1 32
byte 1 82
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $165
byte 1 84
byte 1 82
byte 1 50
byte 1 66
byte 1 76
byte 1 32
byte 1 82
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $164
byte 1 82
byte 1 50
byte 1 76
byte 1 32
byte 1 82
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $163
byte 1 66
byte 1 82
byte 1 50
byte 1 84
byte 1 76
byte 1 32
byte 1 82
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $162
byte 1 66
byte 1 76
byte 1 50
byte 1 84
byte 1 82
byte 1 32
byte 1 82
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $161
byte 1 76
byte 1 50
byte 1 82
byte 1 32
byte 1 82
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $160
byte 1 84
byte 1 76
byte 1 50
byte 1 66
byte 1 82
byte 1 32
byte 1 82
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $159
byte 1 84
byte 1 50
byte 1 66
byte 1 32
byte 1 83
byte 1 116
byte 1 0
align 1
LABELV $158
byte 1 84
byte 1 82
byte 1 50
byte 1 66
byte 1 76
byte 1 32
byte 1 83
byte 1 116
byte 1 0
align 1
LABELV $157
byte 1 82
byte 1 50
byte 1 76
byte 1 32
byte 1 83
byte 1 116
byte 1 0
align 1
LABELV $156
byte 1 66
byte 1 82
byte 1 50
byte 1 84
byte 1 76
byte 1 32
byte 1 83
byte 1 116
byte 1 0
align 1
LABELV $155
byte 1 66
byte 1 76
byte 1 50
byte 1 84
byte 1 82
byte 1 32
byte 1 83
byte 1 116
byte 1 0
align 1
LABELV $154
byte 1 76
byte 1 50
byte 1 82
byte 1 32
byte 1 83
byte 1 116
byte 1 0
align 1
LABELV $153
byte 1 84
byte 1 76
byte 1 50
byte 1 66
byte 1 82
byte 1 32
byte 1 83
byte 1 116
byte 1 0
align 1
LABELV $152
byte 1 70
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 83
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $151
byte 1 70
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 98
byte 1 0
align 1
LABELV $150
byte 1 74
byte 1 117
byte 1 109
byte 1 112
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $149
byte 1 76
byte 1 117
byte 1 110
byte 1 103
byte 1 101
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $148
byte 1 67
byte 1 82
byte 1 32
byte 1 66
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $147
byte 1 66
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $146
byte 1 66
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 83
byte 1 116
byte 1 97
byte 1 98
byte 1 0
align 1
LABELV $145
byte 1 84
byte 1 50
byte 1 66
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $144
byte 1 84
byte 1 82
byte 1 50
byte 1 66
byte 1 76
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $143
byte 1 82
byte 1 50
byte 1 76
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $142
byte 1 66
byte 1 82
byte 1 50
byte 1 84
byte 1 76
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $141
byte 1 66
byte 1 76
byte 1 50
byte 1 84
byte 1 82
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $140
byte 1 76
byte 1 50
byte 1 82
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $139
byte 1 84
byte 1 76
byte 1 50
byte 1 66
byte 1 82
byte 1 32
byte 1 65
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $138
byte 1 80
byte 1 117
byte 1 116
byte 1 97
byte 1 119
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $137
byte 1 68
byte 1 114
byte 1 97
byte 1 119
byte 1 0
align 1
LABELV $136
byte 1 82
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 0
align 1
LABELV $135
byte 1 78
byte 1 111
byte 1 110
byte 1 101
byte 1 0
