
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

playerState_t* CL_GetActivePlayerState() {
	clSnapshot_t* clSnap = &cl.snap;

	if (clSnap->multiview.multiview && clc.clientView != clc.clientNum && GET_ABIT(clSnap->multiview.clientMask, clc.clientView)) {
		clPSFrame_t* psFrame = NULL;
		int i;

		if (clSnap->multiview.rescued) {
			clc.viewingCorruptedMultiview = 2;
		}

		for (i = clSnap->multiview.parsePlayerstatesNum; i < clSnap->multiview.parsePlayerstatesNum + clSnap->multiview.numPlayerstates; i++) {
			psFrame = &cl.parsePlayerstates[i & (MAX_PARSE_PLAYERSTATES - 1)];
			if (psFrame->number == clc.clientView) {
				break;
			}
		}
		if (psFrame && psFrame->number == clc.clientView) {

			return &psFrame->ps;
		}
	}

	return &clSnap->ps;
}

/*
========================
BG_PlayerStateToEntityStateExtraPolate

This is done after each set of usercmd_t on the server,
and after local prediction on the client
========================
*/
void BG_PlayerStateToEntityStateExtraPolate( playerState_t *ps, entityState_t *s, int time, qboolean snap ) {
	int		i;

	if ( ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPECTATOR ) {
		s->eType = ET_INVISIBLE;
	} else if ( ps->stats[STAT_HEALTH] <= GIB_HEALTH ) {
		s->eType = ET_INVISIBLE;
	} else {
		s->eType = ET_PLAYER;
	}

	s->number = ps->clientNum;

	s->pos.trType = TR_LINEAR_STOP;
	VectorCopy( ps->origin, s->pos.trBase );
	if ( snap ) {
		SnapVector( s->pos.trBase );
	}
	// set the trDelta for flag direction and linear prediction
	VectorCopy( ps->velocity, s->pos.trDelta );
	// set the time for linear prediction
	s->pos.trTime = time;
	// set maximum extra polation time
	s->pos.trDuration = 50; // 1000 / sv_fps (default = 20)

	s->apos.trType = TR_INTERPOLATE;
	VectorCopy( ps->viewangles, s->apos.trBase );
	if ( snap ) {
		SnapVector( s->apos.trBase );
	}

	s->trickedentindex = ps->fd.forceMindtrickTargetIndex;
	s->trickedentindex2 = ps->fd.forceMindtrickTargetIndex2;
	s->trickedentindex3 = ps->fd.forceMindtrickTargetIndex3;
	s->trickedentindex4 = ps->fd.forceMindtrickTargetIndex4;

	s->forceFrame = ps->saberLockFrame;

	s->emplacedOwner = ps->electrifyTime;

	s->speed = ps->speed;

	s->genericenemyindex = ps->genericEnemyIndex;

	s->activeForcePass = ps->activeForcePass;

	s->angles2[YAW] = ps->movementDir;
	s->legsAnim = ps->legsAnim;
	s->torsoAnim = ps->torsoAnim;
	s->clientNum = ps->clientNum;		// ET_PLAYER looks here instead of at number
										// so corpses can also reference the proper config
	s->eFlags = ps->eFlags;

	s->saberInFlight = ps->saberInFlight;
	s->saberEntityNum = ps->saberEntityNum;
	s->saberMove = ps->saberMove;
	s->forcePowersActive = ps->fd.forcePowersActive;

	if (ps->duelInProgress)
	{
		s->bolt1 = 1;
	}
	else
	{
		s->bolt1 = 0;
	}

	if (ps->dualBlade)
	{
		s->bolt2 = 1;
	}
	else
	{
		s->bolt2 = 0;
	}

	s->otherEntityNum2 = ps->emplacedIndex;

	s->shouldtarget = ps->saberHolstered; //reuse bool in entitystate for players differently
	s->teamowner = ps->usingATST;

	if (ps->genericEnemyIndex != -1)
	{
		s->eFlags |= EF_SEEKERDRONE;
	}

	if ( ps->stats[STAT_HEALTH] <= 0 ) {
		s->eFlags |= EF_DEAD;
	} else {
		s->eFlags &= ~EF_DEAD;
	}

	if ( ps->externalEvent ) {
		s->event = ps->externalEvent;
		s->eventParm = ps->externalEventParm;
	} else if ( ps->entityEventSequence < ps->eventSequence ) {
		int		seq;

		if ( ps->entityEventSequence < ps->eventSequence - MAX_PS_EVENTS) {
			ps->entityEventSequence = ps->eventSequence - MAX_PS_EVENTS;
		}
		seq = ps->entityEventSequence & (MAX_PS_EVENTS-1);
		s->event = ps->events[ seq ] | ( ( ps->entityEventSequence & 3 ) << 8 );
		s->eventParm = ps->eventParms[ seq ];
		ps->entityEventSequence++;
	}
	s->weapon = ps->weapon;
	s->groundEntityNum = ps->groundEntityNum;

	s->powerups = 0;
	for ( i = 0 ; i < MAX_POWERUPS ; i++ ) {
		if ( ps->powerups[ i ] ) {
			s->powerups |= 1 << i;
		}
	}

	s->loopSound = ps->loopSound;
	s->generic1 = ps->generic1;

	//NOT INCLUDED IN ENTITYSTATETOPLAYERSTATE:
	s->modelindex2 = ps->weaponstate;
	s->constantLight = ps->weaponChargeTime;

	VectorCopy(ps->lastHitLoc, s->origin2);

	s->isJediMaster = ps->isJediMaster;

	s->time2 = ps->holocronBits;

	s->fireflag = ps->fd.saberAnimLevel;

#if 0
	// bitmask float
	i = MIN(MAX(0, ps->stats[14]), 1023) & 0x3ff;
	s->angles2[PITCH] = *(float*)&i;
#endif
}
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

static void CL_RestorePlayerStateFromEntityState(msg_t* msg, playerState_t* ps, entityState_t* ent, int successMask) {
	const netFieldMapping_t* maps;
	const int mapCount = sizeof(playerStateEntityStateMappings) / sizeof(playerStateEntityStateMappings[0]);
	int failMask = ~successMask & ((1 << MAPPING_GROUPS_COUNT) - 1);
	int *psField,*esField;
	int print = 0;

	// shownet 2/3 will interleave with other printed info, -2 will
	// just print the delta records
	if (cl_shownet->integer >= 2 || cl_shownet->integer == -2) {
		print = 1;
		Com_Printf("%3i: playerstate from entitystate restore: ", msg->readcount);
	}
	else {
		print = 0;
	}

	maps = playerStateEntityStateMappings;
	for (int j = 0; j < mapCount; j++, maps++) {

		if (failMask & (1 << maps->maskIndex)) { // we don't need to snap it i guess
			if (maps->type == NFMT_MAYBESNAP) {
				if (failMask & (1 << (maps->maskIndex+1))) {
					continue;
				}
			}
			else {
				continue;
			}
		}

		psField = (int*)((byte*)ps + maps->offset);
		esField = (int*)((byte*)ent + maps->offset2);

		if ((maps->bits == 0) != (maps->bits2 == 0)) { // if one is float and other is not, check that esField can be converted into psField without loss
			if (!maps->bits) {
				*(float*)psField = (float)*esField;
			}
			else {
				*psField = (int)*(float*)esField;
			}
		}
		else {
			*psField = *esField;
		}
		if (print) {
			if (!maps->bits) {
				Com_Printf("%s:%f ", maps->name, *(float*)psField);
			}
			else {
				Com_Printf("%s:%d ", maps->name, *psField);
			}
		}
	}
	if (print) {
		Com_Printf("\n");
	}
}

#define FINDMATCH(var,numprop,svsarray,firstindex,index,svsmodulo,numtotal,finalvar) while ((var) && (var)->numprop < state->number && (index) < (numtotal) - 1) {\
			(var) = &(svsarray)[((firstindex) + (int64_t)++(index)) % (svsmodulo)];\
		}\
		(finalvar) = ((var) && (var)->numprop == state->number) ? (var) : NULL;

static void CL_ParsePlayerstates(clSnapshot_t* snap, clSnapshot_t* old, msg_t* msg) {
	int clientNum;
	clPSFrame_t* oldState= old ?  &cl.parsePlayerstates[(old->multiview.parsePlayerstatesNum) & (MAX_PARSE_PLAYERSTATES - 1)] : NULL;
	clPSFrame_t* state;
	int oldindex = 0;
	const playerState_t* nullPs = snap->multiview.version >= 4 ? MSG_GetBaselinePS(cl.gametype, MV_GetCurrentGameversion()) : NULL;
	const playerState_t* oldPs;
	qboolean rescuableFakeBase = qfalse;
	msg_t rescueableMsgBkup;

	int entIndex = 0;
	entityState_t *entReal=NULL,*ent = snap->numEntities ? &cl.parseEntities[(snap->parseEntitiesNum + entIndex) & (MAX_PARSE_ENTITIES - 1)] : NULL;

	//int i,firstIndex, lastIndex;

	//for (j = 0; j < snap->numEntities; ++j) {
	//	n = (snap->parseEntitiesNum + j) & (MAX_PARSE_ENTITIES - 1);
	//	ent = &cl.parseEntities[n];

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
				oldPs = nullPs;
			}
		} else {
			Com_Memset(state->entMask, 0, sizeof(state->entMask));
			oldPs = nullPs;
		}

		state->dedupeSuccessMask = 0;
		if (snap->multiview.version >= 4) {
			state->dedupeSuccessMask = snap->multiview.dedupeSuccessMaskMerged;
			if (MSG_ReadBits(msg, 1)) {
				SHOWNET(msg, "v4 ps dedupe successmask xor");
				state->dedupeSuccessMask ^= MSG_ReadBits(msg, MAPPING_GROUPS_COUNT);
			}
		}

		// the snapped mappings refer to the same values. netcode only needs to know to skip these values, it doesn't need to distinguish between snapped or unsnapped
		int netMask = state->dedupeSuccessMask | ((state->dedupeSuccessMask & mappingsSnapped) >> 1);

		if (snap->multiview.version >= 4) {
			MSG_ReadDeltaPlayerstate<qtrue, qtrue>(msg, oldPs, &state->ps, netMask, snap->serverTime);
		}
		else {
			MSG_ReadDeltaPlayerstate(msg, oldPs, &state->ps);
		}

		if (rescuableFakeBase && state->ps.clientNum != clientNum) {
			// now we actually now the clientnum, so we can go back and take the proper source entitystate maybe, and then re-read the changes
			oldPs = CL_GetRescueableBasePS(old, state->ps.clientNum);
			memcpy(msg, &rescueableMsgBkup, sizeof(*msg));
			if (snap->multiview.version >= 4) {
				MSG_ReadDeltaPlayerstate<qtrue, qtrue>(msg, oldPs, &state->ps, netMask, snap->serverTime );
			}
			else {
				MSG_ReadDeltaPlayerstate(msg, oldPs, &state->ps );
			}
		}

		if (netMask) {
			FINDMATCH(ent, number, cl.parseEntities, snap->parseEntitiesNum, entIndex, MAX_PARSE_ENTITIES, snap->numEntities, entReal);
			if (!entReal) {
				Com_Error(ERR_DROP,"CL_ParsePlayerstates: playerstate with netmask received, but no matching entity found");
			}
			CL_RestorePlayerStateFromEntityState(msg,&state->ps, entReal, state->dedupeSuccessMask);
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


	} // for [all clients]
}

void CL_AdjustMultiviewEntity(entityState_t* ent, snapshotMultiview_t* mv, int mainPSClientNum, int targetClientNum) {
	if (mainPSClientNum != targetClientNum) {
		// restore main player stuff for other viewpoint
		if (mainPSClientNum == ent->number) {

		}
	}
}

static void CL_FixOwnPlayer(clSnapshot_t* snap) {
	if (snap->multiview.version >= 3) {
		return;
	}

	int i, j, n;
	entityState_t* ent;
	for (j = 0; j < snap->numEntities; ++j) {
		n = (snap->parseEntitiesNum + j) & (MAX_PARSE_ENTITIES - 1);
		ent = &cl.parseEntities[n];
		if (ent->number > snap->ps.clientNum) {
			break;
		}
		else if (snap->ps.clientNum == ent->number && ent->eType == ET_INVISIBLE && snap->ps.pm_type != PM_INTERMISSION && snap->ps.pm_type != PM_SPECTATOR && snap->ps.stats[STAT_HEALTH] > GIB_HEALTH) {
			ent->eType = ET_PLAYER;
			if (snap->ps.externalEvent) {
				ent->event = snap->ps.externalEvent;
				ent->eventParm = snap->ps.externalEventParm;
			}
			else {// if (snap->ps.entityEventSequence < snap->ps.eventSequence) {
				int		seq;

				//if (snap->ps.entityEventSequence < snap->ps.eventSequence - 1) {// MAX_PS_EVENTS) {
					snap->ps.entityEventSequence = snap->ps.eventSequence - 1;//MAX_PS_EVENTS;
				//}
				seq = snap->ps.entityEventSequence & (MAX_PS_EVENTS - 1);
				ent->event = snap->ps.events[seq] | ((snap->ps.entityEventSequence & 3) << 8);
				ent->eventParm = snap->ps.eventParms[seq];
				snap->ps.entityEventSequence++;
			}
			break;
		}
	}
}

// fixes entmasks in rescued snaps (due to bad delta), and some other things
static void CL_FixRescuedEntmasks(clSnapshot_t* snap) {
	int i,j,n;
	clPSFrame_t* psFrame;
	entityState_t* ent;
	byte fullPSMask[MAX_CLIENTS / 8] = { 0 };

	if (/*snap->multiview.version < 3 && */!snap->multiview.numPlayerstates) {
		// nothing to do
		return;
	}
	// first set all to 255
	if (snap->multiview.version >= 3) {
		// snap is from a chain of invalid deltas, therefore we cannot trust its ent mask. therefore we just enable all ents.
		memset(snap->multiview.ownEntMask, 255, sizeof(snap->multiview.ownEntMask));
		UNSET_ABIT(snap->multiview.ownEntMask, snap->ps.clientNum);
	}
	SET_ABIT(fullPSMask, snap->ps.clientNum); // we set this and don't reuse clientMask because we care about who this view is. if someone is a follow spectator, he himself doesn't matter.
	for (i = snap->multiview.parsePlayerstatesNum; i < snap->multiview.parsePlayerstatesNum + snap->multiview.numPlayerstates; i++) {
		psFrame = &cl.parsePlayerstates[i & (MAX_PARSE_PLAYERSTATES - 1)];
		memset(psFrame->entMask, 255, sizeof(psFrame->entMask));
		SET_ABIT(fullPSMask, psFrame->ps.clientNum); 
		UNSET_ABIT(psFrame->entMask, psFrame->ps.clientNum);
	}

	// now go through all entities in this snap and unset any player entity events in the corresponding clients' entmasks
	for (j = 0; j < snap->numEntities; ++j) {
		n = (snap->parseEntitiesNum + j) & (MAX_PARSE_ENTITIES - 1);
		ent = &cl.parseEntities[n];
		if ( ent->eFlags & EF_PLAYER_EVENT && GET_ABIT(fullPSMask, ent->otherEntityNum) ) {
			if ( snap->multiview.version >= 3 && snap->ps.clientNum == ent->otherEntityNum) {
				UNSET_ABIT(snap->multiview.ownEntMask, ent->number);
			}

			// this is a player event of a player we have a playerstate of. make sure he doesnt see it himself
			for (i = snap->multiview.parsePlayerstatesNum; i < snap->multiview.parsePlayerstatesNum + snap->multiview.numPlayerstates; i++) {
				psFrame = &cl.parsePlayerstates[i & (MAX_PARSE_PLAYERSTATES - 1)];
				if (psFrame->ps.clientNum == ent->otherEntityNum) {
					UNSET_ABIT(psFrame->entMask, ent->number);
				}
			}
		}
	}
}

static int CL_GetPSEvent(playerState_t* ps, int type) {
	if (type == 1) {
		return ps->externalEvent;
	}
	else {
		type -= 2;
		int sequence = ps->eventSequence - 1 - type;
		int seq = sequence & (MAX_PS_EVENTS - 1);
		int relevantEvent = ps->events[seq] | ((sequence & 3) << 8);
		return relevantEvent;
	}
}

// to maintain compatibility with normal demo playback, the main player entity and main player events are zero'd/invisible'd out
// but if we switch to a different view, we still want to see them, so restore them if we can.
static void CL_RestoreOwnInfo(clSnapshot_t* snap) {
	int j, n, counter = 0;
	entityState_t* ent;
	int maincl = snap->ps.clientNum;
	for (j = 0; j < snap->numEntities; ++j) {
		n = (snap->parseEntitiesNum + j) & (MAX_PARSE_ENTITIES - 1);
		ent = &cl.parseEntities[n];

		if (ent->number == maincl) {
			if (snap->multiview.ownEntityEType >= 0) {
				ent->eType = snap->multiview.ownEntityEType;
			}
			if (snap->multiview.ownEventInfo[counter]) {
				int restoreEvent = CL_GetPSEvent(&snap->ps,snap->multiview.ownEventInfo[counter]);
				ent->event = restoreEvent & ((1<<10)-1); // event netfield gets 10 bits
			}
			counter++;
		}
		else if ((ent->eFlags & EF_PLAYER_EVENT) && ent->otherEntityNum == maincl) {
			if (snap->multiview.ownEventInfo[counter]) {
				int restoreEvent = CL_GetPSEvent(&snap->ps, snap->multiview.ownEventInfo[counter]);
				ent->event = restoreEvent & ((1 << 10) - 1); // event netfield gets 10 bits
				ent->eType = (ET_EVENTS + restoreEvent) & ((1 << 8) - 1); // eType netfield gets 8 bits
				//Com_Printf("restored player event: %d %d %d\n",ent->event,ent->eType, snap->ps.eventSequence);
			}
			counter++;
		}
		if (counter >= MULTIVIEW_MAX_PS_ENTITY_EVENT_RESTORE) {
			break;
		}
	}
}

static void CL_ParseMultiview(msg_t* msg, int bits, int startbits) {
	clSnapshot_t* snap = &cl.snap;
	clSnapshot_t* old = NULL;
	int deltaNum;

	Com_Memset(&snap->multiview,0,sizeof(snap->multiview));

	snap->multiview.multiview = qtrue;
	snap->multiview.ownEntityEType = -1;


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
		Com_Memcpy(snap->multiview.ownEntMask, old->multiview.ownEntMask, sizeof(snap->multiview.ownEntMask));
		//newSnap.mergeMask = old->mergeMask;
		snap->multiview.version = old->multiview.version;
		snap->multiview.ownEntityEType = old->multiview.ownEntityEType;
		snap->multiview.dedupeSuccessMaskMerged = old->multiview.dedupeSuccessMaskMerged;
		memcpy(snap->multiview.ownEventInfo, old->multiview.ownEventInfo, sizeof(snap->multiview.ownEventInfo));
	}
	else {
		// already zeroed as new snapshot
	}


	SHOWNET(msg, "version");
	if (MSG_ReadBits(msg, 1)) {
		snap->multiview.version = MSG_ReadByte(msg);
	}

	if (snap->multiview.version > MIN(MAX_MULTIVIEW_VERSION,cl_mvMaxVersion->integer)) {
		SHOWNET(msg, "Multiview version not supported. Skipping rest of multiview");
		snap->multiview.version = 0;
		snap->multiview.multiview = qfalse;
		snap->multiview.multiviewValid = qfalse;
		clc.multiviewVersionFail = qtrue;
		MSG_SkipBits(msg, (bits - (msg->bit - startbits)));
		return;
	}

	if (snap->multiview.version >= 3) {
		if (MSG_ReadBits(msg, 1)) {
			SHOWNET(msg, "v3 ownEType & ownEntMask & ownEventInfo");
			snap->multiview.ownEntityEType = MSG_ReadByte(msg);
			for (int i = 0; i < MULTIVIEW_MAX_PS_ENTITY_EVENT_RESTORE; i++) {
				snap->multiview.ownEventInfo[i] = MSG_ReadBits(msg, 2);
			}
		}
		MSG_ReadByteMask(msg,snap->multiview.ownEntMask, sizeof(snap->multiview.ownEntMask), 7);
		CL_RestoreOwnInfo(snap);
	}
	if (snap->multiview.version >= 4) {
		if (MSG_ReadBits(msg, 1)) {
			SHOWNET(msg, "v4 dedupe successmask merged");
			snap->multiview.dedupeSuccessMaskMerged = MSG_ReadBits(msg, MAPPING_GROUPS_COUNT);
		}
	}

	// playerState to entityState merge mask
	//SHOWNET(msg, "mergemask");
	//if (MSG_ReadBits(msg, 1)) {
	//	snap->multiview.mergeMask = MSG_ReadBits(msg, SM_BITS);
	//}

	if (old && snap->multiview.multiviewValid && snap->multiview.version != old->multiview.version) {
		snap->multiview.multiviewValid = qfalse;
	}

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

	if (snap->multiview.rescued) {
		CL_FixRescuedEntmasks(snap);
	}
	if (!snap->hasItsOwnEntity) {
		BG_PlayerStateToEntityStateExtraPolate(&snap->ps, &snap->multiview.reconstructedOwnEnt, snap->ps.commandTime, qfalse);
		snap->multiview.reconstructedOwnEnt.number = snap->ps.clientNum;
	} else if (snap->multiview.version < 3) {
		CL_FixOwnPlayer(snap);
	}

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
	msg_t msgBackup;
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
			msgBackup = *msg;
			switch (parseExtensionNamespace) {
			case 0: // normal tommyternal extensions namespace. if you make your own extensions, MAKE YOUR OWN NAMESPACE. See comments in sv_extensions.cpp
				CL_ParseTommyTernalNamespaceExtensions(msg,cmd,bits,parsedSnapshot);
				break;
			default:
				// unknown extension. skip
				SHOWNET(msg, va("Unknown cool extension, skipping (size %d bits, unknown namespace %d).", bits, parseExtensionNamespace));
				MSG_SkipBits(msg, bits);
				break;
			}
			// safety so that even if an extension has a parsing error, we are safe from crashes to menu, unless it does something catastrophic.
			if (msg->bit != (msgBackup.bit+bits)) {
				SHOWNET(msg, va("Cool extension parsing resulted in wrong amount of bits being read (expected size %d bits, read size %d bits, namespace %d).", bits, msg->bit-msgBackup.bit, parseExtensionNamespace));
				*msg = msgBackup;
				MSG_SkipBits(msg, bits);
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
