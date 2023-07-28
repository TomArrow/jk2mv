// cl_parse.c  -- parse a message received from the server

#include <algorithm>
#include "client.h"
#include "../qcommon/strip.h"
#include "../ghoul2/G2_local.h"
#ifdef _DONETPROFILE_
#include "../qcommon/INetProfile.h"
#endif

static const char * const svc_strings[256] = {
	"svc_bad",

	"svc_nop",
	"svc_gamestate",
	"svc_configstring",
	"svc_baseline",
	"svc_serverCommand",
	"svc_download",
	"svc_snapshot",
	"svc_mapchange",
};

static void SHOWNET( const msg_t *msg, const char *s) {
	if ( cl_shownet->integer >= 2) {
		Com_Printf ("%3i:%s\n", msg->readcount-1, s);
	}
}

/*
=========================================================================

MESSAGE PARSING

=========================================================================
*/

/*
==================
CL_DeltaEntity

Parses deltas from the given base and adds the resulting entity
to the current frame
==================
*/
void CL_DeltaEntity (msg_t *msg, clSnapshot_t *frame, int newnum, entityState_t *old,
					 qboolean unchanged) {
	entityState_t	*state;

	// save the parsed entity state into the big circular buffer so
	// it can be used as the source for a later delta
	state = &cl.parseEntities[cl.parseEntitiesNum & (MAX_PARSE_ENTITIES-1)];

	if ( unchanged )
	{
		*state = *old;
	}
	else
	{
		MSG_ReadDeltaEntity( msg, old, state, newnum );
	}

	if ( state->number == (MAX_GENTITIES-1) ) {
		return;		// entity was delta removed
	}
	cl.parseEntitiesNum++;
	frame->numEntities++;
}

/*
==================
CL_ParsePacketEntities

==================
*/
void CL_ParsePacketEntities( msg_t *msg, clSnapshot_t *oldframe, clSnapshot_t *newframe) {
	int			newnum;
	entityState_t	*oldstate;
	int			oldindex, oldnum;

	newframe->parseEntitiesNum = cl.parseEntitiesNum;
	newframe->numEntities = 0;

	// delta from the entities present in oldframe
	oldindex = 0;
	oldstate = NULL;
	if (!oldframe) {
		oldnum = 99999;
	} else {
		if ( oldindex >= oldframe->numEntities ) {
			oldnum = 99999;
		} else {
			oldstate = &cl.parseEntities[
				(oldframe->parseEntitiesNum + oldindex) & (MAX_PARSE_ENTITIES-1)];
			oldnum = oldstate->number;
		}
	}

	while ( 1 ) {
		// read the entity index number
		newnum = MSG_ReadBits( msg, GENTITYNUM_BITS );

		if ( newnum == (MAX_GENTITIES-1) ) {
			break;
		}

		if ( msg->readcount > msg->cursize ) {
			Com_Error (ERR_DROP,"CL_ParsePacketEntities: end of message");
		}

		while ( oldnum < newnum ) {
			// one or more entities from the old packet are unchanged
			if ( cl_shownet->integer == 3 ) {
				Com_Printf ("%3i:  unchanged: %i\n", msg->readcount, oldnum);
			}
			CL_DeltaEntity( msg, newframe, oldnum, oldstate, qtrue );

			oldindex++;

			if ( oldindex >= oldframe->numEntities ) {
				oldnum = 99999;
			} else {
				oldstate = &cl.parseEntities[
					(oldframe->parseEntitiesNum + oldindex) & (MAX_PARSE_ENTITIES-1)];
				oldnum = oldstate->number;
			}
		}
		if (oldnum == newnum) {
			// delta from previous state
			if ( cl_shownet->integer == 3 ) {
				Com_Printf ("%3i:  delta: %i\n", msg->readcount, newnum);
			}
			CL_DeltaEntity( msg, newframe, newnum, oldstate, qfalse );

			oldindex++;

			if ( oldindex >= oldframe->numEntities ) {
				oldnum = 99999;
			} else {
				oldstate = &cl.parseEntities[
					(oldframe->parseEntitiesNum + oldindex) & (MAX_PARSE_ENTITIES-1)];
				oldnum = oldstate->number;
			}
			continue;
		}

		if ( oldnum > newnum ) {
			// delta from baseline
			if ( cl_shownet->integer == 3 ) {
				Com_Printf ("%3i:  baseline: %i\n", msg->readcount, newnum);
			}
			CL_DeltaEntity( msg, newframe, newnum, &cl.entityBaselines[newnum], qfalse );
			continue;
		}

	}

	// any remaining entities in the old frame are copied over
	while ( oldnum != 99999 ) {
		// one or more entities from the old packet are unchanged
		if ( cl_shownet->integer == 3 ) {
			Com_Printf ("%3i:  unchanged: %i\n", msg->readcount, oldnum);
		}
		CL_DeltaEntity( msg, newframe, oldnum, oldstate, qtrue );

		oldindex++;

		if ( oldindex >= oldframe->numEntities ) {
			oldnum = 99999;
		} else {
			oldstate = &cl.parseEntities[
				(oldframe->parseEntitiesNum + oldindex) & (MAX_PARSE_ENTITIES-1)];
			oldnum = oldstate->number;
		}
	}
}

extern cvar_t* cl_demoRecordBufferedReorder;
extern std::map<int, bufferedMessageContainer_t> bufferedDemoMessages;

/*
================
CL_ParseSnapshot

If the snapshot is parsed properly, it will be copied to
cl.snap and saved in cl.snapshots[].  If the snapshot is invalid
for any reason, no changes to the state will be made at all.
================
*/
#ifdef RELDEBUG
//#pragma optimize("", off)
#endif
void CL_ParseSnapshot( msg_t *msg ) {
	int			len, len2;
	clSnapshot_t	*old;
	clSnapshot_t	newSnap;
	int			deltaNum;
	int			oldMessageNum;
	int			i, packetNum;
	static int	serverTimeOlderThanPreviousCount = 0; // Count of snaps received with a lower servertime than the old snap we have.

	// get the reliable sequence acknowledge number
	// NOTE: now sent with all server to client messages
	//clc.reliableAcknowledge = MSG_ReadLong( msg );

	// read in the new snapshot to a temporary buffer
	// we will only copy to cl.snap if it is valid
	Com_Memset (&newSnap, 0, sizeof(newSnap));

	// we will have read any new server commands in this
	// message before we got to svc_snapshot
	newSnap.serverCommandNum = clc.serverCommandSequence;

	newSnap.serverTime = MSG_ReadLong( msg );

	// Sometimes packets arrive out of order. We want to tolerate this a bit to tolerate bad internet connections.
	// However if it happens a large amount of times in a row, it might indicate a game restart/map chance I guess?
	// So let the cvar cl_snapOrderTolerance decide how many times we allow it.
	if (newSnap.serverTime < cl.oldFrameServerTime) {
		Com_Printf("WARNING: newSnap.serverTime < cl.oldFrameServerTime.\n");
		serverTimeOlderThanPreviousCount++;
	} else {
		serverTimeOlderThanPreviousCount = 0;
	}

	newSnap.messageNum = clc.serverMessageSequence;

	deltaNum = MSG_ReadByte( msg );
	if ( !deltaNum ) {
		newSnap.deltaNum = -1;
	} else {
		newSnap.deltaNum = newSnap.messageNum - deltaNum;
	}
	newSnap.snapFlags = MSG_ReadByte( msg );

	// If the frame is delta compressed from data that we
	// no longer have available, we must suck up the rest of
	// the frame, but not use it, then ask for a non-compressed
	// message
	if ( newSnap.deltaNum <= 0 ) {
		newSnap.valid = qtrue;		// uncompressed frame
		old = NULL;
		if (cl_demoRecordBufferedReorder->integer) {
			if (bufferedDemoMessages.find(clc.serverMessageSequence) != bufferedDemoMessages.end()) {
				bufferedDemoMessages[clc.serverMessageSequence].containsFullSnapshot = qtrue;
			}
			if (clc.demowaiting == 2) {
				clc.demowaiting = 1;	// now we wait for a delta snapshot that references this or another buffered full snapshot.
			}
		}
		else {
			// This is in case we use the buffered reordering of packets for demos. We want to remember the last sequenceNum we wrote to the demo.
			// Here we just save a fake number of the message before this so that *this* message does get saved.
			//
			clc.demoLastWrittenSequenceNumber = clc.serverMessageSequence - 1;
			clc.demowaiting = 0;// we can start recording now (old fashioned behavior that can occasionally lead to damaged demos)
		}
		
	} else {
		old = &cl.snapshots[newSnap.deltaNum & PACKET_MASK];
		if ( !old->valid ) {
			// should never happen
			Com_Printf ("Message %d: Delta from invalid frame %d (not supposed to happen!).\n",newSnap.messageNum,newSnap.deltaNum);
		} else if ( old->messageNum != newSnap.deltaNum ) {
			// The frame that the server did the delta from
			// is too old, so we can't reconstruct it properly.
			Com_Printf ("Message %d: Delta frame %d too old.\n", newSnap.messageNum, newSnap.deltaNum);
		} else if ( cl.parseEntitiesNum - old->parseEntitiesNum > MAX_PARSE_ENTITIES-128 ) {
			Com_DPrintf ("Message %d: Delta parseEntitiesNum too old.\n", newSnap.messageNum);
		}
		else {
			newSnap.valid = qtrue;	// valid delta parse
		}
		
		// Demo recording stuff.
		if (clc.demowaiting == 1 && cl_demoRecordBufferedReorder->integer && newSnap.valid) {
			if (bufferedDemoMessages.find(newSnap.deltaNum) != bufferedDemoMessages.end()) {
				if (bufferedDemoMessages[newSnap.deltaNum].containsFullSnapshot) {
					// Okay NOW we can start recording the demo.
					clc.demowaiting = 0;
					// This is in case we use the buffered reordering of packets for demos. We want to remember the last sequenceNum we wrote to the demo.
					// Here we just save a fake number of the message before the referenced full snapshot so that saving begins at that full snapshot that is being correctly referenced by the server.
					//
					clc.demoLastWrittenSequenceNumber = newSnap.deltaNum - 1;
					// Short explanation: 
					// The old system merely waited for a full snapshot to start writing the demo.
					// However, at that point the server has not yet received an ack for that full snapshot we received.
					// Sometimes the server does not receive this ack (in time?) and as a result it keeps referencing
					// older snapshots including delta snapshots that are not part of our demo file.
					// So instead, we do a two tier system. First we request a full snapshot. Then we wait for a delta
					// snapshot that correctly references the full snapshot. THEN we start recording the demo, starting
					// exactly at the snapshot that we finally know the server knows we received.
				}
				else {
					clc.demowaiting = 2; // Nah. It's referencing a delta snapshot. We need it to reference a full one. Request another full one.
				}
			}
			else {
				// We do not have this referenced snapshot buffered. Request a new full snapshot.
				clc.demowaiting = 2;
			}
		}
	}

	// Ironically, to be more tolerant of bad internet, we set the (possibly) out of order snap to invalid. 
	// That way it will not be saved to cl.snap and cause a catastrophic failure/disconnect unless it happens
	// at least cl_snapOrderTolerance times in a row.
	if (serverTimeOlderThanPreviousCount > 0 && serverTimeOlderThanPreviousCount <= cl_snapOrderTolerance->integer) {
		// TODO handle demowaiting better?
		newSnap.valid = qfalse;
		if (cl_snapOrderToleranceDemoSkipPackets->integer) {
			clc.demoSkipPacket = qtrue;
		}
		Com_Printf("WARNING: Snapshot servertime lower than previous snap. Ignoring %d/%d.\n", serverTimeOlderThanPreviousCount, cl_snapOrderTolerance->integer);
	}

	// read areamask
	len = MSG_ReadByte( msg );
	len2 = MIN(len, (int)sizeof(newSnap.areamask));
	MSG_ReadData( msg, &newSnap.areamask, len2);
	MSG_SkipData( msg, len - len2);

	// read playerinfo
	SHOWNET( msg, "playerstate" );
	if ( old ) {
		MSG_ReadDeltaPlayerstate( msg, &old->ps, &newSnap.ps );
	} else {
		MSG_ReadDeltaPlayerstate( msg, NULL, &newSnap.ps );
	}

	// read packet entities
	SHOWNET( msg, "packet entities" );
	CL_ParsePacketEntities( msg, old, &newSnap );

	// if not valid, dump the entire thing now that it has
	// been properly read
	if ( !newSnap.valid ) {
		return;
	}

	// clear the valid flags of any snapshots between the last
	// received and this one, so if there was a dropped packet
	// it won't look like something valid to delta from next
	// time we wrap around in the buffer
	oldMessageNum = cl.snap.messageNum + 1;

	if ( newSnap.messageNum - oldMessageNum >= PACKET_BACKUP ) {
		oldMessageNum = newSnap.messageNum - ( PACKET_BACKUP - 1 );
	}
	for ( ; oldMessageNum < newSnap.messageNum ; oldMessageNum++ ) {
		cl.snapshots[oldMessageNum & PACKET_MASK].valid = qfalse;
	}

	// copy to the current good spot
	cl.snap = newSnap;
	cl.snap.ping = 999;

#define SHOWVELOCITY_MAX_PAST_FRAMES 250
	if (cl_showVelocity->integer) {
		static int showVelocityLogIndex = 0;
		static vec3_t lastVelocity{ 0,0,0 };
		static float velocities[SHOWVELOCITY_MAX_PAST_FRAMES];
		static float velocitiesH[SHOWVELOCITY_MAX_PAST_FRAMES];
		static float velocitiesV[SHOWVELOCITY_MAX_PAST_FRAMES];
		static float velocityDeltas[SHOWVELOCITY_MAX_PAST_FRAMES];
		static float velocityDeltasH[SHOWVELOCITY_MAX_PAST_FRAMES];
		static float velocityDeltasV[SHOWVELOCITY_MAX_PAST_FRAMES];

		int pastFrameCount = cl_showVelocity->integer > 1 ? std::min(SHOWVELOCITY_MAX_PAST_FRAMES, cl_showVelocity->integer) : SHOWVELOCITY_MAX_PAST_FRAMES;

		//vec3_t velocityDelta;
		//VectorSubtract(cl.snap.ps.velocity, lastVelocity, velocityDelta);
		velocities[showVelocityLogIndex] = VectorLength(cl.snap.ps.velocity);
		velocitiesH[showVelocityLogIndex] = VectorLength2(cl.snap.ps.velocity);
		velocitiesV[showVelocityLogIndex] = cl.snap.ps.velocity[2];
		velocityDeltas[showVelocityLogIndex] = VectorLength(cl.snap.ps.velocity)- VectorLength(lastVelocity);
		velocityDeltasH[showVelocityLogIndex] = VectorLength2(cl.snap.ps.velocity)- VectorLength2(lastVelocity);
		velocityDeltasV[showVelocityLogIndex] = cl.snap.ps.velocity[2] - lastVelocity[2];

		Com_Memset(&cls.showVelocity, 0, sizeof(cls.showVelocity));

		for (int i = 0; i < pastFrameCount; i++) {
			if (cl_showVelocityAllowNegative->integer) {

				if (abs(velocities[i]) > abs(cls.showVelocity.maxVelocity)) cls.showVelocity.maxVelocity = velocities[i];
				if (abs(velocitiesH[i]) > abs(cls.showVelocity.maxVelocityH)) cls.showVelocity.maxVelocityH = velocitiesH[i];
				if (abs(velocitiesV[i]) > abs(cls.showVelocity.maxVelocityV)) cls.showVelocity.maxVelocityV = velocitiesV[i];
				if (abs(velocityDeltas[i]) > abs(cls.showVelocity.maxVelocityDelta)) cls.showVelocity.maxVelocityDelta = velocityDeltas[i];
				if (abs(velocityDeltasH[i]) > abs(cls.showVelocity.maxVelocityDeltaH)) cls.showVelocity.maxVelocityDeltaH = velocityDeltasH[i];
				if (abs(velocityDeltasV[i]) > abs(cls.showVelocity.maxVelocityDeltaV)) cls.showVelocity.maxVelocityDeltaV = velocityDeltasV[i];
			}
			else {

				if ((velocities[i]) > (cls.showVelocity.maxVelocity)) cls.showVelocity.maxVelocity = velocities[i];
				if ((velocitiesH[i]) > (cls.showVelocity.maxVelocityH)) cls.showVelocity.maxVelocityH = velocitiesH[i];
				if ((velocitiesV[i]) > (cls.showVelocity.maxVelocityV)) cls.showVelocity.maxVelocityV = velocitiesV[i];
				if ((velocityDeltas[i]) > (cls.showVelocity.maxVelocityDelta)) cls.showVelocity.maxVelocityDelta = velocityDeltas[i];
				if ((velocityDeltasH[i]) > (cls.showVelocity.maxVelocityDeltaH)) cls.showVelocity.maxVelocityDeltaH = velocityDeltasH[i];
				if ((velocityDeltasV[i]) > (cls.showVelocity.maxVelocityDeltaV)) cls.showVelocity.maxVelocityDeltaV = velocityDeltasV[i];
			}
		}

		showVelocityLogIndex = ++showVelocityLogIndex % pastFrameCount;
		VectorCopy(cl.snap.ps.velocity, lastVelocity);
	}

	if (cl_fpsGuess->integer) {
		// FPS guessing
		qboolean isMovementDown = (qboolean)(cl.snap.ps.origin[2] < cls.fpsGuess.lastPosition[2]);
		if (isMovementDown && cls.fpsGuess.lastMovementDown && cl.snap.ps.groundEntityNum == ENTITYNUM_NONE) {
			// We will only guess if last and current movement is down. Only that way we can be somewhat sure that force jump isn't interfering.
			// Also useless if we're on the ground.
			int commandTimeDelta = cl.snap.ps.commandTime - cls.fpsGuess.lastPsCommandTime;
			if (commandTimeDelta > 0) { // No use guessing if commandTime didn't change.
				float toPosition = cl.snap.ps.origin[2];
				float toSpeed = cl.snap.ps.velocity[2];
				int foundFps = 0;
				int tmpGuessedFps = -1;
				if (cl_fpsGuessMode->integer == 0) { // All fps from 1 to 50ms
					for (int msec = 50; msec >= 1; msec--) {
						float frametime = (float)msec / 1000.0f;
						// We're gonna try out all these msec options. Find the best fit.
						float speed = cls.fpsGuess.lastVelocity[2];
						float position = cls.fpsGuess.lastPosition[2];
						int totalTime = 0;
						while (position > toPosition) {
							totalTime += msec;
							float newSpeed = speed - DEFAULT_GRAVITY * frametime;
							position += 0.5f * (speed + newSpeed) * frametime;
							speed = roundf(newSpeed);
						}
						if (position == toPosition && speed == toSpeed && (totalTime == commandTimeDelta || cl_fpsGuess->integer == 1)) {
							// Bingo
							tmpGuessedFps = 1000 / msec;
							foundFps++;
						}
					}
				}
				else if (cl_fpsGuessMode->integer == 1) {
					// Only most relevant FPS to avoid improbable fps making a reading sound improbable.
					const static int commonFPSes[] = {3,4,7,8,12,13,33}; // 333,250,142,125,83,76,30
					for (int i = 0; i <(sizeof(commonFPSes)/sizeof(int)); i++) {
						int msec = commonFPSes[i];
						float frametime = (float)msec / 1000.0f;
						// We're gonna try out all these msec options. Find the best fit.
						float speed = cls.fpsGuess.lastVelocity[2];
						float position = cls.fpsGuess.lastPosition[2];
						int totalTime = 0;
						while (position > toPosition) {
							totalTime += msec;
							float newSpeed = speed - DEFAULT_GRAVITY * frametime;
							position += 0.5f * (speed + newSpeed) * frametime;
							speed = roundf(newSpeed);
						}
						if (position == toPosition && speed == toSpeed && (totalTime == commandTimeDelta || cl_fpsGuess->integer == 1)) {
							// Bingo
							tmpGuessedFps = 1000 / msec;
							foundFps++;
						}
					}
				}
				
				if (foundFps >= 1) { // Guess is only valid if only one option is possible. If two different framerates could result in same result, ignore result.

					cls.fpsGuess.lastGuessedFps = cls.fpsGuess.currentGuessedFps = tmpGuessedFps;
					cls.fpsGuess.lastGuessedFpsServerTime = cl.snap.serverTime;
					if (foundFps == 1) { 
						cls.fpsGuess.lastCertainGuessedFps = cls.fpsGuess.lastGuessedFps;
						cls.fpsGuess.lastCertainGuessedFpsServerTime = cls.fpsGuess.lastGuessedFpsServerTime;
						cls.fpsGuess.lastGuessedFpsPercentage = 100;
					}
					else {
						cls.fpsGuess.lastGuessedFpsPercentage = 100/ foundFps;
					}
				}
				else {
					cls.fpsGuess.currentGuessedFps = -1;
				}
			}
		}
		else {
			cls.fpsGuess.currentGuessedFps = -1;
		}
		VectorCopy(cl.snap.ps.velocity, cls.fpsGuess.lastVelocity);
		VectorCopy(cl.snap.ps.origin, cls.fpsGuess.lastPosition);
		cls.fpsGuess.lastMovementDown = isMovementDown;
		cls.fpsGuess.lastPsCommandTime = cl.snap.ps.commandTime;
	}

	// calculate ping time
	for ( i = 0 ; i < PACKET_BACKUP ; i++ ) {
		packetNum = ( clc.netchan.outgoingSequence - 1 - i ) & PACKET_MASK;
		if ( cl.snap.ps.commandTime >= cl.outPackets[ packetNum ].p_serverTime ) {
			cl.snap.ping = cls.realtime - cl.outPackets[ packetNum ].p_realtime;
			break;
		}
	}
	// save the frame off in the backup array for later delta comparisons
	cl.snapshots[cl.snap.messageNum & PACKET_MASK] = cl.snap;

	if (cl_shownet->integer == 3) {
		Com_Printf( "   snapshot:%i  delta:%i  ping:%i\n", cl.snap.messageNum,
		cl.snap.deltaNum, cl.snap.ping );
	}

	cl.newSnapshots = qtrue;
}
#ifdef RELDEBUG
//#pragma optimize("", on)
#endif


//=====================================================================

int cl_connectedToPureServer;

/*
==================
CL_SystemInfoChanged

The systeminfo configstring has been changed, so parse
new information out of it.  This will happen at every
gamestate, and possibly during gameplay.
==================
*/
void CL_SystemInfoChanged( void ) {
	char			*systemInfo;
	const char		*s, *t;
	char			key[BIG_INFO_KEY];
	char			value[BIG_INFO_VALUE];
	qboolean		gameSet;

	systemInfo = cl.gameState.stringData + cl.gameState.stringOffsets[ CS_SYSTEMINFO ];
	cl.serverId = atoi( Info_ValueForKey( systemInfo, "sv_serverid" ) );

	s = Info_ValueForKey( systemInfo, "sv_referencedPaks" );
	t = Info_ValueForKey( systemInfo, "sv_referencedPakNames" );
	FS_PureServerSetReferencedPaks( s, t );

	// don't set any other vars when playing a demo
	if ( clc.demoplaying ) {
		return;
	}

	s = Info_ValueForKey( systemInfo, "sv_cheats" );
	if ( atoi(s) == 0 )
	{
		Cvar_SetCheatState();
	}

	// check pure server string
	s = Info_ValueForKey( systemInfo, "sv_paks" );
	t = Info_ValueForKey( systemInfo, "sv_pakNames" );
	FS_PureServerSetLoadedPaks( s, t );

	gameSet = qfalse;
	// scan through all the variables in the systeminfo and locally set cvars to match
	s = systemInfo;
	while ( s ) {
		Info_NextPair( &s, key, value );
		if ( !key[0] ) {
			break;
		}
		// ehw!
		if ( !Q_stricmp( key, "fs_game" ) ) {
			if (FS_CheckDirTraversal(value)) {
				Com_Printf(S_COLOR_YELLOW "WARNING: Server sent invalid fs_game value %s\n", value);
				continue;
			}

			if (!FS_FilenameCompare(value, BASEGAME)) {
				Com_Printf(S_COLOR_YELLOW "WARNING: Server sent \"%s\" fs_game value, clearing.\n", value);
				value[0] = '\0';
			}

			if (cls.state < CA_ACTIVE && Cvar_VariableIntegerValue("fs_globalcfg")) {
				if (!strlen(value) || value[0] == '\0')
					Cbuf_ExecuteText(EXEC_APPEND, va("exec %s.cfg\n", BASEGAME));
				else
					Cbuf_ExecuteText(EXEC_APPEND, va("exec %s.cfg\n", value));
			}

			gameSet = qtrue;
		}

		// Prevent the server from overwriting existing cVars (like graphic settings)
		cvar_t *var = Cvar_FindVar (key);

		if ( !var )
		{ // Cvar didn't exist, create it, but make sure it is only SYSTEMINFO and not ARCHIVE
			Cvar_Set( key, value );
			var = Cvar_FindVar(key);
			if ( var ) var->flags = CVAR_SYSTEMINFO;
		}
		else if ( var->flags & CVAR_SYSTEMINFO )
		{ // Cvar already exists and is SYSTEMINFO, just set its value
			Cvar_Set( key, value );
		}
	}
	// if game folder should not be set and it is set at the client side
	if ( !gameSet && *Cvar_VariableString("fs_game") ) {
		Cvar_Set( "fs_game", "" );
	}
	cl_connectedToPureServer = Cvar_VariableValue( "sv_pure" );
}

/*
==================
CL_ParseGamestate
==================
*/

extern bool demoCheckFor103;

void CL_ParseGamestate( msg_t *msg ) {
	int				i;
	entityState_t	*es;
	int				newnum;
	entityState_t	nullstate;
	int				cmd;
	char			*s;

	Con_Close();

	clc.connectPacketCount = 0;

	// wipe local client state
	CL_ClearState();

#ifdef _DONETPROFILE_
	int startBytes,endBytes;
	startBytes=msg->readcount;
#endif

	// a gamestate always marks a server command sequence
	clc.serverCommandSequence = MSG_ReadLong( msg );

	// parse all the configstrings and baselines
	cl.gameState.dataCount = 1;	// leave a 0 at the beginning for uninitialized configstrings
	while ( 1 ) {
		cmd = MSG_ReadByte( msg );

		if ( cmd == svc_EOF ) {
			break;
		}

		if ( cmd == svc_configstring ) {
			int		len;

			i = MSG_ReadShort( msg );
			if ( i < 0 || i >= MAX_CONFIGSTRINGS ) {
				Com_Error( ERR_DROP, "configstring > MAX_CONFIGSTRINGS" );
			}
			s = MSG_ReadBigString( msg );
			len = (int)strlen(s);

			if ( len + 1 + cl.gameState.dataCount > MAX_GAMESTATE_CHARS ) {
				Com_Error( ERR_DROP, "MAX_GAMESTATE_CHARS exceeded" );
			}

			if ( i == CS_SERVERINFO ) {
				if ( demoCheckFor103 ) {
					//This is the big serverinfo string containing the value of the "version" cvar of the server.
					//If we are about to play a demo, we can use this information to ascertain whether this demo was recorded on
					//a 1.03 server.
					if ( CL_ServerVersionIs103( Info_ValueForKey(s, "version") ) ) {
						//A 1.03 demo - set the proper game version internally so parsing snapshots etc won't fail
						MV_SetCurrentGameversion( VERSION_1_03 );
					}

					demoCheckFor103 = false; //No need to check this again while playing the demo.
				}
				clc.udpdl = atoi( Info_ValueForKey(s, "sv_allowDownload") );
			}

			// append it to the gameState string buffer
			cl.gameState.stringOffsets[ i ] = cl.gameState.dataCount;
			Com_Memcpy( cl.gameState.stringData + cl.gameState.dataCount, s, len + 1 );
			cl.gameState.dataCount += len + 1;
		} else if ( cmd == svc_baseline ) {
			newnum = MSG_ReadBits( msg, GENTITYNUM_BITS );
			if ( newnum < 0 || newnum >= MAX_GENTITIES ) {
				Com_Error( ERR_DROP, "Baseline number out of range: %i", newnum );
			}
			Com_Memset (&nullstate, 0, sizeof(nullstate));
			es = &cl.entityBaselines[ newnum ];
			MSG_ReadDeltaEntity( msg, &nullstate, es, newnum );
		} else {
			Com_Error( ERR_DROP, "CL_ParseGamestate: bad command byte" );
		}
	}

	clc.clientNum = MSG_ReadLong(msg);
	// read the checksum feed
	clc.checksumFeed = MSG_ReadLong( msg );

#ifdef _DONETPROFILE_
	endBytes=msg->readcount;
//	ClReadProf().AddField("svc_gamestate",endBytes-startBytes);
#endif

	// parse serverId and other cvars
	CL_SystemInfoChanged();

	// reinitialize the filesystem if the game directory has changed
	if( FS_ConditionalRestart( clc.checksumFeed ) ) {
		// don't set to true because we yet have to start downloading
		// enabling this can cause double loading of a map when connecting to
		// a server which has a different game directory set
		//clc.downloadRestart = qtrue;
	}

	// This used to call CL_StartHunkUsers, but now we enter the download state before loading the
	// cgame
	CL_InitDownloads();

	// make sure the game starts
	Cvar_Set( "cl_paused", "0" );
}

//=====================================================================

/*
=====================
CL_ParseDownload

A UDP download message has been received from the server
=====================
*/
void CL_ParseUDPDownload ( msg_t *msg ) {
	int		size;
	unsigned char data[MAX_MSGLEN];
	uint16_t block;

	if (!*clc.downloadTempName) {
		Com_Printf("^3WARNING: Server sending download, but no download was requested\n");
		CL_AddReliableCommand("stopdl");
		return;
	}

	// read the data
	block = MSG_ReadShort(msg);

	if ( !block && !clc.downloadBlock)
	{
		// block zero is special, contains file size
		clc.downloadSize = MSG_ReadLong ( msg );

		Cvar_SetValue( "cl_downloadSize", clc.downloadSize );

		if (clc.downloadSize < 0)
		{
			Com_Error(ERR_DROP, "%s", MSG_ReadString(msg));
			CL_DownloadsComplete();
			return;
		}
	}

	size = MSG_ReadShort(msg);
	if ((unsigned)size > sizeof(data)) {
		Com_Error(ERR_DROP, "CL_ParseDownload: Invalid size %d for download chunk", size);
		return;
	}

	MSG_ReadData(msg, data, size);

	if (clc.downloadBlock != block) {
		Com_DPrintf( "CL_ParseDownload: Expected block %d, got %d\n", clc.downloadBlock, block);
		return;
	}

	// open the file if not opened yet
	if (!clc.download)
	{
		clc.download = FS_SV_FOpenFileWrite( clc.downloadTempName );

		if (!clc.download) {
			Com_Printf( "Could not create %s\n", clc.downloadTempName );
			CL_AddReliableCommand( "stopdl" );
			CL_NextDownload();
			return;
		}
	}

	if (size)
		FS_Write( data, size, clc.download );

	CL_AddReliableCommand( va("nextdl %d", clc.downloadBlock) );
	clc.downloadBlock++;

	clc.downloadCount += size;

	// So UI gets access to it
	Cvar_SetValue( "cl_downloadCount", clc.downloadCount );
	WIN_SetTaskbarState(TBS_PROGRESS, clc.downloadCount, clc.downloadSize);

	if (!size) { // A zero length block means EOF
		if (clc.download) {
			FS_FCloseFile( clc.download );
			clc.download = 0;

			FS_SV_Rename(clc.downloadTempName, clc.downloadName);
		}
		*clc.downloadTempName = *clc.downloadName = 0;
		Cvar_Set( "cl_downloadName", "" );

		// send intentions now
		// We need this because without it, we would hold the last nextdl and then start
		// loading right away.  If we take a while to load, the server is happily trying
		// to send us that last block over and over.
		// Write it twice to help make sure we acknowledge the download
		CL_WritePacket();
		CL_WritePacket();

		// get another file if needed
		CL_NextDownload ();
	}
}

/*
=====================
CL_EndHTTPDownload

HTTP download ended
=====================
*/
void CL_EndHTTPDownload(dlHandle_t handle, qboolean success, const char *err_msg) {
	if (success) {
		FS_SV_Rename(clc.downloadTempName, clc.downloadName);
	} else {
		Com_Error(ERR_DROP, "Download Error: %s", err_msg);
	}

	*clc.downloadTempName = *clc.downloadName = 0;
	Cvar_Set("cl_downloadName", "");

	WIN_SetTaskbarState(TBS_NORMAL, 0, 0);

	CL_NextDownload();
}

/*
=====================
CL_ProcessHTTPDownload

Current status of the HTTP download has changed
=====================
*/
void CL_ProcessHTTPDownload(size_t dltotal, size_t dlnow) {
	if (dltotal && dlnow) {
		Cvar_SetValue("cl_downloadSize", (int)dltotal);
		Cvar_SetValue("cl_downloadCount", (int)dlnow);

		WIN_SetTaskbarState(TBS_PROGRESS, dlnow, dltotal);
	}
}

/*
=====================
CL_DownloadRunning
=====================
*/
qboolean CL_DownloadRunning() {
	return (qboolean)(strlen(clc.downloadName) > 0);
}

/*
=====================
CL_KillDownload
=====================
*/
void CL_KillDownload() {
	NET_HTTP_StopDownload(clc.httpHandle);

	if (clc.download) {
		FS_FCloseFile(clc.download);
		clc.download = 0;
	}
	*clc.downloadTempName = *clc.downloadName = 0;
	Cvar_Set("cl_downloadName", "");

	WIN_SetTaskbarState(TBS_NORMAL, 0, 0);
}

/*
=====================
CL_ParseCommandString

Command strings are just saved off until cgame asks for them
when it transitions a snapshot
=====================
*/
void CL_ParseCommandString( msg_t *msg ) {
	char	*s;
	int		seq;
	int		index;

#ifdef _DONETPROFILE_
	int startBytes,endBytes;
	startBytes=msg->readcount;
#endif
	seq = MSG_ReadLong( msg );
	s = MSG_ReadString( msg );
#ifdef _DONETPROFILE_
	endBytes=msg->readcount;
	ClReadProf().AddField("svc_serverCommand",endBytes-startBytes);
#endif
	// see if we have already executed stored it off
	if ( clc.serverCommandSequence >= seq ) {
		return;
	}
	clc.serverCommandSequence = seq;

	index = seq & (MAX_RELIABLE_COMMANDS-1);
	Q_strncpyz( clc.serverCommands[ index ], s, sizeof( clc.serverCommands[ index ] ) );
}


/*
=====================
CL_ParseServerMessage
=====================
*/
void CL_ParseServerMessage( msg_t *msg ) {
	int			cmd;

	if ( cl_shownet->integer == 1 ) {
		Com_Printf ("%i ",msg->cursize);
	} else if ( cl_shownet->integer >= 2 ) {
		Com_Printf ("------------------\n");
	}

	MSG_Bitstream(msg);

	// get the reliable sequence acknowledge number
	clc.reliableAcknowledge = MSG_ReadLong( msg );
	//
	if ( clc.reliableAcknowledge < clc.reliableSequence - MAX_RELIABLE_COMMANDS ) {
		clc.reliableAcknowledge = clc.reliableSequence;
	}

	//
	// parse the message
	//
	while ( 1 ) {
		if ( msg->readcount > msg->cursize ) {
			Com_Error (ERR_DROP,"CL_ParseServerMessage: read past end of server message");
			break;
		}

		cmd = MSG_ReadByte( msg );

		if ( cmd == svc_EOF) {
			SHOWNET( msg, "END OF MESSAGE" );
			break;
		}

		if ( cl_shownet->integer >= 2 ) {
			if ( !svc_strings[cmd] ) {
				Com_Printf( "%3i:BAD CMD %i\n", msg->readcount-1, cmd );
			} else {
				SHOWNET( msg, svc_strings[cmd] );
			}
		}

	// other commands
		switch ( cmd ) {
		default:
			Com_Error (ERR_DROP,"CL_ParseServerMessage: Illegible server message");
			break;
		case svc_nop:
			break;
		case svc_serverCommand:
			CL_ParseCommandString( msg );
			break;
		case svc_gamestate:
			CL_ParseGamestate( msg );
			break;
		case svc_snapshot:
			CL_ParseSnapshot( msg );
			break;
		case svc_download:
			CL_ParseUDPDownload( msg );
			break;
		case svc_mapchange:
			CL_KillDownload();

			if (cgvm)
			{
				VM_Call( cgvm, CG_MAP_CHANGE );
			}
			break;
		}
	}
}


extern int			scr_center_y;
void SCR_CenterPrint (char *str);//, PalIdx_t colour)

void CL_SP_Print(const word ID, intptr_t Data) //, char* color)
{
	cStringsSingle	*String;
	unsigned int	Flags;
	char			temp[1024], *Text;

	String = SP_GetString(ID);
	if (String)
	{
		Text = String->GetText();
		if (Data)
		{	// replacement for unsafe printf - supports %d, %i and %s
			const char	*p, *tail;
			char		head[1024];
			qboolean	done = qfalse;

			Q_strncpyz(head, Text, sizeof(head));
			Q_strncpyz(temp, Text, sizeof(head));

			while((p = strchr(Text, '%')) && !done) {
				switch(p[1]) {
				case 's':
					head[p - Text] = '\0';
					tail = p + 2;
					Com_sprintf(temp, sizeof(temp), "%s%s%s", head, (char *)VM_ArgString(CG_SP_PRINT, Data), tail);
					done = qtrue;
					break;
				case 'd':
				case 'i':
					head[p - Text] = '\0';
					tail = p + 2;
					Com_sprintf(temp, sizeof(temp), "%s%d%s", head, *(int *)VM_ArgPtr(CG_SP_PRINT, Data, sizeof(int)), tail);
					done = qtrue;
					break;
				case '\0':
					done = qtrue;
					break;
				default:
					p += 2;
					break;
				}
			}

			Text = temp;
		}

		Flags = String->GetFlags();

		// RWL - commented out.
		/*
		if (Flags & SP_FLAG_CREDIT)
		{
			SCR_FadePic(Text);
		}
		// RWL - commented out.

		else if (Flags & SP_FLAG_CAPTIONED)
		{
			if (( cl_subtitles->value )|| (Flags & SP_FLAG_ALWAYS_PRINT))
			{
				scr_center_y = 1;
				SCR_CenterPrint (Text);
			}
		}
		else if (Flags & SP_FLAG_CENTERED)
		*/
		if (Flags & SP_FLAG1)
		{
			scr_center_y = 0;
			SCR_CenterPrint (Text);
		}
		// RWL - commented out.
		/*
		else if (Flags & SP_FLAG_TYPEAMATIC)
		{
			SCR_CinematicString(0,104,5,Text);
		}
		else if (Flags & SP_FLAG_LAYOUT)
		{
			if(Text[0]=='*')
			{
				// Start new layout.

				if(Text[1])
					Com_sprintf(cl.layout,sizeof(cl.layout),"%s",Text+1);
				else
					cl.layout[0]=0;
			}
			else
			{
				// Append to existing layout.

				if((strlen(cl.layout)+strlen(Text)+1)<sizeof(cl.layout))
				{
					strcat(cl.layout," ");
					strcat(cl.layout,Text);
				}
			}
		}
		*/
		else
		{
			Com_Printf ("%s", Text);
		}
	}
}
