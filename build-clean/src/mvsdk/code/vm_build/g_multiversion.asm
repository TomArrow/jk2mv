export trap_G2API_GetBoltMatrix_NoRecNoRot_DoesNotExistIn_1_02
code
proc trap_G2API_GetBoltMatrix_NoRecNoRot_DoesNotExistIn_1_02 0 4
ADDRFP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRFP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 24
ADDRFP4 24
INDIRI4
ASGNI4
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\game\g_multiversion.c"
line 66
;1://g_multiversion.c - This file contains functions to decide which of the modified syscalls we have to call for which version, as well as other version-specific things...
;2:
;3:/* Includes */
;4:#include "g_local.h"
;5:#include "../game/g_multiversion.h"
;6:#include "../game/bg_multiversion.h"
;7:
;8:/*
;9:TODO:
;10:	- 1.02 tournament-behaviour (is it actually different?)
;11:*/
;12:
;13:/* Variables */
;14:playerState_1_02_t g_ps[MAX_CLIENTS];
;15:
;16:/* 1.02 functions */
;17://qboolean	trap_G2API_GetBoltMatrix_NoRecNoRot_1_02	(void *ghoul2, const int modelIndex, const int boltIndex, mdxaBone_t *matrix, const vec3_t angles, const vec3_t position, const int frameNum, qhandle_t *modelList, vec3_t scale);
;18:int			trap_G2API_InitGhoul2Model_1_02				(void **ghoul2Ptr, const char *fileName, int modelIndex, qhandle_t customSkin, qhandle_t customShader, int modelFlags, int lodBias);
;19:int			trap_G2API_AddBolt_1_02						(void *ghoul2, int modelIndex, const char *boneName);
;20:void		trap_G2API_SetBoltInfo_1_02					(void *ghoul2, int modelIndex, int boltInfo);
;21:int			trap_G2API_CopyGhoul2Instance_1_02			(void *g2From, void *g2To, int modelIndex);
;22:void		trap_G2API_CopySpecificGhoul2Model_1_02		(void *g2From, int modelFrom, void *g2To, int modelTo);
;23:void		trap_G2API_DuplicateGhoul2Instance_1_02		(void *g2From, void **g2To);
;24:qboolean	trap_G2API_HasGhoul2ModelOnIndex_1_02		(void *ghlInfo, int modelIndex);
;25:qboolean	trap_G2API_RemoveGhoul2Model_1_02			(void *ghlInfo, int modelIndex);
;26:void		trap_G2API_CleanGhoul2Models_1_02			(void **ghoul2Ptr);
;27://void		trap_G2API_CollisionDetect_1_02				(CollisionRecord_t *collRecMap, void* ghoul2, const vec3_t angles, const vec3_t position, int frameNumber, int entNum, vec3_t rayStart, vec3_t rayEnd, vec3_t scale, int traceFlags, int useLod, float fRadius);
;28:qboolean	trap_G2API_SetBoneAngles_1_02				(void *ghoul2, int modelIndex, const char *boneName, const vec3_t angles, const int flags, const int up, const int right, const int forward, qhandle_t *modelList, int blendTime , int currentTime);
;29:void		trap_G2API_GetGLAName_1_02					(void *ghoul2, int modelIndex, char *fillBuf);
;30:qboolean	trap_G2API_SetBoneAnim_1_02					(void *ghoul2, const int modelIndex, const char *boneName, const int startFrame, const int endFrame, const int flags, const float animSpeed, const int currentTime, const float setFrame , const int blendTime);
;31:
;32:/* 1.03 & 1.04 functions */
;33:qboolean	trap_G2API_GetBoltMatrix_NoRecNoRot_1_04	(void *ghoul2, const int modelIndex, const int boltIndex, mdxaBone_t *matrix, const vec3_t angles, const vec3_t position, const int frameNum, qhandle_t *modelList, vec3_t scale);
;34:int			trap_G2API_InitGhoul2Model_1_04				(void **ghoul2Ptr, const char *fileName, int modelIndex, qhandle_t customSkin, qhandle_t customShader, int modelFlags, int lodBias);
;35:int			trap_G2API_AddBolt_1_04						(void *ghoul2, int modelIndex, const char *boneName);
;36:void		trap_G2API_SetBoltInfo_1_04					(void *ghoul2, int modelIndex, int boltInfo);
;37:int			trap_G2API_CopyGhoul2Instance_1_04			(void *g2From, void *g2To, int modelIndex);
;38:void		trap_G2API_CopySpecificGhoul2Model_1_04		(void *g2From, int modelFrom, void *g2To, int modelTo);
;39:void		trap_G2API_DuplicateGhoul2Instance_1_04		(void *g2From, void **g2To);
;40:qboolean	trap_G2API_HasGhoul2ModelOnIndex_1_04		(void *ghlInfo, int modelIndex);
;41:qboolean	trap_G2API_RemoveGhoul2Model_1_04			(void *ghlInfo, int modelIndex);
;42:void		trap_G2API_CleanGhoul2Models_1_04			(void **ghoul2Ptr);
;43:void		trap_G2API_CollisionDetect_1_04				(CollisionRecord_t *collRecMap, void* ghoul2, const vec3_t angles, const vec3_t position, int frameNumber, int entNum, vec3_t rayStart, vec3_t rayEnd, vec3_t scale, int traceFlags, int useLod, float fRadius);
;44:qboolean	trap_G2API_SetBoneAngles_1_04				(void *ghoul2, int modelIndex, const char *boneName, const vec3_t angles, const int flags, const int up, const int right, const int forward, qhandle_t *modelList, int blendTime , int currentTime);
;45:void		trap_G2API_GetGLAName_1_04					(void *ghoul2, int modelIndex, char *fillBuf);
;46:qboolean	trap_G2API_SetBoneAnim_1_04					(void *ghoul2, const int modelIndex, const char *boneName, const int startFrame, const int endFrame, const int flags, const float animSpeed, const int currentTime, const float setFrame , const int blendTime);
;47:
;48:/* Function Pointers */
;49:qboolean	(*trap_G2API_GetBoltMatrix_NoRecNoRot)		(void *ghoul2, const int modelIndex, const int boltIndex, mdxaBone_t *matrix, const vec3_t angles, const vec3_t position, const int frameNum, qhandle_t *modelList, vec3_t scale);
;50:int			(*trap_G2API_InitGhoul2Model)				(void **ghoul2Ptr, const char *fileName, int modelIndex, qhandle_t customSkin, qhandle_t customShader, int modelFlags, int lodBias);
;51:int			(*trap_G2API_AddBolt)						(void *ghoul2, int modelIndex, const char *boneName);
;52:void		(*trap_G2API_SetBoltInfo)					(void *ghoul2, int modelIndex, int boltInfo);
;53:int			(*trap_G2API_CopyGhoul2Instance)			(void *g2From, void *g2To, int modelIndex);
;54:void		(*trap_G2API_CopySpecificGhoul2Model)		(void *g2From, int modelFrom, void *g2To, int modelTo);
;55:void		(*trap_G2API_DuplicateGhoul2Instance)		(void *g2From, void **g2To);
;56:qboolean	(*trap_G2API_HasGhoul2ModelOnIndex)			(void *ghlInfo, int modelIndex);
;57:qboolean	(*trap_G2API_RemoveGhoul2Model)				(void *ghlInfo, int modelIndex);
;58:void		(*trap_G2API_CleanGhoul2Models)				(void **ghoul2Ptr);
;59:void		(*trap_G2API_CollisionDetect)				(CollisionRecord_t *collRecMap, void* ghoul2, const vec3_t angles, const vec3_t position, int frameNumber, int entNum, vec3_t rayStart, vec3_t rayEnd, vec3_t scale, int traceFlags, int useLod, float fRadius);
;60:qboolean	(*trap_G2API_SetBoneAngles)					(void *ghoul2, int modelIndex, const char *boneName, const vec3_t angles, const int flags, const int up, const int right, const int forward, qhandle_t *modelList, int blendTime , int currentTime);
;61:void		(*trap_G2API_GetGLAName)					(void *ghoul2, int modelIndex, char *fillBuf);
;62:qboolean	(*trap_G2API_SetBoneAnim)					(void *ghoul2, const int modelIndex, const char *boneName, const int startFrame, const int endFrame, const int flags, const float animSpeed, const int currentTime, const float setFrame , const int blendTime);
;63:
;64:/* JK2MultiVersionFunctions: these functions decide which syscalls we have to call for which version... */
;65:qboolean trap_G2API_GetBoltMatrix_NoRecNoRot_DoesNotExistIn_1_02(void *ghoul2, const int modelIndex, const int boltIndex, mdxaBone_t *matrix, const vec3_t angles, const vec3_t position, const int frameNum, qhandle_t *modelList, vec3_t scale)
;66:{
line 67
;67:	G_Printf("MVSDK: trap_G2API_GetBoltMatrix_NoRecNoRot called in 1.02 mode\n");
ADDRGP4 $121
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 68
;68:	return qfalse;
CNSTI4 0
RETI4
LABELV $120
endproc trap_G2API_GetBoltMatrix_NoRecNoRot_DoesNotExistIn_1_02 0 4
export trap_G2API_CollisionDetect_DoesNotExistIn_1_02
proc trap_G2API_CollisionDetect_DoesNotExistIn_1_02 0 4
line 72
;69:}
;70:
;71:void trap_G2API_CollisionDetect_DoesNotExistIn_1_02(CollisionRecord_t *collRecMap, void* ghoul2, const vec3_t angles, const vec3_t position, int frameNumber, int entNum, vec3_t rayStart, vec3_t rayEnd, vec3_t scale, int traceFlags, int useLod, float fRadius)
;72:{
line 73
;73:	G_Printf("MVSDK: trap_G2API_CollisionDetect called in 1.02 mode");
ADDRGP4 $123
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 74
;74:}
LABELV $122
endproc trap_G2API_CollisionDetect_DoesNotExistIn_1_02 0 4
export MV_SetGameVersion
proc MV_SetGameVersion 8 4
line 77
;75:
;76:void MV_SetGameVersion( mvversion_t version, qboolean setGameplay )
;77:{
line 78
;78:	switch ( version )
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $128
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $129
ADDRLP4 0
INDIRI4
CNSTI4 4
EQI4 $129
ADDRGP4 $125
JUMPV
line 79
;79:	{
LABELV $128
line 81
;80:		case VERSION_1_02:
;81:			MV_BuildAnimationMappingTable(); // Only need this in 1.02 mode!
ADDRGP4 MV_BuildAnimationMappingTable
CALLV
pop
line 83
;82:
;83:			trap_G2API_GetBoltMatrix_NoRecNoRot		= trap_G2API_GetBoltMatrix_NoRecNoRot_DoesNotExistIn_1_02;
ADDRGP4 trap_G2API_GetBoltMatrix_NoRecNoRot
ADDRGP4 trap_G2API_GetBoltMatrix_NoRecNoRot_DoesNotExistIn_1_02
ASGNP4
line 84
;84:			trap_G2API_InitGhoul2Model				= trap_G2API_InitGhoul2Model_1_02;
ADDRGP4 trap_G2API_InitGhoul2Model
ADDRGP4 trap_G2API_InitGhoul2Model_1_02
ASGNP4
line 85
;85:			trap_G2API_AddBolt						= trap_G2API_AddBolt_1_02;
ADDRGP4 trap_G2API_AddBolt
ADDRGP4 trap_G2API_AddBolt_1_02
ASGNP4
line 86
;86:			trap_G2API_SetBoltInfo					= trap_G2API_SetBoltInfo_1_02;
ADDRGP4 trap_G2API_SetBoltInfo
ADDRGP4 trap_G2API_SetBoltInfo_1_02
ASGNP4
line 87
;87:			trap_G2API_CopyGhoul2Instance			= trap_G2API_CopyGhoul2Instance_1_02;
ADDRGP4 trap_G2API_CopyGhoul2Instance
ADDRGP4 trap_G2API_CopyGhoul2Instance_1_02
ASGNP4
line 88
;88:			trap_G2API_CopySpecificGhoul2Model		= trap_G2API_CopySpecificGhoul2Model_1_02;
ADDRGP4 trap_G2API_CopySpecificGhoul2Model
ADDRGP4 trap_G2API_CopySpecificGhoul2Model_1_02
ASGNP4
line 89
;89:			trap_G2API_DuplicateGhoul2Instance		= trap_G2API_DuplicateGhoul2Instance_1_02;
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
ADDRGP4 trap_G2API_DuplicateGhoul2Instance_1_02
ASGNP4
line 90
;90:			trap_G2API_HasGhoul2ModelOnIndex		= trap_G2API_HasGhoul2ModelOnIndex_1_02;
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex_1_02
ASGNP4
line 91
;91:			trap_G2API_RemoveGhoul2Model			= trap_G2API_RemoveGhoul2Model_1_02;
ADDRGP4 trap_G2API_RemoveGhoul2Model
ADDRGP4 trap_G2API_RemoveGhoul2Model_1_02
ASGNP4
line 92
;92:			trap_G2API_CleanGhoul2Models			= trap_G2API_CleanGhoul2Models_1_02;
ADDRGP4 trap_G2API_CleanGhoul2Models
ADDRGP4 trap_G2API_CleanGhoul2Models_1_02
ASGNP4
line 93
;93:			trap_G2API_CollisionDetect				= trap_G2API_CollisionDetect_DoesNotExistIn_1_02;
ADDRGP4 trap_G2API_CollisionDetect
ADDRGP4 trap_G2API_CollisionDetect_DoesNotExistIn_1_02
ASGNP4
line 94
;94:			trap_G2API_SetBoneAngles				= trap_G2API_SetBoneAngles_1_02;
ADDRGP4 trap_G2API_SetBoneAngles
ADDRGP4 trap_G2API_SetBoneAngles_1_02
ASGNP4
line 95
;95:			trap_G2API_GetGLAName					= trap_G2API_GetGLAName_1_02;
ADDRGP4 trap_G2API_GetGLAName
ADDRGP4 trap_G2API_GetGLAName_1_02
ASGNP4
line 96
;96:			trap_G2API_SetBoneAnim					= trap_G2API_SetBoneAnim_1_02;
ADDRGP4 trap_G2API_SetBoneAnim
ADDRGP4 trap_G2API_SetBoneAnim_1_02
ASGNP4
line 97
;97:			break;
ADDRGP4 $126
JUMPV
LABELV $129
LABELV $125
line 101
;98:		case VERSION_1_03:
;99:		case VERSION_1_04:
;100:		default:
;101:			trap_G2API_GetBoltMatrix_NoRecNoRot		= trap_G2API_GetBoltMatrix_NoRecNoRot_1_04;
ADDRGP4 trap_G2API_GetBoltMatrix_NoRecNoRot
ADDRGP4 trap_G2API_GetBoltMatrix_NoRecNoRot_1_04
ASGNP4
line 102
;102:			trap_G2API_InitGhoul2Model				= trap_G2API_InitGhoul2Model_1_04;
ADDRGP4 trap_G2API_InitGhoul2Model
ADDRGP4 trap_G2API_InitGhoul2Model_1_04
ASGNP4
line 103
;103:			trap_G2API_AddBolt						= trap_G2API_AddBolt_1_04;
ADDRGP4 trap_G2API_AddBolt
ADDRGP4 trap_G2API_AddBolt_1_04
ASGNP4
line 104
;104:			trap_G2API_SetBoltInfo					= trap_G2API_SetBoltInfo_1_04;
ADDRGP4 trap_G2API_SetBoltInfo
ADDRGP4 trap_G2API_SetBoltInfo_1_04
ASGNP4
line 105
;105:			trap_G2API_CopyGhoul2Instance			= trap_G2API_CopyGhoul2Instance_1_04;
ADDRGP4 trap_G2API_CopyGhoul2Instance
ADDRGP4 trap_G2API_CopyGhoul2Instance_1_04
ASGNP4
line 106
;106:			trap_G2API_CopySpecificGhoul2Model		= trap_G2API_CopySpecificGhoul2Model_1_04;
ADDRGP4 trap_G2API_CopySpecificGhoul2Model
ADDRGP4 trap_G2API_CopySpecificGhoul2Model_1_04
ASGNP4
line 107
;107:			trap_G2API_DuplicateGhoul2Instance		= trap_G2API_DuplicateGhoul2Instance_1_04;
ADDRGP4 trap_G2API_DuplicateGhoul2Instance
ADDRGP4 trap_G2API_DuplicateGhoul2Instance_1_04
ASGNP4
line 108
;108:			trap_G2API_HasGhoul2ModelOnIndex		= trap_G2API_HasGhoul2ModelOnIndex_1_04;
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex
ADDRGP4 trap_G2API_HasGhoul2ModelOnIndex_1_04
ASGNP4
line 109
;109:			trap_G2API_RemoveGhoul2Model			= trap_G2API_RemoveGhoul2Model_1_04;
ADDRGP4 trap_G2API_RemoveGhoul2Model
ADDRGP4 trap_G2API_RemoveGhoul2Model_1_04
ASGNP4
line 110
;110:			trap_G2API_CleanGhoul2Models			= trap_G2API_CleanGhoul2Models_1_04;
ADDRGP4 trap_G2API_CleanGhoul2Models
ADDRGP4 trap_G2API_CleanGhoul2Models_1_04
ASGNP4
line 111
;111:			trap_G2API_CollisionDetect				= trap_G2API_CollisionDetect_1_04;
ADDRGP4 trap_G2API_CollisionDetect
ADDRGP4 trap_G2API_CollisionDetect_1_04
ASGNP4
line 112
;112:			trap_G2API_SetBoneAngles				= trap_G2API_SetBoneAngles_1_04;
ADDRGP4 trap_G2API_SetBoneAngles
ADDRGP4 trap_G2API_SetBoneAngles_1_04
ASGNP4
line 113
;113:			trap_G2API_GetGLAName					= trap_G2API_GetGLAName_1_04;
ADDRGP4 trap_G2API_GetGLAName
ADDRGP4 trap_G2API_GetGLAName_1_04
ASGNP4
line 114
;114:			trap_G2API_SetBoneAnim					= trap_G2API_SetBoneAnim_1_04;
ADDRGP4 trap_G2API_SetBoneAnim
ADDRGP4 trap_G2API_SetBoneAnim_1_04
ASGNP4
line 115
;115:			break;
LABELV $126
line 118
;116:	}
;117:
;118:	if ( setGameplay ) MV_SetGamePlay( version ); // Default gameplay of that version...
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $130
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 MV_SetGamePlay
CALLV
pop
LABELV $130
line 119
;119:}
LABELV $124
endproc MV_SetGameVersion 8 4
lit
align 4
LABELV $136
byte 4 620
align 4
LABELV $137
byte 4 760
export MV_PlayerStateToEngine
code
proc MV_PlayerStateToEngine 1384 12
line 122
;120:
;121:
;122:void MV_PlayerStateToEngine(playerState_t* ps) {
line 123
;123:	if (jk2version == VERSION_1_02 || jk2startversion == VERSION_1_02)
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 jk2version
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $135
ADDRGP4 jk2startversion
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $132
LABELV $135
line 124
;124:	{ // Do the magic
line 130
;125:
;126:		static const size_t section3 = (size_t)((char*)&((playerState_1_02_t*)NULL)->saberIndex);
;127:		static const size_t section4 = (size_t)((char*)(&((playerState_1_02_t*)NULL)[1]) - (char*)&((playerState_1_02_t*)NULL)->saberIndex);
;128:
;129:
;130:		if (jk2startversion == VERSION_1_02)
ADDRGP4 jk2startversion
INDIRI4
CNSTI4 2
NEI4 $138
line 131
;131:		{
line 134
;132:			/* Convert the animations */
;133:			/* NOTE: When converting from 1.02 to 1.04 we have to convert the playerState struct BEFORE the animations. When converting from 1.04 to 1.02 we have to convert the playerState struct AFTER the animations. */
;134:			ps->legsAnim = MV_MapAnimation102(ps->legsAnim);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_04_to_1_02
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 135
;135:			ps->legsAnimExecute = MV_MapAnimation102(ps->legsAnimExecute);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_04_to_1_02
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 136
;136:			ps->torsoAnim = MV_MapAnimation102(ps->torsoAnim);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_04_to_1_02
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 137
;137:			ps->torsoAnimExecute = MV_MapAnimation102(ps->torsoAnimExecute);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_04_to_1_02
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 140
;138:
;139:			/* Only convert forceDodgeAnim if it really is an animation (forceHandExtend being either HANDEXTEND_TAUNT or HANDEXTEND_DODGE) */
;140:			if (ps->forceHandExtend == HANDEXTEND_TAUNT || ps->forceHandExtend == HANDEXTEND_DODGE)
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 10
EQI4 $142
ADDRLP4 36
INDIRI4
CNSTI4 7
NEI4 $140
LABELV $142
line 141
;141:			{
line 142
;142:				ps->forceDodgeAnim = MV_MapAnimation102(ps->forceDodgeAnim);
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 1260
ADDP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_04_to_1_02
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 143
;143:			}
LABELV $140
line 146
;144:
;145:			/* The following two seem to be unused, but maybe custom cgames make use of them (well, fullAnimExecute seems to not even be set at least once - could probably just leave that one out) */
;146:			ps->fullAnimExecute = MV_MapAnimation104(ps->fullAnimExecute);
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 147
;147:			ps->saberAttackSequence = MV_MapAnimation104(ps->saberAttackSequence);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRP4
ADDRLP4 52
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 150
;148:
;149:			/* Convert the saberblocks */
;150:			if (ps->saberBlocked > BLOCKED_NONE) {
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
LEI4 $143
line 151
;151:				ps->saberBlocked--;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 152
;152:			}
LABELV $143
line 153
;153:		}
LABELV $138
line 155
;154:
;155:		if (jk2version == VERSION_1_02 && !mvStructConversionDisabled)
ADDRGP4 jk2version
INDIRI4
CNSTI4 2
NEI4 $134
ADDRGP4 mvStructConversionDisabled
INDIRI4
CNSTI4 0
NEI4 $134
line 156
;156:		{ // 1.04 to 1.02
line 158
;157:			playerState_1_02_t tmpPs;
;158:			memset(&tmpPs, 0, sizeof(playerState_1_02_t));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1380
ARGU4
ADDRGP4 memset
CALLP4
pop
line 160
;159:			/* Convert the 1.04 struct into a 1.02 struct so the engine can handle it */
;160:			memcpy(&tmpPs, ps, section3);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $136
INDIRU4
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 161
;161:			memcpy(&tmpPs.saberIndex, &ps->saberIndex, section4);
ADDRLP4 4+620
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
ARGP4
ADDRGP4 $137
INDIRU4
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 162
;162:			memset(ps, 0, sizeof(playerState_t));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1380
ARGU4
ADDRGP4 memset
CALLP4
pop
line 163
;163:			memcpy(ps, &tmpPs, sizeof(playerState_1_02_t));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTU4 1380
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 164
;164:		}
line 165
;165:	}
line 167
;166:	else
;167:	{ // No magic required for 1.03 and 1.04...
line 168
;168:		return;
LABELV $134
line 170
;169:	}
;170:}
LABELV $132
endproc MV_PlayerStateToEngine 1384 12
lit
align 4
LABELV $152
byte 4 608
align 4
LABELV $153
byte 4 760
export MV_PlayerStateFromEngine
code
proc MV_PlayerStateFromEngine 1384 12
line 172
;171:
;172:void MV_PlayerStateFromEngine(playerState_t* ps) {
line 174
;173:
;174:	if (jk2version == VERSION_1_02 || jk2startversion == VERSION_1_02)
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 jk2version
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $151
ADDRGP4 jk2startversion
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $148
LABELV $151
line 175
;175:	{ // Do the magic
line 182
;176:		static const size_t section1 = (size_t)((char*)&((playerState_t*)NULL)->forceRestricted);
;177:		static const size_t section2 = (size_t)((char*)(&((gclient_t*)NULL)->ps) + sizeof(playerState_t) - (char*)&((gclient_t*)NULL)->ps.saberIndex);
;178:
;179:		//sizeof(playerState_1_02_t); //1368
;180:		//sizeof(playerState_t); //1380
;181:
;182:		if (jk2version == VERSION_1_02 && !mvStructConversionDisabled)
ADDRGP4 jk2version
INDIRI4
CNSTI4 2
NEI4 $154
ADDRGP4 mvStructConversionDisabled
INDIRI4
CNSTI4 0
NEI4 $154
line 183
;183:		{
line 185
;184:			playerState_1_02_t tmpPs;
;185:			memset(&tmpPs, 0, sizeof(playerState_1_02_t));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1380
ARGU4
ADDRGP4 memset
CALLP4
pop
line 186
;186:			memcpy(&tmpPs, ps, sizeof(playerState_1_02_t));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTU4 1380
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 187
;187:			memset(ps,0,sizeof(playerState_t));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTU4 1380
ARGU4
ADDRGP4 memset
CALLP4
pop
line 189
;188:			/* Convert the 1.02 struct from the engine into a 1.04 struct we can handle internally */
;189:			memcpy(ps, &tmpPs, section1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 $152
INDIRU4
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 191
;190:			// memset( &(g_clients[i].ps.forceRestricted), 0, ((size_t)&(g_clients[i].ps.saberIndex) - (size_t)&(g_clients[i].ps.forceRestricted)) ); // We don't need this, as the engine only got the 1.02 struct. By not doing this we can these internally...
;191:			memcpy(&ps->saberIndex, &tmpPs.saberIndex, section2);
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
ARGP4
ADDRLP4 4+620
ARGP4
ADDRGP4 $153
INDIRU4
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 192
;192:		}
LABELV $154
line 194
;193:
;194:		if (jk2startversion == VERSION_1_02)
ADDRGP4 jk2startversion
INDIRI4
CNSTI4 2
NEI4 $150
line 195
;195:		{
line 198
;196:			/* Convert the animations */
;197:			/* NOTE: When converting from 1.02 to 1.04 we have to convert the playerState struct BEFORE the animations. When converting from 1.04 to 1.02 we have to convert the playerState struct AFTER the animations. */
;198:			ps->legsAnim = MV_MapAnimation104(ps->legsAnim);
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 199
;199:			ps->legsAnimExecute = MV_MapAnimation104(ps->legsAnimExecute);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 16
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 200
;200:			ps->torsoAnim = MV_MapAnimation104(ps->torsoAnim);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 201
;201:			ps->torsoAnimExecute = MV_MapAnimation104(ps->torsoAnimExecute);
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 204
;202:
;203:			/* Only convert forceDodgeAnim if it really is an animation (forceHandExtend being either HANDEXTEND_TAUNT or HANDEXTEND_DODGE) */
;204:			if (ps->forceHandExtend == HANDEXTEND_TAUNT || ps->forceHandExtend == HANDEXTEND_DODGE)
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 10
EQI4 $161
ADDRLP4 36
INDIRI4
CNSTI4 7
NEI4 $159
LABELV $161
line 205
;205:			{
line 206
;206:				ps->forceDodgeAnim = MV_MapAnimation104(ps->forceDodgeAnim);
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 1260
ADDP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 207
;207:			}
LABELV $159
line 210
;208:
;209:			/* The following two seem to be unused, but maybe custom cgames make use of them (well, fullAnimExecute seems to not even be set at least once - could probably just leave that one out) */
;210:			ps->fullAnimExecute = MV_MapAnimation104(ps->fullAnimExecute);
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
ASGNP4
ADDRLP4 44
ADDRLP4 40
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRP4
ADDRLP4 44
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 211
;211:			ps->saberAttackSequence = MV_MapAnimation104(ps->saberAttackSequence);
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 52
ADDRLP4 48
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 48
INDIRP4
ADDRLP4 52
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 52
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 214
;212:
;213:			/* Convert the saberblocks */
;214:			if (ps->saberBlocked > BLOCKED_NONE) {
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
LEI4 $150
line 215
;215:				ps->saberBlocked++;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 216
;216:			}
line 217
;217:		}
line 218
;218:	}
line 220
;219:	else
;220:	{ // No magic required for 1.03 and 1.04...
line 221
;221:		return;
LABELV $150
line 223
;222:	}
;223:}
LABELV $148
endproc MV_PlayerStateFromEngine 1384 12
lit
align 4
LABELV $168
byte 4 608
align 4
LABELV $169
byte 4 760
align 4
LABELV $170
byte 4 620
align 4
LABELV $171
byte 4 760
export MV_VersionMagic
code
proc MV_VersionMagic 76 12
line 226
;224:
;225:void MV_VersionMagic( qboolean revert )
;226:{
line 227
;227:	if ( jk2version == VERSION_1_02 || jk2startversion == VERSION_1_02 )
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 jk2version
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $167
ADDRGP4 jk2startversion
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $164
LABELV $167
line 228
;228:	{ // Do the magic
line 235
;229:		static const size_t section1 = (size_t)((char *)&((playerState_t*)NULL)->forceRestricted);
;230:		static const size_t section2 = (size_t)((char *)(&((gclient_t*)NULL)->ps) + sizeof(playerState_t) - (char *)&((gclient_t*)NULL)->ps.saberIndex);
;231:		static const size_t section3 = (size_t)((char *)&((playerState_1_02_t*)NULL)->saberIndex);
;232:		static const size_t section4 = (size_t)((char *)(&((playerState_1_02_t*)NULL)[1]) - (char *)&((playerState_1_02_t*)NULL)->saberIndex);
;233:
;234:		gentity_t *ent;
;235:		gentity_t *entEnd = &g_entities[level.num_entities];
ADDRLP4 16
CNSTI4 2352
ADDRGP4 level+12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 239
;236:		playerState_t *ps;
;237:		int i;
;238:
;239:		if ( !revert )
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $173
line 240
;240:		{ // 1.02 to 1.04
line 241
;241:			for ( i = 0; i < level.maxclients; i++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $178
JUMPV
LABELV $175
line 242
;242:			{
line 243
;243:				ent = &g_entities[i];
ADDRLP4 8
CNSTI4 2352
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 244
;244:				if ( !ent->inuse ) continue;
ADDRLP4 8
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $180
ADDRGP4 $176
JUMPV
LABELV $180
line 246
;245:
;246:				ps = &ent->client->ps;
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 248
;247:
;248:				if ( jk2version == VERSION_1_02 && !mvStructConversionDisabled )
ADDRGP4 jk2version
INDIRI4
CNSTI4 2
NEI4 $182
ADDRGP4 mvStructConversionDisabled
INDIRI4
CNSTI4 0
NEI4 $182
line 249
;249:				{
line 251
;250:					/* Convert the 1.02 struct from the engine into a 1.04 struct we can handle internally */
;251:					memcpy( ps, &g_ps[i], section1);
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 1380
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_ps
ADDP4
ARGP4
ADDRGP4 $168
INDIRU4
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 253
;252:					// memset( &(g_clients[i].ps.forceRestricted), 0, ((size_t)&(g_clients[i].ps.saberIndex) - (size_t)&(g_clients[i].ps.forceRestricted)) ); // We don't need this, as the engine only got the 1.02 struct. By not doing this we can these internally...
;253:					memcpy( &ps->saberIndex, &g_ps[i].saberIndex, section2);
ADDRLP4 4
INDIRP4
CNSTI4 620
ADDP4
ARGP4
CNSTI4 1380
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_ps+620
ADDP4
ARGP4
ADDRGP4 $169
INDIRU4
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 254
;254:				}
LABELV $182
line 256
;255:
;256:				if ( jk2startversion == VERSION_1_02 )
ADDRGP4 jk2startversion
INDIRI4
CNSTI4 2
NEI4 $185
line 257
;257:				{
line 260
;258:					/* Convert the animations */
;259:					/* NOTE: When converting from 1.02 to 1.04 we have to convert the playerState struct BEFORE the animations. When converting from 1.04 to 1.02 we have to convert the playerState struct AFTER the animations. */
;260:					ps->legsAnim = MV_MapAnimation104( ps->legsAnim );
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 261
;261:					ps->legsAnimExecute = MV_MapAnimation104( ps->legsAnimExecute );
ADDRLP4 28
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 262
;262:					ps->torsoAnim = MV_MapAnimation104( ps->torsoAnim );
ADDRLP4 36
ADDRLP4 4
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 263
;263:					ps->torsoAnimExecute = MV_MapAnimation104( ps->torsoAnimExecute );
ADDRLP4 44
ADDRLP4 4
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 266
;264:
;265:					/* Only convert forceDodgeAnim if it really is an animation (forceHandExtend being either HANDEXTEND_TAUNT or HANDEXTEND_DODGE) */
;266:					if ( ps->forceHandExtend == HANDEXTEND_TAUNT || ps->forceHandExtend == HANDEXTEND_DODGE )
ADDRLP4 52
ADDRLP4 4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 10
EQI4 $189
ADDRLP4 52
INDIRI4
CNSTI4 7
NEI4 $187
LABELV $189
line 267
;267:					{
line 268
;268:						ps->forceDodgeAnim = MV_MapAnimation104( ps->forceDodgeAnim );
ADDRLP4 56
ADDRLP4 4
INDIRP4
CNSTI4 1260
ADDP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRP4
ADDRLP4 60
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 269
;269:					}
LABELV $187
line 272
;270:
;271:					/* The following two seem to be unused, but maybe custom cgames make use of them (well, fullAnimExecute seems to not even be set at least once - could probably just leave that one out) */
;272:					ps->fullAnimExecute = MV_MapAnimation104( ps->fullAnimExecute );
ADDRLP4 56
ADDRLP4 4
INDIRP4
CNSTI4 736
ADDP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRP4
ADDRLP4 60
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 273
;273:					ps->saberAttackSequence = MV_MapAnimation104( ps->saberAttackSequence );
ADDRLP4 64
ADDRLP4 4
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 68
ADDRLP4 64
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 276
;274:
;275:					/* Convert the saberblocks */
;276:					if (ps->saberBlocked > BLOCKED_NONE) {
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
LEI4 $190
line 277
;277:						ps->saberBlocked++;
ADDRLP4 72
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 278
;278:					}
LABELV $190
line 279
;279:				}
LABELV $185
line 280
;280:			}
LABELV $176
line 241
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $178
ADDRLP4 12
INDIRI4
ADDRGP4 level+28
INDIRI4
LTI4 $175
line 282
;281:
;282:			if ( jk2startversion != VERSION_1_02 ) return;
ADDRGP4 jk2startversion
INDIRI4
CNSTI4 2
EQI4 $192
ADDRGP4 $164
JUMPV
LABELV $192
line 284
;283:
;284:			for ( ent = g_entities; ent < entEnd; ent++ )
ADDRLP4 8
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $197
JUMPV
LABELV $194
line 285
;285:			{
line 286
;286:				if ( !ent->inuse ) continue;
ADDRLP4 8
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $198
ADDRGP4 $195
JUMPV
LABELV $198
line 288
;287:
;288:				ent->s.torsoAnim = MV_MapAnimation104( ent->s.torsoAnim );
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 289
;289:				ent->s.legsAnim = MV_MapAnimation104( ent->s.legsAnim );
ADDRLP4 28
ADDRLP4 8
INDIRP4
CNSTI4 280
ADDP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_02_to_1_04
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 290
;290:			}
LABELV $195
line 284
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 2352
ADDP4
ASGNP4
LABELV $197
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRP4
CVPU4 4
LTU4 $194
line 291
;291:		}
ADDRGP4 $166
JUMPV
LABELV $173
line 293
;292:		else	// revert
;293:		{
line 294
;294:			for ( i = 0; i < MAX_CLIENTS; i++ )
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $200
line 295
;295:			{
line 296
;296:				ent = &g_entities[i];
ADDRLP4 8
CNSTI4 2352
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 297
;297:				if ( !ent->inuse ) continue;
ADDRLP4 8
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $204
ADDRGP4 $201
JUMPV
LABELV $204
line 299
;298:
;299:				ps = &ent->client->ps;
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 408
ADDP4
INDIRP4
ASGNP4
line 301
;300:
;301:				if ( jk2startversion == VERSION_1_02 )
ADDRGP4 jk2startversion
INDIRI4
CNSTI4 2
NEI4 $206
line 302
;302:				{
line 305
;303:					/* Convert the animations */
;304:					/* NOTE: When converting from 1.02 to 1.04 we have to convert the playerState struct BEFORE the animations. When converting from 1.04 to 1.02 we have to convert the playerState struct AFTER the animations. */
;305:					ps->legsAnim = MV_MapAnimation102( ps->legsAnim );
ADDRLP4 20
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_04_to_1_02
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 306
;306:					ps->legsAnimExecute = MV_MapAnimation102( ps->legsAnimExecute );
ADDRLP4 28
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_04_to_1_02
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 307
;307:					ps->torsoAnim = MV_MapAnimation102( ps->torsoAnim );
ADDRLP4 36
ADDRLP4 4
INDIRP4
CNSTI4 100
ADDP4
ASGNP4
ADDRLP4 40
ADDRLP4 36
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRP4
ADDRLP4 40
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_04_to_1_02
ADDP4
INDIRI4
ADDRLP4 40
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 308
;308:					ps->torsoAnimExecute = MV_MapAnimation102( ps->torsoAnimExecute );
ADDRLP4 44
ADDRLP4 4
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 48
ADDRLP4 44
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 44
INDIRP4
ADDRLP4 48
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_04_to_1_02
ADDP4
INDIRI4
ADDRLP4 48
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 311
;309:
;310:					/* Only convert forceDodgeAnim if it really is an animation (forceHandExtend being either HANDEXTEND_TAUNT or HANDEXTEND_DODGE) */
;311:					if ( ps->forceHandExtend == HANDEXTEND_TAUNT || ps->forceHandExtend == HANDEXTEND_DODGE )
ADDRLP4 52
ADDRLP4 4
INDIRP4
CNSTI4 1248
ADDP4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 10
EQI4 $210
ADDRLP4 52
INDIRI4
CNSTI4 7
NEI4 $208
LABELV $210
line 312
;312:					{
line 313
;313:						ps->forceDodgeAnim = MV_MapAnimation102( ps->forceDodgeAnim );
ADDRLP4 56
ADDRLP4 4
INDIRP4
CNSTI4 1260
ADDP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRP4
ADDRLP4 60
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_04_to_1_02
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 314
;314:					}
LABELV $208
line 317
;315:
;316:					/* The following two seem to be unused, but maybe custom cgames make use of them (well, fullAnimExecute seems to not even be set at least once - could probably just leave that one out) */
;317:					ps->fullAnimExecute = MV_MapAnimation102( ps->fullAnimExecute );
ADDRLP4 56
ADDRLP4 4
INDIRP4
CNSTI4 736
ADDP4
ASGNP4
ADDRLP4 60
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 56
INDIRP4
ADDRLP4 60
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_04_to_1_02
ADDP4
INDIRI4
ADDRLP4 60
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 318
;318:					ps->saberAttackSequence = MV_MapAnimation102( ps->saberAttackSequence );
ADDRLP4 64
ADDRLP4 4
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 68
ADDRLP4 64
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_04_to_1_02
ADDP4
INDIRI4
ADDRLP4 68
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 321
;319:
;320:					/* Convert the saberblocks */
;321:					if (ps->saberBlocked > BLOCKED_NONE) {
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
LEI4 $211
line 322
;322:						ps->saberBlocked--;
ADDRLP4 72
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 323
;323:					}
LABELV $211
line 324
;324:				}
LABELV $206
line 326
;325:
;326:				if ( jk2version == VERSION_1_02 && !mvStructConversionDisabled )
ADDRGP4 jk2version
INDIRI4
CNSTI4 2
NEI4 $213
ADDRGP4 mvStructConversionDisabled
INDIRI4
CNSTI4 0
NEI4 $213
line 327
;327:				{ // 1.04 to 1.02
line 329
;328:					/* Convert the 1.04 struct into a 1.02 struct so the engine can handle it */
;329:					memcpy( &g_ps[i], ps, section3);
CNSTI4 1380
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_ps
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $170
INDIRU4
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 330
;330:					memcpy( &g_ps[i].saberIndex, &ps->saberIndex, section4);
CNSTI4 1380
ADDRLP4 12
INDIRI4
MULI4
ADDRGP4 g_ps+620
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 620
ADDP4
ARGP4
ADDRGP4 $171
INDIRU4
ARGU4
ADDRGP4 memcpy
CALLP4
pop
line 331
;331:				}
LABELV $213
line 332
;332:			}
LABELV $201
line 294
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 32
LTI4 $200
line 334
;333:
;334:			if ( jk2startversion != VERSION_1_02 ) return;
ADDRGP4 jk2startversion
INDIRI4
CNSTI4 2
EQI4 $216
ADDRGP4 $164
JUMPV
LABELV $216
line 337
;335:
;336:			/* Things that must be converted for all entities (like the torsoAnim and legsAnim, g2animent have them as well) */
;337:			for ( ent = g_entities; ent < entEnd; ent++ )
ADDRLP4 8
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $221
JUMPV
LABELV $218
line 338
;338:			{
line 339
;339:				if ( !ent->inuse ) continue;
ADDRLP4 8
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 0
NEI4 $222
ADDRGP4 $219
JUMPV
LABELV $222
line 341
;340:
;341:				ent->s.torsoAnim = MV_MapAnimation102( ent->s.torsoAnim );
ADDRLP4 20
ADDRLP4 8
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_04_to_1_02
ADDP4
INDIRI4
ADDRLP4 24
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 342
;342:				ent->s.legsAnim = MV_MapAnimation102( ent->s.legsAnim );
ADDRLP4 28
ADDRLP4 8
INDIRP4
CNSTI4 280
ADDP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
CNSTI4 -2049
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 animMappingTable_1_04_to_1_02
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
CNSTI4 2048
BANDI4
BORI4
ASGNI4
line 343
;343:			}
LABELV $219
line 337
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 2352
ADDP4
ASGNP4
LABELV $221
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRLP4 16
INDIRP4
CVPU4 4
LTU4 $218
line 344
;344:		}
line 345
;345:	}
line 347
;346:	else
;347:	{ // No magic required for 1.03 and 1.04...
line 348
;348:		return;
LABELV $166
line 350
;349:	}
;350:}
LABELV $164
endproc MV_VersionMagic 76 12
import trap_G2API_SetBoneAnim_1_04
import trap_G2API_GetGLAName_1_04
import trap_G2API_SetBoneAngles_1_04
import trap_G2API_CollisionDetect_1_04
import trap_G2API_CleanGhoul2Models_1_04
import trap_G2API_RemoveGhoul2Model_1_04
import trap_G2API_HasGhoul2ModelOnIndex_1_04
import trap_G2API_DuplicateGhoul2Instance_1_04
import trap_G2API_CopySpecificGhoul2Model_1_04
import trap_G2API_CopyGhoul2Instance_1_04
import trap_G2API_SetBoltInfo_1_04
import trap_G2API_AddBolt_1_04
import trap_G2API_InitGhoul2Model_1_04
import trap_G2API_GetBoltMatrix_NoRecNoRot_1_04
import trap_G2API_SetBoneAnim_1_02
import trap_G2API_GetGLAName_1_02
import trap_G2API_SetBoneAngles_1_02
import trap_G2API_CleanGhoul2Models_1_02
import trap_G2API_RemoveGhoul2Model_1_02
import trap_G2API_HasGhoul2ModelOnIndex_1_02
import trap_G2API_DuplicateGhoul2Instance_1_02
import trap_G2API_CopySpecificGhoul2Model_1_02
import trap_G2API_CopyGhoul2Instance_1_02
import trap_G2API_SetBoltInfo_1_02
import trap_G2API_AddBolt_1_02
import trap_G2API_InitGhoul2Model_1_02
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
bss
export trap_G2API_SetBoneAnim
align 4
LABELV trap_G2API_SetBoneAnim
skip 4
export trap_G2API_GetGLAName
align 4
LABELV trap_G2API_GetGLAName
skip 4
export trap_G2API_SetBoneAngles
align 4
LABELV trap_G2API_SetBoneAngles
skip 4
export trap_G2API_CollisionDetect
align 4
LABELV trap_G2API_CollisionDetect
skip 4
export trap_G2API_CleanGhoul2Models
align 4
LABELV trap_G2API_CleanGhoul2Models
skip 4
export trap_G2API_RemoveGhoul2Model
align 4
LABELV trap_G2API_RemoveGhoul2Model
skip 4
export trap_G2API_HasGhoul2ModelOnIndex
align 4
LABELV trap_G2API_HasGhoul2ModelOnIndex
skip 4
export trap_G2API_DuplicateGhoul2Instance
align 4
LABELV trap_G2API_DuplicateGhoul2Instance
skip 4
export trap_G2API_CopySpecificGhoul2Model
align 4
LABELV trap_G2API_CopySpecificGhoul2Model
skip 4
export trap_G2API_CopyGhoul2Instance
align 4
LABELV trap_G2API_CopyGhoul2Instance
skip 4
export trap_G2API_SetBoltInfo
align 4
LABELV trap_G2API_SetBoltInfo
skip 4
export trap_G2API_AddBolt
align 4
LABELV trap_G2API_AddBolt
skip 4
export trap_G2API_InitGhoul2Model
align 4
LABELV trap_G2API_InitGhoul2Model
skip 4
export trap_G2API_GetBoltMatrix_NoRecNoRot
align 4
LABELV trap_G2API_GetBoltMatrix_NoRecNoRot
skip 4
export g_ps
align 4
LABELV g_ps
skip 44160
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
LABELV $123
byte 1 77
byte 1 86
byte 1 83
byte 1 68
byte 1 75
byte 1 58
byte 1 32
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 71
byte 1 50
byte 1 65
byte 1 80
byte 1 73
byte 1 95
byte 1 67
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 68
byte 1 101
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 49
byte 1 46
byte 1 48
byte 1 50
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $121
byte 1 77
byte 1 86
byte 1 83
byte 1 68
byte 1 75
byte 1 58
byte 1 32
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 71
byte 1 50
byte 1 65
byte 1 80
byte 1 73
byte 1 95
byte 1 71
byte 1 101
byte 1 116
byte 1 66
byte 1 111
byte 1 108
byte 1 116
byte 1 77
byte 1 97
byte 1 116
byte 1 114
byte 1 105
byte 1 120
byte 1 95
byte 1 78
byte 1 111
byte 1 82
byte 1 101
byte 1 99
byte 1 78
byte 1 111
byte 1 82
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 49
byte 1 46
byte 1 48
byte 1 50
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 10
byte 1 0
