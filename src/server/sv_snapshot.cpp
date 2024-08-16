
#include "server.h"
#include <map>
#include <string>

#ifdef SVDEMO
std::vector<std::unique_ptr<bufferedMessageContainer_t>> demoPreRecordBuffer[MAX_CLIENTS];
std::map<std::string, std::string> demoMetaData[MAX_CLIENTS];
#endif

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
			newent = &svs.snapshotEntities[(to->first_entity+newindex) % svs.numSnapshotEntities];
			newnum = newent->number;
		}

		if ( oldindex >= from_num_entities ) {
			oldnum = 9999;
		} else {
			oldent = &svs.snapshotEntities[(from->first_entity+oldindex) % svs.numSnapshotEntities];
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
static void SV_WriteSnapshotToClient( client_t *client, msg_t *msg ) {
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
	if (client->demo.isBot) {
		client->deltaMessage = client->netchan.outgoingSequence;
	}
#endif

	// try to use a previous frame as the source for delta compressing the snapshot
	if ( client->deltaMessage <= 0 || client->state != CS_ACTIVE ) {
		// client is asking for a retransmit
		oldframe = NULL;
		lastframe = 0;
	} else if ( client->netchan.outgoingSequence - client->deltaMessage
		>= (PACKET_BACKUP - 3) ) {
		// client hasn't gotten a good message through in a long time
		Com_DPrintf ("%s: Delta request from out of date packet.\n", client->name);
		oldframe = NULL;
		lastframe = 0;
	} 
#ifdef SVDEMO
	else if (client->demo.demorecording && client->demo.demowaiting) {
		// demo is waiting for a non-delta-compressed frame for this client, so don't delta compress
		oldframe = NULL;
		lastframe = 0;
	}
	else if (client->demo.minDeltaFrame > deltaMessage) {
		// we saved a non-delta frame to the demo and sent it to the client, but the client didn't ack it
		// we can't delta against an old frame that's not in the demo without breaking the demo.  so send
		// non-delta frames until the client acks.
		oldframe = NULL;
		lastframe = 0;
	}
	else if (sv_demoPreRecord->integer && client->demo.preRecord.keyframeWaiting) {
		// demo is waiting for a non-delta-compressed frame for this client, so don't delta compress
		oldframe = NULL;
		lastframe = 0;
	}
	else if (sv_demoPreRecord->integer && client->demo.preRecord.minDeltaFrame > deltaMessage) {
		// we saved a non-delta frame to the pre-record buffer and sent it to the client, but the client didn't ack it
		// we can't delta against an old frame that's not in the demo without breaking the demo.  so send
		// non-delta frames until the client acks.
		oldframe = NULL;
		lastframe = 0;
	}
#endif
	else {
		// we have a valid snapshot to delta from
		oldframe = &client->frames[ client->deltaMessage & PACKET_MASK ];
		lastframe = client->netchan.outgoingSequence - client->deltaMessage;

		// the snapshot's entities may still have rolled off the buffer, though
		if ( oldframe->first_entity <= svs.nextSnapshotEntities - svs.numSnapshotEntities ) {
			Com_DPrintf ("%s: Delta request from out of date entities.\n", client->name);
			oldframe = NULL;
			lastframe = 0;
		}
	}

#ifdef SVDEMO
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
		snapFlags |= SNAPFLAG_NOT_ACTIVE;
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
void SV_UpdateServerCommandsToClient( client_t *client, msg_t *msg ) {
	int		i;
	int		reliableAcknowledge;

#ifdef SVDEMO
	if (client->demo.isBot && client->demo.demorecording) {
		reliableAcknowledge = client->demo.botReliableAcknowledge;
	}
	else
#endif
	{
		reliableAcknowledge = client->reliableAcknowledge;
	}

	// write any unacknowledged serverCommands
	for ( i = reliableAcknowledge + 1 ; i <= client->reliableSequence ; i++ ) {
		MSG_WriteByte( msg, svc_serverCommand );
		MSG_WriteLong( msg, i );
		MSG_WriteString( msg, client->reliableCommands[ i & (MAX_RELIABLE_COMMANDS-1) ] );
	}
	client->reliableSent = client->reliableSequence;
}

/*
=============================================================================

Build a client snapshot structure

=============================================================================
*/

#define	MAX_SNAPSHOT_ENTITIES	1024
typedef struct {
	int		numSnapshotEntities;
	int		snapshotEntities[MAX_SNAPSHOT_ENTITIES];
} snapshotEntityNumbers_t;

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
static void SV_AddEntToSnapshot( svEntity_t *svEnt, sharedEntity_t *gEnt, snapshotEntityNumbers_t *eNums ) {
	// if we have already added this entity to this snapshot, don't add again
	if ( svEnt->snapshotCounter == sv.snapshotCounter ) {
		return;
	}
	svEnt->snapshotCounter = sv.snapshotCounter;

	// if we are full, silently discard entities
	if ( eNums->numSnapshotEntities == MAX_SNAPSHOT_ENTITIES ) {
		return;
	}

	eNums->snapshotEntities[ eNums->numSnapshotEntities ] = gEnt->s.number;
	eNums->numSnapshotEntities++;
}

/*
===============
SV_AddEntitiesVisibleFromPoint
===============
*/
static void SV_AddEntitiesVisibleFromPoint( vec3_t origin, clientSnapshot_t *frame,
									snapshotEntityNumbers_t *eNums, qboolean portal ) {
	int		e, i;
	sharedEntity_t *ent;
	svEntity_t	*svEnt;
	int		l;
	int		clientarea, clientcluster;
	int		leafnum;
	int		c_fullsend;
	byte	*clientpvs;
	byte	*bitvector;

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
			if ( mvEnt->snapshotIgnore[frame->ps.clientNum] ) continue;
			else if ( mvEnt->snapshotEnforce[frame->ps.clientNum] )
			{
				SV_AddEntToSnapshot( svEnt, ent, eNums );
				continue;
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
			SV_AddEntToSnapshot( svEnt, ent, eNums );
			continue;
		}

#ifdef SVDEMO
		if (sv_autoDemo->integer == 2) //How find out how to only add all entities for the bot named RECORDER, not all bots? what entities can we still exclude?
		{
			sharedEntity_t* ent2;
			ent2 = SV_GentityNum(frame->ps.clientNum);
			if (ent2->r.svFlags & SVF_BOT && /* ent2->playerState->*/frame->ps.pm_type == PM_SPECTATOR) {
				SV_AddEntToSnapshot(svEnt, ent, eNums);
				continue;
			}
		}
#endif
		
		// If server has sv_specAllEnts set, spectators receive all entities.
		if (sv_specAllEnts->integer && (frame->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR ||
			(frame->ps.pm_flags & PMF_FOLLOW)))
		{
			SV_AddEntToSnapshot(svEnt, ent, eNums);
			continue;
		}

		// ignore if not touching a PV leaf
		// check area
		if ( !CM_AreasConnected( clientarea, svEnt->areanum ) ) {
			// doors can legally straddle two areas, so
			// we may need to check another one
			if ( !CM_AreasConnected( clientarea, svEnt->areanum2 ) ) {
				continue;		// blocked by a door
			}
		}

		bitvector = clientpvs;

		// check individual leafs
		if ( !svEnt->numClusters ) {
			continue;
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
					continue;	// not visible
				}
			} else {
				continue;
			}
		}

		// add it
		SV_AddEntToSnapshot( svEnt, ent, eNums );

		// if its a portal entity, add everything visible from its camera position
		if ( ent->r.svFlags & SVF_PORTAL ) {
			if ( ent->s.generic1 ) {
				vec3_t dir;
				VectorSubtract(ent->s.origin, origin, dir);
				if ( VectorLengthSquared(dir) > (float) ent->s.generic1 * ent->s.generic1 ) {
					continue;
				}
			}
			SV_AddEntitiesVisibleFromPoint( ent->s.origin2, frame, eNums, qtrue );
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
	int							i;
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
	Com_Memset( frame->areabits, 0, sizeof( frame->areabits ) );

	frame->num_entities = 0;

	clent = client->gentity;
	if ( !clent || client->state == CS_ZOMBIE ) {
		return;
	}

	// grab the current playerState_t
	ps = SV_GameClientNum( client - svs.clients );
	if (VM_GetGameversion(gvm) != VERSION_1_02 || mvStructConversionDisabled) {
		frame->ps = *ps;
	} else {
		// tricky but works atleast on x86
		playerState15_t *ps15 = (playerState15_t *)ps;

		memcpy(&frame->ps, ps15, ((char *)&ps15->saberIndex) - (char *)ps15);
		memcpy(&frame->ps.saberIndex, &ps15->saberIndex, (char *)&(ps15)[1] - (char *)&ps15->saberIndex);
	}


	int							clientNum;
	// never send client's own entity, because it can
	// be regenerated from the playerstate
	clientNum = frame->ps.clientNum;
	if ( clientNum < 0 || clientNum >= MAX_GENTITIES ) {
		Com_Error( ERR_DROP, "SV_SvEntityForGentity: bad gEnt" );
	}
	svEnt = &sv.svEntities[ clientNum ];
	svEnt->snapshotCounter = sv.snapshotCounter;


	// find the client's viewpoint
	VectorCopy( ps->origin, org );
	org[2] += ps->viewheight;

	// add all the entities directly visible to the eye, which
	// may include portal entities that merge other viewpoints
	SV_AddEntitiesVisibleFromPoint( org, frame, &entityNumbers, qfalse );

	// if there were portals visible, there may be out of order entities
	// in the list which will need to be resorted for the delta compression
	// to work correctly.  This also catches the error condition
	// of an entity being included twice.
	qsort( entityNumbers.snapshotEntities, entityNumbers.numSnapshotEntities,
		sizeof( entityNumbers.snapshotEntities[0] ), SV_QsortEntityNumbers );

	// now that all viewpoint's areabits have been OR'd together, invert
	// all of them to make it a mask vector, which is what the renderer wants
	for ( i = 0 ; i < MAX_MAP_AREA_BYTES/4 ; i++ ) {
		((int *)frame->areabits)[i] = ((int *)frame->areabits)[i] ^ -1;
	}

	// copy the entity states out
	frame->num_entities = 0;
	frame->first_entity = svs.nextSnapshotEntities;
	for ( i = 0 ; i < entityNumbers.numSnapshotEntities ; i++ ) {
		ent = SV_GentityNum(entityNumbers.snapshotEntities[i]);
		state = &svs.snapshotEntities[svs.nextSnapshotEntities % svs.numSnapshotEntities];
		*state = ent->s;
		svs.nextSnapshotEntities++;
		// this should never hit, map should always be restarted first in SV_Frame
		if ( svs.nextSnapshotEntities >= 0x7FFFFFFE ) {
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
static int SV_RateMsec( client_t *client, int messageSize ) {
	int		rate = SV_ClientRate( client );
	int		rateMsec;

	// individual messages will never be larger than fragment size
	if ( messageSize > 1500 ) {
		messageSize = 1500;
	}

	rateMsec = ( messageSize + HEADER_RATE_BYTES ) * 1000 / rate;

	return rateMsec;
}

#ifdef SVDEMO
extern void SV_WriteDemoMessage(client_t* cl, msg_t* msg, int headerBytes);
// defined in sv_client.cpp
extern void SV_CreateClientGameStateMessage(client_t* client, msg_t* msg);
#endif
/*
=======================
SV_SendMessageToClient

Called by SV_SendClientSnapshot and SV_SendClientGameState
=======================
*/
void SV_SendMessageToClient( msg_t *msg, client_t *client ) {
	int			rateMsec;

	// MW - my attempt to fix illegible server message errors caused by
	// packet fragmentation of initial snapshot.
	while(client->state&&client->netchan.unsentFragments)
	{
		// send additional message fragments if the last message
		// was too large to send at once
		Com_Printf ("[ISM]SV_SendClientGameState() [1] for %s, writing out old fragments\n", client->name);
		SV_Netchan_TransmitNextFragment(&client->netchan);
	}

	// record information about the message
	client->frames[client->netchan.outgoingSequence & PACKET_MASK].messageSize = msg->cursize;
	// With sv_pingFix enabled we use a time value that is not limited by sv_fps.
	client->frames[client->netchan.outgoingSequence & PACKET_MASK].messageSent = (sv_pingFix->integer ? Sys_Milliseconds() : svs.time);
	client->frames[client->netchan.outgoingSequence & PACKET_MASK].messageAcked = -1;

#ifdef SVDEMO
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
		SV_WriteDemoMessage(client, &msgcopy, 0);
	}

	// Check for whether a new keyframe must be written in pre recording, and if so, do it.
	if (sv_demoPreRecord->integer && (client->netchan.remoteAddress.type != NA_BOT || sv_demoPreRecordBots->integer)) {
		if (client->demo.preRecord.lastKeyframeTime + (1000 * sv_demoPreRecordKeyframeDistance->integer) < sv.time) {
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

	// bots need to have their snapshots built, but
	// they query them directly without needing to be sent
	if (client->demo.isBot) {
		client->netchan.outgoingSequence++;
		client->demo.botReliableAcknowledge = client->reliableSent;
		return;
	}
#endif

	// send the datagram
	SV_Netchan_Transmit( client, msg );	//msg->cursize, msg->data );

	// set nextSnapshotTime based on rate and requested number of updates

	// local clients get snapshots every frame
	if ( client->netchan.remoteAddress.type == NA_LOOPBACK || Sys_IsLANAddress (client->netchan.remoteAddress) ) {
		client->nextSnapshotTime = svs.time - 1;
		return;
	}

	// normal rate / snapshotMsec calculation
	rateMsec = SV_RateMsec( client, msg->cursize );

	if ( rateMsec < client->snapshotMsec ) {
		// never send more packets than this, no matter what the rate is at
		rateMsec = client->snapshotMsec;
		client->rateDelayed = qfalse;
	} else {
		client->rateDelayed = qtrue;
	}

	client->nextSnapshotTime = svs.time + rateMsec;

	// don't pile up empty snapshots while connecting
	if ( client->state != CS_ACTIVE ) {
		// a gigantic connection message may have already put the nextSnapshotTime
		// more than a second away, so don't shorten it
		// do shorten if client is downloading
		if ( !*client->downloadName && client->nextSnapshotTime < svs.time + 1000 ) {
			client->nextSnapshotTime = svs.time + 1000;
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
	byte		msg_buf[MAX_MSGLEN];
	msg_t		msg;

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
	SV_UpdateServerCommandsToClient( client, &msg );

	// send over all the relevant entityState_t
	// and the playerState_t
	SV_WriteSnapshotToClient( client, &msg );

	// Add any download data if the client is downloading
	SV_WriteDownloadToClient( client, &msg );

	// check for overflow
	if ( msg.overflowed ) {
		Com_Printf ("WARNING: msg overflowed for %s\n", client->name);
		MSG_Clear (&msg);
	}

	if (!dontSend) {
		SV_SendMessageToClient(&msg, client);
	}
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

		// generate and send a new message
		SV_SendClientSnapshot( c, softLimit);
	}
}

