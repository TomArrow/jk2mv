#include "server.h"

#define TOMMYTERNAL_EXTENSIONS_NAMESPACE 0

//
// VERY IMPORTANT: If you add any personal extensions outside of the ones Tommyternal provides,
// designate your own namespace by changing the namespaceExt parameter in SV_CommitExtensionMessage (see below)
// from 0 to something else. you should research other mods and find a value that doesn't conflict with anything,
// while trying to keep the value as low as possible for low transmission cost
// 
// this namespace system allows for up to 29 bits of unique identifier, so not the full 32 bits of the int. 
// that's because it's sent byte by byte, with the first 3 bytes only allowing 0-127, and the last bit determining
// whether another byte is read// 
// 
// your clientside parsing should equally check for the correct namespace. the default namespace is always assumed to be 0
// 
// note to never reuse the svc_namespace command number itself, since it is required to be able to set a new namespace at any time.
// 
// 
// EXTENSION DATA AFTER SVC_EOF OF MESSAGES
// 
// the way it works for adding new extensions is simple:
//
// in SV_WriteCoolExtensionsToClient, 
// do anythingImportantWritten = (qboolean)(anythingImportantWritten || SV_MyOwnExtension(msg));
// 
// In SV_MyOwnExtension(), call msg_t			*extensionMsg = SV_InitExtensionMessage();
// write your extension data into this extensionMsg.
// then call SV_CommitExtensionMessage(msg, extensionMsg, svc, namespaceExt);
// 
// If you are not officially working on Tommyternal, dont call SV_CommitExtensionMessage with 0 at the end. 
// Pick a new number instead that uniquely identifies your mod. That way more variety than just 0-255 svc_ extensions
// can potentially exist.
// 
// SV_CommitExtensionMessage copies your extension data into the main message along with its size. 
// SV_CommitExtensionMessage returns qtrue if the commit was successful
//
// your function should return whether the data is important, in the sense that if no important data
// is added by any extension, the entire extension post-eof data block is completely discarded.
//
//

static int extensionNamespace = 0; // default tommyternal extensions

void SV_SetExtensionNamespace(msg_t* msg, int extNamespace) {
	if (extNamespace == extensionNamespace) {
		return;
	}
	if (extNamespace >= (1<<29)) {
		Com_Error(ERR_FATAL,"Attempted to write extension namespace exceeding 29 bits");
		return;
	}
	extensionNamespace = extNamespace;
	MSG_WriteByte(msg,svc_coolNameSpace);
	MSG_WriteByte(msg, (extNamespace & 127) | ((extNamespace >> 7) ? (1<<7) : 0));
	extNamespace >>= 7;
	if (extNamespace) {
		MSG_WriteByte(msg, extNamespace & 127 | ((extNamespace >> 7) ? (1 << 7) : 0));
	}
	extNamespace >>= 7;
	if (extNamespace) {
		MSG_WriteByte(msg, extNamespace & 127 | ((extNamespace >> 7) ? (1 << 7) : 0));
	}
	extNamespace >>= 7;
	if (extNamespace) {
		MSG_WriteByte(msg, extNamespace & 255);
	}
}

msg_t* SV_InitExtensionMessage() {

	static byte		extensionMsgBuffer[MAX_MSGLEN];
	static msg_t	extensionMessage;
	// we write extensions into a separate buffer first, then check their bit length, write it, and then we copy their actual content
	MSG_Init(&extensionMessage, extensionMsgBuffer, sizeof(extensionMsgBuffer));
	extensionMessage.allowoverflow = qtrue;

	return &extensionMessage;
}

qboolean SV_CommitExtensionMessage(msg_t* msg, msg_t* extensionMessage, int svc, int namespaceExt) {
	msg_t			msgBak;
	int				extBits;
	int				oldNamespace = extensionNamespace;

	if (extensionMessage->overflowed || msg->overflowed) {
		return qfalse;
	}

	memcpy(&msgBak, msg, sizeof(msgBak));

	SV_SetExtensionNamespace(msg, namespaceExt);
	MSG_WriteByte(msg, svc);

	extBits = extensionMessage->bit;
	MSG_BeginReading(extensionMessage);

	MSG_WriteLong(msg, extBits);
	MSG_BitCopy(msg, extensionMessage, extBits, qtrue);

	if (msg->overflowed) {
		memcpy(msg, &msgBak, sizeof(*msg));
		extensionNamespace = oldNamespace;
		return qfalse;
	}
	return qtrue;
}

#ifdef USE_MULTIVIEW

// most of this stuff is copied and adapted from quake3e multiview version, though I made a lot of changes
static void SV_EmitPlayerStates( int baseClientID, const clientSnapshot_t *from, const clientSnapshot_t *to, msg_t *msg)
{
    psFrame_t *psf;
    const psFrame_t *old_psf;
    const playerState_t *oldPs;

    int i, n;
    int clientSlot;
    int oldIndex;

    const byte *oldPsMask;
    byte oldPsMaskBuf[MAX_CLIENTS/8];
    byte newPsMask[MAX_CLIENTS/8];

    const byte *oldEntMask;
    byte oldEntMaskBuf[MAX_GENTITIES/8];
    byte newEntMask[MAX_GENTITIES/8];

    // generate playerstate mask
    if ( !from || !from->num_psf ) {
        Com_Memset( oldPsMaskBuf, 0, sizeof( oldPsMaskBuf ) );
        oldPsMask = oldPsMaskBuf;
    } else {
        oldPsMask = from->psMask;
    }

#if 1
    // delta-xor playerstate bitmask
    for ( i = 0; i < ARRAY_LEN( newPsMask ); i++ ) {
        newPsMask[ i ] = to->psMask[ i ] ^ oldPsMask[ i ];
    }
    MSG_EmitByteMask( msg, newPsMask, MAX_CLIENTS/8, 3, qfalse );
#else
    MSG_WriteData( msg, to->psMask[ i ], sizeof( to->psMasks ) ); // direct playerstate mask
#endif

    oldIndex = 0;
    clientSlot = 0;
    old_psf = NULL; // silent warning

    for ( i = 0; i < to->num_psf; i++ )
    {
        psf = &svs.snapshotPSF[ ( to->first_psf + i ) % svs.numSnapshotPSF ];
        clientSlot = psf->clientSlot;
        // check if masked in previous frame:
        if ( !GET_ABIT( oldPsMask, clientSlot ) ) {
            if ( from && clientSlot == baseClientID ) // FIXME: ps->clientNum?
                oldPs = &from->ps; // transition from legacy to multiview mode
            else
                oldPs = NULL; // new playerstate
            // empty entity mask
            Com_Memset( oldEntMaskBuf, 0, sizeof( oldEntMaskBuf ) );
            oldEntMask = oldEntMaskBuf;
        } else {
            // masked in previous frame so MUST exist
            old_psf = NULL;
            // search for client state in old frame
            for ( ; oldIndex < from->num_psf; oldIndex++ ) {
                old_psf = &svs.snapshotPSF[ ( from->first_psf + oldIndex ) % svs.numSnapshotPSF ];
                if ( old_psf->clientSlot == clientSlot )
                    break;
            }
            if ( oldIndex >= from->num_psf ) { // should never happen?
                Com_Error( ERR_DROP, "oldIndex(%i) >= from->num_psf(%i), from->first_pfs=%i", oldIndex, from->num_psf, from->first_psf );
                continue;
            }
            oldPs = &old_psf->ps;
            oldEntMask = old_psf->entMask;
        }

        // areabytes
        MSG_WriteBits( msg, psf->areabytes, 6 ); // was 8
        MSG_WriteData( msg, psf->areabits, psf->areabytes );

        // playerstate
        MSG_WriteDeltaPlayerstate( msg, oldPs, &psf->ps );

#if 1
        // delta-xor mask
        for ( n = 0; n < ARRAY_LEN( newEntMask ); n++ ) {
            newEntMask[ n ] = psf->entMask[ n ] ^ oldEntMask[ n ];
        }
        MSG_EmitByteMask( msg, newEntMask, sizeof( newEntMask ), 7, qtrue );
#else
        // direct mask
		MSG_WriteData( msg, psf->entMask.mask, sizeof( psf->entMask.mask ) );
#endif
    }
}




qboolean SV_WriteMultiview(client_t* client, msg_t* msg, messageType_t msgType) {
	clientSnapshot_t* frame, * oldframe;
	int					lastframe;
	int					i;
	int					snapFlags;
#ifdef SVDEMO
	int					deltaMessage;
#endif

	// this is the snapshot we are creating
	frame = &client->frames[client->netchan.outgoingSequence & PACKET_MASK];

	if (!frame->multiview) {
		return qfalse;
	}

	// we already checked which oldframe to use in the normal snapshot writing, so just copy it over
	if (!frame->normalSnapshotOldFrame) {
		oldframe = NULL;
		lastframe = 0;
	}
	else {
		lastframe = frame->normalSnapshotOldFrame;
		deltaMessage = client->netchan.outgoingSequence - lastframe; 
		oldframe = &client->frames[deltaMessage & PACKET_MASK];

		// the snapshot's playerstates may still have rolled off the buffer, though
		// so as you can see, normal snapshot may get delta'd but we can still fail to delta here.
		if (oldframe->first_psf <= svs.nextSnapshotPSF - svs.numSnapshotPSF) {
			if (com_developer->integer > 5 || !(client->deltaMessageWarning & 4) || client->deltaMessageWarningLast < (svs.time - 1000) || svs.time < client->deltaMessageWarningLast) { // debug spam reduction
				Com_DPrintf("%s: Delta request from out of date playerstates. (msgType %d)\n", client->name, msgType);
				client->deltaMessageWarning |= 4;
				client->deltaMessageWarningLast = svs.time;
			}
			oldframe = NULL;
			lastframe = 0;
		}
	}

	msg_t* extensionMsg = SV_InitExtensionMessage();

	// hmm how to deal with this. this is really just about the client giving us a valid ack? 
	// eeh.
#if 0 //def SVDEMO
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

	//int newmask;
	//int oldmask;
	int	oldversion;

	frame->version = MV_PROTOCOL_VERSION;

	if ( !oldframe || !oldframe->multiview ) {
		oldversion = 0;
		lastframe = 0;
		oldframe = NULL;
		//oldmask = 0;
	} else {
		oldversion = oldframe->version;
		//oldmask = oldframe->mergeMask;
	}

	// what we are delta'ing from
	MSG_WriteByte( extensionMsg, lastframe );

	// emit protocol version in first message
	if ( oldversion != frame->version ) {
		MSG_WriteBits( extensionMsg, 1, 1 );
		MSG_WriteByte( extensionMsg, frame->version );
	} else {
		MSG_WriteBits( extensionMsg, 0, 1 );
	}

	//newmask = SM_ALL & ~SV_GetMergeMaskEntities( frame );

	// emit skip-merge mask
	//if ( oldmask != newmask ) {
	//	MSG_WriteBits( msg, 1, 1 );
	//	MSG_WriteBits( msg, newmask, SM_BITS );
	//} else {
	//	MSG_WriteBits( msg, 0, 1 );
	//}

	//frame->mergeMask = newmask;

	SV_EmitPlayerStates( client - svs.clients, oldframe, frame, extensionMsg);
	//MSG_entMergeMask = newmask; // emit packet entities with skipmask
	//SV_EmitPacketEntities( oldframe, frame, msg );
	//MSG_entMergeMask = 0; // don't forget to reset that!










	SV_CommitExtensionMessage(msg, extensionMsg,svc_coolMultiview,0);

	return qtrue;
}
#endif
qboolean SV_WriteCoolPadding(msg_t* msg) {
	msg_t			*extensionMsg = SV_InitExtensionMessage();


	int bitsTotal = rand() % 100;
	int bytes = bitsTotal / 8;
	int bits = bitsTotal & 7;
	int i;

	for (i = 0; i < bytes; i++) {
		MSG_WriteByte(extensionMsg, rand());
	}
	for (i = 0; i < bits; i++) {
		MSG_WriteBits(extensionMsg, rand()&1,1);
	}

	SV_CommitExtensionMessage(msg, extensionMsg,svc_coolPadding,0);

	return qfalse;
}

qboolean SV_WriteArbitraryDebugExtension(msg_t* msg, int svc, int someNamespace) {
	msg_t			*extensionMsg = SV_InitExtensionMessage();


	int bitsTotal = rand() % 100;
	int bytes = bitsTotal / 8;
	int bits = bitsTotal & 7;
	int i;

	for (i = 0; i < bytes; i++) {
		MSG_WriteByte(extensionMsg, rand());
	}
	for (i = 0; i < bits; i++) {
		MSG_WriteBits(extensionMsg, rand()&1,1);
	}

	SV_CommitExtensionMessage(msg, extensionMsg,svc, someNamespace);

	return qfalse;
}

void SV_WriteCoolExtensionsToClient(msg_t* msg, client_t* cl, messageType_t msgType, qboolean doingSnapshot) {
	msg_t			msgBakStart;
	int				extBits;
	qboolean		anythingImportantWritten = qfalse;

	extensionNamespace = 0;

	memcpy(&msgBakStart, msg, sizeof(msgBakStart));

	MSG_WriteByte(msg, svc_EOF); // EOF for normal message

	int minsize = MSG_WriteExtensionMarker(msg, EXT_COOLEXTEND); // minsize says how big the message must be to be recognized by the client (it checks cursize)

#ifdef USE_MULTIVIEW
	if (doingSnapshot) {
		anythingImportantWritten = (qboolean)(anythingImportantWritten || SV_WriteMultiview(cl,msg,msgType));
	}
#endif
	//anythingImportantWritten = (qboolean)(anythingImportantWritten || SV_WriteCoolPadding(msg));
	//anythingImportantWritten = (qboolean)(anythingImportantWritten || SV_WriteArbitraryDebugExtension(msg,21,2));
	//anythingImportantWritten = (qboolean)(anythingImportantWritten || SV_WriteArbitraryDebugExtension(msg,10, 536870911));
	//anythingImportantWritten = (qboolean)(anythingImportantWritten || SV_WriteArbitraryDebugExtension(msg,15, 0));
	//anythingImportantWritten = qtrue;



	// EOF for the cool extension part
	MSG_WriteByte(msg, svc_EOF);

done:
	if (!anythingImportantWritten) {
		// nothing of importance was written so ditch the entire extension part including the marker, since the marker itself eats some space.
		memcpy(msg, &msgBakStart, sizeof(*msg));
		extensionNamespace = 0;
	}

}
