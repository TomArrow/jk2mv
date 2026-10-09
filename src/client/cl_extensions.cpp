
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
#define MAX_MULTIVIEW_VERSION 1 // max version number we can currently decode

static void CL_ParsePlayerstates(clSnapshot_t* snap, clSnapshot_t* old, msg_t* msg) {
	int clientNum;
	clPSFrame_t* oldState= old ?  &cl.parsePlayerstates[(old->multiview.parsePlayerstatesNum) & (MAX_PARSE_PLAYERSTATES - 1)] : NULL;
	clPSFrame_t* state;
	int oldindex = 0;
	playerState_t* oldPs;
	//int i,firstIndex, lastIndex;

	snap->multiview.parsePlayerstatesNum = cl.parsePlayerstatesNum;
	snap->multiview.numPlayerstates = 0;

	for ( clientNum = 0; clientNum < MAX_CLIENTS; clientNum++ ) {

		if ( !GET_ABIT( snap->multiview.clientMask, clientNum ) )
			continue; // not masked, skip

		state = &cl.parsePlayerstates[(cl.parsePlayerstatesNum + snap->multiview.numPlayerstates++) & (MAX_PARSE_PLAYERSTATES - 1)];
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
			if (GET_ABIT(old->multiview.clientMask, clientNum)) {
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

			} else {
				oldPs = NULL;
			}
		} else {
			oldPs = NULL;
		}

		MSG_ReadDeltaPlayerstate( msg, oldPs, &state->ps );

		// spectated (pramary?) playerstate ping
		//if ( clientNum == clc.clientView ) // clc.clientNum?
		//	commandTime = state->ps.commandTime;

		// entity mask
		SHOWNET( msg, "entity mask" );
#if 1
		//while ( MSG_ReadBits( msg, 1 ) ) {
		//	firstIndex = MSG_ReadBits( msg, 7 ); // 0..127
		//	lastIndex = MSG_ReadBits( msg, 7 );  // 0..127
		//	for ( i = firstIndex; i < lastIndex + 1; i++ ) {
		//		//state->entMask[ i ] = MSG_ReadByte( msg ); // direct mask
		//		state->entMask[ i ] ^= MSG_ReadByte( msg ); // delta-xor mask
		//	}
		//}
		MSG_ReadByteMask(msg, state->entMask, sizeof(state->entMask), 7);
#else
		MSG_ReadData( msg, &state->entMask, sizeof( state->entMask ) );
#endif
		//if ( clientNum == clc.clientView /* clc.clientNum */ ) {
			// copy data to primary playerstate
		//	Com_Memcpy( &snap->areamask, &state->areamask, sizeof( snap->areamask ) );
		//	Com_Memcpy( &snap->ps, &state->ps, sizeof( snap->ps ) );
		//}
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
		if ( !old->multiview.multiviewValid) {
			// should never happen
			Com_Printf ("Message %d: Multiview delta from invalid frame %d (not supposed to happen!).\n",snap->messageNum,snap->multiview.multiViewDeltaNum);
		} else if ( old->messageNum != snap->multiview.multiViewDeltaNum) {
			// The frame that the server did the delta from
			// is too old, so we can't reconstruct it properly.
			Com_Printf ("Message %d: Multiview delta frame %d too old.\n", snap->messageNum, snap->multiview.multiViewDeltaNum);
		} else if ( cl.parsePlayerstatesNum - old->multiview.parsePlayerstatesNum > MAX_PARSE_PLAYERSTATES-32 ) {
			Com_DPrintf ("Message %d: Multiview delta parsePlayerstatesNum too old.\n", snap->messageNum);
		}
		else {
			snap->multiview.multiviewValid = qtrue;	// valid delta parse
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

	if (!snap->multiview.multiviewValid) {
		// sadly multiview protocol rn makes it impossible to parse successfully if the delta fails.
		// this is because the clientmask is delta xor'd, so we don't know how many playerstates come after it.
		SHOWNET(msg, "invalid delta, skipping multiview");
		MSG_SkipBits(msg, bits - (msg->bit - startbits));
		return;
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
		MSG_SkipBits(msg, (bits - (msg->bit - bits)));
	}


	// playerState to entityState merge mask
	//SHOWNET(msg, "mergemask");
	//if (MSG_ReadBits(msg, 1)) {
	//	snap->multiview.mergeMask = MSG_ReadBits(msg, SM_BITS);
	//}

	// playerstate mask
	SHOWNET(msg, "psMask");
	//int firstIndex;
	//int lastIndex;
	//while (MSG_ReadBits(msg, 1)) {
	//	firstIndex = MSG_ReadBits(msg, 3); // 0..7
	//	lastIndex = MSG_ReadBits(msg, 3);  // 0..7
	//	for (; firstIndex < lastIndex + 1; firstIndex++) {
	//		snap->multiview.clientMask[firstIndex] ^= MSG_ReadByte(msg); // delta-xor mask
	//	}
	//}
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

		if (extension == EXT_COOLEXTEND) {

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
