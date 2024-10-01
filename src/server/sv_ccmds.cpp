
#include "server.h"
#include "../strings/str_server.h"
#include "../qcommon/strip.h"

#include <sstream>
#include <ctime>

#ifdef SVDEMO
//extern std::vector<bufferedMessageContainer_t> demoPreRecordBuffer[MAX_CLIENTS];
extern std::vector<std::unique_ptr<bufferedMessageContainer_t>> demoPreRecordBuffer[MAX_CLIENTS];
extern std::map<std::string, std::string> demoMetaData[MAX_CLIENTS];
#endif

/*
===============================================================================

OPERATOR CONSOLE ONLY COMMANDS

These commands can only be entered from stdin or by a remote operator datagram
===============================================================================
*/

const char *SV_GetStripEdString(char *refSection, char *refName)
{
	/*
	static char text[1024]={0};
	trap_SP_GetStringTextString(va("%s_%s", refSection, refName), text, sizeof(text));
	return text;
	*/

	//Well, it would've been lovely doing it the above way, but it would mean mixing
	//languages for the client depending on what the server is. So we'll mark this as
	//a striped reference with @@@ and send the refname to the client, and when it goes
	//to print it will get scanned for the striped reference indication and dealt with
	//properly.
	static char text[1024]={0};
	Com_sprintf(text, sizeof(text), "@@@%s", refName);
	return text;
}



/*
==================
SV_GetPlayerByName

Returns the player with name from Cmd_Argv(1)
==================
*/
static client_t *SV_GetPlayerByName( void ) {
	client_t	*cl;
	int			i;
	char		*s;
	char		cleanName[64];

	// make sure server is running
	if ( !com_sv_running->integer ) {
		return NULL;
	}

	if ( Cmd_Argc() < 2 ) {
		Com_Printf( "No player specified.\n" );
		return NULL;
	}

	s = Cmd_Argv(1);

	// check for a name match
	for ( i=0, cl=svs.clients ; i < sv_maxclients->integer ; i++,cl++ ) {
		if ( !cl->state ) {
			continue;
		}
		if ( !Q_stricmp( cl->name, s ) ) {
			return cl;
		}

		Q_strncpyz( cleanName, cl->name, sizeof(cleanName) );
		Q_CleanStr( cleanName, (qboolean)MV_USE102COLOR, serverIsTommyTernal);
		if ( !Q_stricmp( cleanName, s ) ) {
			return cl;
		}
	}

	Com_Printf( "Player %s is not on the server\n", s );

	return NULL;
}

/*
==================
SV_GetPlayerByNum

Returns the player with idnum from Cmd_Argv(1)
==================
*/
static client_t *SV_GetPlayerByNum( void ) {
	client_t	*cl;
	int			i;
	int			idnum;
	char		*s;

	// make sure server is running
	if ( !com_sv_running->integer ) {
		return NULL;
	}

	if ( Cmd_Argc() < 2 ) {
		Com_Printf( "No player specified.\n" );
		return NULL;
	}

	s = Cmd_Argv(1);

	for (i = 0; s[i]; i++) {
		if (s[i] < '0' || s[i] > '9') {
			Com_Printf( "Bad slot number: %s\n", s);
			return NULL;
		}
	}
	idnum = atoi( s );
	if ( idnum < 0 || idnum >= sv_maxclients->integer ) {
		Com_Printf( "Bad client slot: %i\n", idnum );
		return NULL;
	}

	cl = &svs.clients[idnum];
	if ( !cl->state ) {
		Com_Printf( "Client %i is not active\n", idnum );
		return NULL;
	}
	return cl;
}

//=========================================================



/*
==================
SV_Map_f

Restart the server on a different map
==================
*/
static void SV_Map_f( void ) {
	char		*cmd;
	char		*map;
	qboolean	killBots, cheat;
	char		expanded[MAX_QPATH];
	char		mapname[MAX_QPATH];

	map = Cmd_Argv(1);
	if ( !map ) {
		return;
	}

	// make sure the level exists before trying to change, so that
	// a typo at the server console won't end the game
	if (strchr (map, '\\') ) {
		Com_Printf ("Can't have mapnames with a \\\n");
		return;
	}

	Com_sprintf (expanded, sizeof(expanded), "maps/%s.bsp", map);
	if ( FS_ReadFile (expanded, NULL) == -1 ) {
		Com_Printf ("Can't find map %s\n", expanded);
		return;
	}

	// force latched values to get set
	Cvar_Get ("g_gametype", "0", CVAR_SERVERINFO | CVAR_USERINFO | CVAR_LATCH );

	cmd = Cmd_Argv(0);
	if( Q_stricmpn( cmd, "sp", 2 ) == 0 ) {
		Cvar_SetValue( "g_gametype", GT_SINGLE_PLAYER );
		Cvar_SetValue( "g_doWarmup", 0 );
		// may not set sv_maxclients directly, always set latched
		Cvar_SetLatched( "sv_maxclients", "8" );
		cmd += 2;
		cheat = qfalse;
		killBots = qtrue;
	}
	else {
		if ( !Q_stricmpn( cmd, "devmap",6 ) || !Q_stricmp( cmd, "spdevmap" ) ) {
			cheat = qtrue;
			killBots = qtrue;
		} else {
			cheat = qfalse;
			killBots = qfalse;
		}
		/*
		if( sv_gametype->integer == GT_SINGLE_PLAYER ) {
			Cvar_SetValue( "g_gametype", GT_FFA );
		}
		*/
	}

	// save the map name here cause on a map restart we reload the jk2mpconfig.cfg
	// and thus nuke the arguments of the map command
	Q_strncpyz(mapname, map, sizeof(mapname));

	ForceReload_e eForceReload = eForceReload_NOTHING;	// default for normal load

//	if ( !Q_stricmp( cmd, "devmapbsp") ) {	// not relevant in MP codebase
//		eForceReload = eForceReload_BSP;
//	}
//	else
	if ( !Q_stricmp( cmd, "devmapmdl") ) {
		eForceReload = eForceReload_MODELS;
	}
	else
	if ( !Q_stricmp( cmd, "devmapall") ) {
		eForceReload = eForceReload_ALL;
	}

	// start up the map
	SV_SpawnServer( mapname, killBots, eForceReload );

	// set the cheat value
	// if the level was started with "map <levelname>", then
	// cheats will not be allowed.  If started with "devmap <levelname>"
	// then cheats will be allowed
	if ( cheat ) {
		Cvar_Set( "sv_cheats", "1" );
	} else {
		Cvar_Set( "sv_cheats", "0" );
	}
}


/*
================
SV_MapRestart_f

Completely restarts a level, but doesn't send a new gamestate to the clients.
This allows fair starts with variable load times.
================
*/
static void SV_MapRestart_f( void ) {
	int			i;
	client_t	*client;
	const char	*denied;
	qboolean	isBot;
	int			delay;

	// make sure we aren't restarting twice in the same frame
	if ( com_frameTime == sv.serverId ) {
		return;
	}

	// make sure server is running
	if ( !com_sv_running->integer ) {
		Com_Printf( "Server is not running.\n" );
		return;
	}

	if ( sv.restartTime ) {
		return;
	}

	if (Cmd_Argc() > 1 ) {
		delay = atoi( Cmd_Argv(1) );
	}
	else {
		delay = 5;
	}
	if( delay && (!Cvar_VariableValue("g_doWarmup") || Cvar_VariableValue("g_gametype") == GT_TOURNAMENT) ) {
		sv.restartTime = sv.time + delay * 1000;
		SV_SetConfigstring( CS_WARMUP, va("%i", sv.restartTime) );
		return;
	}

	// check for changes in variables that can't just be restarted
	// check for maxclients change
	if ( sv_maxclients->modified || sv_gametype->modified ) {
		char	mapname[MAX_QPATH];

		Com_Printf( "variable change -- restarting.\n" );
		// restart the map the slow way
		Q_strncpyz( mapname, Cvar_VariableString( "mapname" ), sizeof( mapname ) );

		SV_SpawnServer( mapname, qfalse, eForceReload_NOTHING );
		return;
	}

#ifdef SVDEMO
	SV_StopAutoRecordDemos();
	SV_ClearAllDemoPreRecord();
#endif

	// toggle the server bit so clients can detect that a
	// map_restart has happened
	svs.snapFlagServerBit ^= SNAPFLAG_SERVERCOUNT;

	// generate a new serverid
	sv.restartedServerId = sv.serverId;
	sv.serverId = com_frameTime;
	Cvar_Set( "sv_serverid", va("%i", sv.serverId ) );

#ifdef SVDEMO
	time(&sv.realMapTimeStarted);
	sv.demosPruned = qfalse;
#endif

	// if a map_restart occurs while a client is changing maps, we need
	// to give them the correct time so that when they finish loading
	// they don't violate the backwards time check in cl_cgame.c
	for (i=0 ; i<sv_maxclients->integer ; i++) {
		if (svs.clients[i].state == CS_PRIMED) {
			svs.clients[i].oldServerTime = sv.restartTime;
		}
	}

	// reset all the vm data in place without changing memory allocation
	// note that we do NOT set sv.state = SS_LOADING, so configstrings that
	// had been changed from their default values will generate broadcast updates
	sv.state = SS_LOADING;
	sv.restarting = qtrue;

	SV_RestartGameProgs();

	// run a few frames to allow everything to settle
	for ( i = 0 ;i < 3 ; i++ ) {
		VM_Call( gvm, GAME_RUN_FRAME, sv.time );
		sv.time += 100;
		svs.time += 100;
	}

	sv.state = SS_GAME;
	sv.restarting = qfalse;

	// connect and begin all the clients
	for (i=0 ; i<sv_maxclients->integer ; i++) {
		client = &svs.clients[i];

		// send the new gamestate to all connected clients
		if ( client->state < CS_CONNECTED) {
			continue;
		}

		if ( client->netchan.remoteAddress.type == NA_BOT ) {
			isBot = qtrue;
		} else {
			isBot = qfalse;
		}

		// add the map_restart command
		SV_AddServerCommand( client, "map_restart\n" );

		// connect the client again, without the firstTime flag
		denied = (const char *)VM_ExplicitArgString( gvm, VM_Call( gvm, GAME_CLIENT_CONNECT, i, qfalse, isBot ) );
		if ( denied ) {
			// this generally shouldn't happen, because the client
			// was connected before the level change
			SV_DropClient( client, denied );
			Com_Printf( "SV_MapRestart_f(%d): dropped client %i - denied!\n", delay, i ); // bk010125
			continue;
		}

		client->state = CS_ACTIVE;

		SV_ClientEnterWorld( client, &client->lastUsercmd );
	}

	// run another frame to allow things to look at all the players
	VM_Call( gvm, GAME_RUN_FRAME, sv.time );
	sv.time += 100;
	svs.time += 100;
}

//===============================================================

/*
==================
SV_GetPlayerByName

Returns the player with name from Cmd_Argv(1)
==================
*/
static client_t *SV_GetPlayerByFedName( const char *name )
{
	client_t	*cl;
	int			i;
	char		cleanName[64];

	// make sure server is running
	if ( !com_sv_running->integer )
	{
		return NULL;
	}

	// check for a name match
	for ( i=0, cl=svs.clients ; i < sv_maxclients->integer ; i++,cl++ )
	{
		if ( !cl->state )
		{
			continue;
		}
		if ( !Q_stricmp( cl->name, name ) )
		{
			return cl;
		}

		Q_strncpyz( cleanName, cl->name, sizeof(cleanName) );
		Q_CleanStr( cleanName, (qboolean)MV_USE102COLOR, serverIsTommyTernal);
		if ( !Q_stricmp( cleanName, name ) )
		{
			return cl;
		}
	}

	return NULL;
}

static void SV_KickByName( const char *name )
{
	client_t	*cl;
	int			i;

	// make sure server is running
	if ( !com_sv_running->integer )
	{
		return;
	}

	cl = SV_GetPlayerByFedName(name);
	if ( !cl )
	{
		if ( !Q_stricmp(name, "all") )
		{
			for ( i=0, cl=svs.clients ; i < sv_maxclients->integer ; i++,cl++ )
			{
				if ( !cl->state )
				{
					continue;
				}
				if( cl->netchan.remoteAddress.type == NA_LOOPBACK )
				{
					continue;
				}
				SV_DropClient( cl, SV_GetStripEdString("SVINGAME","WAS_KICKED"));	// "was kicked" );
				cl->lastPacketTime = svs.time;	// in case there is a funny zombie
			}
		}
		else if ( !Q_stricmp(name, "allbots") )
		{
			for ( i=0, cl=svs.clients ; i < sv_maxclients->integer ; i++,cl++ )
			{
				if ( !cl->state )
				{
					continue;
				}
				if( cl->netchan.remoteAddress.type != NA_BOT )
				{
					continue;
				}
				SV_DropClient( cl, SV_GetStripEdString("SVINGAME","WAS_KICKED"));	// "was kicked" );
				cl->lastPacketTime = svs.time;	// in case there is a funny zombie
			}
		}
		return;
	}
	if( cl->netchan.remoteAddress.type == NA_LOOPBACK )
	{
//		SV_SendServerCommand(NULL, "print \"%s\"", "Cannot kick host player\n");
		SV_SendServerCommand(NULL, "print \"%s\"", SV_GetStripEdString("SVINGAME","CANNOT_KICK_HOST"));
		return;
	}

	SV_DropClient( cl, SV_GetStripEdString("SVINGAME","WAS_KICKED"));	// "was kicked" );
	cl->lastPacketTime = svs.time;	// in case there is a funny zombie
}

/*
==================
SV_Kick_f

Kick a user off of the server  FIXME: move to game
==================
*/
static void SV_Kick_f( void ) {
	client_t	*cl;
	int			i;

	// make sure server is running
	if ( !com_sv_running->integer ) {
		Com_Printf( "Server is not running.\n" );
		return;
	}

	if ( Cmd_Argc() != 2 ) {
		Com_Printf ("Usage: kick <player name>\nkick all = kick everyone\nkick allbots = kick all bots\n");
		return;
	}

	if (!Q_stricmp(Cmd_Argv(1), "Padawan"))
	{ //if you try to kick the default name, also try to kick ""
		SV_KickByName("");
	}

	cl = SV_GetPlayerByName();
	if ( !cl ) {
		if ( !Q_stricmp(Cmd_Argv(1), "all") ) {
			for ( i=0, cl=svs.clients ; i < sv_maxclients->integer ; i++,cl++ ) {
				if ( !cl->state ) {
					continue;
				}
				if( cl->netchan.remoteAddress.type == NA_LOOPBACK ) {
					continue;
				}
				SV_DropClient( cl, SV_GetStripEdString("SVINGAME","WAS_KICKED"));	// "was kicked" );
				cl->lastPacketTime = svs.time;	// in case there is a funny zombie
			}
		}
		else if ( !Q_stricmp(Cmd_Argv(1), "allbots") ) {
			for ( i=0, cl=svs.clients ; i < sv_maxclients->integer ; i++,cl++ ) {
				if ( !cl->state ) {
					continue;
				}
				if( cl->netchan.remoteAddress.type != NA_BOT ) {
					continue;
				}
				SV_DropClient( cl, SV_GetStripEdString("SVINGAME","WAS_KICKED"));	// "was kicked" );
				cl->lastPacketTime = svs.time;	// in case there is a funny zombie
			}
		}
		return;
	}
	if( cl->netchan.remoteAddress.type == NA_LOOPBACK ) {
//		SV_SendServerCommand(NULL, "print \"%s\"", "Cannot kick host player\n");
		SV_SendServerCommand(NULL, "print \"%s\"", SV_GetStripEdString("SVINGAME","CANNOT_KICK_HOST"));
		return;
	}

	SV_DropClient( cl, SV_GetStripEdString("SVINGAME","WAS_KICKED"));	// "was kicked" );
	cl->lastPacketTime = svs.time;	// in case there is a funny zombie
}

/*
==================
SV_KickNum_f

Kick a user off of the server  FIXME: move to game
==================
*/
static void SV_KickNum_f( void ) {
	client_t	*cl;

	// make sure server is running
	if ( !com_sv_running->integer ) {
		Com_Printf( "Server is not running.\n" );
		return;
	}

	if ( Cmd_Argc() != 2 ) {
		Com_Printf ("Usage: kicknum <client number>\n");
		return;
	}

	cl = SV_GetPlayerByNum();
	if ( !cl ) {
		return;
	}
	if( cl->netchan.remoteAddress.type == NA_LOOPBACK ) {
//		SV_SendServerCommand(NULL, "print \"%s\"", "Cannot kick host player\n");
		SV_SendServerCommand(NULL, "print \"%s\"", SV_GetStripEdString("SVINGAME","CANNOT_KICK_HOST"));
		return;
	}

	SV_DropClient( cl, SV_GetStripEdString("SVINGAME","WAS_KICKED"));	// "was kicked" );
	cl->lastPacketTime = svs.time;	// in case there is a funny zombie
}

/*
================
SV_Status_f
================
*/
static void SV_Status_f( void )
{
	int				i;
	client_t		*cl;
	playerState_t	*ps;
	const char		*s;
	int				ping;
	char			state[32];
	qboolean		avoidTruncation = qfalse;

	int				j, k;
	char			spaces[32];
	char			displayName[MAX_NAME_LENGTH];

	// make sure server is running
	if ( !com_sv_running->integer )
	{
		Com_Printf( "%s", SP_GetStringText(STR_SERVER_SERVER_NOT_RUNNING) );
		return;
	}

	if ( Cmd_Argc() > 1 )
	{
		if (!Q_stricmp("notrunc", Cmd_Argv(1)))
		{
			avoidTruncation = qtrue;
		}
	}

	Com_Printf ("map: %s\n", sv_mapname->string );

	Com_Printf ("num score ping name            lastmsg address               qport rate\n");
	Com_Printf ("--- ----- ---- --------------- ------- --------------------- ----- -----\n");
	for (i=0,cl=svs.clients ; i < sv_maxclients->integer ; i++,cl++)
	{
		if (!cl->state)
		{
			continue;
		}

		if (cl->state == CS_CONNECTED)
		{
			strcpy(state, "CNCT ");
		}
		else if (cl->state == CS_ZOMBIE)
		{
			strcpy(state, "ZMBI ");
		}
		else
		{
			ping = cl->ping < 9999 ? cl->ping : 9999;
			sprintf(state, "%4i", ping);
		}

		ps = SV_GameClientNum( i );
		s = NET_AdrToString( cl->netchan.remoteAddress );

		// Count the length of the visible characters in the name and if it's less than 15 fill the rest with spaces
		k = Q_PrintStrlen(cl->name, MV_USE102COLOR, serverIsTommyTernal);
		if ( k < 0 ) k = 0; // Should never happen
		for( j = 0; j < (15 - k); j++ ) spaces[j] = ' ';
		spaces[j] = 0;

		if (!avoidTruncation) {
			// Limit the visible length of the name to 15 characters (not counting colors)
			Q_PrintStrCopy( displayName, cl->name, sizeof(displayName), 0, 15, MV_USE102COLOR, serverIsTommyTernal);
		} else {
			Q_strncpyz( displayName, cl->name, sizeof(displayName) );
		}

		Com_Printf ("%3i %5i %s %s^7%s %7i %21s %5i %5i\n",
			i,
			ps->persistant[PERS_SCORE],
			state,
			displayName,
			spaces,
			svs.time - cl->lastPacketTime,
			s,
			cl->netchan.qport,
			SV_ClientRate(cl)
			);
	}
	Com_Printf ("\n");
}

/*
==================
SV_ConSay_f
==================
*/
static void SV_ConSay_f(void) {
	char	*p;
	char	text[1024];

	if( !com_dedicated->integer ) {
		Com_Printf( "Server is not dedicated.\n" );
		return;
	}

	// make sure server is running
	if ( !com_sv_running->integer ) {
		Com_Printf( "Server is not running.\n" );
		return;
	}

	if ( Cmd_Argc () < 2 ) {
		return;
	}

	strcpy (text, "Server: ");
	p = Cmd_Args();

	if ( *p == '"' ) {
		p++;
		p[strlen(p)-1] = 0;
	}

	strcat(text, p);

	SV_SendServerCommand(NULL, "chat \"%s\n\"", text);
}

static const char * const forceToggleNamePrints[] =
{
	"HEAL",//FP_HEAL
	"JUMP",//FP_LEVITATION
	"SPEED",//FP_SPEED
	"PUSH",//FP_PUSH
	"PULL",//FP_PULL
	"MINDTRICK",//FP_TELEPTAHY
	"GRIP",//FP_GRIP
	"LIGHTNING",//FP_LIGHTNING
	"DARK RAGE",//FP_RAGE
	"PROTECT",//FP_PROTECT
	"ABSORB",//FP_ABSORB
	"TEAM HEAL",//FP_TEAM_HEAL
	"TEAM REPLENISH",//FP_TEAM_FORCE
	"DRAIN",//FP_DRAIN
	"SEEING",//FP_SEE
	"SABER OFFENSE",//FP_SABERATTACK
	"SABER DEFENSE",//FP_SABERDEFEND
	"SABER THROW",//FP_SABERTHROW
	NULL
};

/*
==================
SV_ForceToggle_f
==================
*/
void SV_ForceToggle_f(void)
{
	int i = 0;
	int fpDisabled = Cvar_VariableValue("g_forcePowerDisable");
	int targetPower = 0;
	const char *powerDisabled = "Enabled";

	if ( Cmd_Argc () < 2 )
	{ //no argument supplied, spit out a list of force powers and their numbers
		while (i < NUM_FORCE_POWERS)
		{
			if (fpDisabled & (1 << i))
			{
				powerDisabled = "Disabled";
			}
			else
			{
				powerDisabled = "Enabled";
			}

			Com_Printf("%i - %s - Status: %s\n", i, forceToggleNamePrints[i], powerDisabled);
			i++;
		}

		Com_Printf("Example usage: forcetoggle 3\n(toggles PUSH)\n");
		return;
	}

	targetPower = atoi(Cmd_Argv(1));

	if (targetPower < 0 || targetPower >= NUM_FORCE_POWERS)
	{
		Com_Printf("Specified a power that does not exist.\nExample usage: forcetoggle 3\n(toggles PUSH)\n");
		return;
	}

	if (fpDisabled & (1 << targetPower))
	{
		powerDisabled = "enabled";
		fpDisabled &= ~(1 << targetPower);
	}
	else
	{
		powerDisabled = "disabled";
		fpDisabled |= (1 << targetPower);
	}

	Cvar_Set("g_forcePowerDisable", va("%i", fpDisabled));

	Com_Printf("%s has been %s.\n", forceToggleNamePrints[targetPower], powerDisabled);
}

/*
==================
SV_Heartbeat_f

Also called by SV_DropClient, SV_DirectConnect, and SV_SpawnServer
==================
*/
void SV_Heartbeat_f( void ) {
	svs.nextHeartbeatTime = -9999999;
}


/*
===========
SV_Serverinfo_f

Examine the serverinfo string
===========
*/
static void SV_Serverinfo_f( void ) {
	Com_Printf ("Server info settings:\n");
	Info_Print ( Cvar_InfoString( CVAR_SERVERINFO ) );
	if ( !com_sv_running->integer ) {
		Com_Printf( "Server is not running.\n" );
	}
}


/*
===========
SV_Systeminfo_f

Examine or change the serverinfo string
===========
*/
static void SV_Systeminfo_f( void ) {
	Com_Printf ("System info settings:\n");
	Info_Print ( Cvar_InfoString( CVAR_SYSTEMINFO ) );
}


/*
===========
SV_DumpUser_f

Examine all a users info strings FIXME: move to game
===========
*/
static void SV_DumpUser_f( void ) {
	client_t	*cl;

	// make sure server is running
	if ( !com_sv_running->integer ) {
		Com_Printf( "Server is not running.\n" );
		return;
	}

	if ( Cmd_Argc() != 2 ) {
		Com_Printf ("Usage: info <userid>\n");
		return;
	}

	cl = SV_GetPlayerByName();
	if ( !cl ) {
		return;
	}

	Com_Printf( "userinfo\n" );
	Com_Printf( "--------\n" );
	Info_Print( cl->userinfo );
}


/*
=================
SV_KillServer
=================
*/
static void SV_KillServer_f( void ) {
	SV_Shutdown( "killserver" );
}


#ifdef SVDEMO

void SV_WriteDemoMessage(client_t* cl, msg_t* msg, int headerBytes) {
	int		len, swlen;

	// write the packet sequence
	len = cl->netchan.outgoingSequence;
	swlen = LittleLong(len);
	FS_Write(&swlen, 4, cl->demo.demofile);

	// skip the packet sequencing information
	len = msg->cursize - headerBytes;
	swlen = LittleLong(len);
	FS_Write(&swlen, 4, cl->demo.demofile);
	FS_Write(msg->data + headerBytes, len, cl->demo.demofile);
}

void SV_WriteDemoMessage(client_t* cl, msg_t* msg, int headerBytes, int messageNum) { // Version that specifies messagenumber manually, for buffered (pre-record) messages.
	int		len, swlen;

	// write the packet sequence
	len = messageNum;
	swlen = LittleLong(len);
	if (com_developer->integer > 1) {
		Com_Printf("a ");
	}
	FS_Write(&swlen, 4, cl->demo.demofile);

	// skip the packet sequencing information
	len = msg->cursize - headerBytes;
	swlen = LittleLong(len);
	if (com_developer->integer > 1) {
		Com_Printf("b ");
	}
	FS_Write(&swlen, 4, cl->demo.demofile);
	if (com_developer->integer > 1) {
		Com_Printf("c ");
	}
	FS_Write(msg->data + headerBytes, len, cl->demo.demofile);
}



constexpr char postEOFMetadataMarker[] = "HIDDENMETA";

// Write an empty message at start of demo with metadata.
// Metadata must be in JSON format to maintain compatibility for this format,
// that way every demo writing tool/client/server can read/write different parameters
// without conflicting.
// But the JSON is not verified in this function, so just be good.
// "lastClientCommand" is client->lastClientCommand, but if you are pre-recording,
// you should get the older value
// "messageNum" is the messageNum of the metadata messsage.
// Normally the first message in a demo is the "header" or gamestate message with first message num -1
// With metadata, this becomes sthe first message instead. So it's first demo message num - 2
void SV_WriteEmptyMessageWithMetadata(int lastClientCommand, fileHandle_t f, const char* metaData, int messageNum) {
	byte			bufData[MAX_MSGLEN];
	msg_t			buf;
	int				i;
	int				len;
	entityState_t* ent;
	entityState_t	nullstate;
	char* s;


	MSG_Init(&buf, bufData, sizeof(bufData));
	MSG_Bitstream(&buf);
	// NOTE, MRE: all server->client messages now acknowledge
	MSG_WriteLong(&buf, lastClientCommand);
	MSG_WriteByte(&buf, svc_EOF);

	// Normal demo readers will quit here. For all intents and purposes this demo message is over. But we're gonna put the metadata here now. Since it comes after svc_EOF, nobody will ever be bothered by it 
	// but we can read it if we want to.
	constexpr int metaMarkerLength = sizeof(postEOFMetadataMarker) - 1;
	// This is how the demo huffman operates. Worst case a byte can take almost 2 bytes to save, from what I understand. When reading past the end, we need to detect if we SHOULD read past the end.
	// For each byte we need to read, thus, the message length must be at least 2 bytes longer still. Hence at the end we will artificially set the message length to be minimum that long.
	// We will only read x amount of bytes (where x is the length of the meta marker) and see if the meta marker is present. If it is, we then proceeed to read a bigstring.
	// This same thing is technically not true for the custom compressed types (as their size is always the real size of the data) but we'll just leave it like this to be universal and simple.
	constexpr int maxBytePerByteSaved = 2;
	constexpr int metaMarkerPresenceMinimumByteLengthExtra = metaMarkerLength * maxBytePerByteSaved;

	const int requiredCursize = buf.cursize + metaMarkerPresenceMinimumByteLengthExtra; // We'll just set it to this value at the end if it ends up smaller.

	for (int i = 0; i < metaMarkerLength; i++) {
		MSG_WriteByte(&buf, postEOFMetadataMarker[i]);
	}
	MSG_WriteBigString(&buf, metaData);


	MSG_WriteByte(&buf, svc_EOF); // Done. Not really needed but whatever.

	if (buf.cursize < requiredCursize) {
		buf.cursize = requiredCursize;
	}

	// write it to the demo file
	len = LittleLong(messageNum);
	FS_Write(&len, 4, f);
	len = LittleLong(buf.cursize);
	FS_Write(&len, 4, f);

	FS_Write(buf.data, buf.cursize, f);
}

void SV_StopRecordDemo(client_t* cl) {
	int		len;

	if (!cl->demo.demorecording) {
		Com_Printf("Client %d is not recording a demo.\n", cl - svs.clients);
		return;
	}

	if (com_developer->integer > 1) {
		Com_Printf("Stopping demo recording ... ");
	}

	// finish up
	len = -1;
	FS_Write(&len, 4, cl->demo.demofile);
	FS_Write(&len, 4, cl->demo.demofile);
	FS_FCloseFile(cl->demo.demofile);
	cl->demo.demofile = 0;
	cl->demo.demorecording = qfalse;
	if (com_developer->integer)
		Com_Printf("Stopped demo for client %d.\n", cl - svs.clients);
}

void SV_ClearClientDemoMeta(client_t* cl) {

	demoMetaData[cl - svs.clients].clear();
}

void SV_ClearClientDemoPreRecord(client_t* cl) {

	demoPreRecordBuffer[cl - svs.clients].clear();
	Com_Memset(&cl->demo.preRecord, 0, sizeof(cl->demo.preRecord));
	cl->demo.preRecord.lastKeyframeTime = -(1000 * sv_demoPreRecordKeyframeDistance->integer) * 2; // Make sure that restarting recording will immediately create a keyframe.
}

void SV_ClearAllDemoPreRecord() {

	if (svs.clients) {
		for (client_t* client = svs.clients; client - svs.clients < sv_maxclients->integer; client++) {
			SV_ClearClientDemoPreRecord(client);
		}
	}
}

// stops all recording demos
void SV_StopAutoRecordDemos() {
	if (svs.clients && sv_autoDemo->integer) {
		for (client_t* client = svs.clients; client - svs.clients < sv_maxclients->integer; client++) {
			if (client->demo.demorecording) {
				SV_StopRecordDemo(client);
			}
		}
	}
}

/*
====================
SV_StopRecording_f

stop recording a demo
====================
*/
void SV_StopRecord_f(void) {
	int		i;

	client_t* cl = NULL;
	if (Cmd_Argc() == 2) {
		int clIndex = atoi(Cmd_Argv(1));
		if (clIndex < 0 || clIndex >= sv_maxclients->integer) {
			Com_Printf("Unknown client number %d.\n", clIndex);
			return;
		}
		cl = &svs.clients[clIndex];
	}
	else {
		for (i = 0; i < sv_maxclients->integer; i++) {
			if (svs.clients[i].demo.demorecording) {
				cl = &svs.clients[i];
				break;
			}
		}
		if (cl == NULL) {
			Com_Printf("No demo being recorded.\n");
			return;
		}
	}
	SV_StopRecordDemo(cl);
}

/*
====================
SV_RenameDemo_f

rename a demo, deleting the destination file if it already exists
====================
*/
void SV_RenameDemo_f(void) {
	char		from[MAX_OSPATH];
	char		to[MAX_OSPATH];

	if (Cmd_Argc() != 3) {
		return;
	}

	Com_sprintf(from, sizeof(from), "demos/%s.dm_%d", Cmd_Argv(1), MV_GetCurrentProtocol());
	Com_sprintf(to, sizeof(to), "demos/%s.dm_%d", Cmd_Argv(2), MV_GetCurrentProtocol()); //DEMO_EXTENSION

	if (FS_CheckDirTraversal(from) || FS_CheckDirTraversal(to)) {
		return;
	}

	FS_Rename(from, to);
}

/*
====================
SV_ListRecording_f

list demos being recorded
====================
*/
void SV_ListRecording_f(void) {
	int i;
	Com_Printf("Demos currently being recorded:\n");
	for (i = 0; i < sv_maxclients->integer; i++) {
		if (svs.clients[i].demo.demorecording) {
			Com_Printf("Client %i (%s)\n", i, svs.clients[i].demo.demoName);
		}
	}
}

/*
==================
SV_DemoFilename
==================
*/
void SV_DemoFilename(char* buf, int bufSize) {
	time_t rawtime;
	char timeStr[32] = { 0 }; // should really only reach ~19 chars

	time(&rawtime);
	strftime(timeStr, sizeof(timeStr), "%Y-%m-%d_%H-%M-%S", localtime(&rawtime)); // or gmtime

	Com_sprintf(buf, bufSize, "demo%s", timeStr);
}

// defined in sv_client.cpp
extern void SV_CreateClientGameStateMessage(client_t* client, msg_t* msg);
void SV_RecordDemo(client_t* cl, char* demoName) {
	char		name[MAX_OSPATH];
	byte		bufData[MAX_MSGLEN];
	msg_t		msg;
	int			len;
	std::stringstream ssMeta; // JSON metadata

	if (com_developer->integer > 1) {
		Com_Printf("Starting demo recording ... ");
	}

	if (cl->demo.demorecording) {
		Com_Printf("Already recording.\n");
		return;
	}

	if (cl->state != CS_ACTIVE) {
		Com_Printf("Client is not active.\n");
		return;
	}

	// open the demo file
	Q_strncpyz(cl->demo.demoName, demoName, sizeof(cl->demo.demoName));
	Com_sprintf(name, sizeof(name), "demos/%s.dm_%d", cl->demo.demoName, MV_GetCurrentProtocol()); //Should use DEMO_EXTENSION


	if (com_developer->integer) {
		Com_Printf("recording to %s.\n", name);
	}
	cl->demo.demofile = FS_FOpenFileWriteAsync(name, qtrue);
	if (!cl->demo.demofile) {
		Com_Printf("ERROR: couldn't open.\n");
		return;
	}
	cl->demo.demorecording = qtrue;

	cl->demo.isBot = (cl->netchan.remoteAddress.type == NA_BOT) ? qtrue : qfalse;
	cl->demo.botReliableAcknowledge = cl->reliableSent;


	// Save metadata message if desired
	if (sv_demoWriteMeta->integer) {
		if (com_developer->integer > 1) {
			Com_Printf("Preparing demo metadata ... ");
		}
		int i;
		ssMeta << "{";
		ssMeta << "\"wr\":\"EternalJK_Server\""; // Writer (keyword used by other tools too to identify origin of demo)

		// Go through manually set metadata and add it.
		for (auto it = demoMetaData[cl - svs.clients].begin(); it != demoMetaData[cl - svs.clients].end(); it++) {
			if (it->first != "wr" && it->first != "ost" && it->first != "prso") { // Can't overwrite default parameters (writer, original start time, pre-record start offset)

				ssMeta << ",\"" << it->first << "\":"; // JSON Key

				// Check if value is number
				bool isNumber = true;
				for (int i = 0; i < it->second.size(); i++) {
					if (!(it->second[i] >= '0' && it->second[i] <= '9' || it->second[i] == '.')) { // Allow floating point numbers too
						isNumber = false;
						break;
					}
				}

				if (isNumber) {
					ssMeta << it->second; // JSON Number value (no quotes)
				}
				else {
					ssMeta << "\"" << it->second << "\""; // JSON String value (with quotes)
				}
			}
		}
		//ssMeta << "}"; // Don't end the json array here, we want to add extra info in the case of pre-recording
	}

	// Ok we have two options now. Either the classical way of starting with gamestate.
	// OR, if enabled, we use our pre-recorded buffer to start recording a bit in the past,
	// in which case we also don't have to worry about demowaiting since the pre-record
	// already takes care of that
	if (sv_demoPreRecord->integer) {
		if (com_developer->integer) {
			SV_SendServerCommand(cl, "cp \"Starting demo. Buffer size: %d/%d\n\"", demoPreRecordBuffer[cl - svs.clients].size(), demoPreRecordBuffer[cl - svs.clients].capacity());
		}
		if (com_developer->integer > 1) {
			Com_Printf("Checking demo pre-record queue ... ");
		}
		// Pre-recording is enabled. Let's check for the oldest available keyframe.
		demoPreRecordBufferIt firstOldKeyframe;
		qboolean firstOldKeyframeFound = qfalse;
		if (com_developer->integer > 1) {
			Com_Printf("Demo pre-record queue size is %d, number of first message in queue is %d ... ", demoPreRecordBuffer[cl - svs.clients].begin(), demoPreRecordBuffer[cl - svs.clients].begin()->get()->msgNum);
		}
		for (demoPreRecordBufferIt it = demoPreRecordBuffer[cl - svs.clients].begin(); it != demoPreRecordBuffer[cl - svs.clients].end(); it++) {
			if (it->get()->isKeyframe && it->get()->time < sv.time) {
				firstOldKeyframe = it;
				firstOldKeyframeFound = qtrue;
				break;
			}
		}
		if (firstOldKeyframeFound) {
			if (com_developer->integer > 1) {
				Com_Printf("Dumping pre-recorded demo messages ... ");
			}
			int index = 0;
			// Dump this keyframe (gamestate message) and all following non-keyframes into the demo.
			for (demoPreRecordBufferIt it = firstOldKeyframe; it != demoPreRecordBuffer[cl - svs.clients].end(); it++, index++) {
				static byte preRecordBufData[MAX_MSGLEN]; // I make these static so they don't sit on the stack.
				static msg_t		preRecordMsg;

				if ((!it->get()->isKeyframe || index == 0) && it->get()->msgNum <= cl->netchan.outgoingSequence && it->get()->time <= sv.time) { // Check against outgoing sequence and server time too, *just in case* we ended up with some old messages
					// We only want a keyframe at the beginning of the demo, none after.
					Com_Memset(&preRecordMsg, 0, sizeof(msg_t));
					Com_Memset(&preRecordBufData, 0, sizeof(preRecordBufData));
					preRecordMsg.data = preRecordBufData;
					MSG_FromBuffered(&preRecordMsg, &it->get()->msg);
					MSG_WriteByte(&preRecordMsg, svc_EOF); // We didn't do that for the ones we put into the buffer, so we do it now.
					if (index == 0 && sv_demoWriteMeta->integer) {
						// This goes before the first messsage

						ssMeta << ",\"ost\":" << ((int64_t)std::time(nullptr) - ((sv.time - it->get()->time) / 1000)); // Original start time. When was demo recording started?
						ssMeta << ",\"prso\":" << (sv.time - it->get()->time); // Pre-recording start offset. Offset from start of demo to when the command to start recording was called

						ssMeta << "}"; // End JSON object
						if (com_developer->integer > 1) {
							Com_Printf("Writing demo metadata (pre-record) ... ");
						}
						SV_WriteEmptyMessageWithMetadata(it->get()->lastClientCommand, cl->demo.demofile, ssMeta.str().c_str(), it->get()->msgNum - 1);
						if (com_developer->integer > 1) {
							Com_Printf("done, writing pre-record messages ... ");
						}
					}
					if (com_developer->integer > 1) {
						Com_Printf("%d", it->get()->msgNum);
					}
					SV_WriteDemoMessage(cl, &preRecordMsg, 0, it->get()->msgNum);
					if (com_developer->integer > 1) {
						Com_Printf("w ");
					}
				}
			}
			if (com_developer->integer > 1) {
				Com_Printf("done.\n");
			}
			return; // No need to go through the whole normal demo procedure with demowaiting etc.
		}
	}

	// don't start saving messages until a non-delta compressed message is received
	cl->demo.demowaiting = qtrue;

	// write out the gamestate message
	MSG_Init(&msg, bufData, sizeof(bufData));

	// NOTE, MRE: all server->client messages now acknowledge
	int tmp = cl->reliableSent;
	if (com_developer->integer > 1) {
		Com_Printf("Creating gamestate (no pre-record) ... ");
	}
	SV_CreateClientGameStateMessage(cl, &msg);
	if (com_developer->integer > 1) {
		Com_Printf("done ...");
	}
	cl->reliableSent = tmp;

	// finished writing the client packet
	MSG_WriteByte(&msg, svc_EOF);

	if (sv_demoWriteMeta->integer) {
		// Write metadata first
		ssMeta << ",\"ost\":" << (int64_t)std::time(nullptr); // Original start time. When was demo recording started?
		ssMeta << "}"; // End JSON object
		if (com_developer->integer > 1) {
			Com_Printf("Writing demo metadata (default) ... ");
		}
		SV_WriteEmptyMessageWithMetadata(cl->lastClientCommand, cl->demo.demofile, ssMeta.str().c_str(), cl->netchan.outgoingSequence - 2);
		if (com_developer->integer > 1) {
			Com_Printf("done, writing gamestate ... ");
		}
	}

	// write it to the demo file
	len = LittleLong(cl->netchan.outgoingSequence - 1);
	FS_Write(&len, 4, cl->demo.demofile);

	len = LittleLong(msg.cursize);
	FS_Write(&len, 4, cl->demo.demofile);
	FS_Write(msg.data, msg.cursize, cl->demo.demofile);

	if (com_developer->integer > 1) {
		Com_Printf("done.\n");
	}
	// the rest of the demo file will be copied from net messages
}

void SV_AutoRecordDemo(client_t* cl) {
	char demoName[MAX_OSPATH];
	char demoFolderName[MAX_OSPATH];
	char demoFileName[MAX_OSPATH];
	char* demoNames[] = { demoFolderName, demoFileName };
	char date[MAX_OSPATH];
	char folderDate[MAX_OSPATH];
	char folderTreeDate[MAX_OSPATH];
	char demoPlayerName[MAX_NAME_LENGTH];
	time_t rawtime;
	struct tm* timeinfo;
	time(&rawtime);
	timeinfo = localtime(&rawtime);
	strftime(date, sizeof(date), "%Y-%m-%d_%H-%M-%S", timeinfo);
	timeinfo = localtime(&sv.realMapTimeStarted);
	strftime(folderDate, sizeof(folderDate), "%Y-%m-%d_%H-%M-%S", timeinfo);
	strftime(folderTreeDate, sizeof(folderTreeDate), "%Y/%m/%d", timeinfo);
	Q_strncpyz(demoPlayerName, cl->name, sizeof(demoPlayerName));
	Q_CleanStr(demoPlayerName,qtrue, serverIsTommyTernal);
	if (sv_autoDemo->integer == 2)
		Com_sprintf(demoFileName, sizeof(demoFileName), "%s %s", Cvar_VariableString("mapname"), date);
	else
		Com_sprintf(demoFileName, sizeof(demoFileName), "%d %s %s %s",
			cl - svs.clients, demoPlayerName, Cvar_VariableString("mapname"), date);
	Com_sprintf(demoFolderName, sizeof(demoFolderName), "%s %s", Cvar_VariableString("mapname"), folderDate);
	// sanitize filename
	for (char** start = demoNames; start - demoNames < (ptrdiff_t)ARRAY_LEN(demoNames); start++) {
		Q_strstrip(*start, "\n\r;:.?*<>|\\/\"", NULL);
	}
	Com_sprintf(demoName, sizeof(demoName), "autorecord/%s/%s/%s", folderTreeDate, demoFolderName, demoFileName);
	SV_RecordDemo(cl, demoName);
}

static time_t SV_ExtractTimeFromDemoFolder(char* folder) {
	char* slash = strrchr(folder, '/');
	if (slash) {
		folder = slash + 1;
	}
	size_t timeLen = strlen("0000-00-00_00-00-00");
	if (strlen(folder) < timeLen) {
		return 0;
	}
	struct tm timeinfo;
	timeinfo.tm_isdst = 0;
	int numMatched = sscanf(folder + (strlen(folder) - timeLen), "%4d-%2d-%2d_%2d-%2d-%2d",
		&timeinfo.tm_year, &timeinfo.tm_mon, &timeinfo.tm_mday, &timeinfo.tm_hour, &timeinfo.tm_min, &timeinfo.tm_sec);
	if (numMatched < 6) {
		// parsing failed
		return 0;
	}
	timeinfo.tm_year -= 1900;
	timeinfo.tm_mon--;
	return mktime(&timeinfo);
}

static int QDECL SV_DemoFolderTimeComparator(const void* arg1, const void* arg2) {
	char* left = (char*)arg1, * right = (char*)arg2;
	time_t leftTime = SV_ExtractTimeFromDemoFolder(left);
	time_t rightTime = SV_ExtractTimeFromDemoFolder(right);
	if (leftTime == 0 && rightTime == 0) {
		return -strcmp(left, right);
	}
	else if (leftTime == 0) {
		return 1;
	}
	else if (rightTime == 0) {
		return -1;
	}
	return rightTime - leftTime;
}


// returns number of folders found.  pass NULL result pointer for just a count.
static int SV_FindLeafFolders(const char* baseFolder, char* result, int maxResults, int maxFolderLength) {
	char* fileList = (char*)Z_Malloc(MAX_OSPATH * maxResults, TAG_FILESYS); // too big for stack since this is recursive
	char fullFolder[MAX_OSPATH];
	int resultCount = 0;
	char* fileName;
	int i;
	int numFiles = FS_GetFileList(baseFolder, "/", fileList, MAX_OSPATH * maxResults);

	fileName = fileList;
	for (i = 0; i < numFiles; i++) {
		if (Q_stricmp(fileName, ".") && Q_stricmp(fileName, "..")) {
			char* nextResult = NULL;
			Com_sprintf(fullFolder, sizeof(fullFolder), "%s/%s", baseFolder, fileName);
			if (result != NULL) {
				nextResult = &result[maxFolderLength * resultCount];
			}
			int newResults = SV_FindLeafFolders(fullFolder, nextResult, maxResults - resultCount, maxFolderLength);
			resultCount += newResults;
			if (result != NULL && resultCount >= maxResults) {
				break;
			}
			if (newResults == 0) {
				if (result != NULL) {
					Q_strncpyz(&result[maxFolderLength * resultCount], fullFolder, maxFolderLength);
				}
				resultCount++;
				if (result != NULL && resultCount >= maxResults) {
					break;
				}
			}
		}
		fileName += strlen(fileName) + 1;
	}

	Z_Free(fileList);

	return resultCount;
}

// starts demo recording on all active clients
void SV_BeginAutoRecordDemos() {
	if (sv_autoDemo->integer) {
		if (sv_autoDemo->integer == 2) { //Record a bot in spec named "RECORDER" only (to be used with cvar that networks spectators all player info)
			qboolean humans = qfalse;

			for (client_t* client = svs.clients; client - svs.clients < sv_maxclients->integer; client++) {
				if (client->state == CS_ACTIVE && client->netchan.remoteAddress.type != NA_BOT) {
					humans = qtrue;
					break;
				}
			}

			if (humans) { //mm.. stop demos of only bots being started when map_restart calls this 
				for (client_t* client = svs.clients; client - svs.clients < sv_maxclients->integer; client++) {
					if (client->state == CS_ACTIVE && !client->demo.demorecording) {
						if (client->netchan.remoteAddress.type == NA_BOT && !Q_stricmp(client->name, "RECORDER")) { //Only record a bot named RECORDER who is in spectate

							//client->gentity->playerState->fd.forcePowersActive
							//client->gentity->r.broadcastClients 

							//client->gentity->playerState->

							SV_AutoRecordDemo(client);
							break;
						}
					}
				}
			}
		}
		else if (sv_autoDemo->integer == 1) { //Normal autodemo behaviour, record 1 demo for everyone
			for (client_t* client = svs.clients; client - svs.clients < sv_maxclients->integer; client++) {
				if (client->state == CS_ACTIVE && !client->demo.demorecording) {
					if (client->netchan.remoteAddress.type != NA_BOT || sv_autoDemoBots->integer) {
						SV_AutoRecordDemo(client);
					}
				}
			}
		}
		if (sv_autoDemoMaxMaps->integer > 0 && sv.demosPruned == qfalse) {
			char autorecordDirList[500 * MAX_OSPATH], tmpFileList[5 * MAX_OSPATH];
			int autorecordDirListCount = SV_FindLeafFolders("demos/autorecord", autorecordDirList, 500, MAX_OSPATH);
			int i;

			qsort(autorecordDirList, autorecordDirListCount, MAX_OSPATH, SV_DemoFolderTimeComparator);
			for (i = sv_autoDemoMaxMaps->integer; i < autorecordDirListCount; i++) {
				char* folder = &autorecordDirList[i * MAX_OSPATH], * slash = NULL;
				FS_HomeRmdir(folder, qtrue);
				// if this folder was the last thing in its parent folder (and its parent isn't the root folder),
				// also delete the parent.
				for (;;) {
					slash = strrchr(folder, '/');
					if (slash == NULL) {
						break;
					}
					slash[0] = '\0';
					if (!strcmp(folder, "demos/autorecord")) {
						break;
					}
					int numFiles = FS_GetFileList(folder, "", tmpFileList, sizeof(tmpFileList));
					int numFolders = FS_GetFileList(folder, "/", tmpFileList, sizeof(tmpFileList));
					// numFolders will include . and ..
					if (numFiles == 0 && numFolders == 2) {
						// dangling empty folder, delete
						FS_HomeRmdir(folder, qfalse);
					}
					else {
						break;
					}
				}
			}
			sv.demosPruned = qtrue;
		}
	}
}

// code is a merge of the cl_main.cpp function of the same name and SV_SendClientGameState in sv_client.cpp
static void SV_Record_f(void) {
	char		demoName[MAX_OSPATH];
	char		name[MAX_OSPATH];
	int			i;
	char* s;
	client_t* cl;
	//int			len;

	if (svs.clients == NULL) {
		Com_Printf("cannot record server demo - null svs.clients\n");
		return;
	}

	if (Cmd_Argc() > 3) {
		Com_Printf("record <demoname> <clientnum>\n");
		return;
	}

	if (Cmd_Argc() == 3) {
		int clIndex = atoi(Cmd_Argv(2));
		if (clIndex < 0 || clIndex >= sv_maxclients->integer) {
			Com_Printf("Unknown client number %d.\n", clIndex);
			return;
		}
		cl = &svs.clients[clIndex];
	}
	else {
		for (i = 0, cl = svs.clients; i < sv_maxclients->integer; i++, cl++)
		{
			if (!cl->state)
			{
				continue;
			}

			if (cl->demo.demorecording)
			{
				continue;
			}

			if (cl->state == CS_ACTIVE)
			{
				break;
			}
		}
	}

	if (cl - svs.clients >= sv_maxclients->integer) {
		Com_Printf("No active client could be found.\n");
		return;
	}

	if (cl->demo.demorecording) {
		Com_Printf("Already recording.\n");
		return;
	}

	if (cl->state != CS_ACTIVE) {
		Com_Printf("Client is not active.\n");
		return;
	}

	if (Cmd_Argc() >= 2) {
		s = Cmd_Argv(1);
		Q_strncpyz(demoName, s, sizeof(demoName));
		Com_sprintf(name, sizeof(name), "demos/%s.dm_%d", demoName, MV_GetCurrentProtocol()); //Should use DEMO_EXTENSION
	}
	else {
		// timestamp the file
		SV_DemoFilename(demoName, sizeof(demoName));

		Com_sprintf(name, sizeof(name), "demos/%s.dm_%d", demoName, MV_GetCurrentProtocol());

		if (FS_FileExists(name)) {
			Com_Printf("Record: Couldn't create a file\n");
			return;
		}
	}

	SV_RecordDemo(cl, demoName);
}

// Set metadata for demos of a particular client
static void SV_DemoMeta_f(void) {
	int i, len;
	client_t* cl;
	const char* key = NULL;
	const char* data = NULL;

	if (!svs.clients) {
		Com_Printf("Can't set demo metadata, svs.clients is null\n");
		return;
	}

	if (Cmd_Argc() != 4 && Cmd_Argc() != 3) {
		Com_Printf("svdemometa <clientnum> <metakey> <metadata>, for example svdemometa 2 runstarttime 235254. Leave out <metadata> to remove key.\n");
		return;
	}

	int clIndex = atoi(Cmd_Argv(1));
	if (clIndex < 0 || clIndex >= sv_maxclients->integer) {
		Com_Printf("Unknown client number %d.\n", clIndex);
		return;
	}
	cl = &svs.clients[clIndex];

	key = Cmd_Argv(2);
	data = Cmd_Argc() == 4 ? Cmd_Argv(3) : "";

	// Quick sanity check for key (must be valid json key)
	// Let's be strict and only allow letters
	len = strlen(key);
	if (len == 0) {
		Com_Printf("Metadata key must not be empty\n");
		return;
	}
	for (i = 0; i < len; i++) {
		if (!(key[i] > 'a' && key[i] < 'z' || key[i] > 'A' && key[i] < 'Z')) {
			Com_Printf("Metadata key must only contain a-z (lower or upper case)\n");
			return;
		}
	}
	len = strlen(data);
	if (len == 0) {
		// Empty data provided. Remove key if it exists.
		if (demoMetaData[cl - svs.clients].find(key) != demoMetaData[cl - svs.clients].end()) {
			demoMetaData[cl - svs.clients].erase(key);
		}
	}
	else {
		demoMetaData[cl - svs.clients][key] = data;
	}

}
// Clear metadata for demos of a particular client
static void SV_DemoClearMeta_f(void) {
	client_t* cl;

	if (!svs.clients) {
		Com_Printf("Can't clear demo metadata, svs.clients is null\n");
		return;
	}

	if (Cmd_Argc() != 2) {
		Com_Printf("svdemoclearmeta <clientnum>\n");
		return;
	}

	int clIndex = atoi(Cmd_Argv(1));
	if (clIndex < 0 || clIndex >= sv_maxclients->integer) {
		Com_Printf("Unknown client number %d.\n", clIndex);
		return;
	}
	cl = &svs.clients[clIndex];

	SV_ClearClientDemoMeta(cl);
}
// Clear pre-record data for demos of a particular client
// Careful with overusage: This will force generation of new keyframes & non-delta snaps
static void SV_DemoClearPreRecord_f(void) {
	client_t* cl;

	if (!svs.clients) {
		Com_Printf("Can't clear demo pre-record, svs.clients is null\n");
		return;
	}

	if (Cmd_Argc() != 2) {
		Com_Printf("svdemoclearprerecord <clientnum>\n");
		return;
	}

	int clIndex = atoi(Cmd_Argv(1));
	if (clIndex < 0 || clIndex >= sv_maxclients->integer) {
		Com_Printf("Unknown client number %d.\n", clIndex);
		return;
	}
	cl = &svs.clients[clIndex];

	SV_ClearClientDemoPreRecord(cl);
}

#endif




/*
=================
SV_WhitelistIP_f
=================
*/
static void SV_WhitelistIP_f( void ) {
	if ( Cmd_Argc() < 2 ) {
		Com_Printf ("Usage: whitelistip <ip>...\n");
		return;
	}

	for ( int i = 1; i < Cmd_Argc(); i++ ) {
		netadr_t	adr;

		if ( NET_StringToAdr( Cmd_Argv(i), &adr ) ) {
			SVC_WhitelistAdr( adr );
		} else {
			Com_Printf("Incorrect IP address: %s\n", Cmd_Argv(i));
		}
	}
}

//===========================================================

/*
==================
SV_CompleteMapName
==================
*/
static void SV_CompleteMapName( char *args, int argNum ) { // for auto-complete (copied from OpenJK)
	if ( argNum == 2 )
		Field_CompleteFilename( "maps", ".bsp", qtrue );
}

/*
==================
SV_AddOperatorCommands
==================
*/
void SV_AddOperatorCommands( void ) {
	static qboolean	initialized;

	if ( initialized ) {
		return;
	}
	initialized = qtrue;

	Cmd_AddCommand ("heartbeat", SV_Heartbeat_f);
	Cmd_AddCommand ("kick", SV_Kick_f);
	Cmd_AddCommand ("clientkick", SV_KickNum_f);
	Cmd_AddCommand ("status", SV_Status_f);
	Cmd_AddCommand ("serverinfo", SV_Serverinfo_f);
	Cmd_AddCommand ("systeminfo", SV_Systeminfo_f);
	Cmd_AddCommand ("dumpuser", SV_DumpUser_f);
	Cmd_AddCommand ("map_restart", SV_MapRestart_f);
	Cmd_AddCommand ("sectorlist", SV_SectorList_f);
	Cmd_AddCommand ("map", SV_Map_f);
	Cmd_SetCommandCompletionFunc( "map", SV_CompleteMapName );
	Cmd_AddCommand ("devmap", SV_Map_f);
	Cmd_SetCommandCompletionFunc( "devmap", SV_CompleteMapName );
	Cmd_AddCommand ("spmap", SV_Map_f);
	Cmd_AddCommand ("spdevmap", SV_Map_f);
//	Cmd_AddCommand ("devmapbsp", SV_Map_f);	// not used in MP codebase, no server BSP_cacheing
	Cmd_AddCommand ("devmapmdl", SV_Map_f);
	Cmd_SetCommandCompletionFunc( "devmapmdl", SV_CompleteMapName );
	Cmd_AddCommand ("devmapall", SV_Map_f);
	Cmd_SetCommandCompletionFunc( "devmapall", SV_CompleteMapName );
	Cmd_AddCommand ("killserver", SV_KillServer_f);
	Cmd_AddCommand ("svsay", SV_ConSay_f);
	Cmd_AddCommand ("forcetoggle", SV_ForceToggle_f);

	Cmd_AddCommand("whitelistip", SV_WhitelistIP_f);
}

/*
==================
SV_RemoveOperatorCommands
==================
*/
void SV_RemoveOperatorCommands( void ) {
#if 0
	// removing these won't let the server start again
	Cmd_RemoveCommand ("heartbeat");
	Cmd_RemoveCommand ("kick");
	Cmd_RemoveCommand ("banUser");
	Cmd_RemoveCommand ("banClient");
	Cmd_RemoveCommand ("status");
	Cmd_RemoveCommand ("serverinfo");
	Cmd_RemoveCommand ("systeminfo");
	Cmd_RemoveCommand ("dumpuser");
	Cmd_RemoveCommand ("map_restart");
	Cmd_RemoveCommand ("sectorlist");
	Cmd_RemoveCommand ("svsay");
#endif
}

