data
export jk2version
align 4
LABELV jk2version
byte 4 0
export jk2gameplay
align 4
LABELV jk2gameplay
byte 4 0
export jk2startversion
align 4
LABELV jk2startversion
byte 4 0
export MV_BuildAnimationMappingTable
code
proc MV_BuildAnimationMappingTable 0 0
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\bg_multiversion.c"
line 85
;1://bg_multiversion.c - This file contains multiversion variables and functions that are shared accross all modules...
;2:#include "../game/bg_multiversion.h"
;3:
;4:#ifdef JK2_GAME
;5:#include "../game/g_local.h"
;6:#elif JK2_CGAME
;7:#include "../cgame/cg_local.h"
;8:#elif JK2_UI
;9:#include "../ui/ui_local.h"
;10:#else // JK2MV_MENU
;11:#include "../ui/ui_local.h"
;12:#endif
;13:
;14:mvversion_t	jk2version      = VERSION_UNDEF;  // Current engine gameversion
;15:mvversion_t	jk2gameplay     = VERSION_UNDEF;  // Current gameplay to apply
;16:mvversion_t	jk2startversion = VERSION_UNDEF;  // Gameversion the engine had when the module was loaded
;17:
;18:#if !defined(JK2_UI) && !defined(JK2MV_MENU) // Not defined for UI and MENU, but still in bg_* for game and cgame
;19:/* Additional functions */
;20:extern stringID_table_t animTable_1_02[MAX_ANIMATIONS_1_02+1];
;21:extern stringID_table_t animTable[MAX_ANIMATIONS+1];
;22://int animMappingTable_1_04_to_1_02[MAX_TOTALANIMATIONS];
;23://int animMappingTable_1_02_to_1_04[MAX_TOTALANIMATIONS_1_02];
;24:
;25:#ifdef MV_GENERATE_ANIMATION_MAPPING_TABLE
;26:void MV_DumpAnimationMappingTable( void )
;27:{
;28:	fileHandle_t dumpFile;
;29:	char		 line[512];
;30:	int			 i, j;
;31:
;32:	trap_FS_FOpenFile("animMappingTableDump.txt", &dumpFile, FS_WRITE);
;33:	if ( !dumpFile )
;34:	{
;35:		trap_FS_FCloseFile(dumpFile);
;36:		return;
;37:	}
;38:
;39:	Q_strncpyz( line, "animNumber_1_02_t animMappingTable_1_04_to_1_02[MAX_TOTALANIMATIONS] = \n"
;40:					"{\n", sizeof(line) );
;41:	trap_FS_Write( line, strlen(line), dumpFile );
;42:
;43:	for ( i = 0; i < MAX_TOTALANIMATIONS; i++ )
;44:	{
;45:		for ( j = 0; j < sizeof(animTable_1_02); j++ )
;46:		{
;47:			if ( animTable_1_02[j].id == animMappingTable_1_04_to_1_02[i] )
;48:			{
;49:				Q_strncpyz( line, va("	%s, // %s\n", animTable_1_02[j].name, animTable[i].name), sizeof(line) ); // It's only an assumption that animTable[i].name is the right 1.04 name. :/
;50:				trap_FS_Write( line, strlen(line), dumpFile );
;51:				break;
;52:			}
;53:		}
;54:	}
;55:
;56:	Q_strncpyz( line, "};\n\n", sizeof(line) );
;57:	trap_FS_Write( line, strlen(line), dumpFile );
;58:
;59:	Q_strncpyz( line, "animNumber_t animMappingTable_1_02_to_1_04[MAX_TOTALANIMATIONS_1_02] = \n"
;60:					"{\n", sizeof(line) );
;61:	trap_FS_Write( line, strlen(line), dumpFile );
;62:
;63:	for ( i = 0; i < MAX_TOTALANIMATIONS_1_02; i++ )
;64:	{
;65:		for ( j = 0; j < sizeof(animTable); j++ )
;66:		{
;67:			if ( animTable[j].id == animMappingTable_1_02_to_1_04[i] )
;68:			{
;69:				Q_strncpyz( line, va("	%s, // %s\n", animTable[j].name, animTable_1_02[i].name), sizeof(line) ); // It's only an assumption that animTable_1_02[i].name is the right 1.02 name. :/
;70:				trap_FS_Write( line, strlen(line), dumpFile );
;71:				break;
;72:			}
;73:		}
;74:	}
;75:
;76:	Q_strncpyz( line, "};\n\n", sizeof(line) );
;77:	trap_FS_Write( line, strlen(line), dumpFile );
;78:
;79:	trap_FS_FCloseFile( dumpFile );
;80:	return;
;81:}
;82:#endif // #ifdef MV_GENERATE_ANIMATION_MAPPING_TABLE
;83:
;84:void MV_BuildAnimationMappingTable( void )
;85:{
line 138
;86:#ifdef MV_GENERATE_ANIMATION_MAPPING_TABLE
;87:	qboolean found = qfalse;
;88:	int i, j;
;89:
;90:	// 1.04 to 1.02
;91:	Com_Printf("Building animationMappingTable 1.04 to 1.02!\n");
;92:	for ( i = 0; i < MAX_TOTALANIMATIONS; i++ )
;93:	{
;94:		found = qfalse;
;95:		for ( j = 0; j < MAX_TOTALANIMATIONS_1_02; j++ )
;96:		{
;97:			if ( !Q_stricmp(va("%s_1_02", animTable[i].name), animTable_1_02[j].name) )
;98:			{
;99:				animMappingTable_1_04_to_1_02[animTable[i].id] = animTable_1_02[j].id;
;100:				found = qtrue;
;101:			}
;102:		}
;103:		if ( !found ) animMappingTable_1_04_to_1_02[i] = 0;
;104:	}
;105:
;106:#ifdef _DEBUG
;107:	for ( i = 0; i < MAX_TOTALANIMATIONS; i++ )
;108:	{
;109:		Com_Printf("%s to %s\n", animTable[i].name, animTable_1_02[animMappingTable_1_04_to_1_02[i]].name);
;110:	}
;111:#endif
;112:	
;113:	// 1.02 to 1.04
;114:	Com_Printf("Building animationMappingTable 1.02 to 1.04!\n");
;115:	for ( i = 0; i < MAX_TOTALANIMATIONS_1_02; i++ )
;116:	{
;117:		found = qfalse;
;118:		for ( j = 0; j < MAX_TOTALANIMATIONS; j++ )
;119:		{
;120:			if ( !Q_stricmp(animTable_1_02[i].name, va("%s_1_02", animTable[j].name)) )
;121:			{
;122:				animMappingTable_1_02_to_1_04[animTable_1_02[i].id] = animTable[j].id;
;123:				found = qtrue;
;124:			}
;125:		}
;126:		if ( !found ) animMappingTable_1_02_to_1_04[i] = 0;
;127:	}
;128:
;129:#ifdef _DEBUG
;130:	for ( i = 0; i < MAX_TOTALANIMATIONS_1_02; i++ )
;131:	{
;132:		Com_Printf("%s to %s\n", animTable_1_02[i].name, animTable[animMappingTable_1_02_to_1_04[i]].name);
;133:	}
;134:#endif
;135:
;136:	Com_Printf("AnimTable built!\n");
;137:#endif // #ifdef MV_GENERATE_ANIMATION_MAPPING_TABLE
;138:}
LABELV $120
endproc MV_BuildAnimationMappingTable 0 0
export MV_SetGamePlay
proc MV_SetGamePlay 52 4
line 144
;139:
;140:extern int forcePowerNeeded_1_02[NUM_FORCE_POWER_LEVELS][NUM_FORCE_POWERS];
;141:extern int forcePowerNeeded_1_04[NUM_FORCE_POWER_LEVELS][NUM_FORCE_POWERS];
;142:extern int (*forcePowerNeeded)[NUM_FORCE_POWERS];
;143:void MV_SetGamePlay( mvversion_t version )
;144:{ /* Set weaponData (ammo costs, ...), forcePowerNeeded (force costs) and the gameplay value according to the new version. */
line 152
;145:#ifdef JK2_GAME
;146:	gentity_t *saberent;
;147:	gentity_t *ent;
;148:	int		   i;
;149:#endif // #ifdef JK2_GAME
;150:
;151:	/* Find the settings for the version we want to switch to */
;152:	switch ( version )
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $125
ADDRLP4 12
INDIRI4
CNSTI4 3
EQI4 $126
ADDRLP4 12
INDIRI4
CNSTI4 4
EQI4 $127
ADDRGP4 $122
JUMPV
line 153
;153:	{
LABELV $125
line 155
;154:		case VERSION_1_02:
;155:			weaponData = weaponData_1_02;
ADDRGP4 weaponData
ADDRGP4 weaponData_1_02
ASGNP4
line 156
;156:			forcePowerNeeded = forcePowerNeeded_1_02;
ADDRGP4 forcePowerNeeded
ADDRGP4 forcePowerNeeded_1_02
ASGNP4
line 157
;157:			jk2gameplay = VERSION_1_02;
ADDRGP4 jk2gameplay
CNSTI4 2
ASGNI4
line 158
;158:			break;
ADDRGP4 $123
JUMPV
LABELV $126
line 160
;159:		case VERSION_1_03:
;160:			weaponData = weaponData_1_03;
ADDRGP4 weaponData
ADDRGP4 weaponData_1_03
ASGNP4
line 161
;161:			forcePowerNeeded = forcePowerNeeded_1_04;
ADDRGP4 forcePowerNeeded
ADDRGP4 forcePowerNeeded_1_04
ASGNP4
line 162
;162:			jk2gameplay = VERSION_1_03;
ADDRGP4 jk2gameplay
CNSTI4 3
ASGNI4
line 163
;163:			break;
ADDRGP4 $123
JUMPV
LABELV $122
LABELV $127
line 166
;164:		default:
;165:		case VERSION_1_04:
;166:			weaponData = weaponData_1_04;
ADDRGP4 weaponData
ADDRGP4 weaponData_1_04
ASGNP4
line 167
;167:			forcePowerNeeded = forcePowerNeeded_1_04;
ADDRGP4 forcePowerNeeded
ADDRGP4 forcePowerNeeded_1_04
ASGNP4
line 168
;168:			jk2gameplay = VERSION_1_04;
ADDRGP4 jk2gameplay
CNSTI4 4
ASGNI4
line 169
;169:			break;
LABELV $123
line 174
;170:	}
;171:	
;172:#ifdef JK2_GAME
;173:	/* Client specific changes */
;174:	for ( i = 0; i < MAX_CLIENTS; i++ )
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $128
line 175
;175:	{
line 176
;176:		ent = &g_entities[i];
ADDRLP4 4
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 178
;177:
;178:		if ( ent && ent->client && ent->inuse )
ADDRLP4 24
CNSTU4 0
ASGNU4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $132
ADDRLP4 4
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 24
INDIRU4
EQU4 $132
ADDRLP4 4
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $132
line 179
;179:		{
line 181
;180:			/* Adjust the size of the saberbox (8.0f in 1.02, 16.0f in 1.03 and 1.04). The define for SABER_BOX_SIZE already contains the check for the current version, so we can just use the same code for all 3 versions here. */
;181:			saberent = &g_entities[ent->client->ps.saberEntityNum];
ADDRLP4 8
CNSTI4 2352
ADDRLP4 4
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
line 182
;182:			if (saberent)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $134
line 183
;183:			{
line 184
;184:				VectorSet( saberent->r.mins, -SABER_BOX_SIZE, -SABER_BOX_SIZE, -SABER_BOX_SIZE );
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $139
ADDRLP4 28
CNSTF4 1090519040
ASGNF4
ADDRGP4 $140
JUMPV
LABELV $139
ADDRLP4 28
CNSTF4 1098907648
ASGNF4
LABELV $140
ADDRLP4 8
INDIRP4
CNSTI4 316
ADDP4
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $141
ADDRLP4 32
CNSTF4 1090519040
ASGNF4
ADDRGP4 $142
JUMPV
LABELV $141
ADDRLP4 32
CNSTF4 1098907648
ASGNF4
LABELV $142
ADDRLP4 8
INDIRP4
CNSTI4 320
ADDP4
ADDRLP4 32
INDIRF4
NEGF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $143
ADDRLP4 36
CNSTF4 1090519040
ASGNF4
ADDRGP4 $144
JUMPV
LABELV $143
ADDRLP4 36
CNSTF4 1098907648
ASGNF4
LABELV $144
ADDRLP4 8
INDIRP4
CNSTI4 324
ADDP4
ADDRLP4 36
INDIRF4
NEGF4
ASGNF4
line 185
;185:				VectorSet( saberent->r.maxs, SABER_BOX_SIZE, SABER_BOX_SIZE, SABER_BOX_SIZE );
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $148
ADDRLP4 40
CNSTF4 1090519040
ASGNF4
ADDRGP4 $149
JUMPV
LABELV $148
ADDRLP4 40
CNSTF4 1098907648
ASGNF4
LABELV $149
ADDRLP4 8
INDIRP4
CNSTI4 328
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $150
ADDRLP4 44
CNSTF4 1090519040
ASGNF4
ADDRGP4 $151
JUMPV
LABELV $150
ADDRLP4 44
CNSTF4 1098907648
ASGNF4
LABELV $151
ADDRLP4 8
INDIRP4
CNSTI4 332
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRGP4 jk2gameplay
INDIRI4
CNSTI4 2
NEI4 $152
ADDRLP4 48
CNSTF4 1090519040
ASGNF4
ADDRGP4 $153
JUMPV
LABELV $152
ADDRLP4 48
CNSTF4 1098907648
ASGNF4
LABELV $153
ADDRLP4 8
INDIRP4
CNSTI4 336
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
line 186
;186:			}
LABELV $134
line 187
;187:		}
LABELV $132
line 188
;188:	}
LABELV $129
line 174
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $128
line 190
;189:	
;190:	for ( i = 0; i < MAX_CLIENTS; i++ ) if ( g_entities[i].client && g_entities[i].inuse ) ClientUserinfoChanged(i); // Update every client's userinfo to reflect the gameplay change (assigning the value to every player opens the possibility to intoduce per-player gameplay in the future)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $154
ADDRLP4 20
CNSTI4 2352
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+408
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $158
ADDRLP4 20
INDIRI4
ADDRGP4 g_entities+412
ADDP4
INDIRI4
CNSTI4 0
EQI4 $158
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLV
pop
LABELV $158
LABELV $155
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $154
line 192
;191:#endif // #ifdef JK2_GAME
;192:}
LABELV $121
endproc MV_SetGamePlay 52 4
import forcePowerNeeded
import forcePowerNeeded_1_04
import forcePowerNeeded_1_02
import animTable
import animTable_1_02
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
import animMappingTable_1_02_to_1_04
import animMappingTable_1_04_to_1_02
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
