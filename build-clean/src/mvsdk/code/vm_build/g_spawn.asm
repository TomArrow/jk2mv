export G_SpawnString
code
proc G_SpawnString 8 8
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_spawn.c"
line 7
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:#include "g_defrag.h"
;6:
;7:qboolean	G_SpawnString( const char *key, const char *defaultString, char **out ) {
line 10
;8:	int		i;
;9:
;10:	if ( !level.spawning ) {
ADDRGP4 level+4404
INDIRI4
CNSTI4 0
NEI4 $123
line 11
;11:		*out = (char *)defaultString;
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 13
;12://		G_Error( "G_SpawnString() called while not spawning" );
;13:	}
LABELV $123
line 15
;14:
;15:	for ( i = 0 ; i < level.numSpawnVars ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $129
JUMPV
LABELV $126
line 16
;16:		if ( !Q_stricmp( key, level.spawnVars[i][0] ) ) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4412
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $131
line 17
;17:			*out = level.spawnVars[i][1];
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4412+4
ADDP4
INDIRP4
ASGNP4
line 18
;18:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $122
JUMPV
LABELV $131
line 20
;19:		}
;20:	}
LABELV $127
line 15
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $129
ADDRLP4 0
INDIRI4
ADDRGP4 level+4408
INDIRI4
LTI4 $126
line 22
;21:
;22:	*out = (char *)defaultString;
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 23
;23:	return qfalse;
CNSTI4 0
RETI4
LABELV $122
endproc G_SpawnString 8 8
export G_SpawnFloat
proc G_SpawnFloat 16 12
line 26
;24:}
;25:
;26:qboolean	G_SpawnFloat( const char *key, const char *defaultString, float *out ) {
line 30
;27:	char		*s;
;28:	qboolean	present;
;29:
;30:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 31
;31:	*out = atof( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 32
;32:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $136
endproc G_SpawnFloat 16 12
export G_SpawnInt
proc G_SpawnInt 16 12
line 35
;33:}
;34:
;35:qboolean	G_SpawnInt( const char *key, const char *defaultString, int *out ) {
line 39
;36:	char		*s;
;37:	qboolean	present;
;38:
;39:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 40
;40:	*out = atoi( s );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 41
;41:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $137
endproc G_SpawnInt 16 12
export G_SpawnVector
proc G_SpawnVector 16 20
line 44
;42:}
;43:
;44:qboolean	G_SpawnVector( const char *key, const char *defaultString, float *out ) {
line 48
;45:	char		*s;
;46:	qboolean	present;
;47:
;48:	present = G_SpawnString( key, defaultString, &s );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 49
;49:	sscanf( s, "%f %f %f", &out[0], &out[1], &out[2] );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $139
ARGP4
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 50
;50:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $138
endproc G_SpawnVector 16 20
data
export fields
align 4
LABELV fields
address $142
byte 4 416
byte 4 2
skip 4
address $143
byte 4 428
byte 4 0
skip 4
address $144
byte 4 432
byte 4 2
skip 4
address $145
byte 4 436
byte 4 2
skip 4
address $146
byte 4 92
byte 4 4
skip 4
address $147
byte 4 480
byte 4 2
skip 4
address $148
byte 4 484
byte 4 2
skip 4
address $149
byte 4 420
byte 4 0
skip 4
address $150
byte 4 616
byte 4 1
skip 4
address $151
byte 4 592
byte 4 2
skip 4
address $152
byte 4 596
byte 4 2
skip 4
address $153
byte 4 576
byte 4 2
skip 4
address $154
byte 4 600
byte 4 2
skip 4
address $155
byte 4 800
byte 4 1
skip 4
address $156
byte 4 804
byte 4 1
skip 4
address $157
byte 4 728
byte 4 0
skip 4
address $158
byte 4 688
byte 4 0
skip 4
address $159
byte 4 0
byte 4 9
skip 4
address $160
byte 4 704
byte 4 0
skip 4
address $161
byte 4 116
byte 4 4
skip 4
address $162
byte 4 116
byte 4 5
skip 4
address $163
byte 4 604
byte 4 2
skip 4
address $164
byte 4 608
byte 4 2
skip 4
address $165
byte 4 788
byte 4 0
skip 4
address $166
byte 4 792
byte 4 0
skip 4
address $167
byte 4 796
byte 4 0
skip 4
address $168
byte 4 580
byte 4 2
skip 4
address $169
byte 4 424
byte 4 0
skip 4
address $170
byte 4 2320
byte 4 0
skip 4
address $171
byte 4 2324
byte 4 0
skip 4
byte 4 0
skip 12
export SP_item_botroam
code
proc SP_item_botroam 0 0
line 212
;51:}
;52:
;53:
;54:
;55://
;56:// fields are needed for spawning from the entity string
;57://
;58:typedef enum {
;59:	F_INT, 
;60:	F_FLOAT,
;61:	F_LSTRING,			// string on disk, pointer in memory, TAG_LEVEL
;62:	F_GSTRING,			// string on disk, pointer in memory, TAG_GAME
;63:	F_VECTOR,
;64:	F_ANGLEHACK,
;65:	F_ENTITY,			// index on disk, pointer in memory
;66:	F_ITEM,				// index on disk, pointer in memory
;67:	F_CLIENT,			// index on disk, pointer in memory
;68:	F_IGNORE
;69:} fieldtype_t;
;70:
;71:typedef struct
;72:{
;73:	char	*name;
;74:	int		ofs;
;75:	fieldtype_t	type;
;76:	int		flags;
;77:} field_t;
;78:
;79:field_t fields[] = {
;80:	{"classname", FOFS(classname), F_LSTRING},
;81:	{"teamnodmg", FOFS(teamnodmg), F_INT},
;82:	{"roffname", FOFS(roffname), F_LSTRING},
;83:	{"rofftarget", FOFS(rofftarget), F_LSTRING},
;84:	{"origin", FOFS(s.origin), F_VECTOR},
;85:	{"model", FOFS(model), F_LSTRING},
;86:	{"model2", FOFS(model2), F_LSTRING},
;87:	{"spawnflags", FOFS(spawnflags), F_INT},
;88:	{"speed", FOFS(speed), F_FLOAT},
;89:	{"target", FOFS(target), F_LSTRING},
;90:	{"targetname", FOFS(targetname), F_LSTRING},
;91:	{"message", FOFS(message), F_LSTRING},
;92:	{"team", FOFS(team), F_LSTRING},
;93:	{"wait", FOFS(wait), F_FLOAT},
;94:	{"random", FOFS(random), F_FLOAT},
;95:	{"count", FOFS(count), F_INT},
;96:	{"health", FOFS(health), F_INT},
;97:	{"light", 0, F_IGNORE},
;98:	{"dmg", FOFS(damage), F_INT},
;99:	{"angles", FOFS(s.angles), F_VECTOR},
;100:	{"angle", FOFS(s.angles), F_ANGLEHACK},
;101:	{"targetShaderName", FOFS(targetShaderName), F_LSTRING},
;102:	{"targetShaderNewName", FOFS(targetShaderNewName), F_LSTRING},
;103:
;104:	{"courseid", FOFS(courseID), F_INT},
;105:	{"notvq3", FOFS(notVQ3), F_INT},
;106:	{"notcpm", FOFS(notCPM), F_INT},
;107:	{"overrideMessage", FOFS(overrideMessage), F_LSTRING},
;108:	{"ttFlags", FOFS(ttFlags), F_INT},
;109:	{"number", FOFS(number), F_INT}, // q3 rally map support
;110:	{"laps", FOFS(laps), F_INT}, // q3 rally map support
;111:	//{"objective", FOFS(objective), F_INT},
;112:
;113:	{NULL}
;114:};
;115:
;116:
;117:typedef struct {
;118:	char	*name;
;119:	qboolean	logical;
;120:	void	(*spawn)(gentity_t *ent);
;121:} spawn_t;
;122:
;123:void SP_info_player_start (gentity_t *ent);
;124:void SP_info_player_deathmatch (gentity_t *ent);
;125:void SP_info_player_imperial (gentity_t *ent);
;126:void SP_info_player_rebel (gentity_t *ent);
;127:void SP_info_player_intermission (gentity_t *ent);
;128:void SP_info_jedimaster_start (gentity_t *ent);
;129:void SP_info_firstplace(gentity_t *ent);
;130:void SP_info_secondplace(gentity_t *ent);
;131:void SP_info_thirdplace(gentity_t *ent);
;132:void SP_info_podium(gentity_t *ent);
;133:
;134:void SP_info_saga_objective (gentity_t *ent);
;135:
;136:void SP_func_plat (gentity_t *ent);
;137:void SP_func_static (gentity_t *ent);
;138:void SP_func_rotating (gentity_t *ent);
;139:void SP_func_bobbing (gentity_t *ent);
;140:void SP_func_pendulum( gentity_t *ent );
;141:void SP_func_button (gentity_t *ent);
;142:void SP_func_door (gentity_t *ent);
;143:void SP_func_train (gentity_t *ent);
;144:void SP_func_timer (gentity_t *self);
;145:void SP_func_breakable (gentity_t *ent);
;146:void SP_func_glass (gentity_t *ent);
;147:void SP_func_usable( gentity_t *ent);
;148:
;149:void SP_trigger_always (gentity_t *ent);
;150:void SP_trigger_multiple (gentity_t *ent);
;151:void SP_trigger_push (gentity_t *ent);
;152:void SP_trigger_push_velocity(gentity_t* ent);
;153:void SP_trigger_teleport (gentity_t *ent);
;154:void SP_trigger_hurt (gentity_t *ent);
;155:
;156:void SP_target_remove_powerups( gentity_t *ent );
;157:void SP_target_give (gentity_t *ent);
;158:void SP_target_delay (gentity_t *ent);
;159:void SP_target_speaker (gentity_t *ent);
;160:void SP_target_print (gentity_t *ent);
;161:void SP_target_laser (gentity_t *self);
;162:void SP_target_character (gentity_t *ent);
;163:void SP_target_score( gentity_t *ent ); 
;164:void DF_target_fragsFilter(gentity_t* ent);
;165:void DF_target_speed_husk(gentity_t* ent);
;166:void SP_target_teleporter( gentity_t *ent );
;167:void SP_target_relay (gentity_t *ent);
;168:void SP_target_kill (gentity_t *ent);
;169:void SP_target_position (gentity_t *ent);
;170:void SP_target_location (gentity_t *ent);
;171:void SP_target_push (gentity_t *ent);
;172:
;173:void Q3R_SP_rally_checkpoint(gentity_t* ent);
;174:void Q3R_SP_rally_startfinish(gentity_t* ent);
;175:
;176:void SP_light (gentity_t *self);
;177:void SP_info_null (gentity_t *self);
;178:void SP_info_notnull (gentity_t *self);
;179:void SP_info_camp (gentity_t *self);
;180:void SP_path_corner (gentity_t *self);
;181:
;182:void SP_misc_teleporter_dest (gentity_t *self);
;183:void SP_misc_model(gentity_t *ent);
;184:void SP_misc_G2model(gentity_t *ent);
;185:void SP_misc_portal_camera(gentity_t *ent);
;186:void SP_misc_portal_surface(gentity_t *ent);
;187:
;188:void SP_misc_shield_floor_unit( gentity_t *ent );
;189:void SP_misc_model_shield_power_converter( gentity_t *ent );
;190:void SP_misc_model_ammo_power_converter( gentity_t *ent );
;191:void SP_misc_model_health_power_converter( gentity_t *ent );
;192:
;193:void SP_fx_runner( gentity_t *ent );
;194:
;195:#ifdef ANIMENT_SPAWNER
;196:void SP_misc_animent_spawner(gentity_t *ent);
;197:void SP_target_screenshake(gentity_t *ent);
;198:void SP_target_escapetrig(gentity_t *ent);
;199:#endif
;200:
;201:void SP_misc_holocron(gentity_t *ent);
;202:
;203:void SP_shooter_blaster( gentity_t *ent );
;204:
;205:void SP_team_CTF_redplayer( gentity_t *ent );
;206:void SP_team_CTF_blueplayer( gentity_t *ent );
;207:
;208:void SP_team_CTF_redspawn( gentity_t *ent );
;209:void SP_team_CTF_bluespawn( gentity_t *ent );
;210:
;211:void SP_item_botroam( gentity_t *ent )
;212:{
line 213
;213:}
LABELV $173
endproc SP_item_botroam 0 0
data
export spawns
align 4
LABELV spawns
address $174
byte 4 1
address SP_info_player_start
address $175
byte 4 1
address SP_info_player_deathmatch
address $176
byte 4 1
address SP_info_player_imperial
address $177
byte 4 1
address SP_info_player_rebel
address $178
byte 4 1
address SP_info_player_intermission
address $179
byte 4 0
address SP_info_jedimaster_start
address $180
byte 4 1
address SP_info_null
address $181
byte 4 1
address SP_info_notnull
address $182
byte 4 1
address SP_info_camp
address $183
byte 4 0
address SP_info_saga_objective
address $184
byte 4 0
address SP_func_plat
address $185
byte 4 0
address SP_func_button
address $186
byte 4 0
address SP_func_door
address $187
byte 4 0
address SP_func_static
address $188
byte 4 0
address SP_func_rotating
address $189
byte 4 0
address SP_func_bobbing
address $190
byte 4 0
address SP_func_pendulum
address $191
byte 4 0
address SP_func_train
address $192
byte 4 1
address SP_info_null
address $193
byte 4 1
address SP_func_timer
address $194
byte 4 0
address SP_func_breakable
address $195
byte 4 0
address SP_func_glass
address $196
byte 4 0
address SP_func_usable
address $197
byte 4 1
address SP_trigger_always
address $198
byte 4 0
address SP_trigger_multiple
address $199
byte 4 0
address SP_trigger_push
address $200
byte 4 0
address SP_trigger_push_velocity
address $201
byte 4 0
address SP_trigger_teleport
address $202
byte 4 0
address SP_trigger_hurt
address $203
byte 4 0
address DF_trigger_start
address $204
byte 4 0
address DF_trigger_finish
address $205
byte 4 0
address DF_trigger_checkpoint
address $206
byte 4 0
address Q3R_SP_rally_startfinish
address $207
byte 4 0
address Q3R_SP_rally_checkpoint
address $208
byte 4 0
address SP_HoldableMedkit
address $209
byte 4 1
address SP_target_give
address $210
byte 4 1
address SP_target_remove_powerups
address $211
byte 4 1
address SP_target_delay
address $212
byte 4 0
address SP_target_speaker
address $213
byte 4 1
address SP_target_print
address $214
byte 4 0
address SP_target_laser
address $215
byte 4 1
address SP_target_score
address $216
byte 4 1
address SP_target_teleporter
address $217
byte 4 1
address SP_target_relay
address $218
byte 4 1
address SP_target_kill
address $219
byte 4 1
address SP_target_position
address $220
byte 4 1
address SP_target_location
address $221
byte 4 1
address SP_target_push
address $222
byte 4 1
address DF_target_speed_husk
address $223
byte 4 1
address DF_target_fragsFilter
address $224
byte 4 1
address DF_target_husk
address $225
byte 4 1
address DF_target_husk
address $226
byte 4 1
address DF_target_husk
address $227
byte 4 0
address DF_target_husk
address $159
byte 4 1
address SP_light
address $228
byte 4 1
address SP_path_corner
address $229
byte 4 1
address SP_misc_teleporter_dest
address $230
byte 4 1
address SP_misc_model
address $231
byte 4 1
address SP_misc_G2model
address $232
byte 4 0
address SP_misc_portal_surface
address $233
byte 4 0
address SP_misc_portal_camera
address $234
byte 4 0
address SP_misc_shield_floor_unit
address $235
byte 4 0
address SP_misc_model_shield_power_converter
address $236
byte 4 0
address SP_misc_model_ammo_power_converter
address $237
byte 4 0
address SP_misc_model_health_power_converter
address $238
byte 4 0
address SP_fx_runner
address $239
byte 4 0
address SP_misc_animent_spawner
address $240
byte 4 1
address SP_target_screenshake
address $241
byte 4 1
address SP_target_escapetrig
address $242
byte 4 0
address SP_misc_holocron
address $243
byte 4 0
address SP_shooter_blaster
address $244
byte 4 1
address SP_team_CTF_redplayer
address $245
byte 4 1
address SP_team_CTF_blueplayer
address $246
byte 4 1
address SP_team_CTF_redspawn
address $247
byte 4 1
address SP_team_CTF_bluespawn
address $248
byte 4 1
address SP_item_botroam
address $249
byte 4 0
address SP_emplaced_gun
byte 4 0
byte 4 0
byte 4 0
code
proc spawncmp 4 8
line 337
;214:
;215:void SP_emplaced_gun( gentity_t *ent );
;216:
;217:extern void DF_target_husk(gentity_t* ent);
;218:extern void DF_trigger_start(gentity_t* ent);
;219:extern void DF_trigger_finish(gentity_t* ent);
;220:extern void DF_trigger_checkpoint(gentity_t* ent);
;221:
;222:extern void SP_HoldableMedkit(gentity_t* ent);
;223:spawn_t	spawns[] = {
;224:	// info entities don't do anything at all, but provide positional
;225:	// information for things controlled by other processes
;226:	{"info_player_start", qtrue, SP_info_player_start},
;227:	{"info_player_deathmatch", qtrue, SP_info_player_deathmatch},
;228:	{"info_player_imperial", qtrue, SP_info_player_imperial},
;229:	{"info_player_rebel", qtrue, SP_info_player_rebel},
;230:	{"info_player_intermission", qtrue, SP_info_player_intermission},
;231:	{"info_jedimaster_start", qfalse, SP_info_jedimaster_start}, // for some reason it needs svent
;232:	{"info_null", qtrue, SP_info_null},
;233:	{"info_notnull", qtrue, SP_info_notnull},		// use target_position instead
;234:	{"info_camp", qtrue, SP_info_camp},
;235:
;236:	{"info_saga_objective", qfalse, SP_info_saga_objective}, // can this be logical?
;237:
;238:	{"func_plat", qfalse, SP_func_plat},
;239:	{"func_button", qfalse, SP_func_button},
;240:	{"func_door", qfalse, SP_func_door},
;241:	{"func_static", qfalse, SP_func_static},
;242:	{"func_rotating", qfalse, SP_func_rotating},
;243:	{"func_bobbing", qfalse, SP_func_bobbing},
;244:	{"func_pendulum", qfalse, SP_func_pendulum},
;245:	{"func_train", qfalse, SP_func_train},
;246:	{"func_group", qtrue, SP_info_null}, // ends up null, so can be logical?
;247:	{"func_timer", qtrue, SP_func_timer},			// rename trigger_timer?  // doesnt really have position, so logical?
;248:	{"func_breakable", qfalse, SP_func_breakable},
;249:	{"func_glass", qfalse, SP_func_glass},
;250:	{"func_usable", qfalse, SP_func_usable},
;251:
;252:	// Triggers are brush objects that cause an effect when contacted
;253:	// by a living player, usually involving firing targets.
;254:	// While almost everything could be done with
;255:	// a single trigger class and different targets, triggered effects
;256:	// could not be client side predicted (push and teleport).
;257:	{"trigger_always", qtrue, SP_trigger_always}, // this one can be logical right? it doesnt have a relevant position or anything
;258:	{"trigger_multiple", qfalse, SP_trigger_multiple},
;259:	{"trigger_push", qfalse, SP_trigger_push},
;260:	{"trigger_push_velocity", qfalse, SP_trigger_push_velocity},
;261:	{"trigger_teleport", qfalse, SP_trigger_teleport},
;262:	{"trigger_hurt", qfalse, SP_trigger_hurt},
;263:
;264:	{"df_trigger_start", qfalse, DF_trigger_start},
;265:	{"df_trigger_finish", qfalse, DF_trigger_finish},
;266:	{"df_trigger_checkpoint", qfalse, DF_trigger_checkpoint},
;267:
;268:	// q3 rally map support
;269:	{"rally_startfinish", qfalse, Q3R_SP_rally_startfinish},
;270:	{"rally_checkpoint", qfalse, Q3R_SP_rally_checkpoint},
;271:
;272:	// q3 ents
;273:	{"holdable_medkit", qfalse, SP_HoldableMedkit},
;274:
;275:	// targets perform no action by themselves, but must be triggered
;276:	// by another entity
;277:	{"target_give", qtrue, SP_target_give},
;278:	{"target_remove_powerups", qtrue, SP_target_remove_powerups},
;279:	{"target_delay", qtrue, SP_target_delay},
;280:	{"target_speaker", qfalse, SP_target_speaker},
;281:	{"target_print", qtrue, SP_target_print},
;282:	{"target_laser", qfalse, SP_target_laser},
;283:	{"target_score", qtrue, SP_target_score},
;284:	{"target_teleporter", qtrue, SP_target_teleporter},
;285:	{"target_relay", qtrue, SP_target_relay},
;286:	{"target_kill", qtrue, SP_target_kill},
;287:	{"target_position", qtrue, SP_target_position},
;288:	{"target_location", qtrue, SP_target_location},
;289:	{"target_push", qtrue, SP_target_push},
;290:	{"target_speed", qtrue, DF_target_speed_husk},
;291:
;292:	{"target_fragsFilter", qtrue, DF_target_fragsFilter},
;293:
;294:	{"target_startTimer", qtrue, DF_target_husk},
;295:	{"target_stopTimer", qtrue, DF_target_husk},
;296:	{"target_checkpoint", qtrue, DF_target_husk},
;297:
;298:	{"Twi_timer", qfalse, DF_target_husk},
;299:
;300:	{"light", qtrue, SP_light}, // in jka it can't be logical cuz it does stuff. here it can.
;301:	{"path_corner", qtrue, SP_path_corner},
;302:
;303:	{"misc_teleporter_dest", qtrue, SP_misc_teleporter_dest},
;304:	{"misc_model", qtrue, SP_misc_model}, // doesnt actually do anything rn so make it logical
;305:	{"misc_G2model", qtrue, SP_misc_G2model}, // doesnt actually do anything rn so make it logical
;306:	{"misc_portal_surface", qfalse, SP_misc_portal_surface},
;307:	{"misc_portal_camera", qfalse, SP_misc_portal_camera},
;308:
;309:	{"misc_shield_floor_unit", qfalse, SP_misc_shield_floor_unit},
;310:	{"misc_model_shield_power_converter", qfalse, SP_misc_model_shield_power_converter},
;311:	{"misc_model_ammo_power_converter", qfalse, SP_misc_model_ammo_power_converter},
;312:	{"misc_model_health_power_converter", qfalse, SP_misc_model_health_power_converter},
;313:
;314:	{"fx_runner", qfalse, SP_fx_runner},
;315:#ifdef ANIMENT_SPAWNER
;316:	{"misc_animent_spawner", qfalse, SP_misc_animent_spawner}, // could be logical since its not allowed in MP anyway?
;317:	{"target_screenshake", qtrue, SP_target_screenshake},
;318:	{"target_escapetrig", qtrue, SP_target_escapetrig}, // what is this
;319:#endif
;320:
;321:	{"misc_holocron", qfalse, SP_misc_holocron},
;322:
;323:	{"shooter_blaster", qfalse, SP_shooter_blaster},
;324:
;325:	{"team_CTF_redplayer", qtrue, SP_team_CTF_redplayer},
;326:	{"team_CTF_blueplayer", qtrue, SP_team_CTF_blueplayer},
;327:
;328:	{"team_CTF_redspawn", qtrue, SP_team_CTF_redspawn},
;329:	{"team_CTF_bluespawn", qtrue, SP_team_CTF_bluespawn},
;330:
;331:	{"item_botroam", qtrue, SP_item_botroam},
;332:
;333:	{"emplaced_gun", qfalse, SP_emplaced_gun},
;334:
;335:	{0,qfalse, 0}
;336:};
;337:static int spawncmp(const void* a, const void* b) {
line 338
;338:	return Q_stricmp((const char*)a, ((spawn_t*)b)->name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $250
endproc spawncmp 4 8
export G_IsLogicalEntity
proc G_IsLogicalEntity 12 8
line 340
;339:}
;340:qboolean G_IsLogicalEntity(const char* classname) {
line 342
;341:	int i;
;342:	spawn_t* s = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 344
;343:
;344:	if (!classname) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $252
line 345
;345:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $251
JUMPV
LABELV $252
line 349
;346:	}
;347:
;348:	//s = (spawn_t*)bsearch(classname, spawns, ARRAY_LEN(spawns), sizeof(spawn_t), spawncmp); // i cba sorting the entities by name... and its only for map spawns anyway
;349:	for (i = 0; i < ARRAY_LEN(spawns); i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $257
JUMPV
LABELV $254
line 350
;350:		if (!Q_stricmp(spawns[i].name,classname)) {
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 spawns
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $258
line 351
;351:			s = spawns + i; 
ADDRLP4 4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 spawns
ADDP4
ASGNP4
line 352
;352:			break;
ADDRGP4 $256
JUMPV
LABELV $258
line 354
;353:		}
;354:	}
LABELV $255
line 349
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $257
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 78
LTU4 $254
LABELV $256
line 355
;355:	if (s)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $260
line 356
;356:	{// found it
line 357
;357:		if (s->logical) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $262
line 358
;358:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $251
JUMPV
LABELV $262
line 360
;359:		}
;360:		else {
line 361
;361:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $251
JUMPV
LABELV $260
line 365
;362:		}
;363:	}
;364:
;365:	return qfalse;
CNSTI4 0
RETI4
LABELV $251
endproc G_IsLogicalEntity 12 8
export G_CallSpawn
proc G_CallSpawn 12 8
line 376
;366:}
;367:
;368:/*
;369:===============
;370:G_CallSpawn
;371:
;372:Finds the spawn function for the entity and calls it,
;373:returning qfalse if not found
;374:===============
;375:*/
;376:qboolean G_CallSpawn( gentity_t *ent ) {
line 380
;377:	spawn_t	*s;
;378:	gitem_t	*item;
;379:
;380:	if ( !ent->classname ) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $265
line 381
;381:		G_Printf ("G_CallSpawn: NULL classname\n");
ADDRGP4 $267
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 382
;382:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $264
JUMPV
LABELV $265
line 386
;383:	}
;384:
;385:	// check item spawn functions
;386:	for ( item=bg_itemlist+1 ; item->classname ; item++ ) {
ADDRLP4 4
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $271
JUMPV
LABELV $268
line 387
;387:		if ( !strcmp(item->classname, ent->classname) ) {
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $273
line 388
;388:			G_SpawnItem( ent, item );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 389
;389:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $273
line 391
;390:		}
;391:	}
LABELV $269
line 386
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $271
ADDRLP4 4
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $268
line 394
;392:
;393:	// check normal spawn functions
;394:	for ( s=spawns ; s->name ; s++ ) {
ADDRLP4 0
ADDRGP4 spawns
ASGNP4
ADDRGP4 $278
JUMPV
LABELV $275
line 395
;395:		if ( !strcmp(s->name, ent->classname) ) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $279
line 397
;396:			// found it
;397:			s->spawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
CALLV
pop
line 398
;398:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $279
line 400
;399:		}
;400:	}
LABELV $276
line 394
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
LABELV $278
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $275
line 401
;401:	G_Printf ("%s doesn't have a spawn function\n", ent->classname);
ADDRGP4 $281
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 402
;402:	return qfalse;
CNSTI4 0
RETI4
LABELV $264
endproc G_CallSpawn 12 8
export G_NewString
proc G_NewString 32 4
line 413
;403:}
;404:
;405:/*
;406:=============
;407:G_NewString
;408:
;409:Builds a copy of the string, translating \n to real linefeeds
;410:so message texts can be multi-line
;411:=============
;412:*/
;413:char *G_NewString( const char *string ) {
line 417
;414:	char	*newb, *new_p;
;415:	int		i,l;
;416:	
;417:	l = strlen(string) + 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 4
ADDRLP4 16
INDIRU4
CNSTU4 1
ADDU4
CVUI4 4
ASGNI4
line 419
;418:
;419:	newb = G_Alloc( l );
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 421
;420:
;421:	new_p = newb;
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 424
;422:
;423:	// turn \n into a real linefeed
;424:	for ( i=0 ; i< l ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $286
JUMPV
LABELV $283
line 425
;425:		if (string[i] == '\\' && i < l-1) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $287
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $287
line 426
;426:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 427
;427:			if (string[i] == 'n') {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $289
line 428
;428:				*new_p++ = '\n';
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI1 10
ASGNI1
line 429
;429:			} else {
ADDRGP4 $288
JUMPV
LABELV $289
line 430
;430:				*new_p++ = '\\';
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI1 92
ASGNI1
line 431
;431:			}
line 432
;432:		} else {
ADDRGP4 $288
JUMPV
LABELV $287
line 433
;433:			*new_p++ = string[i];
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 434
;434:		}
LABELV $288
line 435
;435:	}
LABELV $284
line 424
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $286
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $283
line 437
;436:	
;437:	return newb;
ADDRLP4 12
INDIRP4
RETP4
LABELV $282
endproc G_NewString 32 4
export G_ParseField
proc G_ParseField 60 20
line 451
;438:}
;439:
;440:
;441:
;442:
;443:/*
;444:===============
;445:G_ParseField
;446:
;447:Takes a key/value pair and sets the binary values
;448:in a gentity
;449:===============
;450:*/
;451:void G_ParseField( const char *key, const char *value, gentity_t *ent ) {
line 457
;452:	field_t	*f;
;453:	byte	*b;
;454:	float	v;
;455:	vec3_t	vec;
;456:
;457:	for ( f=fields ; f->name ; f++ ) {
ADDRLP4 0
ADDRGP4 fields
ASGNP4
ADDRGP4 $295
JUMPV
LABELV $292
line 458
;458:		if ( !Q_stricmp(f->name, key) ) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $296
line 460
;459:			// found it
;460:			b = (byte *)ent;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 462
;461:
;462:			switch( f->type ) {
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $291
ADDRLP4 28
INDIRI4
CNSTI4 9
GTI4 $291
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $311
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $311
address $307
address $308
address $301
address $291
address $302
address $309
address $291
address $291
address $291
address $291
code
LABELV $301
line 464
;463:			case F_LSTRING:
;464:				*(char **)(b+f->ofs) = G_NewString (value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_NewString
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 36
INDIRP4
ASGNP4
line 465
;465:				break;
ADDRGP4 $291
JUMPV
LABELV $302
line 467
;466:			case F_VECTOR:
;467:				sscanf (value, "%f %f %f", &vec[0], &vec[1], &vec[2]);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $139
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8+4
ARGP4
ADDRLP4 8+8
ARGP4
ADDRGP4 sscanf
CALLI4
pop
line 468
;468:				((float *)(b+f->ofs))[0] = vec[0];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 469
;469:				((float *)(b+f->ofs))[1] = vec[1];
ADDRLP4 40
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 40
INDIRI4
ADDP4
ADDRLP4 8+4
INDIRF4
ASGNF4
line 470
;470:				((float *)(b+f->ofs))[2] = vec[2];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8+8
INDIRF4
ASGNF4
line 471
;471:				break;
ADDRGP4 $291
JUMPV
LABELV $307
line 473
;472:			case F_INT:
;473:				*(int *)(b+f->ofs) = atoi(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 474
;474:				break;
ADDRGP4 $291
JUMPV
LABELV $308
line 476
;475:			case F_FLOAT:
;476:				*(float *)(b+f->ofs) = atof(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
line 477
;477:				break;
ADDRGP4 $291
JUMPV
LABELV $309
line 479
;478:			case F_ANGLEHACK:
;479:				v = atof(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 52
INDIRF4
ASGNF4
line 480
;480:				((float *)(b+f->ofs))[0] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
line 481
;481:				((float *)(b+f->ofs))[1] = v;
ADDRLP4 56
CNSTI4 4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 56
INDIRI4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 56
INDIRI4
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 482
;482:				((float *)(b+f->ofs))[2] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 483
;483:				break;
line 486
;484:			default:
;485:			case F_IGNORE:
;486:				break;
line 488
;487:			}
;488:			return;
ADDRGP4 $291
JUMPV
LABELV $296
line 490
;489:		}
;490:	}
LABELV $293
line 457
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $295
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $292
line 491
;491:}
LABELV $291
endproc G_ParseField 60 20
data
align 4
LABELV $313
address $314
address $315
address $316
address $317
address $318
address $154
address $319
address $320
address $321
export G_SpawnGEntityFromSpawnVars
code
proc G_SpawnGEntityFromSpawnVars 44 12
line 504
;492:
;493:
;494:
;495:
;496:/*
;497:===================
;498:G_SpawnGEntityFromSpawnVars
;499:
;500:Spawn an entity and fill in all of the level fields from
;501:level.spawnVars[], then call the class specfic spawn function
;502:===================
;503:*/
;504:void G_SpawnGEntityFromSpawnVars( void ) {
line 509
;505:	int			i;
;506:	gentity_t	*ent;
;507:	char		*s, *value, *gametypeName;
;508:	static char *gametypeNames[] = {"ffa", "holocron", "jedimaster", "duel", "single", "team", "saga", "ctf", "cty"};
;509:	qboolean	isTwiTimer = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 514
;510:
;511:	//// get the next free entity
;512:	//ent = G_Spawn();
;513:
;514:	value = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 515
;515:	for (i = 0; i < level.numSpawnVars; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $325
JUMPV
LABELV $322
line 516
;516:		if (!Q_stricmp(level.spawnVars[i][0], "Twi_timer"))
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4412
ADDP4
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $327
line 517
;517:		{
line 518
;518:			isTwiTimer = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 519
;519:			value = "Twi_timer";
ADDRLP4 8
ADDRGP4 $227
ASGNP4
line 520
;520:		}
LABELV $327
line 521
;521:	}
LABELV $323
line 515
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $325
ADDRLP4 0
INDIRI4
ADDRGP4 level+4408
INDIRI4
LTI4 $322
line 522
;522:	if (!value) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $330
line 523
;523:		G_SpawnString("classname", NULL, &value);
ADDRGP4 $142
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 524
;524:	}
LABELV $330
line 525
;525:	if (!value) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $332
line 526
;526:		return;	// Dont even bother spawning an ent without a classname
ADDRGP4 $312
JUMPV
LABELV $332
line 528
;527:	}
;528:	if (G_IsLogicalEntity(value)) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_IsLogicalEntity
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $334
line 530
;529:		// Check if the entity wants to be nonlogical anyway
;530:		G_SpawnInt("nological", "0", &i);
ADDRGP4 $336
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 531
;531:		if (i) {				// Despite it being a logical entity, it wants to be nonlogical
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $338
line 532
;532:			ent = G_Spawn();	// possibly because it wants to use icarus for example
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 28
INDIRP4
ASGNP4
line 533
;533:		}
ADDRGP4 $335
JUMPV
LABELV $338
line 534
;534:		else {
line 535
;535:			G_SpawnString("script_targetname", NULL, &value); //Always make entities with script_targetnames non logical (???)
ADDRGP4 $340
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 536
;536:			if (value) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $341
line 537
;537:				ent = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 28
INDIRP4
ASGNP4
line 538
;538:			}
ADDRGP4 $335
JUMPV
LABELV $341
line 539
;539:			else {
line 541
;540:				// Get the next free logical entity
;541:				ent = G_SpawnLogical();
ADDRLP4 28
ADDRGP4 G_SpawnLogical
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 28
INDIRP4
ASGNP4
line 542
;542:			}
line 543
;543:		}
line 544
;544:	}
ADDRGP4 $335
JUMPV
LABELV $334
line 545
;545:	else {
line 547
;546:		// Get the next free normal entity
;547:		ent = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 28
INDIRP4
ASGNP4
line 548
;548:	}
LABELV $335
line 550
;549:
;550:	G_UnlistFromHashTable(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_UnlistFromHashTable
CALLV
pop
line 552
;551:
;552:	for ( i = 0 ; i < level.numSpawnVars ; i++ ) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $346
JUMPV
LABELV $343
line 553
;553:		G_ParseField( level.spawnVars[i][0], level.spawnVars[i][1], ent );
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRGP4 level+4412
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
INDIRI4
ADDRGP4 level+4412+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_ParseField
CALLV
pop
line 554
;554:	}
LABELV $344
line 552
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $346
ADDRLP4 0
INDIRI4
ADDRGP4 level+4408
INDIRI4
LTI4 $343
line 556
;555:
;556:	if (isTwiTimer) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $351
line 557
;557:		G_SetClassName(ent, "Twi_timer");
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $227
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 558
;558:	}
ADDRGP4 $352
JUMPV
LABELV $351
line 559
;559:	else {
line 561
;560:		// make sure the hashtable is aware of this ent with the now set classname
;561:		G_SetClassName(ent, ent->classname);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 562
;562:	}
LABELV $352
line 565
;563:
;564:	// check for "notsingle" flag
;565:	if ( g_gametype.integer == GT_SINGLE_PLAYER ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $353
line 566
;566:		G_SpawnInt( "notsingle", "0", &i );
ADDRGP4 $356
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 567
;567:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $357
line 568
;568:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 569
;569:			return;
ADDRGP4 $312
JUMPV
LABELV $357
line 571
;570:		}
;571:	}
LABELV $353
line 573
;572:	// check for "notteam" flag (GT_FFA, GT_TOURNAMENT, GT_SINGLE_PLAYER)
;573:	if ( g_gametype.integer >= GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $359
line 574
;574:		G_SpawnInt( "notteam", "0", &i );
ADDRGP4 $362
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 575
;575:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $360
line 576
;576:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 577
;577:			return;
ADDRGP4 $312
JUMPV
line 579
;578:		}
;579:	} else {
LABELV $359
line 580
;580:		G_SpawnInt( "notfree", "0", &i );
ADDRGP4 $365
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 581
;581:		if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $366
line 582
;582:			G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 583
;583:			return;
ADDRGP4 $312
JUMPV
LABELV $366
line 585
;584:		}
;585:	}
LABELV $360
line 587
;586:
;587:	G_SpawnInt( "notta", "0", &i );
ADDRGP4 $368
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 588
;588:	if ( i ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $369
line 589
;589:		G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 590
;590:		return;
ADDRGP4 $312
JUMPV
LABELV $369
line 593
;591:	}
;592:
;593:	if( G_SpawnString( "gametype", NULL, &value ) ) {
ADDRGP4 $373
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 28
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $371
line 594
;594:		if( g_gametype.integer >= GT_FFA && g_gametype.integer < GT_MAX_GAME_TYPE ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
LTI4 $374
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 9
GEI4 $374
line 595
;595:			gametypeName = gametypeNames[g_gametype.integer];
ADDRLP4 20
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $313
ADDP4
INDIRP4
ASGNP4
line 597
;596:
;597:			s = strstr( value, gametypeName );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 598
;598:			if( !s ) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $379
line 599
;599:				G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 600
;600:				return;
ADDRGP4 $312
JUMPV
LABELV $379
line 602
;601:			}
;602:		}
LABELV $374
line 603
;603:	}
LABELV $371
line 606
;604:
;605:	// move editor origin to pos
;606:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 607
;607:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 4
INDIRP4
CNSTI4 368
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 610
;608:
;609:	// if we didn't get a classname, don't bother spawning anything
;610:	if ( !G_CallSpawn( ent ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 G_CallSpawn
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $381
line 611
;611:		G_FreeEntity( ent );
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 612
;612:	}
LABELV $381
line 613
;613:}
LABELV $312
endproc G_SpawnGEntityFromSpawnVars 44 12
export G_AddSpawnVarToken
proc G_AddSpawnVarToken 16 12
line 622
;614:
;615:
;616:
;617:/*
;618:====================
;619:G_AddSpawnVarToken
;620:====================
;621:*/
;622:char *G_AddSpawnVarToken( const char *string ) {
line 626
;623:	int		l;
;624:	char	*dest;
;625:
;626:	l = strlen( string );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
ADDRLP4 8
INDIRU4
CVUI4 4
ASGNI4
line 627
;627:	if ( level.numSpawnVarChars + l + 1 > MAX_SPAWN_VARS_CHARS ) {
ADDRGP4 level+4924
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 1
ADDI4
CNSTI4 4096
LEI4 $384
line 628
;628:		G_Error( "G_AddSpawnVarToken: MAX_SPAWN_CHARS" );
ADDRGP4 $387
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 629
;629:	}
LABELV $384
line 631
;630:
;631:	dest = level.spawnVarChars + level.numSpawnVarChars;
ADDRLP4 4
ADDRGP4 level+4924
INDIRI4
ADDRGP4 level+4928
ADDP4
ASGNP4
line 632
;632:	memcpy( dest, string, l+1 );
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
CVIU4 4
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 634
;633:
;634:	level.numSpawnVarChars += l + 1;
ADDRLP4 12
ADDRGP4 level+4924
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 636
;635:
;636:	return dest;
ADDRLP4 4
INDIRP4
RETP4
LABELV $383
endproc G_AddSpawnVarToken 16 12
export G_ParseSpawnVars
proc G_ParseSpawnVars 2072 8
line 649
;637:}
;638:
;639:/*
;640:====================
;641:G_ParseSpawnVars
;642:
;643:Parses a brace bounded set of key / value pairs out of the
;644:level's entity strings into level.spawnVars[]
;645:
;646:This does not actually spawn an entity.
;647:====================
;648:*/
;649:qboolean G_ParseSpawnVars( void ) {
line 653
;650:	char		keyname[MAX_TOKEN_CHARS];
;651:	char		com_token[MAX_TOKEN_CHARS];
;652:
;653:	level.numSpawnVars = 0;
ADDRGP4 level+4408
CNSTI4 0
ASGNI4
line 654
;654:	level.numSpawnVarChars = 0;
ADDRGP4 level+4924
CNSTI4 0
ASGNI4
line 657
;655:
;656:	// parse the opening brace
;657:	if ( !trap_GetEntityToken( com_token, sizeof( com_token ) ) ) {
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2048
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2048
INDIRI4
CNSTI4 0
NEI4 $394
line 659
;658:		// end of spawn string
;659:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $391
JUMPV
LABELV $394
line 661
;660:	}
;661:	if ( com_token[0] != '{' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $400
line 662
;662:		G_Error( "G_ParseSpawnVars: found %s when expecting {",com_token );
ADDRGP4 $398
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 663
;663:	}
ADDRGP4 $400
JUMPV
LABELV $399
line 666
;664:
;665:	// go through all the key / value pairs
;666:	while ( 1 ) {	
line 668
;667:		// parse key
;668:		if ( !trap_GetEntityToken( keyname, sizeof( keyname ) ) ) {
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2052
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 0
NEI4 $402
line 669
;669:			G_Error( "G_ParseSpawnVars: EOF without closing brace" );
ADDRGP4 $404
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 670
;670:		}
LABELV $402
line 672
;671:
;672:		if ( keyname[0] == '}' ) {
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $405
line 673
;673:			break;
ADDRGP4 $401
JUMPV
LABELV $405
line 677
;674:		}
;675:		
;676:		// parse value	
;677:		if ( !trap_GetEntityToken( com_token, sizeof( com_token ) ) ) {
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2056
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 0
NEI4 $407
line 678
;678:			G_Error( "G_ParseSpawnVars: EOF without closing brace" );
ADDRGP4 $404
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 679
;679:		}
LABELV $407
line 681
;680:
;681:		if ( com_token[0] == '}' ) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $409
line 682
;682:			G_Error( "G_ParseSpawnVars: closing brace without data" );
ADDRGP4 $411
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 683
;683:		}
LABELV $409
line 684
;684:		if ( level.numSpawnVars == MAX_SPAWN_VARS ) {
ADDRGP4 level+4408
INDIRI4
CNSTI4 64
NEI4 $412
line 685
;685:			G_Error( "G_ParseSpawnVars: MAX_SPAWN_VARS" );
ADDRGP4 $415
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 686
;686:		}
LABELV $412
line 687
;687:		level.spawnVars[ level.numSpawnVars ][0] = G_AddSpawnVarToken( keyname );
ADDRLP4 1024
ARGP4
ADDRLP4 2060
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+4408
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4412
ADDP4
ADDRLP4 2060
INDIRP4
ASGNP4
line 688
;688:		level.spawnVars[ level.numSpawnVars ][1] = G_AddSpawnVarToken( com_token );
ADDRLP4 0
ARGP4
ADDRLP4 2064
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+4408
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+4412+4
ADDP4
ADDRLP4 2064
INDIRP4
ASGNP4
line 689
;689:		level.numSpawnVars++;
ADDRLP4 2068
ADDRGP4 level+4408
ASGNP4
ADDRLP4 2068
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 690
;690:	}
LABELV $400
line 666
ADDRGP4 $399
JUMPV
LABELV $401
line 692
;691:
;692:	return qtrue;
CNSTI4 1
RETI4
LABELV $391
endproc G_ParseSpawnVars 2072 8
data
align 4
LABELV defaultStyles
address $422
address $422
address $422
address $423
address $423
address $423
address $424
address $424
address $424
address $425
address $425
address $425
address $426
address $426
address $426
address $427
address $427
address $427
address $428
address $428
address $428
address $429
address $429
address $429
address $430
address $430
address $430
address $431
address $431
address $431
address $432
address $432
address $432
address $433
address $433
address $433
address $434
address $434
address $434
address $435
address $436
address $437
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
address $438
export precachedKyle
align 4
LABELV precachedKyle
byte 4 0
export SP_worldspawn
code
proc SP_worldspawn 76 28
line 880
;693:}
;694:
;695:
;696:static	char *defaultStyles[32][3] = 
;697:{
;698:	{	// 0 normal
;699:		"z",
;700:		"z",
;701:		"z"
;702:	},
;703:	{	// 1 FLICKER (first variety)
;704:		"mmnmmommommnonmmonqnmmo",
;705:		"mmnmmommommnonmmonqnmmo",
;706:		"mmnmmommommnonmmonqnmmo"
;707:	},
;708:	{	// 2 SLOW STRONG PULSE
;709:		"abcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcb",
;710:		"abcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcb",
;711:		"abcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcb"
;712:	},
;713:	{	// 3 CANDLE (first variety)
;714:		"mmmmmaaaaammmmmaaaaaabcdefgabcdefg",
;715:		"mmmmmaaaaammmmmaaaaaabcdefgabcdefg",
;716:		"mmmmmaaaaammmmmaaaaaabcdefgabcdefg"
;717:	},
;718:	{	// 4 FAST STROBE
;719:		"mamamamamama",
;720:		"mamamamamama",
;721:		"mamamamamama"
;722:	},
;723:	{	// 5 GENTLE PULSE 1
;724:		"jklmnopqrstuvwxyzyxwvutsrqponmlkj",
;725:		"jklmnopqrstuvwxyzyxwvutsrqponmlkj",
;726:		"jklmnopqrstuvwxyzyxwvutsrqponmlkj"
;727:	},
;728:	{	// 6 FLICKER (second variety)
;729:		"nmonqnmomnmomomno",
;730:		"nmonqnmomnmomomno",
;731:		"nmonqnmomnmomomno"
;732:	},
;733:	{	// 7 CANDLE (second variety)
;734:		"mmmaaaabcdefgmmmmaaaammmaamm",
;735:		"mmmaaaabcdefgmmmmaaaammmaamm",
;736:		"mmmaaaabcdefgmmmmaaaammmaamm"
;737:	},
;738:	{	// 8 CANDLE (third variety)
;739:		"mmmaaammmaaammmabcdefaaaammmmabcdefmmmaaaa",
;740:		"mmmaaammmaaammmabcdefaaaammmmabcdefmmmaaaa",
;741:		"mmmaaammmaaammmabcdefaaaammmmabcdefmmmaaaa"
;742:	},
;743:	{	// 9 SLOW STROBE (fourth variety)
;744:		"aaaaaaaazzzzzzzz",
;745:		"aaaaaaaazzzzzzzz",
;746:		"aaaaaaaazzzzzzzz"
;747:	},
;748:	{	// 10 FLUORESCENT FLICKER
;749:		"mmamammmmammamamaaamammma",
;750:		"mmamammmmammamamaaamammma",
;751:		"mmamammmmammamamaaamammma"
;752:	},
;753:	{	// 11 SLOW PULSE NOT FADE TO BLACK
;754:		"abcdefghijklmnopqrrqponmlkjihgfedcba",
;755:		"abcdefghijklmnopqrrqponmlkjihgfedcba",
;756:		"abcdefghijklmnopqrrqponmlkjihgfedcba"
;757:	},
;758:	{	// 12 FAST PULSE FOR JEREMY
;759:		"mkigegik",
;760:		"mkigegik",
;761:		"mkigegik"
;762:	},
;763:	{	// 13 Test Blending
;764:		"abcdefghijklmqrstuvwxyz",
;765:		"zyxwvutsrqmlkjihgfedcba",
;766:		"aammbbzzccllcckkffyyggp"
;767:	},
;768:	{	// 14
;769:		"",
;770:		"",
;771:		""
;772:	},
;773:	{	// 15
;774:		"",
;775:		"",
;776:		""
;777:	},
;778:	{	// 16
;779:		"",
;780:		"",
;781:		""
;782:	},
;783:	{	// 17
;784:		"",
;785:		"",
;786:		""
;787:	},
;788:	{	// 18
;789:		"",
;790:		"",
;791:		""
;792:	},
;793:	{	// 19
;794:		"",
;795:		"",
;796:		""
;797:	},
;798:	{	// 20
;799:		"",
;800:		"",
;801:		""
;802:	},
;803:	{	// 21
;804:		"",
;805:		"",
;806:		""
;807:	},
;808:	{	// 22
;809:		"",
;810:		"",
;811:		""
;812:	},
;813:	{	// 23
;814:		"",
;815:		"",
;816:		""
;817:	},
;818:	{	// 24
;819:		"",
;820:		"",
;821:		""
;822:	},
;823:	{	// 25
;824:		"",
;825:		"",
;826:		""
;827:	},
;828:	{	// 26
;829:		"",
;830:		"",
;831:		""
;832:	},
;833:	{	// 27
;834:		"",
;835:		"",
;836:		""
;837:	},
;838:	{	// 28
;839:		"",
;840:		"",
;841:		""
;842:	},
;843:	{	// 29
;844:		"",
;845:		"",
;846:		""
;847:	},
;848:	{	// 30
;849:		"",
;850:		"",
;851:		""
;852:	},
;853:	{	// 31
;854:		"",
;855:		"",
;856:		""
;857:	}
;858:};
;859:
;860:void *precachedKyle = 0;
;861:
;862:/*QUAKED worldspawn (0 0 0) ?
;863:
;864:Every map should have exactly one worldspawn.
;865:"music"		music wav file
;866:"gravity"	800 is default gravity
;867:"message"	Text to print during connection process
;868:
;869:BSP Options
;870:"gridsize"     size of lighting grid to "X Y Z". default="64 64 128"
;871:"ambient"      scale of global light (from _color)
;872:"fog"          shader name of the global fog texture - must include the full path, such as "textures/rj/fog1"
;873:"distancecull" value for vis for the maximum viewing distance
;874:"chopsize"     value for bsp on the maximum polygon / portal size
;875:"ls_Xr"	override lightstyle X with this pattern for Red.
;876:"ls_Xg"	green (valid patterns are "a-z")
;877:"ls_Xb"	blue (a is OFF, z is ON)
;878:*/
;879:void SP_worldspawn( void ) 
;880:{
line 885
;881:	char		*text, temp[32];
;882:	int			i;
;883:	int			lengthRed, lengthBlue, lengthGreen;
;884:
;885:	G_SpawnString( "classname", "", &text );
ADDRGP4 $142
ARGP4
ADDRGP4 $438
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 886
;886:	if ( Q_stricmp( text, "worldspawn" ) ) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $442
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $440
line 887
;887:		G_Error( "SP_worldspawn: The first entity isn't 'worldspawn'" );
ADDRGP4 $443
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 888
;888:	}
LABELV $440
line 892
;889:
;890:	//The server will precache the standard model and animations, so that there is no hit
;891:	//when the first client connnects.
;892:	if (!BGPAFtextLoaded)
ADDRGP4 BGPAFtextLoaded
INDIRI4
CNSTI4 0
NEI4 $444
line 893
;893:	{
line 894
;894:		BG_ParseAnimationFile("models/players/_humanoid/animation.cfg");
ADDRGP4 $446
ARGP4
ADDRGP4 BG_ParseAnimationFile
CALLI4
pop
line 895
;895:	}
LABELV $444
line 897
;896:
;897:	if (!precachedKyle)
ADDRGP4 precachedKyle
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $447
line 898
;898:	{
line 899
;899:		trap_G2API_InitGhoul2Model(&precachedKyle, "models/players/kyle/model.glm", 0, 0, -20, 0, 0);
ADDRGP4 precachedKyle
ARGP4
ADDRGP4 $449
ARGP4
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 -20
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
INDIRP4
CALLI4
pop
line 900
;900:	}
LABELV $447
line 902
;901:
;902:	if (!g2SaberInstance)
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $450
line 903
;903:	{
line 904
;904:		trap_G2API_InitGhoul2Model(&g2SaberInstance, "models/weapons2/saber/saber_w.glm", 0, 0, -20, 0, 0);
ADDRGP4 g2SaberInstance
ARGP4
ADDRGP4 $452
ARGP4
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 -20
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_G2API_InitGhoul2Model
INDIRP4
CALLI4
pop
line 906
;905:
;906:		if (g2SaberInstance)
ADDRGP4 g2SaberInstance
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $453
line 907
;907:		{
line 909
;908:			// indicate we will be bolted to model 0 (ie the player) on bolt 0 (always the right hand) when we get copied
;909:			trap_G2API_SetBoltInfo(g2SaberInstance, 0, 0);
ADDRGP4 g2SaberInstance
INDIRP4
ARGP4
ADDRLP4 60
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 trap_G2API_SetBoltInfo
INDIRP4
CALLV
pop
line 911
;910:			// now set up the gun bolt on it
;911:			trap_G2API_AddBolt(g2SaberInstance, 0, "*flash");
ADDRGP4 g2SaberInstance
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 $455
ARGP4
ADDRGP4 trap_G2API_AddBolt
INDIRP4
CALLI4
pop
line 912
;912:		}
LABELV $453
line 913
;913:	}
LABELV $450
line 916
;914:
;915:	// make some data visible to connecting client
;916:	trap_SetConfigstring( CS_GAME_VERSION, GAME_VERSION );
CNSTI4 20
ARGI4
ADDRGP4 $456
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 918
;917:
;918:	trap_SetConfigstring( CS_LEVEL_START_TIME, va("%i", level.startTime ) );
ADDRGP4 $457
ARGP4
ADDRGP4 level+48
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 21
ARGI4
ADDRLP4 56
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 920
;919:
;920:	G_SpawnString( "music", "", &text );
ADDRGP4 $459
ARGP4
ADDRGP4 $438
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 921
;921:	trap_SetConfigstring( CS_MUSIC, text );
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 923
;922:
;923:	G_SpawnString( "message", "", &text );
ADDRGP4 $153
ARGP4
ADDRGP4 $438
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 924
;924:	trap_SetConfigstring( CS_MESSAGE, text );				// map specific message
CNSTI4 3
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 926
;925:
;926:	Q_strncpyz(level.message, text, sizeof(level.message));
ADDRGP4 level+29528
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 928
;927:
;928:	trap_SetConfigstring( CS_MOTD, g_motd.string );		// message of the day
CNSTI4 4
ARGI4
ADDRGP4 g_motd+16
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 930
;929:
;930:	G_SpawnString( "gravity", "800", &text );
ADDRGP4 $463
ARGP4
ADDRGP4 $464
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 931
;931:	trap_Cvar_Set( "g_gravity", text );
ADDRGP4 $465
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 933
;932:
;933:	G_SpawnString( "enableDust", "0", &text );
ADDRGP4 $466
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 934
;934:	trap_Cvar_Set( "g_enableDust", text );
ADDRGP4 $467
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 936
;935:
;936:	G_SpawnString( "enableBreath", "0", &text );
ADDRGP4 $468
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 937
;937:	trap_Cvar_Set( "g_enableBreath", text );
ADDRGP4 $469
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 939
;938:
;939:	g_entities[ENTITYNUM_WORLD].s.number = ENTITYNUM_WORLD;
ADDRGP4 g_entities+2403744
CNSTI4 1022
ASGNI4
line 940
;940:	G_SetClassName(&g_entities[ENTITYNUM_WORLD], "worldspawn");
ADDRGP4 g_entities+2403744
ARGP4
ADDRGP4 $442
ARGP4
ADDRGP4 G_SetClassName
CALLV
pop
line 943
;941:
;942:	// see if we want a warmup time
;943:	trap_SetConfigstring( CS_WARMUP, "" );
CNSTI4 5
ARGI4
ADDRGP4 $438
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 944
;944:	if ( g_restarted.integer ) {
ADDRGP4 g_restarted+12
INDIRI4
CNSTI4 0
EQI4 $472
line 945
;945:		trap_Cvar_Set( "g_restarted", "0" );
ADDRGP4 $475
ARGP4
ADDRGP4 $337
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 946
;946:		level.warmupTime = 0;
ADDRGP4 level+20
CNSTI4 0
ASGNI4
line 947
;947:	} else if ( g_doWarmup.integer && g_gametype.integer != GT_TOURNAMENT ) { // Turn it on
ADDRGP4 $473
JUMPV
LABELV $472
ADDRGP4 g_doWarmup+12
INDIRI4
CNSTI4 0
EQI4 $477
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $477
line 948
;948:		level.warmupTime = -1;
ADDRGP4 level+20
CNSTI4 -1
ASGNI4
line 949
;949:		trap_SetConfigstring( CS_WARMUP, va("%i", level.warmupTime) );
ADDRGP4 $457
ARGP4
ADDRGP4 level+20
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 950
;950:		G_LogPrintf( "Warmup:\n" );
ADDRGP4 $483
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 951
;951:	}
LABELV $477
LABELV $473
line 953
;952:
;953:	trap_SetConfigstring(CS_LIGHT_STYLES+(LS_STYLES_START*3)+0, defaultStyles[0][0]);
CNSTI4 832
ARGI4
ADDRGP4 defaultStyles
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 954
;954:	trap_SetConfigstring(CS_LIGHT_STYLES+(LS_STYLES_START*3)+1, defaultStyles[0][1]);
CNSTI4 833
ARGI4
ADDRGP4 defaultStyles+4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 955
;955:	trap_SetConfigstring(CS_LIGHT_STYLES+(LS_STYLES_START*3)+2, defaultStyles[0][2]);
CNSTI4 834
ARGI4
ADDRGP4 defaultStyles+8
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 957
;956:	
;957:	for(i=1;i<LS_NUM_STYLES;i++)
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $486
line 958
;958:	{
line 959
;959:		Com_sprintf(temp, sizeof(temp), "ls_%dr", i);
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $490
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 960
;960:		G_SpawnString(temp, defaultStyles[i][0], &text);
ADDRLP4 8
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 defaultStyles
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 961
;961:		lengthRed = strlen(text);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 44
ADDRLP4 60
INDIRU4
CVUI4 4
ASGNI4
line 962
;962:		trap_SetConfigstring(CS_LIGHT_STYLES+((i+LS_STYLES_START)*3)+0, text);
CNSTI4 3
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 832
ADDI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 964
;963:
;964:		Com_sprintf(temp, sizeof(temp), "ls_%dg", i);
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $491
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 965
;965:		G_SpawnString(temp, defaultStyles[i][1], &text);
ADDRLP4 8
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 defaultStyles+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 966
;966:		lengthGreen = strlen(text);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 40
ADDRLP4 64
INDIRU4
CVUI4 4
ASGNI4
line 967
;967:		trap_SetConfigstring(CS_LIGHT_STYLES+((i+LS_STYLES_START)*3)+1, text);
CNSTI4 3
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 832
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 969
;968:
;969:		Com_sprintf(temp, sizeof(temp), "ls_%db", i);
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $493
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 970
;970:		G_SpawnString(temp, defaultStyles[i][2], &text);
ADDRLP4 8
ARGP4
CNSTI4 12
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 defaultStyles+8
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 971
;971:		lengthBlue = strlen(text);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 48
ADDRLP4 68
INDIRU4
CVUI4 4
ASGNI4
line 972
;972:		trap_SetConfigstring(CS_LIGHT_STYLES+((i+LS_STYLES_START)*3)+2, text);
CNSTI4 3
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 832
ADDI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 974
;973:
;974:		if (lengthRed != lengthGreen || lengthGreen != lengthBlue)
ADDRLP4 44
INDIRI4
ADDRLP4 40
INDIRI4
NEI4 $497
ADDRLP4 40
INDIRI4
ADDRLP4 48
INDIRI4
EQI4 $495
LABELV $497
line 975
;975:		{
line 976
;976:			Com_Error(ERR_DROP, "Style %d has inconsistent lengths: R %d, G %d, B %d", 
CNSTI4 1
ARGI4
ADDRGP4 $498
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 978
;977:				i, lengthRed, lengthGreen, lengthBlue);
;978:		}
LABELV $495
line 979
;979:	}	
LABELV $487
line 957
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $486
line 983
;980:
;981:
;982:	// q3 rally map support
;983:	G_SpawnString("reversable", "0", &text);
ADDRGP4 $499
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 984
;984:	level.q3r_trackIsReversable = atoi(text); // we can run our checkpoints in any order anyway but may as well maybe tell the player if a reverse order is possible? meh.
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 level+30552
ADDRLP4 60
INDIRI4
ASGNI4
line 985
;985:}
LABELV $439
endproc SP_worldspawn 76 28
export G_SpawnEntitiesFromString
proc G_SpawnEntitiesFromString 8 4
line 995
;986:
;987:
;988:/*
;989:==============
;990:G_SpawnEntitiesFromString
;991:
;992:Parses textual entity definitions out of an entstring and spawns gentities.
;993:==============
;994:*/
;995:void G_SpawnEntitiesFromString( void ) {
line 997
;996:	// allow calls to G_Spawn*()
;997:	level.spawning = qtrue;
ADDRGP4 level+4404
CNSTI4 1
ASGNI4
line 998
;998:	level.numSpawnVars = 0;
ADDRGP4 level+4408
CNSTI4 0
ASGNI4
line 1003
;999:
;1000:	// the worldspawn is not an actual entity, but it still
;1001:	// has a "spawn" function to perform any global setup
;1002:	// needed by a level (setting configstrings or cvars, etc)
;1003:	if ( !G_ParseSpawnVars() ) {
ADDRLP4 0
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $504
line 1004
;1004:		G_Error( "SpawnEntities: no entities" );
ADDRGP4 $506
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 1005
;1005:	}
LABELV $504
line 1006
;1006:	SP_worldspawn();
ADDRGP4 SP_worldspawn
CALLV
pop
line 1008
;1007:
;1008:	level.q3r_numCheckpoints = 0; // q3 rally map support
ADDRGP4 level+30564
CNSTI4 0
ASGNI4
ADDRGP4 $509
JUMPV
LABELV $508
line 1011
;1009:
;1010:	// parse ents
;1011:	while( G_ParseSpawnVars() ) {
line 1012
;1012:		G_SpawnGEntityFromSpawnVars();
ADDRGP4 G_SpawnGEntityFromSpawnVars
CALLV
pop
line 1013
;1013:	}
LABELV $509
line 1011
ADDRLP4 4
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $508
line 1015
;1014:
;1015:	if (g_defrag.integer) {
ADDRGP4 g_defrag+12
INDIRI4
CNSTI4 0
EQI4 $511
line 1016
;1016:		G_ConvertDefragTriggerTypes();
ADDRGP4 G_ConvertDefragTriggerTypes
CALLV
pop
line 1017
;1017:	}
LABELV $511
line 1019
;1018:
;1019:	level.spawning = qfalse;			// any future calls to G_Spawn*() will be errors
ADDRGP4 level+4404
CNSTI4 0
ASGNI4
line 1020
;1020:}
LABELV $501
endproc G_SpawnEntitiesFromString 8 4
import SP_HoldableMedkit
import DF_trigger_checkpoint
import DF_trigger_finish
import DF_trigger_start
import DF_target_husk
import SP_emplaced_gun
import SP_team_CTF_bluespawn
import SP_team_CTF_redspawn
import SP_team_CTF_blueplayer
import SP_team_CTF_redplayer
import SP_shooter_blaster
import SP_misc_holocron
import SP_target_escapetrig
import SP_target_screenshake
import SP_misc_animent_spawner
import SP_fx_runner
import SP_misc_model_health_power_converter
import SP_misc_model_ammo_power_converter
import SP_misc_model_shield_power_converter
import SP_misc_shield_floor_unit
import SP_misc_portal_surface
import SP_misc_portal_camera
import SP_misc_G2model
import SP_misc_model
import SP_misc_teleporter_dest
import SP_path_corner
import SP_info_camp
import SP_info_notnull
import SP_info_null
import SP_light
import Q3R_SP_rally_startfinish
import Q3R_SP_rally_checkpoint
import SP_target_push
import SP_target_location
import SP_target_position
import SP_target_kill
import SP_target_relay
import SP_target_teleporter
import DF_target_speed_husk
import DF_target_fragsFilter
import SP_target_score
import SP_target_character
import SP_target_laser
import SP_target_print
import SP_target_speaker
import SP_target_delay
import SP_target_give
import SP_target_remove_powerups
import SP_trigger_hurt
import SP_trigger_teleport
import SP_trigger_push_velocity
import SP_trigger_push
import SP_trigger_multiple
import SP_trigger_always
import SP_func_usable
import SP_func_glass
import SP_func_breakable
import SP_func_timer
import SP_func_train
import SP_func_door
import SP_func_button
import SP_func_pendulum
import SP_func_bobbing
import SP_func_rotating
import SP_func_static
import SP_func_plat
import SP_info_saga_objective
import SP_info_podium
import SP_info_thirdplace
import SP_info_secondplace
import SP_info_firstplace
import SP_info_jedimaster_start
import SP_info_player_intermission
import SP_info_player_rebel
import SP_info_player_imperial
import SP_info_player_deathmatch
import SP_info_player_start
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
import gEscapeTime
import gEscaping
import g2SaberInstance
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
LABELV $506
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $499
byte 1 114
byte 1 101
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $498
byte 1 83
byte 1 116
byte 1 121
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 115
byte 1 58
byte 1 32
byte 1 82
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 71
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 66
byte 1 32
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $493
byte 1 108
byte 1 115
byte 1 95
byte 1 37
byte 1 100
byte 1 98
byte 1 0
align 1
LABELV $491
byte 1 108
byte 1 115
byte 1 95
byte 1 37
byte 1 100
byte 1 103
byte 1 0
align 1
LABELV $490
byte 1 108
byte 1 115
byte 1 95
byte 1 37
byte 1 100
byte 1 114
byte 1 0
align 1
LABELV $483
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $475
byte 1 103
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $469
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $468
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $467
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 68
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $466
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 68
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $465
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $464
byte 1 56
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $463
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $459
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $457
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $456
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 106
byte 1 107
byte 1 45
byte 1 49
byte 1 0
align 1
LABELV $455
byte 1 42
byte 1 102
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $452
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
LABELV $449
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
LABELV $446
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
LABELV $443
byte 1 83
byte 1 80
byte 1 95
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 39
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 39
byte 1 0
align 1
LABELV $442
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $438
byte 1 0
align 1
LABELV $437
byte 1 97
byte 1 97
byte 1 109
byte 1 109
byte 1 98
byte 1 98
byte 1 122
byte 1 122
byte 1 99
byte 1 99
byte 1 108
byte 1 108
byte 1 99
byte 1 99
byte 1 107
byte 1 107
byte 1 102
byte 1 102
byte 1 121
byte 1 121
byte 1 103
byte 1 103
byte 1 112
byte 1 0
align 1
LABELV $436
byte 1 122
byte 1 121
byte 1 120
byte 1 119
byte 1 118
byte 1 117
byte 1 116
byte 1 115
byte 1 114
byte 1 113
byte 1 109
byte 1 108
byte 1 107
byte 1 106
byte 1 105
byte 1 104
byte 1 103
byte 1 102
byte 1 101
byte 1 100
byte 1 99
byte 1 98
byte 1 97
byte 1 0
align 1
LABELV $435
byte 1 97
byte 1 98
byte 1 99
byte 1 100
byte 1 101
byte 1 102
byte 1 103
byte 1 104
byte 1 105
byte 1 106
byte 1 107
byte 1 108
byte 1 109
byte 1 113
byte 1 114
byte 1 115
byte 1 116
byte 1 117
byte 1 118
byte 1 119
byte 1 120
byte 1 121
byte 1 122
byte 1 0
align 1
LABELV $434
byte 1 109
byte 1 107
byte 1 105
byte 1 103
byte 1 101
byte 1 103
byte 1 105
byte 1 107
byte 1 0
align 1
LABELV $433
byte 1 97
byte 1 98
byte 1 99
byte 1 100
byte 1 101
byte 1 102
byte 1 103
byte 1 104
byte 1 105
byte 1 106
byte 1 107
byte 1 108
byte 1 109
byte 1 110
byte 1 111
byte 1 112
byte 1 113
byte 1 114
byte 1 114
byte 1 113
byte 1 112
byte 1 111
byte 1 110
byte 1 109
byte 1 108
byte 1 107
byte 1 106
byte 1 105
byte 1 104
byte 1 103
byte 1 102
byte 1 101
byte 1 100
byte 1 99
byte 1 98
byte 1 97
byte 1 0
align 1
LABELV $432
byte 1 109
byte 1 109
byte 1 97
byte 1 109
byte 1 97
byte 1 109
byte 1 109
byte 1 109
byte 1 109
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 109
byte 1 97
byte 1 109
byte 1 97
byte 1 97
byte 1 97
byte 1 109
byte 1 97
byte 1 109
byte 1 109
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $431
byte 1 97
byte 1 97
byte 1 97
byte 1 97
byte 1 97
byte 1 97
byte 1 97
byte 1 97
byte 1 122
byte 1 122
byte 1 122
byte 1 122
byte 1 122
byte 1 122
byte 1 122
byte 1 122
byte 1 0
align 1
LABELV $430
byte 1 109
byte 1 109
byte 1 109
byte 1 97
byte 1 97
byte 1 97
byte 1 109
byte 1 109
byte 1 109
byte 1 97
byte 1 97
byte 1 97
byte 1 109
byte 1 109
byte 1 109
byte 1 97
byte 1 98
byte 1 99
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 97
byte 1 97
byte 1 97
byte 1 109
byte 1 109
byte 1 109
byte 1 109
byte 1 97
byte 1 98
byte 1 99
byte 1 100
byte 1 101
byte 1 102
byte 1 109
byte 1 109
byte 1 109
byte 1 97
byte 1 97
byte 1 97
byte 1 97
byte 1 0
align 1
LABELV $429
byte 1 109
byte 1 109
byte 1 109
byte 1 97
byte 1 97
byte 1 97
byte 1 97
byte 1 98
byte 1 99
byte 1 100
byte 1 101
byte 1 102
byte 1 103
byte 1 109
byte 1 109
byte 1 109
byte 1 109
byte 1 97
byte 1 97
byte 1 97
byte 1 97
byte 1 109
byte 1 109
byte 1 109
byte 1 97
byte 1 97
byte 1 109
byte 1 109
byte 1 0
align 1
LABELV $428
byte 1 110
byte 1 109
byte 1 111
byte 1 110
byte 1 113
byte 1 110
byte 1 109
byte 1 111
byte 1 109
byte 1 110
byte 1 109
byte 1 111
byte 1 109
byte 1 111
byte 1 109
byte 1 110
byte 1 111
byte 1 0
align 1
LABELV $427
byte 1 106
byte 1 107
byte 1 108
byte 1 109
byte 1 110
byte 1 111
byte 1 112
byte 1 113
byte 1 114
byte 1 115
byte 1 116
byte 1 117
byte 1 118
byte 1 119
byte 1 120
byte 1 121
byte 1 122
byte 1 121
byte 1 120
byte 1 119
byte 1 118
byte 1 117
byte 1 116
byte 1 115
byte 1 114
byte 1 113
byte 1 112
byte 1 111
byte 1 110
byte 1 109
byte 1 108
byte 1 107
byte 1 106
byte 1 0
align 1
LABELV $426
byte 1 109
byte 1 97
byte 1 109
byte 1 97
byte 1 109
byte 1 97
byte 1 109
byte 1 97
byte 1 109
byte 1 97
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $425
byte 1 109
byte 1 109
byte 1 109
byte 1 109
byte 1 109
byte 1 97
byte 1 97
byte 1 97
byte 1 97
byte 1 97
byte 1 109
byte 1 109
byte 1 109
byte 1 109
byte 1 109
byte 1 97
byte 1 97
byte 1 97
byte 1 97
byte 1 97
byte 1 97
byte 1 98
byte 1 99
byte 1 100
byte 1 101
byte 1 102
byte 1 103
byte 1 97
byte 1 98
byte 1 99
byte 1 100
byte 1 101
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $424
byte 1 97
byte 1 98
byte 1 99
byte 1 100
byte 1 101
byte 1 102
byte 1 103
byte 1 104
byte 1 105
byte 1 106
byte 1 107
byte 1 108
byte 1 109
byte 1 110
byte 1 111
byte 1 112
byte 1 113
byte 1 114
byte 1 115
byte 1 116
byte 1 117
byte 1 118
byte 1 119
byte 1 120
byte 1 121
byte 1 122
byte 1 121
byte 1 120
byte 1 119
byte 1 118
byte 1 117
byte 1 116
byte 1 115
byte 1 114
byte 1 113
byte 1 112
byte 1 111
byte 1 110
byte 1 109
byte 1 108
byte 1 107
byte 1 106
byte 1 105
byte 1 104
byte 1 103
byte 1 102
byte 1 101
byte 1 100
byte 1 99
byte 1 98
byte 1 0
align 1
LABELV $423
byte 1 109
byte 1 109
byte 1 110
byte 1 109
byte 1 109
byte 1 111
byte 1 109
byte 1 109
byte 1 111
byte 1 109
byte 1 109
byte 1 110
byte 1 111
byte 1 110
byte 1 109
byte 1 109
byte 1 111
byte 1 110
byte 1 113
byte 1 110
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $422
byte 1 122
byte 1 0
align 1
LABELV $415
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 95
byte 1 86
byte 1 65
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $411
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 0
align 1
LABELV $404
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 69
byte 1 79
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $398
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 123
byte 1 0
align 1
LABELV $387
byte 1 71
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 84
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $373
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $368
byte 1 110
byte 1 111
byte 1 116
byte 1 116
byte 1 97
byte 1 0
align 1
LABELV $365
byte 1 110
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 0
align 1
LABELV $362
byte 1 110
byte 1 111
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $356
byte 1 110
byte 1 111
byte 1 116
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $340
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $337
byte 1 48
byte 1 0
align 1
LABELV $336
byte 1 110
byte 1 111
byte 1 108
byte 1 111
byte 1 103
byte 1 105
byte 1 99
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $321
byte 1 99
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $320
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $319
byte 1 115
byte 1 97
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $318
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $317
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $316
byte 1 106
byte 1 101
byte 1 100
byte 1 105
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $315
byte 1 104
byte 1 111
byte 1 108
byte 1 111
byte 1 99
byte 1 114
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $314
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $281
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $267
byte 1 71
byte 1 95
byte 1 67
byte 1 97
byte 1 108
byte 1 108
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $249
byte 1 101
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 100
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $248
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $247
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
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $246
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
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $245
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $244
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $243
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $242
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
byte 1 0
align 1
LABELV $241
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 112
byte 1 101
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 0
align 1
LABELV $240
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 115
byte 1 104
byte 1 97
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $239
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 95
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $238
byte 1 102
byte 1 120
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $237
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
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
byte 1 0
align 1
LABELV $236
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 95
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
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
byte 1 0
align 1
LABELV $235
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 115
byte 1 104
byte 1 105
byte 1 101
byte 1 108
byte 1 100
byte 1 95
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
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
byte 1 0
align 1
LABELV $234
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
byte 1 0
align 1
LABELV $233
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 0
align 1
LABELV $232
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 111
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
byte 1 0
align 1
LABELV $231
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 71
byte 1 50
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $230
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $229
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
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
byte 1 95
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $228
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $227
byte 1 84
byte 1 119
byte 1 105
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $226
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
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
byte 1 0
align 1
LABELV $225
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $224
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $223
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $222
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
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $221
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $220
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
LABELV $219
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $218
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $217
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $216
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
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
byte 1 0
align 1
LABELV $215
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $214
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $213
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $212
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
byte 1 0
align 1
LABELV $211
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $210
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $209
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $208
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $207
byte 1 114
byte 1 97
byte 1 108
byte 1 108
byte 1 121
byte 1 95
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
byte 1 0
align 1
LABELV $206
byte 1 114
byte 1 97
byte 1 108
byte 1 108
byte 1 121
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 102
byte 1 105
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $205
byte 1 100
byte 1 102
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
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
byte 1 0
align 1
LABELV $204
byte 1 100
byte 1 102
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 102
byte 1 105
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $203
byte 1 100
byte 1 102
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $202
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 104
byte 1 117
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $201
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
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
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 95
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 99
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $199
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $198
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
byte 1 0
align 1
LABELV $197
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 97
byte 1 108
byte 1 119
byte 1 97
byte 1 121
byte 1 115
byte 1 0
align 1
LABELV $196
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 117
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $195
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 103
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $194
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 114
byte 1 101
byte 1 97
byte 1 107
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $193
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
byte 1 0
align 1
LABELV $192
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $191
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $190
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 112
byte 1 101
byte 1 110
byte 1 100
byte 1 117
byte 1 108
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $189
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 98
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $188
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $187
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $186
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $185
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $184
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $183
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 115
byte 1 97
byte 1 103
byte 1 97
byte 1 95
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $182
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $181
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $180
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $179
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 106
byte 1 101
byte 1 100
byte 1 105
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $178
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
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $177
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
byte 1 114
byte 1 101
byte 1 98
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $176
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
byte 1 105
byte 1 109
byte 1 112
byte 1 101
byte 1 114
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $175
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
LABELV $174
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
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $171
byte 1 108
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $170
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $169
byte 1 116
byte 1 116
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $168
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 114
byte 1 105
byte 1 100
byte 1 101
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $167
byte 1 110
byte 1 111
byte 1 116
byte 1 99
byte 1 112
byte 1 109
byte 1 0
align 1
LABELV $166
byte 1 110
byte 1 111
byte 1 116
byte 1 118
byte 1 113
byte 1 51
byte 1 0
align 1
LABELV $165
byte 1 99
byte 1 111
byte 1 117
byte 1 114
byte 1 115
byte 1 101
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $164
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 78
byte 1 101
byte 1 119
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $163
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $162
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $161
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $160
byte 1 100
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $159
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $158
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $157
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $156
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $155
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $154
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $153
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $152
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $151
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $150
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $149
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $148
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 50
byte 1 0
align 1
LABELV $147
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $146
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $145
byte 1 114
byte 1 111
byte 1 102
byte 1 102
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $144
byte 1 114
byte 1 111
byte 1 102
byte 1 102
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $143
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 110
byte 1 111
byte 1 100
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $142
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $139
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 0
