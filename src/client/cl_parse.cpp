// cl_parse.c  -- parse a message received from the server

#include <algorithm>
#include <sstream>
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

ezDemoBuffer_t		ezDemoBuffer;

#ifdef CL_EZDEMO

void Ezdemo_AddEvent(int client);
qboolean Ezdemo_ClientValid(int client);
entityState_t* Ezdemo_EntForClientNum(int client);
qboolean Ezdemo_CheckOptions(const int clientNum, const int event);
static void Ezdemo_HandleEvent(entityState_t state);

//ret options
#define FRAGS_DBS 		1
#define FRAGS_BS 		2
#define FRAGS_DFA 		4
#define FRAGS_DOOM 		8
#define FRAGS_LUNGE		16
#define FRAGS_BLUEBS	32
#define BS_ATTEMPTS		64

#define FRAGS_ABLUE		64
#define FRAGS_AYELLOW	128
#define FRAGS_ARED		256

#define EZDEMO_RETS				2
#define EZDEMO_CAPTURES			4
#define EZDEMO_FLAGSTEALS		8
#define EZDEMO_CHATS			16

#define EZDEMO_PREDICTEDCLIENT			1337

int 			ezdemoPlayerstateClientNum = -1;
static int 		ezdemoFragOptions = 0;
static int 		ezdemoBitOptions = 0;
static int 		ezdemoEventCount = 0;
static float 	ezdemoMinimumSpeed = 0;
static int 		ezdemoShowOnlyKillsOn = -1;
static int 		ezdemoShowOnlyKillsBy = -1;

qboolean ezdemoActive = qfalse;


#endif

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

	if (ezdemoActive && (state->eType == ET_EVENTS + EV_OBITUARY || state->eType == ET_EVENTS + EV_CTFMESSAGE)) {
		Ezdemo_HandleEvent(*state);
	}
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
extern std::map<int, std::unique_ptr<bufferedMessageContainer_t>> bufferedDemoMessages;



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
	int			len;
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

#ifdef XDEVELOPER
	if (x3_debugcl->integer == 3) {
		static int lastSnapReceiveTime = -1;
		const int newtime = cls.realtime;

		if (lastSnapReceiveTime != -1)
			Com_Printf("Received new snapshot %i ms after last snapshot.\n", newtime - lastSnapReceiveTime);

		lastSnapReceiveTime = cls.realtime;
	}
#endif


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
				bufferedDemoMessages[clc.serverMessageSequence].get()->containsFullSnapshot = qtrue;
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
				if (bufferedDemoMessages[newSnap.deltaNum].get()->containsFullSnapshot) {
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
	MSG_ReadData( msg, &newSnap.areamask, len);

#ifdef XDEVELOPER
	static int oldanim = -1;
#endif

	// read playerinfo
	SHOWNET( msg, "playerstate" );
	if ( old ) {
		MSG_ReadDeltaPlayerstate( msg, &old->ps, &newSnap.ps );
	} else {
		MSG_ReadDeltaPlayerstate( msg, NULL, &newSnap.ps );
	}

#ifdef XDEVELOPER
	int newanim = newSnap.ps.torsoAnim;

	if (newanim == 809 || newanim == 807 || newanim == 804) {
		if (ezdemoActive && newanim != oldanim && ezdemoFragOptions & BS_ATTEMPTS) {
			Ezdemo_AddEvent(ezdemoPlayerstateClientNum);
		}
	}

	oldanim = newanim;
#endif

	// read packet entities
	SHOWNET( msg, "packet entities" );

	if (ezdemoActive) {
		ezdemoPlayerstateClientNum = newSnap.ps.clientNum;
	}

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
		if (cl_fpsGuess->integer == 1) { // Old method.
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
						const static int commonFPSes[] = { 3,4,7,8,12,13,33 }; // 333,250,142,125,83,76,30
						for (int i = 0; i < (sizeof(commonFPSes) / sizeof(int)); i++) {
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
							cls.fpsGuess.lastGuessedFpsPercentage = 100 / foundFps;
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
		}
		else if (cl_fpsGuess->integer == 2) {
			// New method. Spoiler: It's trash and doesn't work at all. Was fun to make though. :D
			static qboolean fpsGuessInitialized = qfalse;
			static signed short commandTimeDeltas[FPS_GUESS_METHOD2_FRAMEAVG_COUNT]{};
			static signed short downfallDeltas[FPS_GUESS_METHOD2_FRAMEAVG_COUNT]{};
			static int commandTimeDeltaIndex = 0;
			static int downFallDeltaIndex = 0;
			static int oldCommandTime = 0;
			//static int primeNumberFactorizations[1000][6] = {{}, {}, { 2 }, { 3 }, { 2,2 }, { 5 }, { 2,3 }, { 7 }, { 2,2,2 }, { 3,3 }, { 2,5 }, { 11 }, { 2,2,3 }, { 13 }, { 2,7 }, { 3,5 }, { 2,2,2,2 }, { 17 }, { 2,3,3 }, { 19 }, { 2,2,5 }, { 3,7 }, { 2,11 }, { 23 }, { 2,2,2,3 }, { 5,5 }, { 2,13 }, { 3,3,3 }, { 2,2,7 }, { 29 }, { 2,3,5 }, { 31 }, { 2,2,2,2,2 }, { 3,11 }, { 2,17 }, { 5,7 }, { 2,2,3,3 }, { 37 }, { 2,19 }, { 3,13 }, { 2,2,2,5 }, { 41 }, { 2,3,7 }, { 43 }, { 2,2,11 }, { 3,3,5 }, { 2,23 }, { 47 }, { 2,2,2,2,3 }, { 7,7 }, { 2,5,5 }, { 3,17 }, { 2,2,13 }, { 53 }, { 2,3,3,3 }, { 5,11 }, { 2,2,2,7 }, { 3,19 }, { 2,29 }, { 59 }, { 2,2,3,5 }, { 61 }, { 2,31 }, { 3,3,7 }, { 2,2,2,2,2,2 }, { 5,13 }, { 2,3,11 }, { 67 }, { 2,2,17 }, { 3,23 }, { 2,5,7 }, { 71 }, { 2,2,2,3,3 }, { 73 }, { 2,37 }, { 3,5,5 }, { 2,2,19 }, { 7,11 }, { 2,3,13 }, { 79 }, { 2,2,2,2,5 }, { 3,3,3,3 }, { 2,41 }, { 83 }, { 2,2,3,7 }, { 5,17 }, { 2,43 }, { 3,29 }, { 2,2,2,11 }, { 89 }, { 2,3,3,5 }, { 7,13 }, { 2,2,23 }, { 3,31 }, { 2,47 }, { 5,19 }, { 2,2,2,2,2,3 }, { 97 }, { 2,7,7 }, { 3,3,11 }, { 2,2,5,5 }, { 101 }, { 2,3,17 }, { 103 }, { 2,2,2,13 }, { 3,5,7 }, { 2,53 }, { 107 }, { 2,2,3,3,3 }, { 109 }, { 2,5,11 }, { 3,37 }, { 2,2,2,2,7 }, { 113 }, { 2,3,19 }, { 5,23 }, { 2,2,29 }, { 3,3,13 }, { 2,59 }, { 7,17 }, { 2,2,2,3,5 }, { 11,11 }, { 2,61 }, { 3,41 }, { 2,2,31 }, { 5,5,5 }, { 2,3,3,7 }, { 127 }, { 2,2,2,2,2,2,2 }, { 3,43 }, { 2,5,13 }, { 131 }, { 2,2,3,11 }, { 7,19 }, { 2,67 }, { 3,3,3,5 }, { 2,2,2,17 }, { 137 }, { 2,3,23 }, { 139 }, { 2,2,5,7 }, { 3,47 }, { 2,71 }, { 11,13 }, { 2,2,2,2,3,3 }, { 5,29 }, { 2,73 }, { 3,7,7 }, { 2,2,37 }, { 149 }, { 2,3,5,5 }, { 151 }, { 2,2,2,19 }, { 3,3,17 }, { 2,7,11 }, { 5,31 }, { 2,2,3,13 }, { 157 }, { 2,79 }, { 3,53 }, { 2,2,2,2,2,5 }, { 7,23 }, { 2,3,3,3,3 }, { 163 }, { 2,2,41 }, { 3,5,11 }, { 2,83 }, { 167 }, { 2,2,2,3,7 }, { 13,13 }, { 2,5,17 }, { 3,3,19 }, { 2,2,43 }, { 173 }, { 2,3,29 }, { 5,5,7 }, { 2,2,2,2,11 }, { 3,59 }, { 2,89 }, { 179 }, { 2,2,3,3,5 }, { 181 }, { 2,7,13 }, { 3,61 }, { 2,2,2,23 }, { 5,37 }, { 2,3,31 }, { 11,17 }, { 2,2,47 }, { 3,3,3,7 }, { 2,5,19 }, { 191 }, { 2,2,2,2,2,2,3 }, { 193 }, { 2,97 }, { 3,5,13 }, { 2,2,7,7 }, { 197 }, { 2,3,3,11 }, { 199 }, { 2,2,2,5,5 }, { 3,67 }, { 2,101 }, { 7,29 }, { 2,2,3,17 }, { 5,41 }, { 2,103 }, { 3,3,23 }, { 2,2,2,2,13 }, { 11,19 }, { 2,3,5,7 }, { 211 }, { 2,2,53 }, { 3,71 }, { 2,107 }, { 5,43 }, { 2,2,2,3,3,3 }, { 7,31 }, { 2,109 }, { 3,73 }, { 2,2,5,11 }, { 13,17 }, { 2,3,37 }, { 223 }, { 2,2,2,2,2,7 }, { 3,3,5,5 }, { 2,113 }, { 227 }, { 2,2,3,19 }, { 229 }, { 2,5,23 }, { 3,7,11 }, { 2,2,2,29 }, { 233 }, { 2,3,3,13 }, { 5,47 }, { 2,2,59 }, { 3,79 }, { 2,7,17 }, { 239 }, { 2,2,2,2,3,5 }, { 241 }, { 2,11,11 }, { 3,3,3,3,3 }, { 2,2,61 }, { 5,7,7 }, { 2,3,41 }, { 13,19 }, { 2,2,2,31 }, { 3,83 }, { 2,5,5,5 }, { 251 }, { 2,2,3,3,7 }, { 11,23 }, { 2,127 }, { 3,5,17 }, { 2,2,2,2,2,2,2,2 }, { 257 }, { 2,3,43 }, { 7,37 }, { 2,2,5,13 }, { 3,3,29 }, { 2,131 }, { 263 }, { 2,2,2,3,11 }, { 5,53 }, { 2,7,19 }, { 3,89 }, { 2,2,67 }, { 269 }, { 2,3,3,3,5 }, { 271 }, { 2,2,2,2,17 }, { 3,7,13 }, { 2,137 }, { 5,5,11 }, { 2,2,3,23 }, { 277 }, { 2,139 }, { 3,3,31 }, { 2,2,2,5,7 }, { 281 }, { 2,3,47 }, { 283 }, { 2,2,71 }, { 3,5,19 }, { 2,11,13 }, { 7,41 }, { 2,2,2,2,2,3,3 }, { 17,17 }, { 2,5,29 }, { 3,97 }, { 2,2,73 }, { 293 }, { 2,3,7,7 }, { 5,59 }, { 2,2,2,37 }, { 3,3,3,11 }, { 2,149 }, { 13,23 }, { 2,2,3,5,5 }, { 7,43 }, { 2,151 }, { 3,101 }, { 2,2,2,2,19 }, { 5,61 }, { 2,3,3,17 }, { 307 }, { 2,2,7,11 }, { 3,103 }, { 2,5,31 }, { 311 }, { 2,2,2,3,13 }, { 313 }, { 2,157 }, { 3,3,5,7 }, { 2,2,79 }, { 317 }, { 2,3,53 }, { 11,29 }, { 2,2,2,2,2,2,5 }, { 3,107 }, { 2,7,23 }, { 17,19 }, { 2,2,3,3,3,3 }, { 5,5,13 }, { 2,163 }, { 3,109 }, { 2,2,2,41 }, { 7,47 }, { 2,3,5,11 }, { 331 }, { 2,2,83 }, { 3,3,37 }, { 2,167 }, { 5,67 }, { 2,2,2,2,3,7 }, { 337 }, { 2,13,13 }, { 3,113 }, { 2,2,5,17 }, { 11,31 }, { 2,3,3,19 }, { 7,7,7 }, { 2,2,2,43 }, { 3,5,23 }, { 2,173 }, { 347 }, { 2,2,3,29 }, { 349 }, { 2,5,5,7 }, { 3,3,3,13 }, { 2,2,2,2,2,11 }, { 353 }, { 2,3,59 }, { 5,71 }, { 2,2,89 }, { 3,7,17 }, { 2,179 }, { 359 }, { 2,2,2,3,3,5 }, { 19,19 }, { 2,181 }, { 3,11,11 }, { 2,2,7,13 }, { 5,73 }, { 2,3,61 }, { 367 }, { 2,2,2,2,23 }, { 3,3,41 }, { 2,5,37 }, { 7,53 }, { 2,2,3,31 }, { 373 }, { 2,11,17 }, { 3,5,5,5 }, { 2,2,2,47 }, { 13,29 }, { 2,3,3,3,7 }, { 379 }, { 2,2,5,19 }, { 3,127 }, { 2,191 }, { 383 }, { 2,2,2,2,2,2,2,3 }, { 5,7,11 }, { 2,193 }, { 3,3,43 }, { 2,2,97 }, { 389 }, { 2,3,5,13 }, { 17,23 }, { 2,2,2,7,7 }, { 3,131 }, { 2,197 }, { 5,79 }, { 2,2,3,3,11 }, { 397 }, { 2,199 }, { 3,7,19 }, { 2,2,2,2,5,5 }, { 401 }, { 2,3,67 }, { 13,31 }, { 2,2,101 }, { 3,3,3,3,5 }, { 2,7,29 }, { 11,37 }, { 2,2,2,3,17 }, { 409 }, { 2,5,41 }, { 3,137 }, { 2,2,103 }, { 7,59 }, { 2,3,3,23 }, { 5,83 }, { 2,2,2,2,2,13 }, { 3,139 }, { 2,11,19 }, { 419 }, { 2,2,3,5,7 }, { 421 }, { 2,211 }, { 3,3,47 }, { 2,2,2,53 }, { 5,5,17 }, { 2,3,71 }, { 7,61 }, { 2,2,107 }, { 3,11,13 }, { 2,5,43 }, { 431 }, { 2,2,2,2,3,3,3 }, { 433 }, { 2,7,31 }, { 3,5,29 }, { 2,2,109 }, { 19,23 }, { 2,3,73 }, { 439 }, { 2,2,2,5,11 }, { 3,3,7,7 }, { 2,13,17 }, { 443 }, { 2,2,3,37 }, { 5,89 }, { 2,223 }, { 3,149 }, { 2,2,2,2,2,2,7 }, { 449 }, { 2,3,3,5,5 }, { 11,41 }, { 2,2,113 }, { 3,151 }, { 2,227 }, { 5,7,13 }, { 2,2,2,3,19 }, { 457 }, { 2,229 }, { 3,3,3,17 }, { 2,2,5,23 }, { 461 }, { 2,3,7,11 }, { 463 }, { 2,2,2,2,29 }, { 3,5,31 }, { 2,233 }, { 467 }, { 2,2,3,3,13 }, { 7,67 }, { 2,5,47 }, { 3,157 }, { 2,2,2,59 }, { 11,43 }, { 2,3,79 }, { 5,5,19 }, { 2,2,7,17 }, { 3,3,53 }, { 2,239 }, { 479 }, { 2,2,2,2,2,3,5 }, { 13,37 }, { 2,241 }, { 3,7,23 }, { 2,2,11,11 }, { 5,97 }, { 2,3,3,3,3,3 }, { 487 }, { 2,2,2,61 }, { 3,163 }, { 2,5,7,7 }, { 491 }, { 2,2,3,41 }, { 17,29 }, { 2,13,19 }, { 3,3,5,11 }, { 2,2,2,2,31 }, { 7,71 }, { 2,3,83 }, { 499 }, { 2,2,5,5,5 }, { 3,167 }, { 2,251 }, { 503 }, { 2,2,2,3,3,7 }, { 5,101 }, { 2,11,23 }, { 3,13,13 }, { 2,2,127 }, { 509 }, { 2,3,5,17 }, { 7,73 }, { 2,2,2,2,2,2,2,2,2 }, { 3,3,3,19 }, { 2,257 }, { 5,103 }, { 2,2,3,43 }, { 11,47 }, { 2,7,37 }, { 3,173 }, { 2,2,2,5,13 }, { 521 }, { 2,3,3,29 }, { 523 }, { 2,2,131 }, { 3,5,5,7 }, { 2,263 }, { 17,31 }, { 2,2,2,2,3,11 }, { 23,23 }, { 2,5,53 }, { 3,3,59 }, { 2,2,7,19 }, { 13,41 }, { 2,3,89 }, { 5,107 }, { 2,2,2,67 }, { 3,179 }, { 2,269 }, { 7,7,11 }, { 2,2,3,3,3,5 }, { 541 }, { 2,271 }, { 3,181 }, { 2,2,2,2,2,17 }, { 5,109 }, { 2,3,7,13 }, { 547 }, { 2,2,137 }, { 3,3,61 }, { 2,5,5,11 }, { 19,29 }, { 2,2,2,3,23 }, { 7,79 }, { 2,277 }, { 3,5,37 }, { 2,2,139 }, { 557 }, { 2,3,3,31 }, { 13,43 }, { 2,2,2,2,5,7 }, { 3,11,17 }, { 2,281 }, { 563 }, { 2,2,3,47 }, { 5,113 }, { 2,283 }, { 3,3,3,3,7 }, { 2,2,2,71 }, { 569 }, { 2,3,5,19 }, { 571 }, { 2,2,11,13 }, { 3,191 }, { 2,7,41 }, { 5,5,23 }, { 2,2,2,2,2,2,3,3 }, { 577 }, { 2,17,17 }, { 3,193 }, { 2,2,5,29 }, { 7,83 }, { 2,3,97 }, { 11,53 }, { 2,2,2,73 }, { 3,3,5,13 }, { 2,293 }, { 587 }, { 2,2,3,7,7 }, { 19,31 }, { 2,5,59 }, { 3,197 }, { 2,2,2,2,37 }, { 593 }, { 2,3,3,3,11 }, { 5,7,17 }, { 2,2,149 }, { 3,199 }, { 2,13,23 }, { 599 }, { 2,2,2,3,5,5 }, { 601 }, { 2,7,43 }, { 3,3,67 }, { 2,2,151 }, { 5,11,11 }, { 2,3,101 }, { 607 }, { 2,2,2,2,2,19 }, { 3,7,29 }, { 2,5,61 }, { 13,47 }, { 2,2,3,3,17 }, { 613 }, { 2,307 }, { 3,5,41 }, { 2,2,2,7,11 }, { 617 }, { 2,3,103 }, { 619 }, { 2,2,5,31 }, { 3,3,3,23 }, { 2,311 }, { 7,89 }, { 2,2,2,2,3,13 }, { 5,5,5,5 }, { 2,313 }, { 3,11,19 }, { 2,2,157 }, { 17,37 }, { 2,3,3,5,7 }, { 631 }, { 2,2,2,79 }, { 3,211 }, { 2,317 }, { 5,127 }, { 2,2,3,53 }, { 7,7,13 }, { 2,11,29 }, { 3,3,71 }, { 2,2,2,2,2,2,2,5 }, { 641 }, { 2,3,107 }, { 643 }, { 2,2,7,23 }, { 3,5,43 }, { 2,17,19 }, { 647 }, { 2,2,2,3,3,3,3 }, { 11,59 }, { 2,5,5,13 }, { 3,7,31 }, { 2,2,163 }, { 653 }, { 2,3,109 }, { 5,131 }, { 2,2,2,2,41 }, { 3,3,73 }, { 2,7,47 }, { 659 }, { 2,2,3,5,11 }, { 661 }, { 2,331 }, { 3,13,17 }, { 2,2,2,83 }, { 5,7,19 }, { 2,3,3,37 }, { 23,29 }, { 2,2,167 }, { 3,223 }, { 2,5,67 }, { 11,61 }, { 2,2,2,2,2,3,7 }, { 673 }, { 2,337 }, { 3,3,3,5,5 }, { 2,2,13,13 }, { 677 }, { 2,3,113 }, { 7,97 }, { 2,2,2,5,17 }, { 3,227 }, { 2,11,31 }, { 683 }, { 2,2,3,3,19 }, { 5,137 }, { 2,7,7,7 }, { 3,229 }, { 2,2,2,2,43 }, { 13,53 }, { 2,3,5,23 }, { 691 }, { 2,2,173 }, { 3,3,7,11 }, { 2,347 }, { 5,139 }, { 2,2,2,3,29 }, { 17,41 }, { 2,349 }, { 3,233 }, { 2,2,5,5,7 }, { 701 }, { 2,3,3,3,13 }, { 19,37 }, { 2,2,2,2,2,2,11 }, { 3,5,47 }, { 2,353 }, { 7,101 }, { 2,2,3,59 }, { 709 }, { 2,5,71 }, { 3,3,79 }, { 2,2,2,89 }, { 23,31 }, { 2,3,7,17 }, { 5,11,13 }, { 2,2,179 }, { 3,239 }, { 2,359 }, { 719 }, { 2,2,2,2,3,3,5 }, { 7,103 }, { 2,19,19 }, { 3,241 }, { 2,2,181 }, { 5,5,29 }, { 2,3,11,11 }, { 727 }, { 2,2,2,7,13 }, { 3,3,3,3,3,3 }, { 2,5,73 }, { 17,43 }, { 2,2,3,61 }, { 733 }, { 2,367 }, { 3,5,7,7 }, { 2,2,2,2,2,23 }, { 11,67 }, { 2,3,3,41 }, { 739 }, { 2,2,5,37 }, { 3,13,19 }, { 2,7,53 }, { 743 }, { 2,2,2,3,31 }, { 5,149 }, { 2,373 }, { 3,3,83 }, { 2,2,11,17 }, { 7,107 }, { 2,3,5,5,5 }, { 751 }, { 2,2,2,2,47 }, { 3,251 }, { 2,13,29 }, { 5,151 }, { 2,2,3,3,3,7 }, { 757 }, { 2,379 }, { 3,11,23 }, { 2,2,2,5,19 }, { 761 }, { 2,3,127 }, { 7,109 }, { 2,2,191 }, { 3,3,5,17 }, { 2,383 }, { 13,59 }, { 2,2,2,2,2,2,2,2,3 }, { 769 }, { 2,5,7,11 }, { 3,257 }, { 2,2,193 }, { 773 }, { 2,3,3,43 }, { 5,5,31 }, { 2,2,2,97 }, { 3,7,37 }, { 2,389 }, { 19,41 }, { 2,2,3,5,13 }, { 11,71 }, { 2,17,23 }, { 3,3,3,29 }, { 2,2,2,2,7,7 }, { 5,157 }, { 2,3,131 }, { 787 }, { 2,2,197 }, { 3,263 }, { 2,5,79 }, { 7,113 }, { 2,2,2,3,3,11 }, { 13,61 }, { 2,397 }, { 3,5,53 }, { 2,2,199 }, { 797 }, { 2,3,7,19 }, { 17,47 }, { 2,2,2,2,2,5,5 }, { 3,3,89 }, { 2,401 }, { 11,73 }, { 2,2,3,67 }, { 5,7,23 }, { 2,13,31 }, { 3,269 }, { 2,2,2,101 }, { 809 }, { 2,3,3,3,3,5 }, { 811 }, { 2,2,7,29 }, { 3,271 }, { 2,11,37 }, { 5,163 }, { 2,2,2,2,3,17 }, { 19,43 }, { 2,409 }, { 3,3,7,13 }, { 2,2,5,41 }, { 821 }, { 2,3,137 }, { 823 }, { 2,2,2,103 }, { 3,5,5,11 }, { 2,7,59 }, { 827 }, { 2,2,3,3,23 }, { 829 }, { 2,5,83 }, { 3,277 }, { 2,2,2,2,2,2,13 }, { 7,7,17 }, { 2,3,139 }, { 5,167 }, { 2,2,11,19 }, { 3,3,3,31 }, { 2,419 }, { 839 }, { 2,2,2,3,5,7 }, { 29,29 }, { 2,421 }, { 3,281 }, { 2,2,211 }, { 5,13,13 }, { 2,3,3,47 }, { 7,11,11 }, { 2,2,2,2,53 }, { 3,283 }, { 2,5,5,17 }, { 23,37 }, { 2,2,3,71 }, { 853 }, { 2,7,61 }, { 3,3,5,19 }, { 2,2,2,107 }, { 857 }, { 2,3,11,13 }, { 859 }, { 2,2,5,43 }, { 3,7,41 }, { 2,431 }, { 863 }, { 2,2,2,2,2,3,3,3 }, { 5,173 }, { 2,433 }, { 3,17,17 }, { 2,2,7,31 }, { 11,79 }, { 2,3,5,29 }, { 13,67 }, { 2,2,2,109 }, { 3,3,97 }, { 2,19,23 }, { 5,5,5,7 }, { 2,2,3,73 }, { 877 }, { 2,439 }, { 3,293 }, { 2,2,2,2,5,11 }, { 881 }, { 2,3,3,7,7 }, { 883 }, { 2,2,13,17 }, { 3,5,59 }, { 2,443 }, { 887 }, { 2,2,2,3,37 }, { 7,127 }, { 2,5,89 }, { 3,3,3,3,11 }, { 2,2,223 }, { 19,47 }, { 2,3,149 }, { 5,179 }, { 2,2,2,2,2,2,2,7 }, { 3,13,23 }, { 2,449 }, { 29,31 }, { 2,2,3,3,5,5 }, { 17,53 }, { 2,11,41 }, { 3,7,43 }, { 2,2,2,113 }, { 5,181 }, { 2,3,151 }, { 907 }, { 2,2,227 }, { 3,3,101 }, { 2,5,7,13 }, { 911 }, { 2,2,2,2,3,19 }, { 11,83 }, { 2,457 }, { 3,5,61 }, { 2,2,229 }, { 7,131 }, { 2,3,3,3,17 }, { 919 }, { 2,2,2,5,23 }, { 3,307 }, { 2,461 }, { 13,71 }, { 2,2,3,7,11 }, { 5,5,37 }, { 2,463 }, { 3,3,103 }, { 2,2,2,2,2,29 }, { 929 }, { 2,3,5,31 }, { 7,7,19 }, { 2,2,233 }, { 3,311 }, { 2,467 }, { 5,11,17 }, { 2,2,2,3,3,13 }, { 937 }, { 2,7,67 }, { 3,313 }, { 2,2,5,47 }, { 941 }, { 2,3,157 }, { 23,41 }, { 2,2,2,2,59 }, { 3,3,3,5,7 }, { 2,11,43 }, { 947 }, { 2,2,3,79 }, { 13,73 }, { 2,5,5,19 }, { 3,317 }, { 2,2,2,7,17 }, { 953 }, { 2,3,3,53 }, { 5,191 }, { 2,2,239 }, { 3,11,29 }, { 2,479 }, { 7,137 }, { 2,2,2,2,2,2,3,5 }, { 31,31 }, { 2,13,37 }, { 3,3,107 }, { 2,2,241 }, { 5,193 }, { 2,3,7,23 }, { 967 }, { 2,2,2,11,11 }, { 3,17,19 }, { 2,5,97 }, { 971 }, { 2,2,3,3,3,3,3 }, { 7,139 }, { 2,487 }, { 3,5,5,13 }, { 2,2,2,2,61 }, { 977 }, { 2,3,163 }, { 11,89 }, { 2,2,5,7,7 }, { 3,3,109 }, { 2,491 }, { 983 }, { 2,2,2,3,41 }, { 5,197 }, { 2,17,29 }, { 3,7,47 }, { 2,2,13,19 }, { 23,43 }, { 2,3,3,5,11 }, { 991 }, { 2,2,2,2,2,31 }, { 3,331 }, { 2,7,71 }, { 5,199 }, { 2,2,3,83 }, { 997 }, { 2,499 }, { 3,3,3,37 },};
			// Contains the various prime numbers that occur in a given number from 0 to 999, no duplicates. Each number from 0 to 999 has no more than 4 unique prime numbers it consists of.
			static const unsigned short primeNumberFactorizationsUnique[1000][4] = { {},{},{2},{3},{2},{5},{2,3},{7},{2},{3},{2,5},{11},{2,3},{13},{2,7},{3,5},{2},{17},{2,3},{19},{2,5},{3,7},{2,11},{23},{2,3},{5},{2,13},{3},{2,7},{29},{2,3,5},{31},{2},{3,11},{2,17},{5,7},{2,3},{37},{2,19},{3,13},{2,5},{41},{2,3,7},{43},{2,11},{3,5},{23},{47},{2,3},{7},{2,5},{3,17},{2,13},{53},{2,3},{5,11},{2,7},{3,19},{29},{59},{2,3,5},{61},{2,31},{3,7},{2},{5,13},{2,3,11},{67},{2,17},{3,23},{2,5,7},{71},{2,3},{73},{2,37},{3,5},{2,19},{7,11},{2,3,13},{79},{2,5},{3},{2,41},{83},{2,3,7},{5,17},{2,43},{3,29},{2,11},{89},{2,3,5},{7,13},{23},{31},{2,47},{5,19},{2,3},{97},{2,7},{3,11},{2,5},{101},{2,3,17},{103},{2,13},{3,5,7},{2,53},{107},{2,3},{109},{2,5,11},{37},{2,7},{113},{2,3,19},{5,23},{29},{3,13},{2,59},{7,17},{2,3,5},{11},{2,61},{3,41},{2,31},{5},{2,3,7},{127},{2},{3,43},{2,5,13},{131},{2,3,11},{7,19},{2,67},{3,5},{2,17},{137},{2,3,23},{139},{2,5,7},{3,47},{2,71},{11,13},{2,3},{5,29},{2,73},{3,7},{2,37},{149},{2,3,5},{151},{2,19},{3,17},{2,7,11},{5,31},{2,3,13},{157},{2,79},{3,53},{2,5},{7,23},{2,3},{163},{2,41},{3,5,11},{2,83},{167},{2,3,7},{13},{2,5,17},{3,19},{2,43},{173},{2,3,29},{5,7},{2,11},{3,59},{2,89},{179},{2,3,5},{181},{2,7,13},{3,61},{23},{5,37},{2,31},{11,17},{2,47},{3,7},{2,5,19},{191},{2,3},{193},{2,97},{3,5,13},{2,7},{197},{2,3,11},{199},{2,5},{3,67},{2,101},{7,29},{2,3,17},{5,41},{2,103},{3,23},{2,13},{11,19},{2,3,5,7},{211},{2,53},{3,71},{2,107},{5,43},{2,3},{7,31},{2,109},{3,73},{2,5,11},{13,17},{2,37},{223},{2,7},{3,5},{2,113},{227},{2,3,19},{229},{2,5,23},{3,7,11},{29},{233},{2,3,13},{5,47},{2,59},{3,79},{2,7,17},{239},{2,3,5},{241},{2,11},{3},{2,61},{5,7},{2,3,41},{13,19},{2,31},{3,83},{2,5},{251},{2,3,7},{11,23},{2,127},{3,5,17},{2},{257},{2,3,43},{7,37},{2,5,13},{3,29},{2,131},{263},{2,3,11},{53},{2,7,19},{3,89},{2,67},{269},{2,3,5},{271},{2,17},{3,7,13},{2,137},{5,11},{2,3,23},{277},{2,139},{31},{2,5,7},{281},{2,3,47},{283},{2,71},{3,5,19},{2,11,13},{7,41},{2,3},{17},{2,5,29},{3,97},{2,73},{293},{2,3,7},{59},{2,37},{3,11},{2,149},{13,23},{2,3,5},{7,43},{2,151},{3,101},{2,19},{5,61},{2,3,17},{307},{2,7,11},{3,103},{2,5,31},{311},{2,3,13},{313},{2,157},{3,5,7},{2,79},{317},{2,3,53},{11,29},{2,5},{3,107},{2,7,23},{17,19},{2,3},{5,13},{2,163},{3,109},{2,41},{7,47},{2,3,5,11},{331},{2,83},{37},{2,167},{5,67},{2,3,7},{337},{2,13},{3,113},{2,5,17},{11,31},{2,3,19},{7},{2,43},{3,5,23},{2,173},{347},{2,3,29},{349},{2,5,7},{3,13},{2,11},{353},{2,3,59},{5,71},{2,89},{3,7,17},{2,179},{359},{2,3,5},{19},{2,181},{3,11},{2,7,13},{5,73},{2,3,61},{367},{23},{3,41},{2,5,37},{7,53},{2,31},{373},{2,11,17},{3,5},{2,47},{13,29},{2,3,7},{379},{2,5,19},{3,127},{2,191},{383},{2,3},{5,7,11},{2,193},{3,43},{2,97},{389},{2,3,5,13},{17,23},{2,7},{3,131},{2,197},{5,79},{2,3,11},{397},{2,199},{3,7,19},{2,5},{401},{2,3,67},{131},{2,101},{3,5},{2,7,29},{11,37},{2,3,17},{409},{2,5,41},{3,137},{2,103},{7,59},{2,3,23},{5,83},{2,13},{3,139},{2,11,19},{419},{2,3,5,7},{421},{211},{3,47},{2,53},{5,17},{2,3,71},{7,61},{2,107},{3,11,13},{2,5,43},{431},{2,3},{433},{2,7,31},{3,5,29},{2,109},{19,23},{2,3,73},{439},{2,5,11},{3,7},{2,13,17},{443},{2,37},{5,89},{223},{3,149},{2,7},{449},{2,3,5},{11,41},{2,113},{3,151},{227},{5,7,13},{2,3,19},{457},{229},{3,17},{2,5,23},{461},{2,3,7,11},{463},{29},{3,5,31},{233},{467},{2,3,13},{7,67},{2,5,47},{3,157},{2,59},{11,43},{2,3,79},{5,19},{2,7,17},{3,53},{239},{479},{2,3,5},{137},{241},{3,7,23},{2,11},{5,97},{2,3},{487},{2,61},{3,163},{2,5,7},{491},{2,3,41},{17,29},{2,13,19},{3,5,11},{2,31},{71},{2,3,83},{499},{2,5},{3,167},{251},{503},{2,3,7},{5,101},{2,11,23},{3,13},{2,127},{509},{2,3,5,17},{73},{2},{3,19},{257},{5,103},{2,3,43},{11,47},{2,7,37},{3,173},{2,5,13},{521},{2,3,29},{523},{2,131},{3,5,7},{263},{17,31},{2,3,11},{23},{2,53},{3,59},{2,7,19},{13,41},{2,3,89},{5,107},{2,67},{3,179},{269},{7,11},{2,3,5},{541},{271},{3,181},{2,17},{5,109},{2,3,7,13},{547},{2,137},{3,61},{2,5,11},{19,29},{2,3,23},{79},{277},{3,5,37},{2,139},{557},{2,31},{13,43},{2,5,7},{3,11,17},{281},{563},{2,3,47},{5,113},{283},{3,7},{2,71},{569},{2,3,5,19},{571},{2,11,13},{3,191},{2,7,41},{5,23},{2,3},{577},{2,17},{3,193},{2,5,29},{7,83},{2,3,97},{11,53},{2,73},{3,5,13},{293},{587},{2,3,7},{19,31},{2,59},{3,197},{2,37},{593},{2,3,11},{5,7,17},{2,149},{3,199},{2,13,23},{599},{2,3,5},{601},{2,7,43},{3,67},{2,151},{5,11},{2,3,101},{607},{2,19},{3,7,29},{2,5,61},{13,47},{2,3,17},{613},{2,307},{3,5,41},{2,7,11},{617},{2,3,103},{619},{2,5,31},{3,23},{2,311},{7,89},{2,3,13},{5},{2,313},{3,11,19},{2,157},{17,37},{2,3,5,7},{631},{2,79},{3,211},{2,317},{5,127},{2,3,53},{7,13},{2,11,29},{3,71},{2,5},{641},{2,3,107},{643},{2,7,23},{3,5,43},{2,17,19},{647},{2,3},{11,59},{2,5,13},{3,7,31},{2,163},{653},{2,3,109},{5,131},{2,41},{3,73},{2,7,47},{659},{2,3,5,11},{661},{2,331},{3,13,17},{2,83},{5,7,19},{2,37},{23,29},{2,167},{3,223},{2,5,67},{11,61},{2,3,7},{673},{2,337},{3,5},{2,13},{677},{2,3,113},{7,97},{2,5,17},{3,227},{2,11,31},{683},{2,3,19},{5,137},{2,7},{3,229},{2,43},{13,53},{2,3,5,23},{691},{2,173},{3,7,11},{2,347},{5,139},{2,3,29},{17,41},{2,349},{3,233},{2,5,7},{701},{2,3,13},{19,37},{2,11},{3,5,47},{2,353},{7,101},{2,3,59},{709},{2,5,71},{3,79},{2,89},{231},{2,3,7,17},{5,11,13},{2,179},{3,239},{2,359},{719},{2,3,5},{7,103},{2,19},{3,241},{2,181},{5,29},{2,3,11},{727},{2,7,13},{3},{2,5,73},{17,43},{2,3,61},{733},{2,367},{3,5,7},{23},{11,67},{2,3,41},{739},{2,5,37},{3,13,19},{2,7,53},{743},{2,31},{5,149},{2,373},{3,83},{2,11,17},{7,107},{2,3,5},{751},{2,47},{3,251},{2,13,29},{5,151},{2,3,7},{757},{2,379},{3,11,23},{2,5,19},{761},{2,3,127},{7,109},{2,191},{3,5,17},{2,383},{13,59},{2,3},{769},{2,5,7,11},{3,257},{2,193},{773},{2,3,43},{5,31},{2,97},{3,7,37},{2,389},{19,41},{2,3,5,13},{11,71},{2,17,23},{3,29},{2,7},{5,157},{2,3,131},{787},{2,197},{3,263},{2,5,79},{7,113},{2,3,11},{13,61},{2,397},{3,53},{2,199},{797},{2,3,7,19},{17,47},{2,5},{3,89},{2,401},{11,73},{2,3,67},{5,7,23},{2,131},{3,269},{2,101},{809},{2,3,5},{811},{2,7,29},{3,271},{2,11,37},{5,163},{2,3,17},{19,43},{2,409},{3,7,13},{2,5,41},{821},{2,3,137},{823},{2,103},{3,5,11},{2,7,59},{827},{2,3,23},{829},{2,5,83},{3,277},{2,13},{7,17},{2,3,139},{5,167},{2,11,19},{31},{2,419},{839},{2,3,5,7},{29},{2,421},{3,281},{211},{5,13},{2,3,47},{7,11},{2,53},{3,283},{2,5,17},{237},{2,3,71},{853},{2,7,61},{3,5,19},{2,107},{857},{2,3,11,13},{859},{2,5,43},{3,7,41},{2,431},{863},{2,3},{5,173},{2,433},{3,17},{2,7,31},{11,79},{2,3,5,29},{13,67},{2,109},{3,97},{2,19,23},{5,7},{2,3,73},{877},{2,439},{3,293},{2,5,11},{881},{2,3,7},{883},{2,13,17},{3,59},{2,443},{887},{2,37},{7,127},{2,5,89},{3,11},{223},{19,47},{2,3,149},{5,179},{2,7},{3,13,23},{2,449},{29,31},{2,3,5},{17,53},{2,11,41},{3,7,43},{2,113},{5,181},{2,3,151},{907},{227},{3,101},{2,5,7,13},{911},{2,3,19},{11,83},{2,457},{3,5,61},{229},{7,131},{2,3,17},{919},{2,5,23},{307},{2,461},{13,71},{2,3,7,11},{5,37},{2,463},{3,103},{29},{929},{2,3,5,31},{7,19},{233},{311},{2,467},{5,11,17},{2,3,13},{937},{2,7,67},{313},{2,5,47},{941},{2,3,157},{23,41},{2,59},{3,5,7},{2,11,43},{947},{2,3,79},{13,73},{2,5,19},{317},{2,7,17},{953},{2,3,53},{5,191},{239},{3,11,29},{2,479},{7,137},{2,3,5},{31},{2,137},{3,107},{241},{5,193},{2,3,7,23},{967},{2,11},{3,17,19},{2,5,97},{971},{2,3},{7,139},{2,487},{3,5,13},{2,61},{977},{2,3,163},{11,89},{2,5,7},{3,109},{2,491},{983},{2,3,41},{5,197},{2,17,29},{3,7,47},{2,13,19},{23,43},{2,3,5,11},{991},{2,31},{331},{2,71},{5,199},{2,3,83},{997},{2,499},{37}, };
			static const unsigned short primeNumbers[] = { 2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113,127,131,137,139,149,151,157,163,167,173,179,181,191,193,197,199,211,223,227,229,233,239,241,251,257,263,269,271,277,281,283,293,307,311,313,317,331,337,347,349,353,359,367,373,379,383,389,397,401,409,419,421,431,433,439,443,449,457,461,463,467,479,487,491,499,503,509,521,523,541,547,557,563,569,571,577,587,593,599,601,607,613,617,619,631,641,643,647,653,659,661,673,677,683,691,701,709,719,727,733,739,743,751,757,761,769,773,787,797,809,811,821,823,827,829,839,853,857,859,863,877,881,883,887,907,911,919,929,937,941,947,953,967,971,977,983,991,997 };
			static const unsigned char primeNumbersCount = sizeof(primeNumbers) / sizeof(primeNumbers[0]);
			static unsigned short primeNumbersPrevalence[primeNumbersCount]{};
			static unsigned char primeNumbersCountToLimit = primeNumbersCount;
			static unsigned short primeNumberReverseLookup[FPS_GUESS_METHOD2_MSEC_LIMIT][FPS_GUESS_METHOD2_PRIME_REVERSE_LOOKUP_COUNT]{}; // Let's say we detect that prime number 7 is very prevalent in commandTime deltas or velocity deltas. Then we use this lookup table to check which actual values this could indicate. We then cross-reference this list of possibilities with the list of possibilities based on the prime numbers seen in velocity deltas when falling and narrow it down. We limit this to 20 values because for a number like 2, there is hundreds of possible reverse results. With 20 we can detect down to about 25 fps if prime number 2 wins.
			static int lastGravity = -999;
			static unsigned short gravityVelocityDeltas[FPS_GUESS_METHOD2_MSEC_LIMIT]{}; // The velocity deltas resulting from various fps settings based on curent gravity. Lucky for us, this is the same regardless of current downspeed as gravity is constant and we are working in 1 dimension (Z axis)
			//static std::unordered_map<int,int> gravityReverseMsecLookup;

			int currentGravity = cl.snap.ps.gravity ? cl.snap.ps.gravity : 800;
			if (!fpsGuessInitialized || currentGravity != lastGravity) {

				//gravityReverseMsecLookup.clear();
				// Create velocity delta->msec frametime lookup table
				for (int msec = 0; msec < FPS_GUESS_METHOD2_MSEC_LIMIT; msec++) {
					float speed = 0;
					float frametime = 0.001f * (float)msec;
					speed = speed - currentGravity * frametime;
					speed = roundf(speed);
					int velocityDeltaForThisFps = fabsf(speed) + 0.5f;
					//gravityReverseMsecLookup[velocityDeltaForThisFps] = msec;
					gravityVelocityDeltas[msec] = velocityDeltaForThisFps;
				}
				lastGravity = currentGravity;
			}
			if (!fpsGuessInitialized) {
				// Create reverse prime number lookup table
				for (int primeIndex = 0; primeIndex < primeNumbersCount; primeIndex++) {
					int prime = primeNumbers[primeIndex];
					if (prime > FPS_GUESS_METHOD2_MSEC_LIMIT) {
						primeNumbersCountToLimit = primeIndex;
						break;
					}
					int countHere = 0;
					for (int msecOption = 0; msecOption < FPS_GUESS_METHOD2_MSEC_LIMIT; msecOption++) {
						for (int n = 0; n < 4; n++) {
							if (primeNumberFactorizationsUnique[msecOption][n] == prime) {
								if (countHere < (FPS_GUESS_METHOD2_PRIME_REVERSE_LOOKUP_COUNT - 1)) {
									primeNumberReverseLookup[prime][countHere] = msecOption;
								}
								countHere++;
								break;
							}
						}
					}
					primeNumbersPrevalence[primeIndex] = countHere;
				}
				/*for (int prime = 2; prime < FPS_GUESS_METHOD2_MSEC_LIMIT; prime++) {
					int countHere = 0;
					for (int msecOption = 0; msecOption < FPS_GUESS_METHOD2_MSEC_LIMIT; msecOption++) {
						for (int n = 0; n < 4; n++) {
							if (primeNumberFactorizationsUnique[msecOption][n] == i && countHere < (FPS_GUESS_METHOD2_PRIME_REVERSE_LOOKUP_COUNT-1)) {
								primeNumberReverseLookup[prime][countHere++] = msecOption;
								continue;
							}
						}
					}
				}*/
				fpsGuessInitialized = qtrue;
			}

			if (oldCommandTime != cl.snap.ps.commandTime) {
				if (isMovementDown && cls.fpsGuess.lastMovementDown && cl.snap.ps.groundEntityNum == ENTITYNUM_NONE && cl.snap.ps.velocity[2] < cls.fpsGuess.lastVelocity[2]) {
					int downFallDelta = fabsf(cl.snap.ps.velocity[2] - cls.fpsGuess.lastVelocity[2]) + 0.5f;
					if (downFallDelta <= 999) {
						downfallDeltas[downFallDeltaIndex++ % FPS_GUESS_METHOD2_FRAMEAVG_COUNT] = downFallDelta;
					}
				}
				if (cl.snap.ps.commandTime > oldCommandTime) {
					int commandTimeDelta = cl.snap.ps.commandTime - oldCommandTime;
					if (commandTimeDelta <= 999) {
						if (cl_fpsGuessMethod2DebugRandMod->integer) {
							commandTimeDeltas[commandTimeDeltaIndex++ % FPS_GUESS_METHOD2_FRAMEAVG_COUNT] = rand() % cl_fpsGuessMethod2DebugRandMod->integer;
						}
						else {
							commandTimeDeltas[commandTimeDeltaIndex++ % FPS_GUESS_METHOD2_FRAMEAVG_COUNT] = commandTimeDelta;
						}
					}
				}
			}

			// Actual analysis.
			if (downFallDeltaIndex >= FPS_GUESS_METHOD2_FRAMEAVG_COUNT && commandTimeDeltaIndex >= FPS_GUESS_METHOD2_FRAMEAVG_COUNT) {
				static unsigned int commandTimeDeltaPrimeNumberResiduals[primeNumbersCount];
				static unsigned int downFallDeltaPrimeNumberResiduals[primeNumbersCount];
				static float commandTimeDeltaPrimeNumberResidualsCorrected[primeNumbersCount];
				static float downFallDeltaPrimeNumberResidualsCorrected[primeNumbersCount];
				Com_Memset(commandTimeDeltaPrimeNumberResiduals,0,sizeof(commandTimeDeltaPrimeNumberResiduals[0])*primeNumbersCountToLimit);
				Com_Memset(downFallDeltaPrimeNumberResiduals,0,sizeof(downFallDeltaPrimeNumberResiduals[0])*primeNumbersCountToLimit);

				//int smallestCommandTimeDelta = 999999;
				//int smallestDownfallVelocityDelta = 999999;

				for (int frame = 0; frame < FPS_GUESS_METHOD2_FRAMEAVG_COUNT; frame++) {
					for (int primeIndex = 0; primeIndex < primeNumbersCountToLimit; primeIndex++) {
						int prime = primeNumbers[primeIndex];
						downFallDeltaPrimeNumberResiduals[primeIndex] += downfallDeltas[frame] % prime;
						commandTimeDeltaPrimeNumberResiduals[primeIndex] += commandTimeDeltas[frame] % prime;
					}
					//smallestCommandTimeDelta = MIN(smallestCommandTimeDelta, commandTimeDeltas[frame]);
					//smallestDownfallVelocityDelta = MIN(smallestDownfallVelocityDelta, downfallDeltas[frame]);
				}
				
				for (int primeIndex = 0; primeIndex < primeNumbersCountToLimit; primeIndex++) {
					int prime = primeNumbers[primeIndex];
					// "punish" prime numbers that are part of almost any number, to favor more rare prime numbers as they give us a more specific idea?
					// The actual relationship appears to be roughly linear, with 0.45x as the rough factor. With random test data, the prime residual
					// of, say, prime number 20 (I know its not a real prime number lol, just to explain the line) with 1000 frames will be about 9000.
					// Only thing is, the linear line does not go through zero. It goes through 1. So, we subtract 1 from the prime number and divide by it.
					// The 0.45 factor doesn't really matter, we only need to flatten the curve, we don't care about the actual result value. 
					downFallDeltaPrimeNumberResidualsCorrected[primeIndex] = (float)downFallDeltaPrimeNumberResiduals[primeIndex] / (float)(prime - 1); //*= primeNumbersPrevalence[primeIndex];
					commandTimeDeltaPrimeNumberResidualsCorrected[primeIndex] = (float)commandTimeDeltaPrimeNumberResiduals[primeIndex] / (float)(prime - 1); //*= primeNumbersPrevalence[primeIndex];
				}

				if (cl_fpsGuessMethod2DebugDumpPrimeResiduals->integer) {
					std::stringstream ssResidualsCMDTime;
					std::stringstream ssResidualsVelDelta;
					if (cl_fpsGuessMethod2DebugDumpPrimeResiduals->integer == 2) {

						ssResidualsCMDTime << "cmdTimePrimeResiduals \n";
						ssResidualsVelDelta << "velDeltaPrimeResiduals \n";
						for (int primeIndex = 0; primeIndex < primeNumbersCountToLimit; primeIndex++) {
							int prime = primeNumbers[primeIndex];
							ssResidualsCMDTime << prime << "," << commandTimeDeltaPrimeNumberResiduals[primeIndex] << "\n";
							ssResidualsVelDelta << prime << "," << downFallDeltaPrimeNumberResiduals[primeIndex] << "\n";
							// "punish" prime numbers that are part of almost any number, to favor more rare prime numbers as they give us a more specific idea?
							//downFallDeltaPrimeNumberResiduals[primeIndex] *= primeNumbersPrevalence[primeIndex];
							//commandTimeDeltaPrimeNumberResiduals[primeIndex] *= primeNumbersPrevalence[primeIndex];
						}
					}
					else {
						ssResidualsCMDTime << "cmdTimePrimeResiduals [";
						ssResidualsVelDelta << "velDeltaPrimeResiduals [";
						for (int primeIndex = 0; primeIndex < primeNumbersCountToLimit; primeIndex++) {
							//int prime = primeNumbers[primeIndex];
							ssResidualsCMDTime << (primeIndex > 0 ? "," : "") << commandTimeDeltaPrimeNumberResiduals[primeIndex];
							ssResidualsVelDelta << (primeIndex > 0 ? "," : "") << downFallDeltaPrimeNumberResiduals[primeIndex];
							// "punish" prime numbers that are part of almost any number, to favor more rare prime numbers as they give us a more specific idea?
							//downFallDeltaPrimeNumberResiduals[primeIndex] *= primeNumbersPrevalence[primeIndex];
							//commandTimeDeltaPrimeNumberResiduals[primeIndex] *= primeNumbersPrevalence[primeIndex];
						}
						ssResidualsCMDTime << "]\n";
						ssResidualsVelDelta << "]\n";
					}
					Com_Printf("%s\n", ssResidualsCMDTime.str().c_str());
					Com_Printf("%s\n", ssResidualsVelDelta.str().c_str());
					Cvar_Set("cl_fpsGuessMethod2DebugDumpPrimeResiduals", "0");
				}

				// Now let's decide on the prime number with the best results for both commandTime delta and falldown delta.
				float minCommandTimeResidual = INT_MAX;
				int minCommandTimeResidualPrimeIndex = -1;
				float minDownFallResidual = INT_MAX;
				int minDownfallResidualPrimeIndex = -1;
				for (int primeIndex = 0; primeIndex < primeNumbersCountToLimit; primeIndex++) {
					if (downFallDeltaPrimeNumberResidualsCorrected[primeIndex] < minDownFallResidual) {
						minDownFallResidual = downFallDeltaPrimeNumberResidualsCorrected[primeIndex];
						minDownfallResidualPrimeIndex = primeIndex;
					}
					if (commandTimeDeltaPrimeNumberResidualsCorrected[primeIndex] < minCommandTimeResidual) {
						minCommandTimeResidual = commandTimeDeltaPrimeNumberResidualsCorrected[primeIndex];
						minCommandTimeResidualPrimeIndex = primeIndex;
					}
				}

				// Ok now we know the most fitting prime numbers for both downfall velocity change and commandtime delta
				if (minCommandTimeResidualPrimeIndex != -1 && minDownfallResidualPrimeIndex != -1) {
					int commandTimeFavoritePrime = primeNumbers[minCommandTimeResidualPrimeIndex];
					int downFallFavoritePrime = primeNumbers[minDownfallResidualPrimeIndex];
					
					// possibleCommandTimeFpses is now an array of maximum 20 entries that contains the possible msec values (as far as we are guessing anyway).
					unsigned short* possibleCommandTimeFpses = primeNumberReverseLookup[commandTimeFavoritePrime];
					// possibleFallDownVelocityDeltas is now an array of maximum 20 entries that contains the possible velocity delta values (as far as we are guessing anyway).
					unsigned short* possibleFallDownVelocityDeltas = primeNumberReverseLookup[commandTimeFavoritePrime];

					Com_Memset(cls.fpsGuess.method2PossibleMsecValues, 0, sizeof(cls.fpsGuess.method2PossibleMsecValues));
					int possibleFpsesIndex = 0;
					for (int p = 0; p < FPS_GUESS_METHOD2_PRIME_REVERSE_LOOKUP_COUNT; p++) {
						int possibleMsecValue = possibleCommandTimeFpses[p];
						if (possibleMsecValue /* && possibleMsecValue <= smallestCommandTimeDelta*/) {
							for (int o = 0; o < FPS_GUESS_METHOD2_PRIME_REVERSE_LOOKUP_COUNT; o++) {
								int possibleDownfallVelocityDelta = possibleFallDownVelocityDeltas[o];

								if (possibleDownfallVelocityDelta /* && possibleDownfallVelocityDelta <= smallestDownfallVelocityDelta*/) {
									if (gravityVelocityDeltas[possibleMsecValue] == possibleDownfallVelocityDelta) {
										// Found an overlap: Both the command time and downwfall velocity delta values allow for this fps.
										cls.fpsGuess.method2PossibleMsecValues[possibleFpsesIndex++] = possibleMsecValue;
										break;
									}
								}
							}
						}
					}
					
				}
			}

			oldCommandTime = cl.snap.ps.commandTime;
		}else if (cl_fpsGuess->integer == 3) {
			

			static int oldCommandTime = 0;
			static int downFallVelocityDeltasAndMsecDeltas[FPS_GUESS_METHOD3_MAX_FRAMEAVG_COUNT][2]{};
			static int downFallVelocityDeltasAndMsecDeltasIndex = 0;
			static int lastGravity = -999;
			//static float effectiveGravities[FPS_GUESS_METHOD3_MSEC_LIMIT]{}; // The velocity deltas resulting from various fps settings based on curent gravity. Lucky for us, this is the same regardless of current downspeed as gravity is constant and we are working in 1 dimension (Z axis)
			
			int actualFrameCount = MAX(MIN(FPS_GUESS_METHOD3_MAX_FRAMEAVG_COUNT,cl_fpsGuessMethod3FrameAvgCount->integer),1);

			int currentGravity = cl.snap.ps.gravity ? cl.snap.ps.gravity : 800;
			if (currentGravity != lastGravity) {

				//gravityReverseMsecLookup.clear();
				// Create velocity delta->msec frametime lookup table
				for (int msec = 0; msec < FPS_GUESS_METHOD2_MSEC_LIMIT; msec++) {
					float speed = 0;
					float frametime = 0.001f * (float)msec;
					speed = speed - currentGravity * frametime;
					float unroundedSpeed = speed;
					speed = roundf(speed);
					int velocityDeltaForThisFps = fabsf(speed) + 0.5f;
					//gravityReverseMsecLookup[velocityDeltaForThisFps] = msec;
					cls.fpsGuess.method3EffectiveFPSGravities[msec] = currentGravity * speed/ unroundedSpeed;
				}
				lastGravity = currentGravity;
			}

			cls.fpsGuess.lastFrameWasMeasured = qfalse;
			cls.fpsGuess.lastFrameWasSlide = qfalse;
			int commandTimeDelta = cl.snap.ps.commandTime - oldCommandTime;
			static bool lastFrameHadLevitation = false;
			bool frameHasLevitation = cl.snap.ps.fd.forcePowersActive & (1 << FP_LEVITATION);
			if (oldCommandTime != cl.snap.ps.commandTime && oldCommandTime != 0 && cl.snap.ps.commandTime > oldCommandTime) {

				if ((/*(!frameHasLevitation && !lastFrameHadLevitation) || */ (isMovementDown && cls.fpsGuess.lastMovementDown)) && cl.snap.ps.groundEntityNum == ENTITYNUM_NONE && cl.snap.ps.velocity[2] < cls.fpsGuess.lastVelocity[2] && commandTimeDelta <= 999) {

					int downFallDelta = fabsf(cl.snap.ps.velocity[2] - cls.fpsGuess.lastVelocity[2]) + 0.5f;
					if (downFallDelta <= 999) {
						downFallVelocityDeltasAndMsecDeltas[downFallVelocityDeltasAndMsecDeltasIndex % actualFrameCount][0] = downFallDelta;
						downFallVelocityDeltasAndMsecDeltas[downFallVelocityDeltasAndMsecDeltasIndex++ % actualFrameCount][1] = commandTimeDelta;
						cls.fpsGuess.lastFrameWasMeasured = qtrue;

						// Check if we are possibly sliding along some surface
						vec3_t groundTracePoint;
						trace_t trace;
						static vec3_t	playerMins = { -15, -15, DEFAULT_MINS_2 };
						static vec3_t	playerMaxs = { 15, 15, DEFAULT_MAXS_2 };
						groundTracePoint[0] = cl.snap.ps.origin[0];
						groundTracePoint[1] = cl.snap.ps.origin[1];
						groundTracePoint[2] = cl.snap.ps.origin[2] - 0.25;
						CM_BoxTrace(&trace, cl.snap.ps.origin, groundTracePoint, playerMins, playerMaxs, 0, MASK_PLAYERSOLID, qfalse);
						cls.fpsGuess.lastFrameWasSlide = (qboolean)( trace.fraction != 1.0);
					}
				}
			}
			lastFrameHadLevitation = frameHasLevitation;

			Com_Memset(cls.fpsGuess.method3PossibleMsecValues, 0, sizeof(cls.fpsGuess.method3PossibleMsecValues));

			// Actual analysis.
			if (downFallVelocityDeltasAndMsecDeltasIndex >= actualFrameCount) {
				int totalTimeDelta = 0;
				int totalVelocityDelta = 0;
				for (int frame = 0; frame < actualFrameCount; frame++) {
					totalVelocityDelta += downFallVelocityDeltasAndMsecDeltas[frame][0];
					totalTimeDelta += downFallVelocityDeltasAndMsecDeltas[frame][1];
				}
				float effectiveMeasuredGravity = 1000.0f*(float)totalVelocityDelta/(float)totalTimeDelta;

				cls.fpsGuess.method3MeasuredEffectiveGravity = effectiveMeasuredGravity;
				cls.fpsGuess.method3MeasuredGravityGlobalTime += commandTimeDelta;
				cls.fpsGuess.method3MeasuredGravitySamples[cls.fpsGuess.method3MeasuredGravitySamplesIndex % FPS_GUESS_METHOD3_HISTORY_LINE_DRAW_SAMPLES].measuredEffectiveGravity = effectiveMeasuredGravity;
				cls.fpsGuess.method3MeasuredGravitySamples[cls.fpsGuess.method3MeasuredGravitySamplesIndex % FPS_GUESS_METHOD3_HISTORY_LINE_DRAW_SAMPLES].sampleType = cls.fpsGuess.lastFrameWasMeasured ? (cls.fpsGuess.lastFrameWasSlide ? FPSGUESSSAMPLE_MEASURED_SLIDE : FPSGUESSSAMPLE_MEASURED ) : FPSGUESSSAMPLE_REPEAT;
				cls.fpsGuess.method3MeasuredGravitySamples[cls.fpsGuess.method3MeasuredGravitySamplesIndex++ % FPS_GUESS_METHOD3_HISTORY_LINE_DRAW_SAMPLES].globalTime = cls.fpsGuess.method3MeasuredGravityGlobalTime;

				int possibleFpsesIndex = 0;
				for (int msec = 0; msec < FPS_GUESS_METHOD3_MSEC_LIMIT; msec++) {
					if (fabsf(cls.fpsGuess.method3EffectiveFPSGravities[msec]-effectiveMeasuredGravity) < cl_fpsGuessMethod3GravityMatchPrecision->value) {
						cls.fpsGuess.method3PossibleMsecValues[possibleFpsesIndex++] = msec;
						if (possibleFpsesIndex >= FPS_GUESS_METHOD3_POSSIBILITIES_DISPLAY) {
							break;
						}
					}
				}
			}

			oldCommandTime = cl.snap.ps.commandTime;
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

	cl.snapshotReceivedRealTimes[cl.snap.messageNum & PACKET_MASK] = cls.realtime;

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

	// don't set any vars when playing a demo
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

	s = Info_ValueForKey( systemInfo, "sv_referencedPaks" );
	t = Info_ValueForKey( systemInfo, "sv_referencedPakNames" );
	FS_PureServerSetReferencedPaks( s, t );

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

			if ( demoCheckFor103 && i == CS_SERVERINFO ) {
				//This is the big serverinfo string containing the value of the "version" cvar of the server.
				//If we are about to play a demo, we can use this information to ascertain whether this demo was recorded on
				//a 1.03 server.
				if ( CL_ServerVersionIs103( Info_ValueForKey(s, "version") ) ) {
					//A 1.03 demo - set the proper game version internally so parsing snapshots etc won't fail
					MV_SetCurrentGameversion( VERSION_1_03 );
				}

				demoCheckFor103 = false; //No need to check this again while playing the demo.
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
	if (!ezdemoActive) {
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
	else {
		cls.state = CA_ACTIVE;	//for some reason it crashes when loading demo if we dont have this ..
	}
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

	if (ezdemoActive) {
		const char* cmd;
		Cmd_TokenizeString(s);

		cmd = Cmd_Argv(0);

		if (ezdemoBitOptions == EZDEMO_CHATS) {

			if (!strcmp(cmd, "chat") || !strcmp(cmd, "tchat"))
				Com_Printf("%s\n", Cmd_ArgsFrom(1));
			else if (!strcmp(cmd, "print")) {
				void CL_CheckSVStripEdRef(char* buf, const char* str);

				char buf[1024] = { 0 };

				CL_CheckSVStripEdRef(buf, Cmd_ArgsFrom(1));

				Com_Printf("%s", buf);
			}
		}

		if (!strcmp(cmd, "cs")) {
			CL_ConfigstringModified();
			// reparse the string, because CL_ConfigstringModified may have done another Cmd_TokenizeString()
			// Cmd_TokenizeString( s );

			//thx to nerevars cammod For preloading models!
			// if (cam_preloadFiles.integer)
#if 0
			{
				int num;
				char* str;

				index = atoi(Cmd_Argv(1));

				Cmd_TokenizeString(s);
				num = atoi(Cmd_Argv(1));

				str = cl.gameState.stringData + cl.gameState.stringOffsets[index];

				if (num >= CS_MODELS && num < CS_MODELS + MAX_MODELS) {
					re.RegisterModel(str);
				}
				else if (num >= CS_SOUNDS && num < CS_SOUNDS + MAX_MODELS) {

					if (str[0] != '*') {
						S_RegisterSound(str);	// player specific sounds don't register here
					}

				}
				else if (num >= CS_PLAYERS && num < CS_PLAYERS + MAX_CLIENTS) {
					const char* v;
					int     team;
					char	modelName[MAX_QPATH];
					char	skinName[MAX_QPATH];
					char* slash;
					qhandle_t torsoSkin;
					void* ghoul2;

					v = Info_ValueForKey(str, "t");
					team = atoi(v);

					v = Info_ValueForKey(str, "model");
					Q_strncpyz(modelName, v, sizeof(modelName));

					if (team != TEAM_SPECTATOR && modelName[0]) {

						slash = strchr(modelName, '/');
						if (!slash) {
							Q_strncpyz(skinName, "default", sizeof(skinName));
						}
						else {
							Q_strncpyz(skinName, slash + 1, sizeof(skinName));
							*slash = 0;
						}

						if (team == TEAM_RED)
							Q_strncpyz(skinName, "red", sizeof(skinName));
						else if (team == TEAM_BLUE)
							Q_strncpyz(skinName, "blue", sizeof(skinName));

#ifdef XDEVELOPER
						Com_Printf("^3registering player skinmodel in precache: '%s/%s'\n", modelName, skinName);
#endif

						torsoSkin = re.RegisterSkin(va("models/players/%s/model_%s.skin", modelName, skinName));
						G2API_CleanGhoul2Models((CGhoul2Info_v**)&ghoul2);
						G2API_InitGhoul2Model((CGhoul2Info_v**)&ghoul2, va("models/players/%s/model.glm", modelName), 0, torsoSkin, 0, 0, 0);
					}
				}
			}
#endif

			// return qtrue;
		}
	}
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

			if (!ezdemoActive && cgvm)
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


#ifdef CL_EZDEMO
// main ezdemo loop, reading demo messages until end of file.
// what happens next is controlled by CL_DemoCompleted
void CL_Ezemo_JustDoIt(void) {
	while (1) {
		CL_ReadDemoMessage();
	}
}

// #define PDCOUNT		"pdcount"
const char* PDCOUNT = "pdcount";

void CL_EzdemoClearEvents(void) {
	//clear all points of interest before playing
	Cvar_Set(PDCOUNT, "0");
	ezdemoEventCount = 0;
	Com_Memset(&ezDemoBuffer, 0, sizeof(ezDemoBuffer));
}

qboolean CL_StringIsDigitsOnly(const char* buf);

#define	KMHconv 0.050f	// for converting our QU speed into an arbitrary km/h unit, we multiply the QU speed with this number
void CL_PlayDemo_f(void);

typedef struct {
	int attacker, target, mod, time;
} lastObituary_t;

typedef struct {
	int client, team, msg, time;
} lastCtfMessage_t;

//This is.. CRAP
lastObituary_t lastObi;
lastCtfMessage_t lastCtf;

void CL_Ezdemo_f(void) {
	char buf[128] = { 0 };
	int i;
	const int argc = Cmd_Argc();

	if (argc < 2) {
		Com_Printf("Usage: ezdemo <demo name/number> [options] - find events in a demo and fast-forward to them\n");
		Com_Printf("Options include:\n");
		Com_Printf("   dbs    - show dbs frags           [\n");
		Com_Printf("   bs     - show bs frags            [\n");
		Com_Printf("   bluebs - show blue bs frags       [  can be combined\n");
		Com_Printf("   lunge  - show blue uppercut frags [\n");
		Com_Printf("   dfa    - show dfa frags           [\n");
		Com_Printf("   by <clientnum or \"me\">    - show only frags/events by this client\n");
		Com_Printf("   on <clientnum or \"me\">    - show only frags on this client\n");
		Com_Printf("   ret                       - show only frags on flag carriers\n");
		Com_Printf("   flaggrabs                 - show flag grabs\n");
		Com_Printf("   caps                      - show flag captures\n");
		Com_Printf("   {kmh, ups} <speed>\" - set a minimum speed in either km/h or Q3 units that a player must have at the time of the frag/event for it to be shown\n");
		Com_Printf("Examples: ezdemo loltest dbs ret by me\n");
		Com_Printf("          ezdemo loltest ret by 3 kmh 20\n");
		Com_Printf("          ezdemo loltest bs on 5\n");
		return;
	}

	ezdemoFragOptions = 0;
	ezdemoBitOptions = 0;
	ezdemoMinimumSpeed = 0;
	ezdemoShowOnlyKillsOn = -1;
	ezdemoShowOnlyKillsBy = -1;
	ezdemoPlayerstateClientNum = -1;

	CL_EzdemoClearEvents();

	memset(&lastObi, -1, sizeof(lastObituary_t));
	memset(&lastCtf, -1, sizeof(lastCtfMessage_t));

	//read all additional args after demoname
	for (i = 2; i < argc; ++i) {
		Q_strncpyz(buf, Cmd_Argv(i), sizeof(buf));

		if (!Q_stricmpn(buf, "chat", 4)) {
			ezdemoBitOptions = EZDEMO_CHATS;
			break;
		}
#ifdef XDEVELOPER
		else if (!Q_stricmp(buf, "bss")) {
			//show all bs attempts.
			ezdemoFragOptions |= BS_ATTEMPTS;
		}
#endif
		else if (!Q_stricmp(buf, "dbs")) {
			ezdemoFragOptions |= FRAGS_DBS;

		}
		else if (!Q_stricmp(buf, "bs")) {
			ezdemoFragOptions |= FRAGS_BS;
		}
		else if (!Q_stricmp(buf, "dfa")) {
			ezdemoFragOptions |= FRAGS_DFA;
		}
		else if (!Q_stricmp(buf, "doom")) {
			ezdemoFragOptions |= FRAGS_DOOM;
		}
		else if (!Q_stricmp(buf, "lunge") || !Q_stricmp(buf, "uppercut")) {
			ezdemoFragOptions |= FRAGS_LUNGE;
		}
		else if (!Q_stricmp(buf, "bluebs")) {
			ezdemoFragOptions |= FRAGS_BLUEBS;

		}
		else if (!Q_stricmp(buf, "blue")) {
			ezdemoFragOptions |= FRAGS_ABLUE;
		}
		else if (!Q_stricmp(buf, "yellow")) {
			ezdemoFragOptions |= FRAGS_AYELLOW;
		}
		else if (!Q_stricmp(buf, "red")) {
			ezdemoFragOptions |= FRAGS_ARED;
		}
		else if (!Q_stricmp(buf, "ret") || !Q_stricmp(buf, "rets")) {
			ezdemoBitOptions |= EZDEMO_RETS;
		}
		else if (!Q_stricmp(buf, "caps") || !Q_stricmp(buf, "cap")) {
			ezdemoBitOptions |= EZDEMO_CAPTURES;
		}
		else if (CL_StringStartsWith(buf, "flagsteal") || CL_StringStartsWith(buf, "flaggrab")) {
			ezdemoBitOptions |= EZDEMO_FLAGSTEALS;

		}
		else if (!Q_stricmp(buf, "by") || !Q_stricmp(buf, "on")) {
			bool by = tolower(buf[0]) == 'b';

			//What a nice hack!
			int* toEdit = by ? &ezdemoShowOnlyKillsBy : &ezdemoShowOnlyKillsOn;
			const char* argname = by ? "by" : "on";

			Q_strncpyz(buf, Cmd_Argv(++i), sizeof(buf));		//try to read the next arg as clientnum

			const char* fail =
				va("ezdemo: option '%s' only supports client numbers [0 ; %d] or \"me\", e.g. \"/ezdemo testdemo %s 1\"\n",
					argname, MAX_CLIENTS - 1, argname);

			const int cl = atoi(buf);

			if (!Q_stricmp(buf, "ps") || !Q_stricmp(buf, "me") || !Q_stricmp(buf, "self")) {
				*toEdit = EZDEMO_PREDICTEDCLIENT;
			}
			else if (!CL_StringIsDigitsOnly(buf) || !(i < argc) || cl >= MAX_CLIENTS || cl < 0) {
				Com_Printf(fail);
				return;
			}
			else {
				if (!CL_StringIsDigitsOnly(buf) || cl < 0 || cl >= MAX_CLIENTS) {
					Com_Printf(fail);
					return;
				}

				*toEdit = cl;
			}

		}
		else if (!Q_stricmp(buf, "kmh") || !Q_stricmp(buf, "qu") || !Q_stricmp(buf, "ups")) {
			//the user wants to specify the minimum speed for a the guy who did a frag, for it to be shown
			bool kmh = tolower(buf[0]) == 'k';

			Q_strncpyz(buf, Cmd_Argv(++i), sizeof(buf));		//try to read the next arg as speed

			if (!(i < argc) || !CL_StringIsDigitsOnly(buf)) {
				Com_Printf("ezdemo: option 'kmh/qu' needs an additional integer argument containing speed, e.g. \"/ezdemo lolowned kmh 40 dbs\"\n");
				return;
			}

			float speed;


			if (kmh) {
				//use kmh as speed unit
				speed = atof(buf) / KMHconv;	//convert to QU
			}
			else {
				//use qu as speed unit
				speed = atof(buf);
			}

			ezdemoMinimumSpeed = speed;
			// Com_Printf("Minimum speed: %i qu -- %.2f km/h\n", (int)ezdemoMinimumSpeed, ezdemoMinimumSpeed * KMHconv);
		}
		else {
			Com_Printf("Unknown option \"%s\".\n", buf);
			return;
		}
	}

	if (ezdemoShowOnlyKillsOn != -1 && ezdemoBitOptions & EZDEMO_RETS) {
		Com_Printf("ezdemo: \"on <client>\" argument is not supported for rets. You can combine <on> and <by> on non-rets though.\n");
		return;
	}

	if ((ezdemoFragOptions & FRAGS_DOOM) && (ezdemoBitOptions & EZDEMO_RETS)) {
		Com_Printf("ezdemo: it's not possible to see ret-only dooms; try just dooms instead\n");
		return;
	}

	ezdemoEventCount = 0;
	Com_Memset(&ezDemoBuffer, 0, sizeof(ezDemoBuffer));
	ezdemoActive = qtrue;
	CL_PlayDemo_f();
	//everything after here wont be happening in the code. check DemoCompleted instead.
}

static void Ezdemo_HandleEvent(entityState_t state) {
	const int eventType = state.eType - ET_EVENTS;

	if (eventType == EV_OBITUARY && !ezdemoBitOptions) {
		int attacker = state.otherEntityNum2;
		int target = state.otherEntityNum;
		int	mod = state.eventParm;

		if ((ezdemoShowOnlyKillsBy == EZDEMO_PREDICTEDCLIENT && attacker != ezdemoPlayerstateClientNum) ||
			(ezdemoShowOnlyKillsBy != EZDEMO_PREDICTEDCLIENT && ezdemoShowOnlyKillsBy >= 0 && ezdemoShowOnlyKillsBy != attacker)) {
			return;
		}

		if ((ezdemoShowOnlyKillsOn == EZDEMO_PREDICTEDCLIENT && target != ezdemoPlayerstateClientNum) ||
			(ezdemoShowOnlyKillsOn != EZDEMO_PREDICTEDCLIENT && ezdemoShowOnlyKillsOn >= 0 && ezdemoShowOnlyKillsOn != target)) {
			return;
		}


		if (attacker == lastObi.attacker && target == lastObi.target && mod == lastObi.mod && cl.snap.serverTime - lastObi.time < 600) {
			//an identical kill happening 100 ms after one just happened? NO!
#ifdef XDEVELOPER
			Com_Printf("Not adding event at time %d...delta is %d\n", cl.snap.serverTime, cl.snap.serverTime - lastObi.time);
#endif
			return;
		}

		if (attacker != target) {
			if (Ezdemo_ClientValid(attacker)) {

				if ((ezdemoFragOptions & FRAGS_DOOM && mod == MOD_FALLING) || (mod != MOD_FALLING && Ezdemo_CheckOptions(attacker, EV_OBITUARY))) {
					Ezdemo_AddEvent(attacker);

					lastObi.attacker = attacker;
					lastObi.target = target;
					lastObi.mod = mod;
					lastObi.time = cl.snap.serverTime;
				}
			}
		}

	}
	else if (eventType == EV_CTFMESSAGE &&
		ezdemoBitOptions /* & (EZDEMO_RETS | EZDEMO_CAPTURES | EZDEMO_FLAGSTEALS) */) {
		const int clIndex = state.trickedentindex;
		const int teamIndex = state.trickedentindex2;
		const int ctfMsg = state.eventParm;

		if (clIndex == lastCtf.client && teamIndex == lastCtf.team && ctfMsg == lastCtf.msg && ctfMsg != CTFMESSAGE_FRAGGED_FLAG_CARRIER && cl.snap.serverTime - lastCtf.time < 600) {
			//BAD.
			return;
		}


		switch (ctfMsg) {
		case CTFMESSAGE_FRAGGED_FLAG_CARRIER:

			if (!(ezdemoBitOptions & EZDEMO_RETS))
				return;

			if ((ezdemoShowOnlyKillsBy == EZDEMO_PREDICTEDCLIENT && clIndex != ezdemoPlayerstateClientNum) ||
				(ezdemoShowOnlyKillsBy != EZDEMO_PREDICTEDCLIENT && ezdemoShowOnlyKillsBy >= 0 && ezdemoShowOnlyKillsBy != clIndex)) {
				return;
			}

			if (Ezdemo_ClientValid(clIndex)) {
				if (Ezdemo_CheckOptions(clIndex, CTFMESSAGE_FRAGGED_FLAG_CARRIER)) {

					lastCtf.client = clIndex;
					lastCtf.team = teamIndex;
					lastCtf.msg = ctfMsg;
					lastCtf.time = cl.snap.serverTime;

					Ezdemo_AddEvent(clIndex);
				}
			}

			break;

		case CTFMESSAGE_FLAG_RETURNED:
			break;
		case CTFMESSAGE_PLAYER_RETURNED_FLAG:
			break;
		case CTFMESSAGE_PLAYER_CAPTURED_FLAG:

			if (!(ezdemoBitOptions & EZDEMO_CAPTURES))
				return;

			if ((ezdemoShowOnlyKillsBy == EZDEMO_PREDICTEDCLIENT && clIndex != ezdemoPlayerstateClientNum) ||
				(ezdemoShowOnlyKillsBy != EZDEMO_PREDICTEDCLIENT && ezdemoShowOnlyKillsBy >= 0 && ezdemoShowOnlyKillsBy != clIndex)) {
				return;
			}

			if (Ezdemo_ClientValid(clIndex)) {
				if (Ezdemo_CheckOptions(clIndex, CTFMESSAGE_PLAYER_CAPTURED_FLAG)) {
					lastCtf.client = clIndex;
					lastCtf.team = teamIndex;
					lastCtf.msg = ctfMsg;
					lastCtf.time = cl.snap.serverTime;

					Ezdemo_AddEvent(clIndex);
				}
			}

			break;
		case CTFMESSAGE_PLAYER_GOT_FLAG:

			if (!(ezdemoBitOptions & EZDEMO_FLAGSTEALS)) return;

			if ((ezdemoShowOnlyKillsBy == EZDEMO_PREDICTEDCLIENT && clIndex != ezdemoPlayerstateClientNum) ||
				(ezdemoShowOnlyKillsBy != EZDEMO_PREDICTEDCLIENT && ezdemoShowOnlyKillsBy >= 0 && ezdemoShowOnlyKillsBy != clIndex)) {
				return;
			}

			if (Ezdemo_ClientValid(clIndex) && Ezdemo_CheckOptions(clIndex, CTFMESSAGE_PLAYER_GOT_FLAG)) {
				lastCtf.client = clIndex;
				lastCtf.team = teamIndex;
				lastCtf.msg = ctfMsg;
				lastCtf.time = cl.snap.serverTime;

				Ezdemo_AddEvent(clIndex);
			}

			break;

		default:
			break;
		}
	}
}

//Add an event at this cl.serverTime with this client (we wanna be speccing this client at the time of this event).
static void Ezdemo_AddEvent(const int clientNum) {

	ezDemoBuffer.events[ezDemoBuffer.eventCount].serverTime = cl.snap.serverTime;
	ezDemoBuffer.events[ezDemoBuffer.eventCount++].clientNum = clientNum;

	if(ezdemoEventCount < 1000){ // With very long demos we get MAX_CVAR error here, so limit it. For more we need the buffer and write it directly to cgame.
		const char* varname = va("pd%d", ++ezdemoEventCount);
		const char* varval = va("%d\\%d", clientNum, cl.snap.serverTime);

		Cvar_Set(varname, varval);
		Cvar_Get(varname, "", CVAR_INTERNAL | CVAR_ROM);	//ensure this cvar isnt visible to the user.
		Cvar_SetValue(PDCOUNT, ezdemoEventCount);
		Cvar_Get(PDCOUNT, "", CVAR_INTERNAL | CVAR_ROM);	//ensure this cvar isnt visible to the user.
	}
}

// Return true if this client is present in the current snapshot.
static qboolean Ezdemo_ClientValid(const int client) {
	if (client == ezdemoPlayerstateClientNum)
		//good, our playerstate client is always valid (visible)
		return qtrue;

	for (int i = 0; i < cl.snap.numEntities; ++i) {
		const int entNum = (cl.snap.parseEntitiesNum + i) & (MAX_PARSE_ENTITIES - 1);

		entityState_t* ent = &cl.parseEntities[entNum];

		if (ent->number == client && ent->number >= 0 && ent->number < MAX_CLIENTS) {
			return qtrue;
		}
	}

	return qfalse;
}


// Ok, just commented out a lot of crap info that we dont really need in this context.
static void BG_PlayerStateToEntityState(playerState_t* ps, entityState_t* s/* , qboolean snap */) {
	// set the trDelta for flag direction
	VectorCopy(ps->velocity, s->pos.trDelta);

	s->legsAnim = ps->legsAnim;
	s->torsoAnim = ps->torsoAnim;
}

static entityState_t* Ezdemo_EntForClientNum(const int client) {
	if (client == ezdemoPlayerstateClientNum) {

		static entityState_t	ent2 = { 0 };	//need to create an entityState_t here rather than pointing to one
		BG_PlayerStateToEntityState(&cl.snap.ps, &ent2);
		return &ent2;
	}


	for (int i = 0; i < cl.snap.numEntities; ++i) {

		const int entNum = (cl.snap.parseEntitiesNum + i) & (MAX_PARSE_ENTITIES - 1);
		entityState_t* ent = &cl.parseEntities[entNum];

		if (ent->number == client) {
			return ent;
		}
	}

	return NULL;
}

static int Ezdemo_PlayerTorsoAnim(const int client) {

	if (client == ezdemoPlayerstateClientNum)
		return (cl.snap.ps.torsoAnim & ~ANIM_TOGGLEBIT);

	entityState_t* test = Ezdemo_EntForClientNum(client);

	if (test)
		return (test->torsoAnim & ~ANIM_TOGGLEBIT);

	return -1;
}


static float Ezdemo_PlayerSpeed(const int client) {
	vec3_t vel = { 0,0,0 };

	if (client == ezdemoPlayerstateClientNum) {
		VectorCopy(cl.snap.ps.velocity, vel);
	}
	else if (client >= 0 && client < 32) {
		entityState_t* test = Ezdemo_EntForClientNum(client);

		if (!test) {
			return -1;
		}
		else {
			VectorCopy(test->pos.trDelta, vel);
		}
	}
	else {
		return -1;
	}

	const float speedQU = sqrt(vel[0] * vel[0] + vel[1] * vel[1]);	// speed quake units

	return speedQU;
}

//Should this event be displayed based on our preferences and what kind of event it is?
static qboolean Ezdemo_CheckOptions(const int clientNum, const int event) {

	//Only check for speed requirements on regular frags and return frags.
	if (ezdemoMinimumSpeed &&
		(event == EV_OBITUARY || event == CTFMESSAGE_FRAGGED_FLAG_CARRIER)
		) {
		const float speed = Ezdemo_PlayerSpeed(clientNum);

		if (speed < ezdemoMinimumSpeed)
			return qfalse;
	}


	// Dont check animation crap for caps and flaggrabs.
	if (event == CTFMESSAGE_PLAYER_CAPTURED_FLAG || event == CTFMESSAGE_PLAYER_GOT_FLAG)
		return qtrue;



	if (ezdemoFragOptions) {
		const int torsoAnim = Ezdemo_PlayerTorsoAnim(clientNum);


		if (ezdemoFragOptions & FRAGS_DBS) {
			if (torsoAnim == 809)
				return qtrue;
		}
		if (ezdemoFragOptions & FRAGS_BS) {
			if (torsoAnim == 804)
				return qtrue;
		}
		if (ezdemoFragOptions & FRAGS_DFA) {
			if (torsoAnim == 807)
				return qtrue;
		}
		if (ezdemoFragOptions & FRAGS_LUNGE) {
			if (torsoAnim == BOTH_LUNGE2_B__T_)
				return qtrue;
		}
		if (ezdemoFragOptions & FRAGS_BLUEBS) {
			if (torsoAnim == 803)
				return qtrue;
		}

		if (ezdemoFragOptions & FRAGS_ARED) {
			// if (torsoAnim == 803)
			if (torsoAnim <= BOTH_D3_B____ && torsoAnim >= BOTH_A3_T__B_) {

				return qtrue;
			}
		}
		if (ezdemoFragOptions & FRAGS_AYELLOW) {
			if (torsoAnim <= BOTH_D2_B____ && torsoAnim >= BOTH_A2_T__B_) {
				return qtrue;
			}
		}
		if (ezdemoFragOptions & FRAGS_ABLUE) {


			if (torsoAnim <= BOTH_D1_B____ && torsoAnim >= BOTH_A1_T__B_) {
				return qtrue;
			}
		}

		return qfalse;
	}

	return qtrue;
}

#endif
