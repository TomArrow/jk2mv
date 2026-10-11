
#include "client.h"

void SHOWNET(const msg_t* msg, const char* s);

static int parseExtensionNamespace = 0;

static void CL_ParseExtensioNamespace(msg_t* msg) {
	int tmp = MSG_ReadByte(msg);
	int newNamespace = tmp & 127;
	int shift = 0;
	if (tmp & (1<<7)) { // got more data.
		shift += 7;
		tmp = MSG_ReadByte(msg);
		newNamespace |= (tmp & 127) << shift;

		if (tmp & (1 << 7)) { // got more data.
			shift += 7;
			tmp = MSG_ReadByte(msg);;
			newNamespace |= (tmp & 127) << shift;

			if (tmp & (1 << 7)) { // got more data.
				shift += 7;
				tmp = MSG_ReadByte(msg);
				newNamespace |= (tmp & 255) << shift;
			}
		}
	}
	if (newNamespace != parseExtensionNamespace) {
		SHOWNET(msg, va("Received new namespace: %d. Old: %d", newNamespace, parseExtensionNamespace));
	}
	parseExtensionNamespace = newNamespace;
}

#ifdef USE_MULTIVIEW
#define MAX_MULTIVIEW_VERSION 2 // max version number we can currently decode
void CL_EntityStateToRescuePlayerState(entityState_t* s, playerState_t* ps) {
	int		i;

	if (s->pos.trType == TR_LINEAR_STOP) {
		ps->commandTime = s->pos.trTime;
	}

	VectorCopy(s->pos.trBase, ps->origin);
	VectorCopy(s->pos.trDelta, ps->velocity); 
	VectorCopy(s->apos.trBase, ps->viewangles);

	ps->fd.forceMindtrickTargetIndex = s->trickedentindex;
	ps->fd.forceMindtrickTargetIndex2 = s->trickedentindex2;
	ps->fd.forceMindtrickTargetIndex3 = s->trickedentindex3;
	ps->fd.forceMindtrickTargetIndex4 = s->trickedentindex4;

	ps->saberLockFrame = s->forceFrame;

	ps->electrifyTime = s->emplacedOwner;

	ps->speed = s->speed;

	ps->genericEnemyIndex = s->genericenemyindex;

	ps->activeForcePass = s->activeForcePass;

	ps->movementDir = s->angles2[YAW];
	ps->legsAnim = s->legsAnim;
	ps->torsoAnim = s->torsoAnim;
	ps->clientNum = s->clientNum;

	ps->eFlags = s->eFlags;

	ps->saberInFlight = s->saberInFlight;
	ps->saberEntityNum = s->saberEntityNum;
	ps->saberMove = s->saberMove;
	ps->fd.forcePowersActive = s->forcePowersActive;

	if (s->bolt1)
	{
		ps->duelInProgress = qtrue;
	}
	else
	{
		ps->duelInProgress = qfalse;
	}

	if (s->bolt2)
	{
		ps->dualBlade = qtrue;
	}
	else
	{
		ps->dualBlade = qfalse;
	}

	ps->emplacedIndex = s->otherEntityNum2;

	ps->saberHolstered = s->shouldtarget;

	ps->usingATST = (qboolean)s->teamowner;

	if (s->eFlags & EF_SEEKERDRONE) {
		ps->genericEnemyIndex = 0;
	}
	else {
		ps->genericEnemyIndex = -1;
	}

	if (s->eFlags & EF_DEAD)
	{
		ps->stats[STAT_HEALTH] = 0;
		ps->pm_type = PM_DEAD;
	}
	else
	{
		ps->stats[STAT_HEALTH] = 100;
		ps->stats[STAT_ARMOR] = 0;
	}

	ps->externalEvent = s->event;
	ps->externalEventParm = s->eventParm;

	ps->weapon = s->weapon;
	ps->groundEntityNum = s->groundEntityNum;

	for (i = 0; i < MAX_POWERUPS; i++) {
		if (s->powerups & (1 << i))
		{
			ps->powerups[i] = 30;
		}
		else
		{
			ps->powerups[i] = 0;
		}
	}

	ps->loopSound = s->loopSound;
	ps->generic1 = s->generic1;

	ps->weaponstate = s->modelindex2;
	ps->weaponChargeTime = s->constantLight;

	VectorCopy(s->origin2, ps->lastHitLoc);

	ps->isJediMaster = s->isJediMaster;

	ps->holocronBits = s->time2;


	if (s->weapon < WP_NUM_WEAPONS) {

		ps->stats[STAT_WEAPONS] |= 1 << s->weapon; // To make weapon select wheel look correct
	}

	if (s->weapon == WP_SABER && s->fireflag == 0) {
		// Server disabled sending fireflag saber style. We must deduce from animations (ugh)
		//byte probability;
		//ps->fd.saberDrawAnimLevel = ps->fd.saberAnimLevel = getLikelyStanceFromTorsoAnim(s->torsoAnim, demoType, &probability);
		ps->fd.saberDrawAnimLevel = ps->fd.saberAnimLevel = 2; // meh xd
	}
	else {
		ps->fd.saberDrawAnimLevel = ps->fd.saberAnimLevel = s->fireflag;
	}

	//int generalizedLegsAnim = generalizeGameValue<GMAP_ANIMATIONS, UNSAFE>(s->legsAnim, demoType);

	// This is my own stuff: (restoring viewheight)
	if (s->eFlags & EF_DEAD) {
		ps->viewheight = DEAD_VIEWHEIGHT;
	}
	//else if (
	//	(generalizedLegsAnim & ~ANIM_TOGGLEBIT) == BOTH_CROUCH1IDLE_GENERAL //|| (generalizedLegsAnim & ~ANIM_TOGGLEBIT) == BOTH_CROUCH1IDLE_15
	//	|| (generalizedLegsAnim & ~ANIM_TOGGLEBIT) == BOTH_CROUCH1WALKBACK_GENERAL || (generalizedLegsAnim & ~ANIM_TOGGLEBIT) == BOTH_CROUCH1WALK_GENERAL

	//	) {
	//	ps->viewheight = CROUCH_VIEWHEIGHT;
	//}
	else {
		ps->viewheight = DEFAULT_VIEWHEIGHT;
	}




}
// we are recovering from an incomplete state. so set some reasonable bare minimum baseline for the "from"
static playerState_t* CL_GetRescueableBasePS(clSnapshot_t* old, int clientNum) {
	static playerState_t psLocal = { 0 };
	psLocal.genericEnemyIndex = -1; // avoid seeker drone idiocy.
	psLocal.stats[STAT_HEALTH] = 1; // better to assume alive to preserve angles.
	psLocal.viewheight = DEFAULT_VIEWHEIGHT;
	if (old && old->valid) {
		// try to see if we can restore from an entity
		int index, n;
		for (index = 0; index < old->numEntities; ++index) {
			n = (old->parseEntitiesNum + index) & (MAX_PARSE_ENTITIES - 1);
			if (cl.parseEntities[n].number == clientNum) {
				CL_EntityStateToRescuePlayerState(&cl.parseEntities[n], &psLocal);
				break;
			}
		}
	}
	return &psLocal;
}

static void CL_ParsePlayerstates(clSnapshot_t* snap, clSnapshot_t* old, msg_t* msg) {
	int clientNum;
	clPSFrame_t* oldState= old ?  &cl.parsePlayerstates[(old->multiview.parsePlayerstatesNum) & (MAX_PARSE_PLAYERSTATES - 1)] : NULL;
	clPSFrame_t* state;
	int oldindex = 0;
	playerState_t* oldPs;
	qboolean rescuableFakeBase = qfalse;
	msg_t rescueableMsgBkup;
	//int i,firstIndex, lastIndex;

	snap->multiview.parsePlayerstatesNum = cl.parsePlayerstatesNum;
	snap->multiview.numPlayerstates = 0;

	for ( clientNum = 0; clientNum < MAX_CLIENTS; clientNum++ ) {

		if ( !GET_ABIT( snap->multiview.clientMask, clientNum ) )
			continue; // not masked, skip

		rescuableFakeBase = qfalse;

		state = &cl.parsePlayerstates[(cl.parsePlayerstatesNum++) & (MAX_PARSE_PLAYERSTATES - 1)];
		snap->multiview.numPlayerstates++;
		state->number = clientNum;
		//oldState = NULL;

		// areamask
		SHOWNET( msg, "areamask" );
		state->areabytes = MSG_ReadBits( msg, 6 ); // was MSG_ReadByte( msg );
		if ( state->areabytes > sizeof( state->areamask ) ) {
			Com_Error( ERR_DROP,"CL_ParsePlayerstates: Invalid size %d for areamask in clps#%d",
				state->areabytes, clientNum );
			return;
		}
		MSG_ReadData( msg, &state->areamask, state->areabytes );

		// playerstate
		SHOWNET( msg, "playerstate" );
		if ( old ) {
			// not doing this. main client is never sent in his own multiview rn, but in normal snapshot
			if (GET_ABIT(old->multiview.clientMask, clientNum) && old->multiview.multiviewValid) {
				// old snap has this client.
				while (oldState->number < clientNum) {
					oldindex++;
					if (oldindex >= old->multiview.numPlayerstates) {
						Com_Error(ERR_DROP,"CL_ParsePlayerstates: Error searching for old playerstate.");
						break;
					}
					oldState = &cl.parsePlayerstates[(old->multiview.parsePlayerstatesNum + oldindex) & (MAX_PARSE_PLAYERSTATES - 1)];
				}
				if (oldState->number != clientNum) {
					Com_Error(ERR_DROP, "CL_ParsePlayerstates: Error searching for old playerstate #2.");
				}
				Com_Memcpy(state->entMask, oldState->entMask, sizeof(state->entMask));
				oldPs = &oldState->ps;

			} else if(!old->multiview.multiviewValid) {
				Com_Memset(state->entMask, 0, sizeof(state->entMask));
				oldPs = CL_GetRescueableBasePS(old,clientNum);
				memcpy(&rescueableMsgBkup, msg, sizeof(rescueableMsgBkup));
				rescuableFakeBase = qtrue;
			} else {
				Com_Memset(state->entMask, 0, sizeof(state->entMask));
				oldPs = NULL;
			}
		} else {
			Com_Memset(state->entMask, 0, sizeof(state->entMask));
			oldPs = NULL;
		}

		MSG_ReadDeltaPlayerstate( msg, oldPs, &state->ps );

		if (rescuableFakeBase && state->ps.clientNum != clientNum) {
			// now we actually now the clientnum, so we can go back and take the proper source entitystate maybe, and then re-read the changes
			oldPs = CL_GetRescueableBasePS(old, state->ps.clientNum);
			memcpy(msg, &rescueableMsgBkup, sizeof(*msg));
			MSG_ReadDeltaPlayerstate(msg, oldPs, &state->ps);
		}

		// we got a spectator's pov but didnt get updated pm_flags
		if (rescuableFakeBase && state->ps.clientNum != clientNum && !(state->ps.pm_flags & PMF_FOLLOW)) {
			state->ps.pm_flags |= PMF_FOLLOW;
		}

		// spectated (pramary?) playerstate ping
		//if ( clientNum == clc.clientView ) // clc.clientNum?
		//	commandTime = state->ps.commandTime;

		// entity mask
		SHOWNET( msg, "entity mask" );
#if 1
		MSG_ReadByteMask(msg, state->entMask, sizeof(state->entMask), 7);
#if 0
		if (state->number == 2) {
			int n;
			int highestNum = ARRAY_LEN(state->entMask) - 1;
			while (highestNum && state->entMask[highestNum]) {
				highestNum--;
			}
			Com_Printf("client 2 entmask (client): ");
			for (n = 0; n <= highestNum; n++) {
				Com_Printf("%d ",(int) state->entMask[n]);
			}
			Com_Printf("\n");
		}
#endif
#else
		MSG_ReadData( msg, &state->entMask, sizeof( state->entMask ) );
#endif
		//if ( clientNum == clc.clientView /* clc.clientNum */ ) {
			// copy data to primary playerstate
		//	Com_Memcpy( &snap->areamask, &state->areamask, sizeof( snap->areamask ) );
		//	Com_Memcpy( &snap->ps, &state->ps, sizeof( snap->ps ) );
		//}


		if (snap->multiview.rescued) {
			// snap is from a chain of invalid deltas, therefore we cannot trust its ent mask. therefore we just enable all ents.
			memset(state->entMask, 255, sizeof(state->entMask));
		}

	} // for [all clients]
}

static void CL_ParseMultiview(msg_t* msg, int bits, int startbits) {
	clSnapshot_t* snap = &cl.snap;
	clSnapshot_t* old = NULL;
	int deltaNum;

	Com_Memset(&snap->multiview,0,sizeof(snap->multiview));

	snap->multiview.multiview = qtrue;


	deltaNum = MSG_ReadByte(msg);


	if (!deltaNum) {
		snap->multiview.multiViewDeltaNum = -1;
	}
	else {
		snap->multiview.multiViewDeltaNum = snap->messageNum - deltaNum;
	}

	// If the frame is delta compressed from data that we
	// no longer have available, we must suck up the rest of
	// the frame, but not use it, then ask for a non-compressed
	// message
	snap->multiview.multiviewValid = qfalse;
	if ( snap->multiview.multiViewDeltaNum <= 0 ) {
		SHOWNET(msg, "multiview non-delta");
		snap->multiview.multiviewValid = qtrue;		// uncompressed frame
		old = NULL;
		/*
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
		}*/
		
	} else {
		SHOWNET(msg, "multiview delta");
		old = &cl.snapshots[snap->multiview.multiViewDeltaNum & PACKET_MASK];
		if ( old->multiview.rescued) {
			// can happen on badly cut demos
			Com_DPrintf("Message %d: Multiview delta from poisoned frame %d (not supposed to happen!).\n", snap->messageNum, snap->multiview.multiViewDeltaNum);
			SHOWNET(msg, "multiview delta poisoned.");
			snap->multiview.rescued = qtrue; // poisoned multiviews propagate into later snaps so we always know we are not in a clean chain
		}

		if (!old->multiview.multiviewValid && !snap->multiview.rescued) {
			if(!clc.multiviewVersionFail)
				Com_Printf("Message %d: Multiview delta from invalid frame %d (not supposed to happen!).\n", snap->messageNum, snap->multiview.multiViewDeltaNum);
		}
		else if ( old->messageNum != snap->multiview.multiViewDeltaNum) {
			// The frame that the server did the delta from
			// is too old, so we can't reconstruct it properly.
			if (!clc.multiviewVersionFail)
				Com_Printf ("Message %d: Multiview delta frame %d too old.\n", snap->messageNum, snap->multiview.multiViewDeltaNum);
			snap->multiview.rescued = qfalse;
		} else if ( cl.parsePlayerstatesNum - old->multiview.parsePlayerstatesNum > MAX_PARSE_PLAYERSTATES-32 ) {
			if (!clc.multiviewVersionFail)
				Com_DPrintf ("Message %d: Multiview delta parsePlayerstatesNum too old.\n", snap->messageNum);
			snap->multiview.rescued = qfalse;
		}
		else {
			snap->multiview.multiviewValid = qtrue;	// valid or "rescued" delta parse
		}
		
		// Demo recording stuff.
		/*if (clc.demowaiting == 1 && cl_demoRecordBufferedReorder->integer && snap->multiview.valid) {
			if (bufferedDemoMessages.find(snap->multiview.multiViewDeltaNum) != bufferedDemoMessages.end()) {
				if (bufferedDemoMessages[snap->multiview.multiViewDeltaNum].get()->containsFullSnapshot) {
					// Okay NOW we can start recording the demo.
					clc.demowaiting = 0;
					// This is in case we use the buffered reordering of packets for demos. We want to remember the last sequenceNum we wrote to the demo.
					// Here we just save a fake number of the message before the referenced full snapshot so that saving begins at that full snapshot that is being correctly referenced by the server.
					//
					clc.demoLastWrittenSequenceNumber = snap->multiview.multiViewDeltaNum - 1;
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
		}*/
	}

	if (old && old->multiview.multiview) {
		Com_Memcpy(snap->multiview.clientMask, old->multiview.clientMask, sizeof(snap->multiview.clientMask));
		//newSnap.mergeMask = old->mergeMask;
		snap->multiview.version = old->multiview.version;
	}
	else {
		// already zeroed as new snapshot
	}


	SHOWNET(msg, "version");
	if (MSG_ReadBits(msg, 1)) {
		snap->multiview.version = MSG_ReadByte(msg);
	}

	if (snap->multiview.version > MAX_MULTIVIEW_VERSION) {
		SHOWNET(msg, "Multiview version not supported. Skipping rest of multiview");
		clc.multiviewVersionFail = qtrue;
		MSG_SkipBits(msg, (bits - (msg->bit - startbits)));
		return;
	}


	// playerState to entityState merge mask
	//SHOWNET(msg, "mergemask");
	//if (MSG_ReadBits(msg, 1)) {
	//	snap->multiview.mergeMask = MSG_ReadBits(msg, SM_BITS);
	//}

	if (snap->multiview.version >= 2 && old) {
		// server sends us a non-delta xor'd clientmask every now and then so we can "recover" with a badly cut or corrupted demo
		if (MSG_ReadBits(msg, 1)) {
			snap->multiview.psMaskRescue = qtrue;
			memset(snap->multiview.clientMask,0,sizeof(snap->multiview.clientMask));
			if (!snap->multiview.multiviewValid) {
				snap->multiview.rescued = qtrue;
			}
		}
	}

	if (!snap->multiview.multiviewValid && !snap->multiview.rescued) {
		// sadly multiview protocol rn makes it impossible to parse successfully if the delta fails.
		// this is because the clientmask is delta xor'd, so we don't know how many playerstates come after it.
		SHOWNET(msg, "invalid delta, skipping multiview");
		MSG_SkipBits(msg, bits - (msg->bit - startbits));
		return;
	}

	clc.multiviewVersionFail = qfalse;

	if (snap->multiview.rescued) {
		SHOWNET(msg, "multiview delta poisoned rescue.");
	}

	// playerstate mask
	SHOWNET(msg, "psMask");
	MSG_ReadByteMask(msg, snap->multiview.clientMask, sizeof(snap->multiview.clientMask), 3);

	CL_ParsePlayerstates(snap,old,msg);

	// update it in the buffer too
	cl.snapshots[snap->messageNum & PACKET_MASK] = *snap;

}
#endif

static void CL_ParseTommyTernalNamespaceExtensions(msg_t* msg, int cmd, int bits, qboolean parsedSnapshot) {
	switch (cmd) {

	case svc_coolPadding:
		SHOWNET(msg, va("Found %d debug padding bits. Skipping.", bits));
		MSG_SkipBits(msg, bits);
		break;
#ifdef USE_MULTIVIEW
	case svc_coolMultiview:
		if (!parsedSnapshot) {
			SHOWNET(msg, "Found svc_coolMultiview, but snapshot parsing failed. Skipping.");
			MSG_SkipBits(msg, bits);
		}
		else {
			SHOWNET(msg, "Found svc_coolMultiview. Trying to parse.");
			CL_ParseMultiview(msg,bits,msg->bit);
		}
		break;
#endif
	default:
		// unknown extension. skip
		SHOWNET(msg, "Unknown cool extension, skipping bits (tommyternal namespace).");
		MSG_SkipBits(msg, bits);
		break;
	}
}

static void CL_ParseCoolExtensions(msg_t* msg, qboolean parsedSnapshot) {
	byte cmd;
	int bits;
	parseExtensionNamespace = 0;
	while ( 1 ) {
		if ( msg->readcount > msg->cursize ) {
			Com_Error (ERR_DROP,"CL_ParseServerMessage: read past end of server message");
			break;
		}

		reread:
		cmd = MSG_ReadByte( msg );

		if ( cmd == svc_EOF) {
			SHOWNET(msg, "End of cool extensions.");
			return;
		}


		// other commands
		switch ( cmd ) {
		case svc_coolNameSpace:
			SHOWNET(msg, "Parsing extension namespace.");
			CL_ParseExtensioNamespace(msg);
			break;
		default:
			bits = MSG_ReadLong(msg);
			switch (parseExtensionNamespace) {
			case 0: // normal tommyternal extensions namespace. if you make your own extensions, MAKE YOUR OWN NAMESPACE. See comments in sv_extensions.cpp
				CL_ParseTommyTernalNamespaceExtensions(msg,cmd,bits,parsedSnapshot);
				break;
			default:
				// unknown extension. skip
				SHOWNET(msg, va("Unknown cool extension, skipping %d bits (unknown namespace %d).", bits, parseExtensionNamespace));
				MSG_SkipBits(msg, bits);
				break;
			}
		}
	}

}


// qboolean indicates whether we should continue parsing after this was called
// parsedSnapshot tells this function whether we received a snapshot successfully this frame. relevant for decoding multiview
qboolean CL_ParseExtensions(msg_t* msg, qboolean parsedSnapshot) {

	int extension = -1;
	msg_t bak;
	qboolean foundExtensions = qfalse;

	memcpy(&bak, msg, sizeof(bak));
	while ((extension = MSG_CheckForExtensions(msg)) > 0) {

		if (extension == EXT_COOLEXTEND || extension == EXT_COOLEXTEND_SMALL) {

			SHOWNET(msg, "Found cool extensions marker.");
			CL_ParseCoolExtensions(msg, parsedSnapshot);
			foundExtensions = qtrue;
		}
		else {
			SHOWNET(msg, "Unknown post-eof extension, ending read.");
			return qfalse; // found some type of extension we can't parse. not safe to keep parsing.
		}

		memcpy(&bak, msg, sizeof(bak));
	}

	return foundExtensions; // if we found extensions and parsed them all, continue parsing for svc_EOF as a sanity check. otherwise, end it.

}
