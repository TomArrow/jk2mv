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




void SV_CheckMultiviewAutoRecord() {
	playerState_t* ps;
	client_t* cl;
	int ingame = 0;
	int ingameNonAfk = 0;
	int activeClients = 0;
	int spectators = 0;
	int i;
	client_t* recorderClient;

	if (!svs.clients) {
		return;
	}

	svs.multiviewActiveClient = SV_FindActiveClient();

	recorderClient = svs.clients + sv_maxclients->integer;
	if (!recorderClient->isMultiviewRecorder || !GHOSTCLIENTS) {
		return;
	}

	for (i = 0, cl = svs.clients; i < sv_maxclients->integer; i++, cl++) {

		if (cl->state != CS_ACTIVE || cl->gentity == NULL)
			continue;

		if (cl->gentity->r.svFlags & SVF_BOT) {
			continue;
		}

		activeClients++;

		ps = SV_GameClientNum(cl - svs.clients);

		if (ps->persistant[PERS_TEAM] == TEAM_SPECTATOR || ps->clientNum != i && (ps->pm_flags & PMF_FOLLOW)) {
			spectators++;
		}
		else {
			ingame++;
			if (svs.time - cl->lastSeenActive < 10000) {
				ingameNonAfk++;
			}
		}

	}

	if (ingameNonAfk >= sv_mvAutoRecordMinActiveClients->integer) {
		svs.lastTimeActivePlayers = svs.time;
		if (recorderClient->snaps != sv_mvAutoRecordSnaps->integer) {
			recorderClient->snaps = sv_mvAutoRecordSnaps->integer;
			Com_DPrintf("^3Changing multiview recorder snaps to %d\n", recorderClient->snaps);
			SV_ClientUpdateSnaps(recorderClient);
		}
		svs.shouldMultiviewRecord = qtrue;
	}
	else {
		int64_t timeSinceAnyActive = svs.time - svs.lastTimeActivePlayers;
		if (sv_mvAutoRecordAfkStopDelay->integer && timeSinceAnyActive > clampedIntMult(sv_mvAutoRecordAfkStopDelay->integer,1000)) { // after 5 minutes just stop recording
			svs.shouldMultiviewRecord = qfalse;
			SV_StopMVAutoRecordDemo();
		}
		if (timeSinceAnyActive > 20000) {
			if (recorderClient->snaps != 1) {
				recorderClient->snaps = 1;
				Com_DPrintf("^3Changing multiview recorder snaps to %d\n", recorderClient->snaps);
				SV_ClientUpdateSnaps(recorderClient);
			}
		}
	}

}







int SV_GetPSEventMatch(playerState_t* ps,entityState_t* es, qboolean mainPlayer) {
	// we know that es->eType has data above 8 bits (the sequence masky thingy) but the netfield is 8 bits only so it gets stripped away.
	// so when restoring on the client, we need to & 8 on the eType field.
	// TODO check how this would behave with very strange things like values that exceed 8/10 bits with extremely strange custom mods?
	if (es->event == 0 || !mainPlayer && es->event != (es->eType - ET_EVENTS)) {
		return 0; // no event, or cannot restore due to not following the normal logic
	}

	if (es->event == ps->externalEvent) {
		return 1;
	}

	for (int sequence = ps->eventSequence - 1, i=0; i < 2; sequence--,i++) {
		int seq = sequence & (MAX_PS_EVENTS - 1);
		int relevantEvent = ps->events[seq] | ((sequence & 3) << 8);
		if (es->event == relevantEvent) {
			return i + 2;
		}
	}

	// no match found
	return 0;
}

typedef struct playerEntDedupeBackup_s {
	entityState_t ents[MAX_CLIENTS];
	int nums[MAX_CLIENTS];
	int numBackups;
}playerEntDedupeBackup_t;


// dedupe some fields that are shared by entitystate and playerstate
void SV_ProcessMultiviewPlayerEntityDedupe(clientSnapshot_t* snap, clientSnapshot_t* oldSnap, qboolean restore) {
	const netFieldMapping_t* maps;
	const int mapCount = sizeof(playerStateEntityStateMappings) / sizeof(playerStateEntityStateMappings[0]);
	static playerEntDedupeBackup_t backupSlots[2] = { 0 };
	int i, n;

	if (!snap->multiview || snap->version < 4 || !snap->num_psf) {
		return;
	}
	playerEntDedupeBackup_t* backup = &backupSlots[0];
	playerEntDedupeBackup_t* backupOld = &backupSlots[1];

	
	if (restore) {
		int i,n;
		entityState_t* ent;

		for (i = 0; i < backup->numBackups; i++) {
			if (backup->nums[i] < 0) {
				Com_Error(ERR_DROP, "SV_ProcessMultiviewPlayerEntityDedupe: Some extreme weirdnes...");
				continue;
			}
			ent = &svs.snapshotEntities[(snap->first_entity + (int64_t)backup->nums[i]) % svs.numSnapshotEntities];
			*ent = backup->ents[i];
		}
		if (!oldSnap) {
			return;
		}
		for (i = 0; i < backupOld->numBackups; i++) {
			if (backupOld->nums[i] < 0) {
				Com_Error(ERR_DROP, "SV_ProcessMultiviewPlayerEntityDedupe: Some extreme weirdnes #2...");
				continue;
			}
			ent = &svs.snapshotEntities[(oldSnap->first_entity + (int64_t)backupOld->nums[i]) % svs.numSnapshotEntities];
			*ent = backupOld->ents[i];
		}
		return;
	}

	// reset stuff
	backup->numBackups = backupOld->numBackups = 0;
	snap->dedupeSuccessMaskMerged = 0;
	//for (int i = 0; i < MULTIVIEW_MAX_PS_ENTITY_EVENT_RESTORE; i++) {
	//	backup->nums[i] = -1;
	//	backupOld->nums[i] = -1;
	//	snap->ownEventInfo[i] = 0;
	//}
	//snap->ownEntityEType = -1;

	int oldIndex = 0;
	int psIndex = 0;
	int oldPsIndex = 0;
	entityState_t* ent, *entOldReal = NULL, *entOld = (!oldSnap || !oldSnap->num_entities) ? NULL : &svs.snapshotEntities[(oldSnap->first_entity + (int64_t)oldIndex) % svs.numSnapshotEntities];
	int oldIndexPS = 0;
	psFrame_t	
		*psReal, 
		*ps = &svs.snapshotPSF[(snap->first_psf + (int64_t)psIndex) % svs.numSnapshotPSF],
		*psOldReal = NULL, 
		*psOld = (!oldSnap || !oldSnap->num_psf) ? NULL : &svs.snapshotPSF[(oldSnap->first_psf + (int64_t)oldPsIndex) % svs.numSnapshotPSF];
	int *psField,*esField;
	int *psFieldOld,*esFieldOld;
	vec3_t	tmpVec;

#define FINDMATCH(var,numprop,svsarray,firstindex,index,svsmodulo,numtotal,finalvar) while ((var) && (var)->numprop < ent->number && (index) < (numtotal) - 1) {\
			(var) = &(svsarray)[((firstindex) + (int64_t)++(index)) % (svsmodulo)];\
		}\
		(finalvar) = ((var) && (var)->numprop == ent->number) ? (var) : NULL;

	for (i = 0; i < snap->num_entities; i++) {
		ent = &svs.snapshotEntities[(snap->first_entity + (int64_t)i) % svs.numSnapshotEntities];

		if (ent->number >= MAX_CLIENTS) {
			break;
		}

		// find corrresponding playerstate if one exists
		FINDMATCH(ps, clientSlot, svs.snapshotPSF, snap->first_psf, psIndex, svs.numSnapshotPSF, snap->num_psf, psReal);

		if (psReal) {
			// found a match

			// generate a fail mask of any mappings that WON'T work.
			int failMask = 0; 
			maps = playerStateEntityStateMappings;
			for (int j = 0; j < mapCount; j++, maps++) {

				psField = (int*)((byte*)&psReal->ps + maps->offset);
				esField = (int*)((byte*)ent + maps->offset2);

				if (*psField != *esField) {
					if ((maps->bits == 0) != (maps->bits2 == 0)) { // if one is float and other is not, check that esField can be converted into psField without loss
						if (!maps->bits) {
							if ((float)*esField != *(float*)psField) {
								failMask |= (1 << maps->maskIndex);
							}
						}
						else {
							if ((int)*(float*)esField != *psField) {
								failMask |= (1 << maps->maskIndex);
							}
						}
					}
					else {
						failMask |= (1 << maps->maskIndex);
					}
				}
				// can't nest this, gotta always check because even with snapping, the previous condition might hold for some values. e.g. someone might have position 0 which will match snapped and unsnapped
				if (maps->type == NFMT_MAYBESNAP) {
					if ((float)(int)*(float*)psField != *(float*)esField) {
						failMask |= (1 << (maps->maskIndex + 1));
					}
				}
			}

			int successMask = (~failMask) & ((1<<MAPPING_GROUPS_COUNT)-1);

			psReal->dedupeSuccessMask = successMask;
			snap->dedupeSuccessMaskMerged |= successMask;

			if (!(successMask & mappingsSnapped) || (successMask & (mappingsSnapped >> 1))) {
				// nothing that needs snapping.
				continue;
			}

			// now check for the special snapped values case
			// in which case we will overwrite the entity values to have the unsnapped value so we can avoid sending it in ps,
			// and then reverse this on client.
			maps = playerStateEntityStateMappings;
			for (int j = 0; j < mapCount; j++, maps++) {
				if (maps->type != NFMT_MAYBESNAP) { // just a normal value
					continue;
				}
				if (successMask & (1<<maps->maskIndex)) { // we don't need to snap it i guess
					continue;
				}
				if (failMask & (1<<(maps->maskIndex+1))) { // snapping won't work either. :/
					continue;
				}

				// alright, the entitystate contains a snapped version of the playerstate value.
				// we will transfer the unsnapped version to the entitystate.
				psField = (int*)((byte*)&psReal->ps + maps->offset);
				esField = (int*)((byte*)ent + maps->offset2);

				// first things first, make a backup of the ent if we don't have one yet
				if (!backup->numBackups || backup->nums[backup->numBackups-1] != i) {
					backup->ents[backup->numBackups] = *ent;
					backup->nums[backup->numBackups] = i;
					backup->numBackups++;
					if (backup->numBackups > MAX_CLIENTS) {
						Com_Error(ERR_DROP, "SV_ProcessMultiviewPlayerEntityDedupe: Some extreme weirdnes #3...");
					}
				}

				// check for old PS match
				FINDMATCH(psOld, clientSlot, svs.snapshotPSF, oldSnap->first_psf, oldPsIndex, svs.numSnapshotPSF, oldSnap->num_psf, psOldReal);
				// check for old entity match
				FINDMATCH(entOld, number, svs.snapshotEntities, oldSnap->first_entity, oldIndex, svs.numSnapshotEntities, oldSnap->num_entities, entOldReal);

				bool canSkipRetransmit = false;

				psFieldOld = psOldReal ? (int*)((byte*)&psOldReal->ps + maps->offset) : NULL;
				esFieldOld = entOldReal ? (int*)((byte*)entOldReal + maps->offset2) : NULL;
				canSkipRetransmit = psFieldOld && esFieldOld && *psFieldOld == *psField && *esFieldOld == *esField;

				if (!canSkipRetransmit && entOldReal && *esFieldOld == *psField) {
					// game wouldn't retransmit as delta compression would recognize the values as unchanged, but we need to retransmit.
					// therefore, make a backup of the old entity as well, and set its value to something dumb
					if (!backupOld->numBackups || backupOld->nums[backupOld->numBackups - 1] != oldIndex) {
						backupOld->ents[backupOld->numBackups] = *entOldReal;
						backupOld->nums[backupOld->numBackups] = oldIndex;
						backupOld->numBackups++;
						if (backupOld->numBackups > MAX_CLIENTS) {
							Com_Error(ERR_DROP, "SV_ProcessMultiviewPlayerEntityDedupe: Some extreme weirdnes #4...");
						}
					}
					*esFieldOld = ~*psField; // we set it to something ridiculous, we just need to make sure it's not the same value.
				}

				*esField = *psField;

			}







		}


	}

}


typedef struct playerEntBackups_s {
	entityState_t ents[MULTIVIEW_MAX_PS_ENTITY_EVENT_RESTORE];
	int nums[MULTIVIEW_MAX_PS_ENTITY_EVENT_RESTORE];
}playerEntBackups_t;

// hide events and player's own entity from himself in multiview
void SV_ProcessPlayerEntities(clientSnapshot_t* snap, clientSnapshot_t* oldSnap, qboolean restore) {
	static playerEntBackups_t backupSlots[2] = { 
		{
			{ 0,0,0 },
			{ -1,-1,-1 }
		},{
			{ 0,0,0 },
			{ -1,-1,-1 }
		}
	};
	playerEntBackups_t* backup = &backupSlots[0];
	playerEntBackups_t* backupOld = &backupSlots[1];

	if (!snap || !snap->multiview/* || snap->version < 3*/) { // need at least version 3 to properly reconstruct
		if (snap) {
			snap->ownEntityEType = -1;
		}
		return;
	}
	if (restore) {
		int i,n;
		entityState_t* ent;

		for (i = 0; i < MULTIVIEW_MAX_PS_ENTITY_EVENT_RESTORE; i++) {
			if (backup->nums[i] < 0) {
				continue;
			}
			ent = &svs.snapshotEntities[(snap->first_entity + (int64_t)backup->nums[i]) % svs.numSnapshotEntities];
			*ent = backup->ents[i];
		}
		if (!oldSnap) {
			return;
		}
		for (i = 0; i < MULTIVIEW_MAX_PS_ENTITY_EVENT_RESTORE; i++) {
			if (backupOld->nums[i] < 0) {
				continue;
			}
			ent = &svs.snapshotEntities[(oldSnap->first_entity + (int64_t)backupOld->nums[i]) % svs.numSnapshotEntities];
			*ent = backupOld->ents[i];
		}
		return;
	}

	// reset stuff
	for (int i = 0; i < MULTIVIEW_MAX_PS_ENTITY_EVENT_RESTORE; i++) {
		backup->nums[i] = -1;
		backupOld->nums[i] = -1;
		snap->ownEventInfo[i] = 0;
	}
	snap->ownEntityEType = -1;

	//
	// k here's the idea. 
	// we go through all the entities in the snapshot that are related to the main player playerstate clientnum.
	// since in multiview, we send the all entities to the client, including his player entity and EF_PLAYER_EVENT entities,
	// we need to:
	// - set his main player entity to ET_INVISIBLE so it doesn't conflict with his playerstate on a normal client playback
	// - set any events and player event entities to ET_INVISIBLE and event to 0 so we don't get double events (because it's annoying)
	// 
	// but when switching views, we want to restore all this data. luckily, we have the main player ps anyway so:
	// 1. we go through all entities in the snapshot and check if they are the player entity or an event entity.
	// 2. if its a player entity, set eType to ET_INVISIBLE, and save ownEntityEType of that player entity.
	// 3. if it's a player entity with an event or EF_PLAYER_EVENT, do the following:
	//		- compare the value to ps.externalEvent, ps.events[0] and ps.events[1], the latter with the correct flip bits set.
	//		- if any matches, do ownEventInfo[counter] = 1, 2 or 3 depending on which matched, as they can be restored from ps
	//			- if matched, set its entitytype (if not a palyer entity) to ET_INVISIBLE and its event to 0
	//		- if none matched, do 0
	//		- make a backup
	//		- increment counter. if counter >= 3 (MAX_PS_ENTITY_EVENT_RESTORE), break; (we can't restore more) 
	// now here'
	//		
	// client will receive the ownEventInfo array as 3x 2 bits of data with a value from 0 to 3 and can use it to restore data.
	//

	int oldIndex = 0;
	entityState_t* ent, *entOldReal = NULL, *entOld = (!oldSnap || !oldSnap->num_entities) ? NULL : &svs.snapshotEntities[(oldSnap->first_entity + (int64_t)oldIndex) % svs.numSnapshotEntities];
	int counter = 0;
	int maincl = snap->ps.clientNum;
	int eventmatch;
	bool noretransmit = false;
	for (int i = 0; i < snap->num_entities; i++) {
		ent = &svs.snapshotEntities[(snap->first_entity + (int64_t)i) % svs.numSnapshotEntities];

		// find corrresponding old entity if one exists
		while (entOld && entOld->number < ent->number && oldIndex < oldSnap->num_entities-1) {
			entOld = &svs.snapshotEntities[(oldSnap->first_entity + (int64_t)++oldIndex) % svs.numSnapshotEntities];
		}

		entOldReal = (entOld && entOld->number == ent->number) ? entOld : NULL;

		if (entOldReal) {
			noretransmit = entOldReal->eType == ent->eType && entOldReal->event == ent->event;
		}

		if (ent->number == maincl) {
			snap->ownEntityEType = ent->eType;
			if (entOldReal) {
				backupOld->ents[counter] = *entOldReal;
				backupOld->nums[counter] = oldIndex;
				// force or prevent retransmit based on what the original value would have resulted in.
				entOldReal->eType = !noretransmit ? INT_MIN : ET_INVISIBLE;
			}
			backup->ents[counter] = *ent;
			backup->nums[counter] = i;
			ent->eType = ET_INVISIBLE;
			eventmatch = SV_GetPSEventMatch(&snap->ps, ent, qtrue);
			snap->ownEventInfo[counter++] = eventmatch;
			if (eventmatch) {
				// we are able to restore this, so zero the event
				if (entOldReal) {
					// force or prevent retransmit based on what the original value would have resulted in.
					entOldReal->event = !noretransmit ? INT_MIN : 0;
				}
				ent->event = 0;
			}
		}
		else if ((ent->eFlags & EF_PLAYER_EVENT) && ent->otherEntityNum == maincl) {
			eventmatch = SV_GetPSEventMatch(&snap->ps, ent, qfalse);
			if (eventmatch) {
				// we are able to restore this, so zero the event and make it "invisible" (to avoid the ET_EVENTS path)
				//Com_Printf("hid player event: %d %d %d\n", ent->event, ent->eType, snap->ps.eventSequence);
				backup->ents[counter] = *ent;
				backup->nums[counter] = i;
				if (entOldReal) {
					backupOld->ents[counter] = *entOldReal;
					backupOld->nums[counter] = oldIndex;
					// force or prevent retransmit based on what the original values would have resulted in.
					entOldReal->eType = !noretransmit ? INT_MIN : ET_INVISIBLE;
					entOldReal->event = !noretransmit ? INT_MIN : 0;
				}
				ent->eType = ET_INVISIBLE;
				ent->event = 0;
			}
			snap->ownEventInfo[counter++] = eventmatch;
		}
		if (counter >= MULTIVIEW_MAX_PS_ENTITY_EVENT_RESTORE) {
			break;
		}
	}
}

// force retransmit of only a few fields by setting them to invalid values,
// so that bad deltas look a bit more graceful on badly cut demos
static const playerState_t* SV_GetRescueableBasePS(const playerState_t* srcPs) {
	static playerState_t psLocal;
	psLocal = *srcPs;
	psLocal.clientNum = INT_MIN;
	psLocal.stats[STAT_HEALTH] = INT_MIN;
	return &psLocal;
}

static void SV_EmitEntMask(msg_t* msg, const byte* newEntMask, const byte* oldEntMask) {

	int n;
	static const byte nullMaskBuf[MAX_GENTITIES / 8] = { 0 };
	byte xorEntMask[MAX_GENTITIES / 8];

	if (!oldEntMask) {
		oldEntMask = nullMaskBuf;
	}
	for (n = 0; n < ARRAY_LEN(xorEntMask); n++) {
		xorEntMask[n] = newEntMask[n] ^ oldEntMask[n];
	}
	MSG_EmitByteMask(msg, xorEntMask, sizeof(xorEntMask), 7, qtrue);
}

static int CountByteDifferences(byte* a, byte*b, int length) {

	int sixtyfours = length / 8;
	int matches = 0;
	uint64_t* a64 = (uint64_t*)a;
	uint64_t* b64 = (uint64_t*)b;
	for (int i = 0; i < sixtyfours; i++, a64++, b64++) {
		if (*a64 == *b64) {
			matches += 8;
		}
		else {
			a = (byte*)a64;
			b = (byte*)b64;
			for (int j = 0; j < 8; j++,a++,b++) {
				matches += (*a == *b);
			}
		}
	}

	a = (byte*)a64;
	b = (byte*)b64;

	int remainder = length % 8;
	for (int i = 0; i < remainder; i++, a++, b++) {
		matches += (*a == *b);
	}

	return length - matches;
}

// most of this stuff is copied and adapted from quake3e multiview version, though I made a lot of changes
static qboolean SV_EmitPlayerStates( client_t* client, const clientSnapshot_t *from, const clientSnapshot_t *to, msg_t *msg)
{
    psFrame_t *psf;
    const psFrame_t *old_psf;
    const playerState_t *oldPs;
	int baseClientID = client->isMultiviewRecorder ? MV_AUTORECORD_CLIENT : client - svs.clients;
	const playerState_t* nullPs = to->version >= 4 ? MSG_GetBaselinePS(sv_gametype->integer,MV_GetCurrentGameversion()) : NULL;
	const playerState_t* playerStateClientnumFroms[MAX_CLIENTS] = { 0 }; // if multiple people have the same ps clientnum, we can check a spectator relationship. so just delta from the old one if it looks similar enough

	playerStateClientnumFroms[to->ps.clientNum] = &to->ps;

    int i, n;
    int clientSlot;
    int oldIndex;

    const byte *oldPsMask;
    const byte *oldPsMaskForEncoding;
    byte oldPsMaskBuf[MAX_CLIENTS/8];
    byte newPsMask[MAX_CLIENTS/8];

    const byte *oldEntMask;

    // generate playerstate mask
    if ( !from || !from->num_psf ) {
        Com_Memset( oldPsMaskBuf, 0, sizeof( oldPsMaskBuf ) );
        oldPsMask = oldPsMaskBuf;
    } else {
        oldPsMask = from->psMask;
    }

	oldPsMaskForEncoding = oldPsMask;

	if (to->version >= 2 && from) {
		// every now and then send out a full psmask. so oldschool demo cutters dont totally break the demos
		if (to->rescueable && from->num_psf) {
			MSG_WriteBits(msg, 1, 1);
			Com_Memset(oldPsMaskBuf, 0, sizeof(oldPsMaskBuf));
			oldPsMaskForEncoding = oldPsMaskBuf;
		}
		else {
			MSG_WriteBits(msg, 0, 1);
		}
	}
#if 1
	// delta-xor playerstate bitmask
	for ( i = 0; i < ARRAY_LEN( newPsMask ); i++ ) {
		newPsMask[ i ] = to->psMask[ i ] ^ oldPsMaskForEncoding[ i ];
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
			// TA: I dont think we really need this check anymor since base client is excluded anyway? meh
            if ( from && clientSlot == baseClientID ) // FIXME: ps->clientNum?
                oldPs = &from->ps; // transition from legacy to multiview mode
            else
                oldPs = nullPs; // new playerstate
            // empty entity mask
            oldEntMask = NULL;
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
				//TA: it happens on mapchanges because the global psf buffer gets cleared but our frames do not.
				// we have 2 options: return qfalse to just avoid sending, or delta from NULL. 
				// but current client parse code will fail from a non-existing source delta anyway (due to bitmask xoring)
				// so i guess just avoid sending
				// in addition, let's clear the multiview flag of all client frames during reinits of the global arrays.
                //Com_Error( ERR_DROP, "oldIndex(%i) >= from->num_psf(%i), from->first_pfs=%i", oldIndex, from->num_psf, from->first_psf );
                Com_DPrintf( "SV_EmitPlayerStates: Old playerstate for delta is lost (due to mapchange?): oldIndex(%i) >= from->num_psf(%i), from->first_pfs=%i", oldIndex, from->num_psf, from->first_psf );
				return qfalse;
				//oldPs = NULL;
				//oldEntMask = old_psf->entMask;
			}

			oldPs = &old_psf->ps;
			oldEntMask = old_psf->entMask;
        }

		if (oldPs && to->rescueable) {
			oldPs = SV_GetRescueableBasePS(oldPs);
		}

        // areabytes
        MSG_WriteBits( msg, psf->areabytes, 6 ); // was 8
        MSG_WriteData( msg, psf->areabits, psf->areabytes & 63 );

		if (to->version >= 4) {
			if (psf->dedupeSuccessMask != to->dedupeSuccessMaskMerged) {
				MSG_WriteBits(msg, 1, 1);
				MSG_WriteBits(msg, psf->dedupeSuccessMask ^ to->dedupeSuccessMaskMerged, MAPPING_GROUPS_COUNT);
			}
			else
			{
				MSG_WriteBits(msg, 0, 1);
			}
		}

		// the snapped mappings refer to the same values. netcode only needs to know to skip these values, it doesn't need to distinguish between snapped or unsnapped
		int netMask = psf->dedupeSuccessMask | ((psf->dedupeSuccessMask & mappingsSnapped) >> 1);

		assert(psf->ps.clientNum >= 0 && psf->ps.clientNum < MAX_CLIENTS);

		if (to->version >= 5) {
			// prefer to remember one with PMF_FOLLOW to delta from, since a player can have many spectators and then we don't have to transmit the different pm_flags
			bool usePrevious = false;
			if (playerStateClientnumFroms[psf->ps.clientNum] && playerStateClientnumFroms[psf->ps.clientNum]->commandTime == psf->ps.commandTime) {

				int differences = CountByteDifferences((byte*)playerStateClientnumFroms[psf->ps.clientNum], (byte*)&psf->ps, sizeof(playerState_t));
				if (differences < 16) { 
					// typically it will only be 2 bytes or so (eFlags difference), but lets be generous
					// typically it will only be pm_flags (PMF_FOLLOW) and ping, but it can also be eFlags (cuz it gets adjusted for having voted)
					// and mods could ostensibly make changes.
					// we can increase this limit or otherwise change the condition serverside without really affecting the decodability (client only needs to know whether we are doing this)
					// so it's safe to just keep it like this for now and change later when better judgment arrives
					usePrevious = true;
				}
			}

			if (usePrevious) {
				oldPs = playerStateClientnumFroms[psf->ps.clientNum];
				MSG_WriteBits(msg, 1, 1);
				// TODO potential improvement: send index into psframes so far, and reduce the bits accordingly. e.g. if only 3 ps were sent so far, we only need 2 bits to uniquely identify each. but maybe overcomplicates?
				MSG_WriteBits(msg, psf->ps.clientNum, 5); // we don't know the actual ps clientnum until we read it on the client :/
			}
			else {
				MSG_WriteBits(msg, 0, 1);
			}
		}

        // playerstate
		if (to->version >= 4) {
			MSG_WriteDeltaPlayerstate<qtrue, qtrue>(msg, oldPs, &psf->ps, netMask, sv.time);
		}
		else {
			MSG_WriteDeltaPlayerstate(msg, oldPs, &psf->ps);
		}

		if (to->version >= 5) {
			if (!playerStateClientnumFroms[psf->ps.clientNum] || !(playerStateClientnumFroms[psf->ps.clientNum]->pm_flags & PMF_FOLLOW)) {
				// prefer to remember one with PMF_FOLLOW to delta from, since a player can have many spectators and then we don't have to transmit the different pm_flags
				playerStateClientnumFroms[psf->ps.clientNum] = &psf->ps;
			}
		}

#if 1
        // delta-xor mask
#if 0
		if (clientSlot == 2) {
			int highestNum = ARRAY_LEN(newEntMask) - 1;
			while (highestNum && newEntMask[highestNum]) {
				highestNum--;
			}
			Com_Printf("client 2 entmask (server): ");
			for (n = 0; n <= highestNum; n++) {
				Com_Printf("%d ", (int)psf->entMask[n]);
			}
			Com_Printf("\n");
		}
#endif
		SV_EmitEntMask(msg, psf->entMask, oldEntMask);
#else
        // direct mask
		MSG_WriteData( msg, psf->entMask.mask, sizeof( psf->entMask.mask ) );
#endif
    }

	return qtrue;
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
	if (!frame->normalSnapshotOldFrame || sv_mvNonDeltaInterval->integer && (svs.time == client->multiview.lastNonDelta || svs.time - client->multiview.lastNonDelta >= clampedIntMult(sv_mvNonDeltaInterval->integer,1000) || svs.time < client->multiview.lastNonDelta)) {
		oldframe = NULL;
		lastframe = 0;
		client->multiview.lastNonDelta = svs.time;
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
	int	olddedupeSuccessMaskMerged;

	frame->version = MIN(client->multiview.protocol,sv_mvMaxVersion->integer);

	if ( !oldframe || !oldframe->multiview || oldframe->version != frame->version ) {
		oldversion = 0;
		olddedupeSuccessMaskMerged = 0;
		lastframe = 0;
		oldframe = NULL;
		//oldmask = 0;
	} else {
		oldversion = oldframe->version;
		olddedupeSuccessMaskMerged = oldframe->dedupeSuccessMaskMerged;
		//oldmask = oldframe->mergeMask;
	}

	// what we are delta'ing from
	MSG_WriteByte( extensionMsg, lastframe );

	// every now and then we send a rescuable packet
	if (frame->version >= 2 && oldframe && (svs.time == client->multiview.lastFullPSMask || svs.time - client->multiview.lastFullPSMask >= 1000 || svs.time < client->multiview.lastFullPSMask)) { // do it on svs.time == client->multiview.lastFullPSMask cuz we may write separate snapshots for server demo
		frame->rescueable = qtrue;
		client->multiview.lastFullPSMask = svs.time;
	}
	else {
		frame->rescueable = qfalse;
	}

	// emit protocol version in first message
	if ( oldversion != frame->version || frame->rescueable ) {
		MSG_WriteBits( extensionMsg, 1, 1 );
		MSG_WriteByte( extensionMsg, frame->version );
	} else {
		MSG_WriteBits( extensionMsg, 0, 1 );
	}

	if (frame->version >= 3) {
		// we may have sent the main player's own entity, but turned it to ET_INVISIBLE to avoid conflicts
		// if we did, tell the client what the correct eType is
		if ( !oldframe || frame->ownEntityEType != oldframe->ownEntityEType || memcmp(frame->ownEventInfo,oldframe->ownEventInfo,sizeof(frame->ownEventInfo)) ) {
			MSG_WriteBits( extensionMsg, 1, 1 );
			MSG_WriteByte( extensionMsg, frame->ownEntityEType );
			for (int i = 0; i < MULTIVIEW_MAX_PS_ENTITY_EVENT_RESTORE; i++) {
				MSG_WriteBits(extensionMsg, frame->ownEventInfo[i], 2);
			}
		}
		else {
			MSG_WriteBits( extensionMsg, 0, 1 );
		}
		SV_EmitEntMask(extensionMsg, frame->ownEntmask, oldframe ? oldframe->ownEntmask : NULL);
	}

	// emit skip-merge mask
	if (frame->version >= 4) {
		if (olddedupeSuccessMaskMerged != frame->dedupeSuccessMaskMerged || frame->rescueable) {
			MSG_WriteBits(extensionMsg, 1, 1 );
			MSG_WriteBits(extensionMsg, frame->dedupeSuccessMaskMerged, MAPPING_GROUPS_COUNT);
		}
		else
		{
			MSG_WriteBits(extensionMsg, 0, 1 );
		}
	}

	if (!SV_EmitPlayerStates(client, oldframe, frame, extensionMsg)) {
		return qfalse;
	}
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

	int minsize = MSG_WriteExtensionMarker(msg, EXT_COOLEXTEND_SMALL); // minsize says how big the message must be to be recognized by the client (it checks cursize)

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
