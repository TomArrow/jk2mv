
#include "server.h"
#include <map>
#include <string>

#ifdef SVDEMO
std::vector<std::unique_ptr<bufferedMessageContainer_t>> demoPreRecordBuffer[MAX_CLIENTS];
std::map<std::string, std::string> demoMetaData[MAX_CLIENTS];
#endif

extern void SV_WriteEOFAndHiddenUcmdMarker(msg_t* buf, int* requiredCurSizeRet);

std::vector<std::unique_ptr<userMessage_t>> userMessages[MAX_CLIENTS];
int userStoredUcmdCounts[MAX_CLIENTS];
/*
=============================================================================

Delta encode a client frame onto the network channel

A normal server packet will look like:

4	sequence number (high bit set if an oversize fragment)
<optional reliable commands>
1	svc_snapshot
4	last client reliable command
4	serverTime
1	lastframe for delta compression
1	snapFlags
1	areaBytes
<areabytes>
<playerstate>
<packetentities>

=============================================================================
*/

/*
=============
SV_EmitPacketEntities

Writes a delta update of an entityState_t list to the message.
=============
*/
static void SV_EmitPacketEntities( clientSnapshot_t *from, clientSnapshot_t *to, msg_t *msg ) {
	entityState_t	*oldent, *newent;
	int		oldindex, newindex;
	int		oldnum, newnum;
	int		from_num_entities;

	// generate the delta update
	if ( !from ) {
		from_num_entities = 0;
	} else {
		from_num_entities = from->num_entities;
	}

	newent = NULL;
	oldent = NULL;
	newindex = 0;
	oldindex = 0;
	while ( newindex < to->num_entities || oldindex < from_num_entities ) {
		if ( newindex >= to->num_entities ) {
			newnum = 9999;
		} else {
			newent = &svs.snapshotEntities[(to->first_entity+(int64_t)newindex) % svs.numSnapshotEntities];
			newnum = newent->number;
		}

		if ( oldindex >= from_num_entities ) {
			oldnum = 9999;
		} else {
			oldent = &svs.snapshotEntities[(from->first_entity+(int64_t)oldindex) % svs.numSnapshotEntities];
			oldnum = oldent->number;
		}

		if ( newnum == oldnum ) {
			// delta update from old position
			// because the force parm is qfalse, this will not result
			// in any bytes being emited if the entity has not changed at all
			MSG_WriteDeltaEntity (msg, oldent, newent, qfalse );
			oldindex++;
			newindex++;
			continue;
		}

		if ( newnum < oldnum ) {
			// this is a new entity, send it from the baseline
			MSG_WriteDeltaEntity (msg, &sv.svEntities[newnum].baseline, newent, qtrue );
			newindex++;
			continue;
		}

		if ( newnum > oldnum ) {
			// the old entity isn't present in the new message
			MSG_WriteDeltaEntity (msg, oldent, NULL, qtrue );
			oldindex++;
			continue;
		}
	}

	MSG_WriteBits( msg, (MAX_GENTITIES-1), GENTITYNUM_BITS );	// end of packetentities
}



/*
==================
SV_WriteSnapshotToClient
==================
*/
static void SV_WriteSnapshotToClient( client_t *client, msg_t *msg, messageType_t msgType ) {
	clientSnapshot_t	*frame, *oldframe;
	int					lastframe;
	int					i;
	int					snapFlags;
#ifdef SVDEMO
	int					deltaMessage;
#endif

	// this is the snapshot we are creating
	frame = &client->frames[ client->netchan.outgoingSequence & PACKET_MASK ];

#ifdef SVDEMO
	// bots never acknowledge, but it doesn't matter since the only use case is for serverside demos
	// in which case we can delta against the very last message every time
	deltaMessage = client->deltaMessage;
	if (client->demo.isBot || client->state == CS_ZOMBIE) { // sometimes we keep zombies around to finish things up. make them acknowledge :)
		deltaMessage = client->deltaMessage = client->netchan.outgoingSequence-1;
	}
	if (msgType == MSG_DEMO) {
		if (client->demo.demowaiting || (sv_demoPreRecord->integer && client->demo.preRecord.keyframeWaiting)) {
			deltaMessage = 0;
		}
		else {
			if (client->demo.lastSnap > client->netchan.outgoingSequence || (client->netchan.outgoingSequence - client->demo.lastSnap) >= (PACKET_BACKUP - 3)) {
				deltaMessage = 0;
				Com_DPrintf("%s: LastSnap %d too old/higher than outgoingSequence %d.\n", client->name, client->demo.lastSnap, client->netchan.outgoingSequence);
			}
			else {
				deltaMessage = client->demo.lastSnap;
			}
		}
		client->demo.lastSnap = client->netchan.outgoingSequence;
	}
#endif

	// try to use a previous frame as the source for delta compressing the snapshot
	if (deltaMessage <= 0 || client->state != CS_ACTIVE ) {
		// client is asking for a retransmit
		oldframe = NULL;
		lastframe = 0;
	} else if ( client->netchan.outgoingSequence - deltaMessage
		>= (PACKET_BACKUP - 3) ) {
		// client hasn't gotten a good message through in a long time
		if (com_developer->integer > 5 || !(client->deltaMessageWarning & 1) || client->deltaMessageWarningLast < (svs.time - 1000) || svs.time < client->deltaMessageWarningLast) { // debug spam reduction
			Com_DPrintf("%s: Delta request from out of date packet (msgType %d).\n", client->name, msgType);
			client->deltaMessageWarning |= 1;
			client->deltaMessageWarningLast = svs.time;
		}
		oldframe = NULL;
		lastframe = 0;
	} 
#ifdef SVDEMO
	// sv_demoSpaceSaving explanation:
	// when activated, demos get snapshots separate from the clients, with tighter deltas.
	// which means, we no longer have to force clients to also receive the non-deltas when starting demos/keyframing pre-record
	// and minDeltaFrame becomes completely irrelevant because we only need a single non-delta at the start of the demo.
	else if ((!sv_demoSpaceSaving->integer || msgType == MSG_DEMO) && client->demo.demorecording && client->demo.demowaiting) {
		// demo is waiting for a non-delta-compressed frame for this client, so don't delta compress
		oldframe = NULL;
		lastframe = 0;
	}
	else if (!sv_demoSpaceSaving->integer && client->demo.minDeltaFrame > deltaMessage) {
		// we saved a non-delta frame to the demo and sent it to the client, but the client didn't ack it
		// we can't delta against an old frame that's not in the demo without breaking the demo.  so send
		// non-delta frames until the client acks.
		oldframe = NULL;
		lastframe = 0;
	}
	else if ((!sv_demoSpaceSaving->integer || msgType == MSG_DEMO) && sv_demoPreRecord->integer && client->demo.preRecord.keyframeWaiting) {
		// demo is waiting for a non-delta-compressed frame for this client, so don't delta compress
		oldframe = NULL;
		lastframe = 0;
	}
	else if (!sv_demoSpaceSaving->integer && sv_demoPreRecord->integer && client->demo.preRecord.minDeltaFrame > deltaMessage) {
		// we saved a non-delta frame to the pre-record buffer and sent it to the client, but the client didn't ack it
		// we can't delta against an old frame that's not in the demo without breaking the demo.  so send
		// non-delta frames until the client acks.
		oldframe = NULL;
		lastframe = 0;
	}
#endif
	else {
		// we have a valid snapshot to delta from
		oldframe = &client->frames[deltaMessage & PACKET_MASK ];
		lastframe = client->netchan.outgoingSequence - deltaMessage;

		// the snapshot's entities may still have rolled off the buffer, though
		if ( oldframe->first_entity <= svs.nextSnapshotEntities - svs.numSnapshotEntities ) {
			if (com_developer->integer > 5 || !(client->deltaMessageWarning & 2) || client->deltaMessageWarningLast < (svs.time - 1000) || svs.time < client->deltaMessageWarningLast) { // debug spam reduction
				Com_DPrintf("%s: Delta request from out of date entities. (msgType %d)\n", client->name, msgType);
				client->deltaMessageWarning |= 2;
				client->deltaMessageWarningLast = svs.time;
			}
			oldframe = NULL;
			lastframe = 0;
		}
	}

#ifdef SVDEMO
	if ((!sv_demoSpaceSaving->integer || msgType == MSG_DEMO)) {
		if (oldframe == NULL) {
			if (client->demo.demowaiting) {
				// this is a non-delta frame, so we can delta against it in the demo
				client->demo.minDeltaFrame = client->netchan.outgoingSequence;
			}
			client->demo.demowaiting = qfalse;
			if (client->demo.preRecord.keyframeWaiting) {
				// this is a non-delta frame, so we can delta against it in the demo
				client->demo.preRecord.minDeltaFrame = client->netchan.outgoingSequence;
			}
			client->demo.preRecord.keyframeWaiting = qfalse;
		}
		else {
			if (!client->demo.preRecord.keyframeWaiting) {
				// We got the frame we needed acked, so reset this to 0
				// to avoid any potential shenanigans after map changes or so
				client->demo.preRecord.minDeltaFrame = 0;
			}
			if (!client->demo.demowaiting) {
				// We got the frame we needed acked, so reset this to 0
				// to avoid any potential shenanigans after map changes or so
				client->demo.minDeltaFrame = 0;
			}
		}
	}
#endif

	MSG_WriteByte (msg, svc_snapshot);

	// NOTE, MRE: now sent at the start of every message from server to client
	// let the client know which reliable clientCommands we have received
	//MSG_WriteLong( msg, client->lastClientCommand );

	// send over the current server time so the client can drift
	// its view of time to try to match
	if( client->oldServerTime 
#ifdef SVDEMO
		&& !(client->demo.demorecording && client->demo.isBot)
#endif
		) {
		// The server has not yet got an acknowledgement of the
		// new gamestate from this client, so continue to send it
		// a time as if the server has not restarted. Note from
		// the client's perspective this time is strictly speaking
		// incorrect, but since it'll be busy loading a map at
		// the time it doesn't really matter.
		MSG_WriteLong (msg, sv.time + client->oldServerTime);
	} else {
		MSG_WriteLong (msg, sv.time);
	}

	// what we are delta'ing from
	MSG_WriteByte (msg, lastframe);

	snapFlags = svs.snapFlagServerBit;
	if ( client->rateDelayed ) {
		snapFlags |= SNAPFLAG_RATE_DELAYED;
	}
	if ( client->state != CS_ACTIVE ) {
		if (!(client->state == CS_ZOMBIE && client->zombified)) { // ruins demos if we add this snapFlag, will draw a loading screen
			snapFlags |= SNAPFLAG_NOT_ACTIVE;
		}
	}

	MSG_WriteByte (msg, snapFlags);

	// send over the areabits
	MSG_WriteByte (msg, frame->areabytes);
	MSG_WriteData (msg, frame->areabits, frame->areabytes);

	// delta encode the playerstate
	if ( oldframe ) {
		MSG_WriteDeltaPlayerstate( msg, &oldframe->ps, &frame->ps );
	} else {
		MSG_WriteDeltaPlayerstate( msg, NULL, &frame->ps );
	}

	// delta encode the entities
	SV_EmitPacketEntities (oldframe, frame, msg);

	// padding for rate debugging
	if ( sv_padPackets->integer ) {
		for ( i = 0 ; i < sv_padPackets->integer ; i++ ) {
			MSG_WriteByte (msg, svc_nop);
		}
	}
}


/*
==================
SV_UpdateServerCommandsToClient

(re)send all server commands the client hasn't acknowledged yet
==================
*/
void SV_UpdateServerCommandsToClient( client_t *client, msg_t *msg, messageType_t msgType) {
	SV_UpdateServerCommandsToClient( client, msg, qfalse, msgType );
}

qboolean SV_UpdateServerCommandsToClient( client_t *client, msg_t *msg, qboolean allowPartial, messageType_t msgType) {
	int		i;
	int		reliableAcknowledge;
	int		countSent = 0;

#ifdef SVDEMO
	if (client->demo.isBot && client->demo.demorecording) {
		reliableAcknowledge = client->demo.botReliableAcknowledge;
	}
	else if (msgType == MSG_DEMO) {
		reliableAcknowledge = client->demo.clientDemoReliableAcknowledge;
		if (client->demo.clientDemoReliableAcknowledge < client->reliableAcknowledge) {
			reliableAcknowledge = client->reliableAcknowledge; // in case we somehow didn't properly update client->demo.clientDemoReliableAcknowledge when we needed to.
		}
		if (reliableAcknowledge > client->reliableSequence) {
			reliableAcknowledge = client->reliableSequence; // just in case client (for whatever reason) sends malicious numbers here or it somehow gets confused otherwise.
			Com_Printf("^1reliableAcknowledge > client->reliableSequence for demo message. How tf.");
			// TODO Cleint could still cause us to drop servercommands from demo? not nice. fix somehow?
		}
	}
	else
#endif
	{
		reliableAcknowledge = client->reliableAcknowledge;
	}

	// write any unacknowledged serverCommands
	for ( i = client->reliableAcknowledge + 1 ; i <= client->reliableSequence ; i++, countSent++) {
		// msg overflow checks for 4 byte internally; we want to write svc_servercommand (1 byte), the index (4 byte) and the string and 0 terminator (1 byte)
		// also, multiply with 2 because worst theoretical case each byte might end up 2 bytes with huffman
		if ( sv_dynamicSnapshots->integer && allowPartial && msg->maxsize - msg->cursize - 4 < 2 * (1 + 4 + (int)strlen(client->reliableCommands[i & (MAX_RELIABLE_COMMANDS-1)]) + 1) ) {
			client->reliableSent = i - 1;
			return qfalse;
		}

		// try to reduce the risk of a "CL_GetServerCommand: a reliable command was cycled out" error by limiting the total amount of 
		// new servercommands we send in a single message
		// This server is modded to have a higher serverside buffer (MAX_RELIABLE_COMMANDS) than a vanilla client
		// So don't send more than the client will conservatively be able to process
		// Also consider demo playback, so do like half of what the client would probably be able to handle because 
		// it might parse two messages in a single frame. I suppose it might parse even more but oh well, nothing is perfect.
		if ( sv_dynamicSnapshots->integer && allowPartial && countSent >= (MAX_RELIABLE_COMMANDS_VANILLA/2)) {
			client->reliableSent = i - 1;
			return qfalse;
		}

		MSG_WriteByte( msg, svc_serverCommand );
		MSG_WriteLong( msg, i );
		MSG_WriteString( msg, client->reliableCommands[ i & (MAX_RELIABLE_COMMANDS-1) ] );
	}
	client->reliableSent = client->reliableSequence;
	return qtrue;
}

/*
=============================================================================

Build a client snapshot structure

=============================================================================
*/
typedef enum snapshotEntityPriority_s {
	SSPRIO_BROADCAST,
	SSPRIO_MVSNAPSHOTENFORCE,
	SSPRIO_MVSNAPSHOTENFORCEREAL,
	SSPRIO_PORTAL,
	SSPRIO_VISIBLE,
	SSPRIO_AUTODEMOSPECTATOR, // might wanna apply the same distinctions as with specall? since it seems to be basically the same thing
	SSPRIO_SPECALLPLAYER,
	SSPRIO_SPECALLPLAYEREVENT,
	SSPRIO_SPECALLG2ENT,
	SSPRIO_SPECALLMOVER,
	SSPRIO_SPECALL,
	SSPRIO_SPECALLFX,
	SSPRIO_SPECALLSPEAKER,
	SSPRIO_SPECALLTRIGGER,
} snapshotEntityPriority_t;

typedef struct snapshotEntity_s {
	int							number;
	snapshotEntityPriority_t	priority; // during filtering: lower priority: more likely to stay
	float						distance;
} snapshotEntity_t;

//#define	MAX_SNAPSHOT_ENTITIES	256
typedef struct {
	int					numSnapshotEntities;
	snapshotEntity_t	snapshotEntitiesRaw[MAX_SNAPSHOT_ENTITIES_SERVER]; // will get filtered to snapshotEntities
	int					snapshotEntities[MAX_SNAPSHOT_ENTITIES_SERVER];
} snapshotEntityNumbers_t;




/*
=======================
SV_QsortSnapshotEntitiesByPriority
=======================
*/
static int QDECL SV_QsortSnapshotEntitiesByPriority(const void* a, const void* b) {
	snapshotEntity_t* ea, * eb;

	ea = (snapshotEntity_t*)a;
	eb = (snapshotEntity_t*)b;

	if (ea->priority == eb->priority) {
		if (ea->distance == eb->distance) {
			return 0;
		}
		if (ea->distance < eb->distance) {
			return -1;
		}
		return 1;
	}

	if (ea->priority < eb->priority) {
		return -1;
	}

	return 1;
}

/*
=======================
SV_QsortEntityNumbers
=======================
*/
static int QDECL SV_QsortEntityNumbers( const void *a, const void *b ) {
	const int	*ea, *eb;

	ea = (const int *)a;
	eb = (const int *)b;

	if ( *ea == *eb ) {
		Com_Error( ERR_DROP, "SV_QsortEntityStates: duplicated entity" );
	}

	if ( *ea < *eb ) {
		return -1;
	}

	return 1;
}


/*
===============
SV_AddEntToSnapshot
===============
*/
static void SV_AddEntToSnapshot( svEntity_t *svEnt, sharedEntity_t *gEnt, snapshotEntityNumbers_t *eNums, snapshotEntityPriority_t priority, float distance) {
	// if we have already added this entity to this snapshot, don't add again
	if ( svEnt->snapshotCounter == sv.snapshotCounter ) {
		return;
	}
	svEnt->snapshotCounter = sv.snapshotCounter;

	// if we are full, silently discard entities
	if ( eNums->numSnapshotEntities == MAX_SNAPSHOT_ENTITIES_SERVER ) {
		return;
	}

	eNums->snapshotEntitiesRaw[eNums->numSnapshotEntities].number = gEnt->s.number;
	eNums->snapshotEntitiesRaw[eNums->numSnapshotEntities].priority = priority;
	eNums->snapshotEntitiesRaw[eNums->numSnapshotEntities].distance = distance;
	eNums->numSnapshotEntities++;
}

/*
===============
SV_AddEntitiesVisibleFromPoint
===============
*/
static void SV_AddEntitiesVisibleFromPoint( vec3_t origin, clientSnapshot_t *frame,
									snapshotEntityNumbers_t *eNums, qboolean portal, int realClientNum ) {
	int		e, i;
	sharedEntity_t *ent;
	svEntity_t	*svEnt;
	int		l;
	int		clientarea, clientcluster;
	int		leafnum;
	int		c_fullsend;
	byte	*clientpvs;
	byte	*bitvector;
	vec3_t	difference;
	float	length, radius, distance;

	// during an error shutdown message we may need to transmit
	// the shutdown message after the server has shutdown, so
	// specfically check for it
	if ( !sv.state ) {
		return;
	}

	leafnum = CM_PointLeafnum (origin);
	clientarea = CM_LeafArea (leafnum);
	clientcluster = CM_LeafCluster (leafnum);

	// calculate the visible areas
	frame->areabytes = CM_WriteAreaBits( frame->areabits, clientarea );

	clientpvs = CM_ClusterPVS (clientcluster);

	c_fullsend = 0;

	for ( e = 0 ; e < sv.num_entities ; e++ ) {
		ent = SV_GentityNum(e);

		// never send entities that aren't linked in
		if ( !ent->r.linked ) {
			continue;
		}

		if (ent->s.number != e) {
			Com_DPrintf ("FIXING ENT->S.NUMBER!!!\n");
			ent->s.number = e;
		}

		// calculate the distance (for priority sorting)
		VectorAdd(ent->r.absmax, ent->r.absmin, difference);
		VectorScale(difference, 0.5f, difference);
		VectorSubtract(origin, difference, difference);
		length = VectorLength(difference);
		VectorSubtract(ent->r.absmax, ent->r.absmin, difference);
		radius = VectorLength(difference);
		distance = length - radius;

		svEnt = SV_SvEntityForGentity( ent );

		if ( sv.gentitiesMV != NULL && sv.gentitySizeMV > 0 )
		{
			mvsharedEntity_t *mvEnt = MV_EntityNum(e);

			if ( VM_MVAPILevel( gvm ) >= 2 ) {
				// MV entities can be flagged to be sent only to
				// spectators or non-spectators
				if ( frame->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR ||
					(frame->ps.pm_flags & PMF_FOLLOW) )
				{
					if ( mvEnt->mvFlags & MVF_NOSPEC )
						continue;
				}
				else
				{
					if ( mvEnt->mvFlags & MVF_SPECONLY )
						continue;
				}
			}

			// MV entities can be flagged to be sent only to specific
			// clients (can't filter following spectators this way)
			if (mvEnt->snapshotIgnore[frame->ps.clientNum])
			{
				continue;
			}
			else if ( mvEnt->snapshotEnforce[frame->ps.clientNum] )
			{
				SV_AddEntToSnapshot( svEnt, ent, eNums, SSPRIO_MVSNAPSHOTENFORCE, distance);
				continue;
			}

			if (com_coolApi_supported_game->integer & COOL_APIFEATURE_MVSHAREDENTITY_REALCLIENTS) {
				if (mvEnt->snapshotIgnoreRealClient[realClientNum])
				{
					continue;
				}
				else if (mvEnt->snapshotEnforceRealClient[realClientNum])
				{
					SV_AddEntToSnapshot(svEnt, ent, eNums, SSPRIO_MVSNAPSHOTENFORCEREAL, distance);
					continue;
				}
			}
		}

		// entities can be flagged to explicitly not be sent to the client
		if ( ent->r.svFlags & SVF_NOCLIENT ) {
			continue;
		}

		// entities can be flagged to be sent to only one client
		if ( ent->r.svFlags & SVF_SINGLECLIENT ) {
			if ( ent->r.singleClient != frame->ps.clientNum ) {
				continue;
			}
		}
		// entities can be flagged to be sent to everyone but one client
		if ( ent->r.svFlags & SVF_NOTSINGLECLIENT ) {
			if ( ent->r.singleClient == frame->ps.clientNum ) {
				continue;
			}
		}

		// don't double add an entity through portals
		if ( svEnt->snapshotCounter == sv.snapshotCounter ) {
			continue;
		}

		// broadcast entities are always sent, and so is the main player so we don't see noclip weirdness
		if ( ent->r.svFlags & SVF_BROADCAST || (e == frame->ps.clientNum) || (ent->r.broadcastClients[frame->ps.clientNum/32] & (1<<(frame->ps.clientNum%32))))
		{
			SV_AddEntToSnapshot( svEnt, ent, eNums, SSPRIO_BROADCAST, distance);
			continue;
		}

#ifdef SVDEMO
		if (sv_autoDemo->integer == 2) //How find out how to only add all entities for the bot named RECORDER, not all bots? what entities can we still exclude?
		{
			sharedEntity_t* ent2;
			ent2 = SV_GentityNum(frame->ps.clientNum);
			if (ent2->r.svFlags & SVF_BOT && /* ent2->playerState->*/frame->ps.pm_type == PM_SPECTATOR) {
				SV_AddEntToSnapshot(svEnt, ent, eNums, SSPRIO_AUTODEMOSPECTATOR, distance);
				continue;
			}
		}
#endif
		

		// ignore if not touching a PV leaf
		// check area
		if ( !CM_AreasConnected( clientarea, svEnt->areanum ) ) {
			// doors can legally straddle two areas, so
			// we may need to check another one
			if ( !CM_AreasConnected( clientarea, svEnt->areanum2 ) ) {
				goto vischeckfailed;		// blocked by a door
			}
		}

		bitvector = clientpvs;

		// check individual leafs
		if ( !svEnt->numClusters ) {
			goto vischeckfailed;
		}
		l = 0;
		for ( i=0 ; i < svEnt->numClusters ; i++ ) {
			l = svEnt->clusternums[i];
			if ( bitvector[l >> 3] & (1 << (l&7) ) ) {
				break;
			}
		}

		// if we haven't found it to be visible,
		// check overflow clusters that coudln't be stored
		if ( i == svEnt->numClusters ) {
			if ( svEnt->lastCluster ) {
				for ( ; l <= svEnt->lastCluster ; l++ ) {
					if ( bitvector[l >> 3] & (1 << (l&7) ) ) {
						break;
					}
				}
				if ( l == svEnt->lastCluster ) {
					goto vischeckfailed;	// not visible
				}
			} else {
				goto vischeckfailed;
			}
		}

		// add it
		SV_AddEntToSnapshot( svEnt, ent, eNums, SSPRIO_VISIBLE, distance);

		// if its a portal entity, add everything visible from its camera position
		if ( ent->r.svFlags & SVF_PORTAL ) {
			if ( ent->s.generic1 ) {
				vec3_t dir;
				VectorSubtract(ent->s.origin, origin, dir);
				if ( VectorLengthSquared(dir) > (float) ent->s.generic1 * ent->s.generic1 ) {
					continue;
				}
			}
			SV_AddEntitiesVisibleFromPoint( ent->s.origin2, frame, eNums, qtrue, realClientNum );
		}

		vischeckfailed:

		// If server has sv_specAllEnts set, spectators receive all entities.
		if (sv_specAllEnts->integer && (frame->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR ||
			(frame->ps.pm_flags & PMF_FOLLOW)))
		{
			snapshotEntityPriority_t priority = SSPRIO_SPECALL;
			if (ent->s.eType == ET_PLAYER) {
				priority = SSPRIO_SPECALLPLAYER; // players are higher priority
			}
			else if (ent->s.eType == ET_GRAPPLE) {
				priority = SSPRIO_SPECALLG2ENT; // player g2 ents are higher priority
			}
			else if (ent->s.eFlags & EF_PLAYER_EVENT) {
				priority = SSPRIO_SPECALLPLAYEREVENT;
			}
			else if (ent->s.eType == ET_MOVER) {
				priority = SSPRIO_SPECALLMOVER; // movers should be visible, so decently high priority
			}
			else if (ent->s.eType == ET_SPEAKER) {
				priority = SSPRIO_SPECALLSPEAKER; // movers should be visible, so decently high priority
			}
			else if (ent->s.eType == ET_PUSH_TRIGGER || ent->s.eType == ET_TELEPORT_TRIGGER) {
				priority = SSPRIO_SPECALLTRIGGER; // triggers have lower priority (not visible in spec anyway)
			}
			SV_AddEntToSnapshot(svEnt, ent, eNums, priority, distance);
			continue;
		}

	}
}

/*
=============
SV_BuildClientSnapshot

Decides which entities are going to be visible to the client, and
copies off the playerstate and areabits.

This properly handles multiple recursive portals, but the render
currently doesn't.

For viewing through other player's eyes, clent can be something other than client->gentity
=============
*/
static void SV_BuildClientSnapshot( client_t *client ) {
	vec3_t						org;
	clientSnapshot_t			*frame;
	snapshotEntityNumbers_t		entityNumbers;
	int							i, maxSnapEnts;
	sharedEntity_t				*ent;
	entityState_t				*state;
	svEntity_t					*svEnt;
	sharedEntity_t				*clent;
	playerState_t				*ps;

	// bump the counter used to prevent double adding
	sv.snapshotCounter++;

	// this is the frame we are creating
	frame = &client->frames[ client->netchan.outgoingSequence & PACKET_MASK ];

	// clear everything in this snapshot
	entityNumbers.numSnapshotEntities = 0;
	Com_Memset(frame->areabits, 0, sizeof(frame->areabits));

	frame->num_entities = 0;

	clent = client->gentity;
	if (!clent || client->state == CS_ZOMBIE && !client->zombified) {
		return;
	}

	// grab the current playerState_t
	ps = SV_GameClientNum(client - svs.clients);
	if (VM_GetGameversion(gvm) != VERSION_1_02 || mvStructConversionDisabled) {
		frame->ps = *ps;
	}
	else {
		// tricky but works atleast on x86
		playerState15_t* ps15 = (playerState15_t*)ps;

		memcpy(&frame->ps, ps15, ((char*)&ps15->saberIndex) - (char*)ps15);
		memcpy(&frame->ps.saberIndex, &ps15->saberIndex, (char*)&(ps15)[1] - (char*)&ps15->saberIndex);
	}


	int							clientNum;
	// never send client's own entity, because it can
	// be regenerated from the playerstate
	clientNum = frame->ps.clientNum;
	if (clientNum < 0 || clientNum >= MAX_GENTITIES) {
		Com_Error(ERR_DROP, "SV_SvEntityForGentity: bad gEnt");
	}
	svEnt = &sv.svEntities[clientNum];
	svEnt->snapshotCounter = sv.snapshotCounter;


	// find the client's viewpoint
	VectorCopy(ps->origin, org);
	org[2] += ps->viewheight;

	// add all the entities directly visible to the eye, which
	// may include portal entities that merge other viewpoints
	SV_AddEntitiesVisibleFromPoint(org, frame, &entityNumbers, qfalse, client - svs.clients);

	maxSnapEnts = client->customSnapEntCount ? client->customSnapEntCount : MAX_SNAPSHOT_ENTITIES_SERVER;
	if (entityNumbers.numSnapshotEntities > maxSnapEnts) {
		// this is a normal client who would rather not receive more than the usual vanilla 256 ents per snapshot.
		// pre-sort by priority
		qsort(entityNumbers.snapshotEntitiesRaw, entityNumbers.numSnapshotEntities,
			sizeof(entityNumbers.snapshotEntitiesRaw[0]), SV_QsortSnapshotEntitiesByPriority);
		// then limit
		entityNumbers.numSnapshotEntities = maxSnapEnts;
	}

	for (i = 0; i < entityNumbers.numSnapshotEntities; i++) {
		entityNumbers.snapshotEntities[i] = entityNumbers.snapshotEntitiesRaw[i].number;
	}

	// if there were portals visible, there may be out of order entities
	// in the list which will need to be resorted for the delta compression
	// to work correctly.  This also catches the error condition
	// of an entity being included twice.
	// TA: this is needed now anyway since we pre-sort by priority.
	qsort(entityNumbers.snapshotEntities, entityNumbers.numSnapshotEntities,
		sizeof(entityNumbers.snapshotEntities[0]), SV_QsortEntityNumbers);

	// now that all viewpoint's areabits have been OR'd together, invert
	// all of them to make it a mask vector, which is what the renderer wants
	for (i = 0; i < MAX_MAP_AREA_BYTES / 4; i++) {
		((int*)frame->areabits)[i] = ((int*)frame->areabits)[i] ^ -1;
	}

	// copy the entity states out
	frame->num_entities = 0;
	frame->first_entity = svs.nextSnapshotEntities;
	for (i = 0; i < entityNumbers.numSnapshotEntities; i++) {
		ent = SV_GentityNum(entityNumbers.snapshotEntities[i]);
		state = &svs.snapshotEntities[svs.nextSnapshotEntities % svs.numSnapshotEntities];
		*state = ent->s;
		svs.nextSnapshotEntities++;
		// this should never hit, map should always be restarted first in SV_Frame
		if (svs.nextSnapshotEntities >= 0x7FFFFFFFFFFFFFFE) {
			Com_Error(ERR_FATAL, "svs.nextSnapshotEntities wrapped");
		}
		frame->num_entities++;
	}
}


/*
====================
SV_RateMsec

Return the number of msec a given size message is supposed
to take to clear, based on the current rate
====================
*/
#define	HEADER_RATE_BYTES	48		// include our header, IP header, and some overhead
static int SV_RateMsec(client_t* client, int messageSize) {
	int		rate = SV_ClientRate(client);
	int		rateMsec;

	// individual messages will never be larger than fragment size
	if (messageSize > 1500) {
		messageSize = 1500;
	}
	rateMsec = (messageSize + HEADER_RATE_BYTES) * 1000 / rate;

	return rateMsec;
}

#define EF_SEGMENTEDREPLAY	0x08000000		// is in a segmented replay

int SV_GetClientSnapshotMsec(client_t* client) {
	playerState_t* ps = SV_GameClientNum(client - svs.clients);
	qboolean spectator = (qboolean)(ps && ((ps->pm_flags & PMF_FOLLOW) || ps->persistant[PERS_TEAM] == TEAM_SPECTATOR));

	if (com_coolApi_supported_game_vmflags && (com_coolApi_supported_game_vmflags->integer & COOL_APIFEATURE_VMGAME_FLAG_SEGMENTEDREPLAY)){
		if (ps->eFlags & EF_SEGMENTEDREPLAY) {
			spectator = qfalse;
		}
		// this sadly also means a spectator won't be able to set lower snaps if he's spectating someone in a segmented replay. but oh well!
	}

	return spectator ? client->snapshotMsecSpec : client->snapshotMsec;
}

#ifdef SVDEMO
extern void SV_WriteDemoMessage(client_t* cl, demoInfo_t* demo, msg_t* msg, int headerBytes);
// defined in sv_client.cpp
extern void SV_CreateClientGameStateMessage(client_t* client, msg_t* msg);
#endif
/*
=======================
SV_SendMessageToClient

Called by SV_SendClientSnapshot and SV_SendClientGameState

If you ever plan to call this with msgType != MSG_ALL, keep in mind this is meant for making tighter/smaller snapshots for demos.
In that case ALWAYS call with MSG_DEMO first and MSG_CLIENT second. MSG_DEMO will write the demo message and do related stuff.
MSG_CLIENT will actually send to the client and increment outgoingSequence.
=======================
*/
void SV_SendMessageToClient( msg_t *msg, client_t *client, qboolean fakeSend, qboolean isSnapshot, messageType_t msgType) {
	int			rateMsec;
	int			snapshotMsec = isSnapshot ? SV_GetClientSnapshotMsec(client) : client->snapshotMsec; // only with a snapshot can we trust that SV_GetClientSnapshotMsec wont cause a segfault due to accessing ps when game isnt loaded

	// MW - my attempt to fix illegible server message errors caused by
	// packet fragmentation of initial snapshot.
	while(client->state&&client->netchan.unsentFragments)
	{
		// send additional message fragments if the last message
		// was too large to send at once
		Com_Printf ("[ISM]SV_SendMessageToClient() [1] for %s, writing out old fragments\n", client->name);
		SV_Netchan_TransmitNextFragment(&client->netchan);

		// TA: This could mess up snapshot sending tho right? Since outgoingSequence will go out of sync with the snapshot.
		// What if we just increase outgoingsequence immediately when we START sending a packet?
	}

	// record information about the message
	client->frames[client->netchan.outgoingSequence & PACKET_MASK].messageSize = msg->cursize;
	// With sv_pingFix enabled we use a time value that is not limited by sv_fps.
	client->frames[client->netchan.outgoingSequence & PACKET_MASK].messageSent = (sv_pingFix->integer ? Sys_Milliseconds() : svs.time);
	client->frames[client->netchan.outgoingSequence & PACKET_MASK].messageAcked = -1;

#ifdef SVDEMO

	if (msgType != MSG_CLIENT) { // don't do any of the demo related stuff if we're sending a message for the client. (already happened before)

		if (sv_demoPreRecord->integer) { // If pre record demo message buffering is enabled, we write this message to the buffer.

			// But first, Do a quick cleanup of possible old packages in the buffer that have msgNum > client->netchan.outgoingSequence
			// This shouldn't really happen as we clear the buffer on disconnects/connects and map_restarts but let's be safe.
			demoPreRecordBufferIt lastEvilPackage;
			qboolean evilPackagesFound = qfalse;
			for (demoPreRecordBufferIt it = demoPreRecordBuffer[client - svs.clients].begin(); it != demoPreRecordBuffer[client - svs.clients].end(); it++) {
				if (it->get()->msgNum > client->netchan.outgoingSequence || it->get()->time > sv.time) {
					lastEvilPackage = it;
					evilPackagesFound = qtrue;
				}
				else {
					break;
				}
			}
			if (evilPackagesFound) {
				// The lastTooOldKeyframe itself won't be erased because .erase()'s second parameter is not inclusive, 
				// aka it deletes up to that element, but not that element itself.
				Com_Printf("Found evil old messages in demoPreRecordBuffer. This shouldn't happen.\n");
				lastEvilPackage++; // .erase() function excludes the last element, but we want to delete the last evil package too.
				demoPreRecordBuffer[client - svs.clients].erase(demoPreRecordBuffer[client - svs.clients].begin(), lastEvilPackage);
			}

			// Now put the current messsage in the buffer.
			if (client->netchan.remoteAddress.type != NA_BOT || sv_demoPreRecordBots->integer) {
				std::unique_ptr<bufferedMessageContainer_t> bmtPtr(new bufferedMessageContainer_t(msg));
				bufferedMessageContainer_t* bmt = bmtPtr.get();
				//static bufferedMessageContainer_t bmt; // I make these static so they don't sit on the stack.
				//Com_Memset(bmt, 0, sizeof(bufferedMessageContainer_t));
				//MSG_ToBuffered(msg,&bmt->msg);
				bmt->msgNum = client->netchan.outgoingSequence;
				bmt->lastClientCommand = client->lastClientCommand;
				bmt->time = sv.time;
				bmt->isKeyframe = qfalse; // In theory it might be a gamestate message, but we only call it a keyframe if we ourselves explicitly save a keyframe.
				demoPreRecordBuffer[client - svs.clients].push_back(std::move(bmtPtr));
			}
		}

		// save the message to demo.  this must happen before sending over network as that encodes the backing databuf
		if (client->demo.demorecording && !client->demo.demowaiting) {
			msg_t msgcopy = *msg;
			MSG_WriteByte(&msgcopy, svc_EOF);
			SV_WriteDemoMessage(client, &client->demo, &msgcopy, 0);
		}

		// Check for whether a new keyframe must be written in pre recording, and if so, do it.
		if (sv_demoPreRecord->integer && (client->netchan.remoteAddress.type != NA_BOT || sv_demoPreRecordBots->integer)) {
			//if (client->demo.preRecord.lastKeyframeTime + (1000 * sv_demoPreRecordKeyframeDistance->integer) < sv.time) {
			if (client->demo.preRecord.lastKeyframeTime + (1000 * sv_demoPreRecordKeyframeDistance->integer) < sv.time || client->demo.preRecord.lastKeyframeTime > sv.time) { // See if it's time for a new keyframe, or if the last keyframe was made before a serverTime restart.
				// Save a keyframe.
				static byte keyframeBufData[MAX_MSGLEN]; // I make these static so they don't sit on the stack.
				static msg_t		keyframeMsg;
				//static bufferedMessageContainer_t bmt;
				Com_Memset(&keyframeMsg, 0, sizeof(msg_t));
				//Com_Memset(&bmt, 0, sizeof(bufferedMessageContainer_t));

				MSG_Init(&keyframeMsg, keyframeBufData, sizeof(keyframeBufData));

				int tmp = client->reliableSent; //Idk if this is still needed? Might have been from an older version of SV_CreateClientGameStateMessage that changed that?
				SV_CreateClientGameStateMessage(client, &keyframeMsg);
				client->reliableSent = tmp;

				//MSG_ToBuffered(&keyframeMsg, &bmt->msg);
				std::unique_ptr<bufferedMessageContainer_t> bmtPtr(new bufferedMessageContainer_t(&keyframeMsg));
				bufferedMessageContainer_t* bmt = bmtPtr.get();
				bmt->msgNum = client->netchan.outgoingSequence; // Yes the keyframe duplicates the messagenum of a message. This is (part of) why we dump only one keyframe at the start of the demo and discard future keyframes
				bmt->lastClientCommand = client->lastClientCommand;
				bmt->time = sv.time;
				bmt->isKeyframe = qtrue; // This is a keyframe (gamestate that will be followed by non-delta frames)
				demoPreRecordBuffer[client - svs.clients].push_back(std::move(bmtPtr));
				client->demo.preRecord.minDeltaFrame = 0;
				client->demo.preRecord.keyframeWaiting = qtrue;
				client->demo.preRecord.lastKeyframeTime = sv.time;
			}

			// Clean up pre-record buffer
			// 
			// The goal is to always maintain *at least* sv_demoPreRecordTime seconds of buffer. Rather more than less. 
			// So we find the last keyframe that is older than sv_demoPreRecordTime seconds (or just that old) and then delete everything *before* it.
			demoPreRecordBufferIt lastTooOldKeyframe;
			qboolean lastTooOldKeyframeFound = qfalse;
			for (demoPreRecordBufferIt it = demoPreRecordBuffer[client - svs.clients].begin(); it != demoPreRecordBuffer[client - svs.clients].end(); it++) {
				if (it->get()->isKeyframe && (it->get()->time + (1000 * sv_demoPreRecordTime->integer)) < sv.time) {
					lastTooOldKeyframe = it;
					lastTooOldKeyframeFound = qtrue;
				}
			}
			if (lastTooOldKeyframeFound) {
				// The lastTooOldKeyframe itself won't be erased because .erase()'s second parameter is not inclusive, 
				// aka it deletes up to that element, but not that element itself.
				demoPreRecordBuffer[client - svs.clients].erase(demoPreRecordBuffer[client - svs.clients].begin(), lastTooOldKeyframe);
			}
		}
		else { // Pre-recording disabled. Clear buffer to prevent unexpected behavior if it is turned back on.
			SV_ClearClientDemoPreRecord(client);
		}
	}

	if (msgType == MSG_DEMO) { // if this is only for the demo, quit now. we will send the client message right after this.
		client->demo.clientDemoReliableAcknowledge = client->reliableSent;
		client->demo.spaceSaving.totalSizeDemo += msg->cursize;
		return;
	}
	else if (msgType == MSG_CLIENT) {
		client->demo.spaceSaving.totalSizeClient += msg->cursize;
		client->demo.spaceSaving.sampleCount++;
	}

	// bots need to have their snapshots built, but
	// they query them directly without needing to be sent
	if (client->demo.isBot) {
		client->netchan.outgoingSequence++;
		client->demo.botReliableAcknowledge = client->reliableSent;
		return;
	}

	if (client->state == CS_ZOMBIE && client->zombified) {
		client->reliableAcknowledge = client->reliableSent;
		fakeSend = qtrue;
		//return;
	}
#endif

	// send the datagram
	SV_Netchan_Transmit( client, msg, fakeSend );	//msg->cursize, msg->data );

	// set nextSnapshotTime based on rate and requested number of updates

	// local clients get snapshots every frame
	if ( client->netchan.remoteAddress.type == NA_LOOPBACK || Sys_IsLANAddress (client->netchan.remoteAddress) ) {
		client->nextSnapshotTime = svs.time - 1;
		return;
	}

	// normal rate / snapshotMsec calculation
	rateMsec = SV_RateMsec( client, msg->cursize );

	if ( rateMsec < snapshotMsec) {
		// never send more packets than this, no matter what the rate is at
		rateMsec = snapshotMsec;
		client->rateDelayed = qfalse;
	} else {
		client->rateDelayed = qtrue;
	}

	client->nextSnapshotTime = svs.time + rateMsec;

	// don't pile up empty snapshots while connecting
	if ( client->state != CS_ACTIVE && !(client->state == CS_ZOMBIE && client->zombified)) {
		// a gigantic connection message may have already put the nextSnapshotTime
		// more than a second away, so don't shorten it
		// do shorten if client is downloading
		if ( !*client->downloadName && client->nextSnapshotTime < svs.time + 1000 ) {
			client->nextSnapshotTime = svs.time + 1000;
		}
	}
}


void SV_SendClientUcmdSendback(client_t* client, qboolean force) {

	static byte		msg_buf[MAX_MSGLEN];
	msg_t			msgBak;
	msg_t			msg;

	// must be before SV_BuildClientSnapshot because otherwise stuff gets confused with outgoingsequence
	//if (sv_ucmdSendback->integer && userMessages[client - svs.clients].size() > MAX(1,sv_ucmdSendbackMinCount->integer)) {
	if (sv_ucmdSendback->integer && 
		(
			(MAX(userMessages[client - svs.clients].size(), userStoredUcmdCounts[client - svs.clients]) > MAX(1, sv_ucmdSendbackMinCount->integer))
			|| force
			)
		) {
		int minCurSize = 0;
		usercmd_t	nullcmd;
		usercmd_t* cmd, * oldcmd;
		int sentbackCount = 0, sentbackBackup = 0;
		msg_t		msgBak2;

		// bots need to have their snapshots build, but
		// the query them directly without needing to be sent
		if (client->gentity && client->gentity->r.svFlags & SVF_BOT
#ifdef SVDEMO
			&& !client->demo.demorecording
#endif
			) {
			return;
		}


		// prepend message with client commands (so demos have that info)
		MSG_Init(&msg, msg_buf, sizeof(msg_buf));
		msg.allowoverflow = qtrue;

		// NOTE, MRE: all server->client messages now acknowledge
		// let the client know which reliable clientCommands we have received
		MSG_WriteLong(&msg, client->lastClientCommand);

		SV_WriteEOFAndHiddenUcmdMarker(&msg, &minCurSize);

		MSG_WriteShort(&msg, 2); // version of this sorta ucmd sendback protocol
		// v1 was first working prototype
		// v2 does the delta across all ucmds in this whole message

		Com_Memset(&nullcmd, 0, sizeof(nullcmd));

		oldcmd = &nullcmd;
		auto it = userMessages[client - svs.clients].begin();
		for (; it != userMessages[client - svs.clients].end(); it++) {

			// Backup the msg state in case the snapshot would overflow it
			memcpy(&msgBak, &msg, sizeof(msgBak));
			sentbackBackup = sentbackCount;

			MSG_WriteBits(&msg, 1, 1); // new client message

			MSG_WriteByte(&msg, (*it)->clientNum); // clientnum

			//MSG_WriteLong(&msg, (*it)->serverTime);
			//nullcmd.serverTime = (*it)->serverTime; // make em all relative to this. that way we get to keep the real servertime and delta from it
			// nvm cant do this because the efficient delta compression here works only in one direction and timenudge can fudge it either way

			if ((*it)->cmds.size() > 0) {
				MSG_WriteBits(&msg, 1, 1); // yes we know servertime offset
				MSG_WriteBits(&msg, MAX(-32768, MIN(32767, (*it)->serverTime - (*it)->cmds[0]->serverTime)), -16); // servertime offset of first cmd. can i actually use whole short range safely?
			}
			else {
				MSG_WriteBits(&msg, 0, 1);
			}
			if ((*it)->pingKnown) { // ping is known
				MSG_WriteBits(&msg, 1, 1);
				MSG_WriteBits(&msg, MAX(-32768, MIN(32767, (*it)->ping)), -16); // ping should logically always be positive. is it? uh. well technically it doesnt even matter for the encoding. but if someone is hacking ping, it could be fun to see? wait no it wouldnt. meh.
			}
			else {
				MSG_WriteBits(&msg, 0, 1);
			}
			if ((*it)->droppedPackets > 0) {
				MSG_WriteBits(&msg, 1, 1);
				MSG_WriteByte(&msg, MIN(255, (*it)->droppedPackets));
			}
			else {
				MSG_WriteBits(&msg, 0, 1);
			}

			auto cmdit = (*it)->cmds.begin();
			//oldcmd = &nullcmd;
			for (; cmdit != (*it)->cmds.end(); cmdit++) {
				MSG_WriteBits(&msg, 1, 1);
				cmd = cmdit->get();
				MSG_WriteDeltaUsercmdKey(&msg, 0, oldcmd, cmd, qtrue);
				sentbackCount++;
				oldcmd = cmd;
			}
			MSG_WriteBits(&msg, 0, 1);

			//if (sv_dynamicSnapshots->integer && (msg.overflowed || (msg.maxsize - msg.cursize) < 8) && !msgBak.overflowed) { // (msg.maxsize - msg.cursize) < 8 is like a softer overflow detect. we still need to cram that one "no more usermessages" bit in there and also svc_EOF, so don't go quite up to the limit of it "overflowing" (overflow checks for 4 bytes)
			//if ((msg.overflowed || /*(msg.maxsize - msg.cursize) < 8 || */ (FRAGMENT_SIZE - msg.cursize) < 8) && !msgBak.overflowed) { // (msg.maxsize - msg.cursize) < 8 is like a softer overflow detect. we still need to cram that one "no more usermessages" bit in there and also svc_EOF, so don't go quite up to the limit of it "overflowing" (overflow checks for 4 bytes)
			if ((msg.overflowed || (msg.maxsize - msg.cursize) < 8 /*|| (FRAGMENT_SIZE - msg.cursize) < 8 */) && !msgBak.overflowed) { // (msg.maxsize - msg.cursize) < 8 is like a softer overflow detect. we still need to cram that one "no more usermessages" bit in there and also svc_EOF, so don't go quite up to the limit of it "overflowing" (overflow checks for 4 bytes)
				// actually i'm being even more strict now. this ucmd sendback MUST fit into a single fragment, otherwise the directly following snapshot will stomp it.
				// nvm im reversing that policy since i think i fixed the underlying netcode that caused that to be a problem.
				memcpy(&msg, &msgBak, sizeof(msg));
				sentbackCount = sentbackBackup;
				break;
			}
		}
		userMessages[client - svs.clients].erase(userMessages[client - svs.clients].begin(), it);
		userStoredUcmdCounts[client - svs.clients] -= sentbackCount;
		if (userStoredUcmdCounts[client - svs.clients] < 0) {
			Com_Printf("^1userStoredUcmdCounts ended up smaller than 0!!! WEIRD! Should not happen! It's %d\n", userStoredUcmdCounts[client - svs.clients]);
			userStoredUcmdCounts[client - svs.clients] = 0;
		}
		else if ((userStoredUcmdCounts[client - svs.clients] == 0) != (userMessages[client - svs.clients].size() == 0)) {
			Com_Printf("^1userStoredUcmdCounts and userMessages zero count not same!!! SHOULD NOT HAPPEN! userStoredUcmdCounts is %d, userMessages count is %d, client is %d\n", userStoredUcmdCounts[client - svs.clients], (int)userMessages[client - svs.clients].size(), (int)(client - svs.clients));
			userStoredUcmdCounts[client - svs.clients] = 0;
		}

		MSG_WriteBits(&msg, 0, 1);
		//MSG_WriteByte(&msg, svc_EOF); // done by transmit.

		if (/*sv_dynamicSnapshots->integer&&*/  msg.overflowed) {
			//if (msg.overflowed || (FRAGMENT_SIZE - msg.cursize) < 4) {
				// rare one broken by the last bit. shouldn't happen
			Com_Printf("^sv_dynamicSnapshots: Message overflowed for ucmdSendBack. WHY?!?!! Data loss. Size is %d, maxsize %d\n", msg.cursize, msg.maxsize);
		}
		else {
			if (msg.cursize < minCurSize) {
				msg.cursize = minCurSize;
			}
			SV_SendMessageToClient(&msg, client, (qboolean)(sv_ucmdSendback->integer == -1));
		}

	}
}

/*
=======================
SV_SendClientSnapshot

Also called by SV_FinalMessage

=======================
*/
void SV_SendClientSnapshot( client_t *client, qboolean dontSend) {
	static byte		msg_buf[MAX_MSGLEN];
	msg_t			msg;
	msg_t			msgBak;
	messageType_t	typeFrom = MSG_ALL;
	messageType_t	typeTo = MSG_ALL;
	int				msgType;

#ifdef SVDEMO
	if (sv_demoSpaceSaving->integer && client->netchan.remoteAddress.type != NA_BOT) {
		typeFrom = MSG_DEMO;
		typeTo = MSG_CLIENT;
	}
#endif

	SV_SendClientUcmdSendback(client, qfalse);


	// build the snapshot
	SV_BuildClientSnapshot( client );

#ifdef SVDEMO
	if (!client->demo.demorecording) { //dont think this needs to be done with singledemo option
		if (sv_autoDemo->integer == 2) {
			if (client->netchan.remoteAddress.type == NA_BOT && !Q_stricmp(client->name, "RECORDER")) {
				SV_BeginAutoRecordDemos();
			}
		}
		else if (sv_autoDemo->integer == 1) {
			if (client->netchan.remoteAddress.type != NA_BOT || sv_autoDemoBots->integer) {
				SV_BeginAutoRecordDemos();
			}
		}
	}
#endif

	for (msgType = typeFrom; msgType <= typeTo; msgType++) { // if sv_demoSpaceSaving is enabled, we write a separate message for the demo.


		// bots need to have their snapshots build, but
		// the query them directly without needing to be sent
		if ( client->gentity && client->gentity->r.svFlags & SVF_BOT 
	#ifdef SVDEMO
			&& !client->demo.demorecording
	#endif
			) {
			return;
		}

		MSG_Init (&msg, msg_buf, sizeof(msg_buf));
		msg.allowoverflow = qtrue;

		// NOTE, MRE: all server->client messages now acknowledge
		// let the client know which reliable clientCommands we have received
		MSG_WriteLong( &msg, client->lastClientCommand );

		// (re)send any reliable server commands
		if ( !SV_UpdateServerCommandsToClient(client, &msg, qtrue, (messageType_t)msgType) ) {
			// If we can't fit all commands in a single message send what we got and
			// don't even try to send entities
			SV_SendMessageToClient( &msg, client, qfalse, qtrue, (messageType_t)msgType);
			continue;
		}

		// Backup the msg state in case the snapshot would overflow it
		memcpy( &msgBak, &msg, sizeof(msgBak) );

		// send over all the relevant entityState_t
		// and the playerState_t
		SV_WriteSnapshotToClient( client, &msg, (messageType_t)msgType);

		if ( sv_dynamicSnapshots->integer && msg.overflowed && !msgBak.overflowed ) {
			// The entity states were too much and the message overflowed. So send
			// the old state of the message from before we tried to append the
			// entity states. As the net code doesn't send the msg_buf content after
			// the current size of the message we don't have to clear anything and
			// we can just use the old msg values (which point to the updated buffer).
			SV_SendMessageToClient( &msgBak, client, qfalse, qtrue, (messageType_t)msgType);
			continue;
		}

		// Backup the msg state in case the download would overflow it
		memcpy( &msgBak, &msg, sizeof(msgBak) );

		if (msgType != MSG_DEMO) { // TODO what if other places without MSG_DEMO distinction still do it? will stuff get confused in rare edge cases? idk.
			// Add any download data if the client is downloading
			SV_WriteDownloadToClient(client, &msg);
		}

		if ( sv_dynamicSnapshots->integer && msg.overflowed && !msgBak.overflowed ) {
			// Downloads usually don't happen in situations that are likely to have
			// message overflows, but let's make sure and apply the same logic we
			// used for the entity states.
			SV_SendMessageToClient( &msgBak, client, qfalse, qtrue, (messageType_t)msgType);
			continue;
		}

		// check for overflow
		if ( msg.overflowed ) {
			Com_Printf ("WARNING: msg overflowed for %s, message type %d\n", client->name, msgType);
			MSG_Clear (&msg);
		}

		if (!dontSend) {
			SV_SendMessageToClient(&msg, client, qfalse, qtrue, (messageType_t)msgType);
		}
	}
	
#ifdef SVDEMO
	if (com_developer->integer > 1 && client->demo.spaceSaving.sampleCount >= 1000) {
		Com_Printf("sv_demoSpaceSaving debug, client %s, sample count %d, snapshot demo size percentage %f\n", client->name, client->demo.spaceSaving.sampleCount, 100.0f*(float)client->demo.spaceSaving.totalSizeDemo/ (float)client->demo.spaceSaving.totalSizeClient);
		Com_Memset(&client->demo.spaceSaving,0,sizeof(client->demo.spaceSaving));
	}
#endif
}


void SV_CheckInvalidUserInfoValues(client_t* cl) {
	const char* warning = NULL;
	int64_t timeout = 120000;
	bool critical = false;
	if (cl->ancientClient) {
		warning = "^1Your client is very old and potentially unsafe\n^1to use. Seriously consider upgrading.\n^2JK2MV^7, among other options, is open-source,\nfreely available and contains many\nsecurity fixes and improvements.\nIt also allows you to connect to servers for\nall patch versions of Jedi Outcast.\nGet it at:\n^2https://jk2mv.org/";
		critical = true;
	} else if (cl->invalidValues & (1 << (int)CHECKEDTYPE_RATE)) {
		warning = "^1Your 'rate' value is invalid.\n^1Please check it and set a proper value.";
		critical = true;
	} else if (cl->invalidValues & (1 << (int)CHECKEDTYPE_SNAPS)) {
		warning = "^1Your 'snaps' value is invalid.\n^1Please check it and set a proper value.";
		critical = true;
	} else if (cl->rate < 50000) {
		warning = va("^3Your 'rate' value is extremely low (%d).\n^3Please consider a higher value (50000+).",cl->rate);
		timeout = 60000 * 20; // every 20 min
	} else if (cl->snaps < 20) {
		// we only wanna warn about this in spec i guess but too lazy to code that rn. whatever.
		warning = va("^3Your 'snaps' value is extremely low (%d).\n^3Please consider a higher value (30+).",cl->snaps);
		timeout = 60000 * 60; // every 60 min
	} else if (cl->snaps < 30) {
		// we only wanna warn about this in spec i guess but too lazy to code that rn. whatever.
		warning = va("^3Your 'snaps' value is pretty low (%d).\n^3Consider a higher value (30+).",cl->snaps);
		timeout = 60000 * 60; // every 60 min
	}
	if (!warning || cl->lastInvalidValuesWarning && svs.time - timeout < cl->lastInvalidValuesWarning && svs.time > cl->lastInvalidValuesWarning) {
		return;
	}
	SV_SendServerCommand(cl,"print \"%s\n\"",warning);
	if (critical) {
		SV_SendServerCommand(cl, "cp \"%s\n\"", warning);
		Com_Printf("^3Sending critical warning to client %s: %s\n",cl->name, warning);
	}
	else {
		Com_Printf("^3Sending non-critical warning to client %s: %s\n", cl->name, warning);
	}
	cl->lastInvalidValuesWarning = svs.time;
}

/*
=======================
SV_SendClientMessages
=======================
*/
void SV_SendClientMessages( void ) {
	int			i;
	client_t	*c;

	// send a message to each connected client
	for (i=0, c = svs.clients ; i < sv_maxclients->integer ; i++, c++) {
		if (!c->state) {
			continue;		// not connected
		}

		qboolean softLimit = qfalse;
		if ( svs.time < c->nextSnapshotTime ) {
			if (sv_enforceSnapsDebug->integer) {
				softLimit = qtrue;
			}
			else {
				continue;		// not time yet
			}
		}

		// send additional message fragments if the last message
		// was too large to send at once
		if ( c->netchan.unsentFragments ) {
			c->nextSnapshotTime = svs.time +
				SV_RateMsec( c, c->netchan.unsentLength - c->netchan.unsentFragmentStart );
			SV_Netchan_TransmitNextFragment( &c->netchan );
			continue;
		}

		if ( sv.vmPlayerSnapshots && !VM_Call(gvm, GAME_MVAPI_PLAYERSNAPSHOT, i) ) {
			continue;
		}

		// warn user if he has invalid snaps/rate settings
		if (c->state == CS_ACTIVE) {
			SV_CheckInvalidUserInfoValues(c);
		}

		// generate and send a new message
		SV_SendClientSnapshot( c, softLimit);
	}

	if ( sv.vmPlayerSnapshots ) {
		VM_Call( gvm, GAME_MVAPI_PLAYERSNAPSHOT, -1 );
	}
}

