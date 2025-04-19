// cl_scrn.c -- master for refresh, status bar, console, chat, notify, etc

#include "client.h"
#include "snd_public.h"
#include <mv_setup.h>
#include <map>
#include <string>
#include <memory>

extern console_t con;
qboolean	scr_initialized;		// ready to draw

cvar_t		*cl_timegraph;
cvar_t		*cl_debuggraph;
cvar_t		*cl_graphheight;
cvar_t		*cl_graphscale;
cvar_t		*cl_graphshift;

cvar_t* cl_showVelocity;
cvar_t* cl_showVelocityAllowNegative;
cvar_t* cl_drawPS;
cvar_t* cl_showMouse;
cvar_t* cl_showMouseScale;
cvar_t* cl_showMouseYScale;
cvar_t* cl_showMouseVelocityScale;
cvar_t* cl_showMouseVelocityYScale;
cvar_t* cl_showMouseVelocityTimeScale;
cvar_t* cl_showMouseDecay;
cvar_t* cl_showMouseFadeExp;
cvar_t* cl_showMouseVelocityExp;
cvar_t* cl_showMouseVelocityLog;
cvar_t* cl_fpsGuess;
cvar_t* cl_fpsGuessMode;
cvar_t* cl_fpsGuessMethod2DisplayMode;
cvar_t* cl_fpsGuessMethod2DebugRandMod;
cvar_t* cl_fpsGuessMethod2DebugDumpPrimeResiduals;
cvar_t* cl_fpsGuessMethod3FrameAvgCount;
cvar_t* cl_fpsGuessMethod3GravityMatchPrecision;
cvar_t* cl_fpsGuessMethod3ReferenceLines;
//cvar_t* cl_fpsGuessMethod3DrawRepeat;

extern cvar_t* cl_demoRecordBufferedReorder;
extern std::map<int, std::unique_ptr<bufferedMessageContainer_t>> bufferedDemoMessages;

/*
================
SCR_DrawNamedPic

Coordinates are 640*480 virtual values
=================
*/
void SCR_DrawNamedPic( float x, float y, float width, float height, const char *picname ) {
	qhandle_t	hShader;

	assert( width != 0 );

	hShader = re.RegisterShader( picname );
	re.DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader, 1, 1 );
}


/*
================
SCR_FillRect

Coordinates are 640*480 virtual values
=================
*/
void SCR_FillRect( float x, float y, float width, float height, const float *color ) {
	re.SetColor( color );

	re.DrawStretchPic( x, y, width, height, 0, 0, 0, 0, cls.whiteShader, 1, 1 );

	re.SetColor( NULL );
}


/*
================
SCR_DrawPic

Coordinates are 640*480 virtual values
=================
*/
void SCR_DrawPic( float x, float y, float width, float height, qhandle_t hShader ) {
	re.DrawStretchPic( x, y, width, height, 0, 0, 1, 1, hShader, 1, 1 );
}



/*
** SCR_DrawChar
** chars are drawn at 640*480 virtual screen size
*/
static void SCR_DrawChar( int x, int y, float size, int ch ) {
	int row, col;
	float frow, fcol;
	float	ax, ay, aw, ah;

	ch &= 255;

	if ( ch == ' ' ) {
		return;
	}

	if ( y < -size ) {
		return;
	}

	ax = x;
	ay = y;
	aw = size;
	ah = size;

	row = ch>>4;
	col = ch&15;

	float size2;

	frow = row*0.0625;
	fcol = col*0.0625;
	size = 0.03125;
	size2 = 0.0625;

	re.DrawStretchPic( ax, ay, aw, ah,
					   fcol, frow,
					   fcol + size, frow + size2,
						cls.charSetShader, cls.cgxadj, cls.cgyadj );
}


/*
** SCR_DrawSmallChar
** small chars are drawn at native screen resolution
*/
void SCR_DrawSmallChar( int x, int y, int ch ) {
	int row, col;
	float frow, fcol;
	float size;

	ch &= 255;

	if ( ch == ' ' ) {
		return;
	}

	if ( y < -con.charHeight ) {
		return;
	}

	row = ch>>4;
	col = ch&15;

	float size2;

	frow = row*0.0625;
	fcol = col*0.0625;

#ifdef _JK2
	size = 0.03125;
#else
	size = 0.0625;
#endif
	size2 = 0.0625;

	re.DrawStretchPic( x, y, con.charWidth, con.charHeight,
					   fcol, frow,
					   fcol + size, frow + size2,
					   cls.charSetShader,
					   cls.xadjust, cls.yadjust );
}


/*
==================
SCR_DrawBigString[Color]

Draws a multi-colored string with a drop shadow, optionally forcing
to a fixed color.

Coordinates are at 640 by 480 virtual resolution
==================
*/
static void SCR_DrawStringExt( int x, int y, float size, const char *string, const float *setColor, qboolean forceColor ) {
	vec4_t		color;
	const char	*s;
	int			xx;

	const bool use102color = MV_USE102COLOR;

	// draw the drop shadow
	color[0] = color[1] = color[2] = 0;
	color[3] = setColor[3];
	re.SetColor( color );
	s = string;
	xx = x;
	while ( *s ) {
		if ( Q_IsColorString( s ) || (use102color && Q_IsColorString_1_02( s )) || (serverIsTommyTernal && Q_IsColorStringNT(s))) {
			s += 2;
			continue;
		}
		SCR_DrawChar( xx+2, y+2, size, *s );
		xx += size;
		s++;
	}


	// draw the colored text
	s = string;
	xx = x;
	re.SetColor( setColor );
	while ( *s ) {
		if ((serverIsTommyTernal && Q_IsColorStringNT(s))) {
			if ( !forceColor ) {
				Com_Memcpy( color, g_color_table_nt[ColorIndexNT(*(s+1))], sizeof( color ) );
				color[3] = setColor[3];
				re.SetColor( color );
			}
			s += 2;
			continue;
		}
		else if ( Q_IsColorString( s ) || (use102color && Q_IsColorString_1_02( s ))) {
			if ( !forceColor ) {
				Com_Memcpy( color, g_color_table[ColorIndex(*(s+1))], sizeof( color ) );
				color[3] = setColor[3];
				re.SetColor( color );
			}
			s += 2;
			continue;
		}
		SCR_DrawChar( xx, y, size, *s );
		xx += size;
		s++;
	}
	re.SetColor( NULL );
}


void SCR_DrawBigString( int x, int y, const char *s, float alpha ) {
	float	color[4];

	color[0] = color[1] = color[2] = 1.0;
	color[3] = alpha;
	SCR_DrawStringExt( x, y, BIGCHAR_WIDTH, s, color, qfalse );
}

void SCR_DrawBigStringColor( int x, int y, const char *s, const vec4_t color ) {
	SCR_DrawStringExt( x, y, BIGCHAR_WIDTH, s, color, qtrue );
}


/*
==================
SCR_DrawSmallString[Color]

Draws a multi-colored string with a drop shadow, optionally forcing
to a fixed color.

Coordinates are at 640 by 480 virtual resolution
==================
*/
void SCR_DrawSmallStringExt( int x, int y, const char *string, const vec4_t setColor, qboolean forceColor ) {
	vec4_t		color;
	const char	*s;
	int			xx;

	const bool use102color = MV_USE102COLOR;

	// draw the colored text
	s = string;
	xx = x;
	re.SetColor( setColor );
	while ( *s ) {
		if ( (serverIsTommyTernal && Q_IsColorStringNT(s))) {
			if ( !forceColor ) {
				Com_Memcpy( color, g_color_table_nt[ColorIndexNT(*(s+1))], sizeof( color ) );
				color[3] = setColor[3];
				re.SetColor( color );
			}
			s += 2;
			continue;
		}
		else if ( Q_IsColorString( s ) || (use102color && Q_IsColorString_1_02( s ))) {
			if ( !forceColor ) {
				Com_Memcpy( color, g_color_table[ColorIndex(*(s+1))], sizeof( color ) );
				color[3] = setColor[3];
				re.SetColor( color );
			}
			s += 2;
			continue;
		}
		SCR_DrawSmallChar( xx, y, *s );
		xx += con.charWidth;
		s++;
	}
	re.SetColor( NULL );
}



/*
** SCR_Strlen -- skips color escape codes
*/
static int SCR_Strlen( const char *str ) {
	const char *s = str;
	int count = 0;

	const bool use102color = MV_USE102COLOR;

	while ( *s ) {
		if ( Q_IsColorString( s ) || (use102color && Q_IsColorString_1_02( s )) || (serverIsTommyTernal && Q_IsColorStringNT( s ))) {
			s += 2;
		} else {
			count++;
			s++;
		}
	}

	return count;
}

/*
** SCR_GetBigStringWidth
*/
int	SCR_GetBigStringWidth( const char *str ) {
	return SCR_Strlen( str ) * 16;
}


//===============================================================================

/*
=================
SCR_DrawDemoRecording
=================
*/
void SCR_DrawDemoRecording( void ) {
	char	string[1024];
	int		pos;

	if (com_renderfps->integer > 0) //Draw render FPS - Sad hack sortof
	{
		char	string2[32];
		Com_sprintf(string2, sizeof(string2), "%i", 1000 / cls.frametime);
		SCR_DrawStringExt(((SCREEN_WIDTH - 80) * (1 / cls.cgxadj)) - (strlen(string2) * 8), 2, 8, string2, g_color_table[7], qtrue);
	}

	if ( !clc.demorecording ) {
		return;
	}
	if ( clc.spDemoRecording ) {
		return;
	}

	if (cl_drawRecording->integer >= 2 && cls.recordingShader) {
		static const float width = 60.0f, height = 15.0f;
		re.SetColor(NULL);
		re.DrawStretchPic(0, cls.glconfig.vidHeight - height, width, height,
			0, 0, 1, 1, cls.recordingShader, cls.xadjust, cls.yadjust);
	} else if (cl_drawRecording->integer) {
		pos = FS_FTell( clc.demofile );
		if (bufferedDemoMessages.size() > 0 || cl_demoRecordBufferedReorder->integer) {
			sprintf(string, "RECORDING %s: %ik (%i queued)", clc.demoName, pos / 1024, (int)bufferedDemoMessages.size());
		}
		else {
			sprintf(string, "RECORDING %s: %ik", clc.demoName, pos / 1024);
		}
		SCR_DrawStringExt( ((SCREEN_WIDTH / 2) * (1 / cls.cgxadj)) - (int)strlen( string ) * 4, 20, 8, string, g_color_table[7], qtrue );
	}
}


/*
===============================================================================

DEBUG GRAPH

===============================================================================
*/

typedef struct
{
	float	value;
	int		color;
} graphsamp_t;

static	int			current;
static	graphsamp_t	values[1024];

/*
==============
SCR_DebugGraph
==============
*/
void SCR_DebugGraph (float value, int color)
{
	values[current&1023].value = value;
	values[current&1023].color = color;
	current++;
}

/*
==============
SCR_DrawDebugGraph
==============
*/
void SCR_DrawDebugGraph (void)
{
	int		a, x, y, w, i, h;
	float	v;
	int		color;

	//
	// draw the graph
	//
	w = cls.glconfig.vidWidth;
	x = 0;
	y = cls.glconfig.vidHeight;
	re.SetColor( g_color_table[0] );
	re.DrawStretchPic(x, y - cl_graphheight->integer, w, cl_graphheight->integer,
		0, 0, 0, 0, cls.whiteShader, cls.xadjust, cls.yadjust );
	re.SetColor( NULL );

	for (a=0 ; a<w ; a++)
	{
		i = (current-1-a+1024) & 1023;
		v = values[i].value;
		color = values[i].color;
		v = v * cl_graphscale->integer + cl_graphshift->integer;

		if (v < 0)
			v += cl_graphheight->integer * (1+(int)(-v / cl_graphheight->integer));
		h = (int)v % cl_graphheight->integer;
		re.DrawStretchPic( x+w-1-a, y - h, 1, h,
			0, 0, 0, 0, cls.whiteShader, cls.xadjust, cls.yadjust );
	}
}

//=============================================================================

/*
==================
SCR_Init
==================
*/
void SCR_Init( void ) {

	cl_showVelocity = Cvar_Get("cl_showVelocity", "0", CVAR_ARCHIVE);
	cl_showVelocityAllowNegative = Cvar_Get("cl_showVelocityAllowNegative", "1", CVAR_ARCHIVE);
	cl_showMouse = Cvar_Get("cl_showMouse", "0", CVAR_ARCHIVE);
	cl_showMouseScale = Cvar_Get("cl_showMouseScale", "2.0", CVAR_ARCHIVE);
	cl_showMouseYScale = Cvar_Get("cl_showMouseYScale", "2.0", CVAR_ARCHIVE);
	cl_showMouseVelocityScale = Cvar_Get("cl_showMouseVelocityScale", "5", CVAR_ARCHIVE);
	cl_showMouseVelocityYScale = Cvar_Get("cl_showMouseVelocityYScale", "2.0", CVAR_ARCHIVE);
	cl_showMouseVelocityTimeScale = Cvar_Get("cl_showMouseVelocityTimeScale", "2.0", CVAR_ARCHIVE);
	cl_showMouseDecay = Cvar_Get("cl_showMouseDecay", "0.0", CVAR_ARCHIVE);
	cl_showMouseFadeExp = Cvar_Get("cl_showMouseFadeExp", "1", CVAR_ARCHIVE);
	cl_showMouseVelocityExp = Cvar_Get("cl_showMouseVelocityExp", "0.5", CVAR_ARCHIVE);
	cl_showMouseVelocityLog = Cvar_Get("cl_showMouseVelocityLog", "0", CVAR_ARCHIVE);
	cl_fpsGuess = Cvar_Get("cl_fpsGuess", "0", CVAR_ARCHIVE);
	cl_drawPS = Cvar_Get("cl_drawPS", "0", CVAR_TEMP);
	cl_fpsGuessMode = Cvar_Get("cl_fpsGuessMode", "0", CVAR_ARCHIVE);
	cl_fpsGuessMethod2DisplayMode = Cvar_Get("cl_fpsGuessMethod2DisplayMode", "1", CVAR_ARCHIVE);
	cl_fpsGuessMethod2DebugRandMod = Cvar_Get("cl_fpsGuessMethod2DebugRandMod", "0", CVAR_TEMP);
	cl_fpsGuessMethod2DebugDumpPrimeResiduals = Cvar_Get("cl_fpsGuessMethod2DebugDumpPrimeResiduals", "0", CVAR_TEMP);
	cl_fpsGuessMethod3FrameAvgCount = Cvar_Get("cl_fpsGuessMethod3FrameAvgCount", "10", CVAR_ARCHIVE);
	cl_fpsGuessMethod3GravityMatchPrecision = Cvar_Get("cl_fpsGuessMethod3GravityMatchPrecision", "20.0", CVAR_ARCHIVE);
	cl_fpsGuessMethod3ReferenceLines = Cvar_Get("cl_fpsGuessMethod3ReferenceLines", "333,125,142,90,83,76,30,float", CVAR_ARCHIVE);
	cl_timegraph = Cvar_Get ("timegraph", "0", CVAR_CHEAT);
	cl_debuggraph = Cvar_Get ("debuggraph", "0", CVAR_CHEAT);
	cl_graphheight = Cvar_Get ("graphheight", "32", CVAR_CHEAT);
	cl_graphscale = Cvar_Get ("graphscale", "1", CVAR_CHEAT);
	cl_graphshift = Cvar_Get ("graphshift", "0", CVAR_CHEAT);

	scr_initialized = qtrue;
}


//=======================================================

void MV_DrawConnectingInfo( void )
{ // Versioninfo when loading...
	int		 yPos = 5;
	int		 line = 17;
	char	 txtbuf[128];

	Com_sprintf(txtbuf, sizeof(txtbuf), "^1[ ^7JK2MV " JK2MV_VERSION " " PLATFORM_STRING " ^1]");
	SCR_DrawStringExt(((SCREEN_WIDTH / 2) * (1 / cls.cgxadj)) - SCR_Strlen(txtbuf) * 4, yPos + (line * 0), 8, txtbuf, g_color_table[7], qfalse);

	Com_sprintf(txtbuf, sizeof(txtbuf), "Game-Version^1: ^71.%02d", (int)MV_GetCurrentGameversion());
	SCR_DrawStringExt(((SCREEN_WIDTH / 2) * (1 / cls.cgxadj)) - SCR_Strlen(txtbuf) * 3.5, yPos + (line * 1), 7, txtbuf, g_color_table[7], qfalse);
}

static void SCR_DrawPS() {
	playerState_t* ps;
	static vec4_t transparentBlack = {0,0,0,0.3};
	static vec4_t white = {1,1,1,1};
	int x = 5 / cls.xadjust;
	//int colWidth = con.charWidth * 20;
	if (!cl_drawPS->integer) {
		return;
	}
	ps = &cl.snap.ps;
	SCR_FillRect(0, 240, 640, 240, transparentBlack);

	SCR_DrawSmallStringExt(x,245/ cls.yadjust,						   va("     X %.2f",ps->origin[0]), white,qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight,      va("     Y %.2f",ps->origin[1]), white,qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 2,  va("     Z %.2f",ps->origin[2]), white,qtrue);

	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 4,  va("    VX %.2f",ps->velocity[0]), white,qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 5,  va("    VY %.2f",ps->velocity[1]), white,qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 6,  va("    VZ %.2f",ps->velocity[2]), white,qtrue);

	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 8,  va(" PITCH %.2f", ps->viewangles[0]), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 9,  va("   YAW %.2f", ps->viewangles[1]), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 10, va("  ROLL %.2f", ps->viewangles[2]), white, qtrue);

	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 12, va("PITCHD %d", ps->delta_angles[0]), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 13, va("  YAWD %d", ps->delta_angles[1]), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 14, va(" ROLLD %d", ps->delta_angles[2]), white, qtrue);

	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 16, va("LSHTLC %.2f", ps->lastHitLoc[0]), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 17, va("LSHTLC %.2f", ps->lastHitLoc[1]), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 18, va("LSHTLC %.2f", ps->lastHitLoc[2]), white, qtrue);

#define STRINGWIDTHMAX "16"

	x += con.charWidth * 20;

	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 0, va("%" STRINGWIDTHMAX "s %d","commandTime", ps->commandTime), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 1, va("%" STRINGWIDTHMAX "s %d","bobCycle", ps->bobCycle), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 2, va("%" STRINGWIDTHMAX "s %d","weaponTime", ps->weaponTime), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 3, va("%" STRINGWIDTHMAX "s %d","wpnChrgTim", ps->weaponChargeTime), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 4, va("%" STRINGWIDTHMAX "s %d","wpnChrgSubtrTim", ps->weaponChargeSubtractTime), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 5, va("%" STRINGWIDTHMAX "s %d","pm_time", ps->pm_time), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 6, va("%" STRINGWIDTHMAX "s %d","eventSequence", ps->eventSequence), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 7, va("%" STRINGWIDTHMAX "s %d","torsoAnim", ps->torsoAnim), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 8, va("%" STRINGWIDTHMAX "s %d","torsoTimer", ps->torsoTimer), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 9, va("%" STRINGWIDTHMAX "s %d","legsAnim", ps->legsAnim), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 10, va("%" STRINGWIDTHMAX "s %d","legsTimer", ps->legsTimer), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 11, va("%" STRINGWIDTHMAX "s %d","movementDir", ps->movementDir), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 12, va("%" STRINGWIDTHMAX "s %d","events[0]", ps->events[0]), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 13, va("%" STRINGWIDTHMAX "s %d","events[1]", ps->events[1]), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 14, va("%" STRINGWIDTHMAX "s %d","pm_flags", ps->pm_flags), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 15, va("%" STRINGWIDTHMAX "s %d","groundEntityNum", ps->groundEntityNum), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 16, va("%" STRINGWIDTHMAX "s %d","weaponstate", ps->weaponstate), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 17, va("%" STRINGWIDTHMAX "s %d","eFlags", ps->eFlags), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 18, va("%" STRINGWIDTHMAX "s %d","externalEvent", ps->externalEvent), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 19, va("%" STRINGWIDTHMAX "s %d","gravity", ps->gravity), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 20, va("%" STRINGWIDTHMAX "s %d","speed", ps->speed), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 21, va("%" STRINGWIDTHMAX "s %d","basespeed", ps->basespeed), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 22, va("%" STRINGWIDTHMAX "s %d","extrnlEventParm", ps->externalEventParm), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 23, va("%" STRINGWIDTHMAX "s %d","viewheight", ps->viewheight), white, qtrue);
	//SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 24, va("%" STRINGWIDTHMAX "s %d","damageEvent", ps->damageEvent), white, qtrue);


	x += con.charWidth * 35;

	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 0, va("%" STRINGWIDTHMAX "s %d", "damageEvent", ps->damageEvent), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 1, va("%" STRINGWIDTHMAX "s %d", "damageYaw", ps->damageYaw), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 2, va("%" STRINGWIDTHMAX "s %d", "damagePitch", ps->damagePitch), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 3, va("%" STRINGWIDTHMAX "s %d", "damageCount", ps->damageCount), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 4, va("%" STRINGWIDTHMAX "s %d", "damageType", ps->damageType), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 5, va("%" STRINGWIDTHMAX "s %d", "generic1", ps->generic1), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 6, va("%" STRINGWIDTHMAX "s %d", "pm_type", ps->pm_type), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 7, va("%" STRINGWIDTHMAX "s %d", "eventParms[0]", ps->eventParms[0]), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 8, va("%" STRINGWIDTHMAX "s %d", "eventParms[1]", ps->eventParms[1]), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 9, va("%" STRINGWIDTHMAX "s %d", "clientNum", ps->clientNum), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 10, va("%" STRINGWIDTHMAX "s %d", "weapon", ps->weapon), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 11, va("%" STRINGWIDTHMAX "s %d", "jumppad_ent", ps->jumppad_ent), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 12, va("%" STRINGWIDTHMAX "s %d", "loopSound", ps->loopSound), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 13, va("%" STRINGWIDTHMAX "s %d", "zoomMode", ps->zoomMode), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 14, va("%" STRINGWIDTHMAX "s %d", "zoomTime", ps->zoomTime), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 15, va("%" STRINGWIDTHMAX "s %d", "zoomLocked", ps->zoomLocked), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 16, va("%" STRINGWIDTHMAX "s %d", "zoomFov", ps->zoomFov), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 17, va("%" STRINGWIDTHMAX "s %d", "fd.frcPwrsActv", ps->fd.forcePowersActive), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 18, va("%" STRINGWIDTHMAX "s %d", "fd.frMndtrckId", ps->fd.forceMindtrickTargetIndex), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 19, va("%" STRINGWIDTHMAX "s %d", "fd.frMndtrckId2", ps->fd.forceMindtrickTargetIndex2), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 20, va("%" STRINGWIDTHMAX "s %d", "fd.frMndtrckId3", ps->fd.forceMindtrickTargetIndex3), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 21, va("%" STRINGWIDTHMAX "s %d", "fd.frMndtrckId4", ps->fd.forceMindtrickTargetIndex4), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 22, va("%" STRINGWIDTHMAX "s %.2f", "fd.frcJmpZStart", ps->fd.forceJumpZStart), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 23, va("%" STRINGWIDTHMAX "s %d", "fd.frcPwrSel", ps->fd.forcePowerSelected), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 24, va("%" STRINGWIDTHMAX "s %d", "fd.frcPwrsKnown", ps->fd.forcePowersKnown), white, qtrue);

	x += con.charWidth * 35;

	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 0, va("%" STRINGWIDTHMAX "s %d", "fd.forcePower", ps->fd.forcePower), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 1, va("%" STRINGWIDTHMAX "s %d", "fd.forceSide", ps->fd.forceSide), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 2, va("%" STRINGWIDTHMAX "s %d", "fd.sntryDeployd", ps->fd.sentryDeployed), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 3, va("%" STRINGWIDTHMAX "s %d", "fd.fPwrLvl[LEV]", ps->fd.forcePowerLevel[FP_LEVITATION]), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 4, va("%" STRINGWIDTHMAX "s %d", "fd.fPwrLvl[SEE]", ps->fd.forcePowerLevel[FP_SEE]), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 5, va("%" STRINGWIDTHMAX "s %d", "gnricEnemyIndex", ps->genericEnemyIndex), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 6, va("%" STRINGWIDTHMAX "s %d", "activeForcePass", ps->activeForcePass), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 7, va("%" STRINGWIDTHMAX "s %d", "hasDtPckPlanted", ps->hasDetPackPlanted), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 8, va("%" STRINGWIDTHMAX "s %d", "emplacedIndex", ps->emplacedIndex), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 9, va("%" STRINGWIDTHMAX "s %d", "fd.frcRagRecTim", ps->fd.forceRageRecoveryTime), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 10, va("%" STRINGWIDTHMAX "s %d", "rocketLockIndex", ps->rocketLockIndex), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 11, va("%" STRINGWIDTHMAX "s %d", "rocketLockTime", ps->rocketLockTime), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 12, va("%" STRINGWIDTHMAX "s %d", "rocketTargtTime", ps->rocketTargetTime), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 13, va("%" STRINGWIDTHMAX "s %d", "holocronBits", ps->holocronBits), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 14, va("%" STRINGWIDTHMAX "s %d", "isJediMaster", ps->isJediMaster), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 15, va("%" STRINGWIDTHMAX "s %d", "forceRestricted", ps->forceRestricted), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 16, va("%" STRINGWIDTHMAX "s %d", "trueJedi", ps->trueJedi), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 17, va("%" STRINGWIDTHMAX "s %d", "trueNonJedi", ps->trueNonJedi), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 18, va("%" STRINGWIDTHMAX "s %d", "fallingToDeath", ps->fallingToDeath), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 19, va("%" STRINGWIDTHMAX "s %d", "electrifyTime", ps->electrifyTime), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 20, va("%" STRINGWIDTHMAX "s %d", "fd.fPwrDeb[LEV]", ps->fd.forcePowerDebounce[FP_LEVITATION]), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 21, va("%" STRINGWIDTHMAX "s %d", "saberMove", ps->saberMove), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 22, va("%" STRINGWIDTHMAX "s %d", "saberActive", ps->saberActive), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 23, va("%" STRINGWIDTHMAX "s %d", "saberInFlight", ps->saberInFlight), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 24, va("%" STRINGWIDTHMAX "s %d", "saberBlocked", ps->saberBlocked), white, qtrue);

	x += con.charWidth * 35;

	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 0, va("%" STRINGWIDTHMAX "s %d", "saberEntityNum", ps->saberEntityNum), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 1, va("%" STRINGWIDTHMAX "s %d", "saberCanThrow", ps->saberCanThrow), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 2, va("%" STRINGWIDTHMAX "s %d", "forceHandExtend", ps->forceHandExtend), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 3, va("%" STRINGWIDTHMAX "s %d", "forceDodgeAnim", ps->forceDodgeAnim), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 4, va("%" STRINGWIDTHMAX "s %d", "fd.sbrAnimLevel", ps->fd.saberAnimLevel), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 5, va("%" STRINGWIDTHMAX "s %d", "fd.sbrDrwAnmLvl", ps->fd.saberDrawAnimLevel), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 6, va("%" STRINGWIDTHMAX "s %d", "sbrAtckChainCnt", ps->saberAttackChainCount), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 7, va("%" STRINGWIDTHMAX "s %d", "saberHolstered", ps->saberHolstered), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 8, va("%" STRINGWIDTHMAX "s %d", "usingATST", ps->usingATST), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 9, va("%" STRINGWIDTHMAX "s %d", "atstAltFire", ps->atstAltFire), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 10, va("%" STRINGWIDTHMAX "s %d", "duelIndex", ps->duelIndex), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 11, va("%" STRINGWIDTHMAX "s %d", "duelTime", ps->duelTime), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 12, va("%" STRINGWIDTHMAX "s %d", "duelInProgress", ps->duelInProgress), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 13, va("%" STRINGWIDTHMAX "s %d", "saberLockTime", ps->saberLockTime), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 14, va("%" STRINGWIDTHMAX "s %d", "saberLockEnemy", ps->saberLockEnemy), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 15, va("%" STRINGWIDTHMAX "s %d", "saberLockFrame", ps->saberLockFrame), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 16, va("%" STRINGWIDTHMAX "s %d", "saberLockAdvnce", ps->saberLockAdvance), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 17, va("%" STRINGWIDTHMAX "s %d", "inAirAnim", ps->inAirAnim), white, qtrue);
	SCR_DrawSmallStringExt(x, 245 / cls.yadjust + con.charHeight * 18, va("%" STRINGWIDTHMAX "s %d", "dualBlade", ps->dualBlade), white, qtrue);
}

static void SCR_DrawShowMouse() {
	if (!cl_showMouse->integer || !cls.showMouse.angleDeltaIndex) {
		return;
	}
	showMouseSample_t* sample;
	static vec4_t lineColorNormal{ 1.0f,1.0f,1.0f,1.0f };
	static vec4_t lineColorFast{ 1.0f,0.0f,0.0f,1.0f };
	static vec4_t lineColorVerticalLimit{ 0.0f,1.0f,0.0f,1.0f };
	static vec4_t lineColorVerticalLimitClose{ 0.0f,1.0f,1.0f,1.0f };
	vec4_t lineColor{ 1.0f,0.0f,0.0f,1.0f };
	int startIndex = MAX(0,cls.showMouse.angleDeltaIndex - SHOWMOUSE_PAST_SAMPLES); // -1 +1 (-1 because angleDeltaIndex is the next one actually, and +1 to not overflow)
	float xNow = cls.glconfig.vidWidth*0.5f, yNow = cls.glconfig.vidHeight * 0.5f;
	float xNowVel = cls.glconfig.vidWidth*0.8, yBaseVel = cls.glconfig.vidHeight * 0.8f;
	float xScale = cl_showMouseScale->value;
	float yScale = cl_showMouseScale->value* cl_showMouseYScale->value;
	float xScaleVelocity = cl_showMouseVelocityScale->value;
	float yScaleVelocity = cl_showMouseVelocityScale->value* cl_showMouseVelocityYScale->value;
	const float timeWidth = 5000.0f; // 5 seconds over entire screen width.
	float millisecondWidth = (float)cls.glconfig.winWidth * 0.8f / timeWidth;

	if (cls.showMouse.oldDrawDeltaIndex) {
		int compensateStartIndex = MAX(startIndex, cls.showMouse.oldDrawDeltaIndex);
		float xCompensate = 0;
		float yCompensate = 0;
		for (int i = compensateStartIndex; i < cls.showMouse.angleDeltaIndex; i++) {
			int indexHere = i % SHOWMOUSE_PAST_SAMPLES;
			sample = &cls.showMouse.samples[indexHere];
			xCompensate += sample->angleDelta[0]* xScale;
			yCompensate += sample->angleDelta[1]* yScale;
		}
		cls.showMouse.centerOffset[0] += xCompensate;
		cls.showMouse.centerOffset[1] += yCompensate;
	}

	cls.showMouse.centerOffset[0] *= cl_showMouseDecay->value;
	cls.showMouse.centerOffset[1] *= cl_showMouseDecay->value;

	xNow += cls.showMouse.centerOffset[0];
	yNow += cls.showMouse.centerOffset[1];

	//for (int i = startIndex; i < cls.showMouse.angleDeltaIndex; i++) {
	for (int i = cls.showMouse.angleDeltaIndex-1; i >= startIndex; i--) {
		float opacity = 1.0f- (float)(cls.showMouse.angleDeltaIndex - 1 - i)/ (float)(SHOWMOUSE_PAST_SAMPLES-1);
		int indexHere = i % SHOWMOUSE_PAST_SAMPLES;
		sample = &cls.showMouse.samples[indexHere];
		float speedMult = Com_Clamp(0.0f,1.0f, sample->angleChangeSpeed/10.0f);
		opacity = powf(opacity, cl_showMouseFadeExp->value);
		if (sample->flags & SMSF_TOUCHING_VERTICAL_LIMIT) {
			VectorCopy(lineColorVerticalLimit, lineColor);
		} else if (sample->flags & SMSF_CLOSE_TO_VERTICAL_LIMIT) {
			VectorCopy(lineColorVerticalLimitClose, lineColor);
		}
		else {
			VectorMA(vec3_origin, speedMult, lineColorFast, lineColor);
			VectorMA(lineColor, 1.0f - speedMult, lineColorNormal, lineColor);
		}
		lineColor[3] = opacity;
		re.SetColor(lineColor);
		re.DrawLine(xNow, yNow, xNow - sample->angleDelta[0]*xScale, yNow - sample->angleDelta[1]*yScale, 2, 0, 0, 0, 0, cls.whiteShader, cls.xadjust, cls.yadjust);
		if (xNowVel > 0.0f) {
			float segTimeWidth = millisecondWidth * (float)sample->cmdTimeDelta * cl_showMouseVelocityTimeScale->value;
			float height[2] = {
				cl_showMouseVelocityLog->integer ? 
				logf(sample->angleChangeSpeedXY[0] * xScaleVelocity * 1000.0f)
				: powf(sample->angleChangeSpeedXY[0] * xScaleVelocity * 10.0f,cl_showMouseVelocityExp->value) ,
				cl_showMouseVelocityLog->integer ?
				logf(sample->angleChangeSpeedXY[1] * yScaleVelocity * 1000.0f)
				: powf(sample->angleChangeSpeedXY[1] * yScaleVelocity * 10.0f,cl_showMouseVelocityExp->value)
			};
			re.DrawStretchPic(xNowVel - segTimeWidth, yBaseVel - height[0], segTimeWidth, height[0], 0, 0, 0, 0, cls.whiteShader, cls.xadjust, cls.yadjust);
			re.DrawStretchPic(xNowVel - segTimeWidth, yBaseVel + 1.0f, segTimeWidth, height[1], 0, 0, 0, 0, cls.whiteShader, cls.xadjust, cls.yadjust);
			xNowVel -= segTimeWidth;
		}
		re.SetColor(NULL);
		xNow -= sample->angleDelta[0]*xScale;
		yNow -= sample->angleDelta[1]*yScale;
	}
	cls.showMouse.oldDrawDeltaIndex = cls.showMouse.angleDeltaIndex;
}

static void SCR_DrawFPSGuess() {
	if (cl_fpsGuess->integer == 1) {
		bool notTooOld = (cl.snap.serverTime - cls.fpsGuess.lastGuessedFpsServerTime < 1000);
		SCR_DrawBigString(320, 240, va("%d:%d/%d(%d%%)", cl_fpsGuessMode->integer, cls.fpsGuess.lastCertainGuessedFps, notTooOld ? cls.fpsGuess.lastGuessedFps : 0, notTooOld ? cls.fpsGuess.lastGuessedFpsPercentage : 0), 1.0f);
	}
	else if (cl_fpsGuess->integer == 2) {
		static char fpsGuessMethod2String[2048];
		fpsGuessMethod2String[0] = 0;
		for (int i = 0; i < FPS_GUESS_METHOD2_PRIME_REVERSE_LOOKUP_COUNT; i++) {
			if (cls.fpsGuess.method2PossibleMsecValues[i]) {

				Q_strcat(fpsGuessMethod2String, sizeof(fpsGuessMethod2String), i == 0 ? va("%d", 1000 / cls.fpsGuess.method2PossibleMsecValues[i]) : va("/%d", 1000 / cls.fpsGuess.method2PossibleMsecValues[i]));
			}
		}
		SCR_DrawBigString(320, 240, fpsGuessMethod2String, 1.0f);
	}
	else if (cl_fpsGuess->integer == 3) {
		float leftOffset = 100;
		float matchPrecisions[FPS_GUESS_METHOD3_POSSIBILITIES_DISPLAY];
		for (int i = 0; i < FPS_GUESS_METHOD3_POSSIBILITIES_DISPLAY; i++) {
			int possibleMsecValue = cls.fpsGuess.method3PossibleMsecValues[i];
			if (possibleMsecValue) {
				static vec4_t thisFPSColor{ 1.0f,1.0f,1.0f,1.0f };
				float matchPrecisionHere = matchPrecisions[i] = MIN(1.0f, MAX(0.0f, cl_fpsGuessMethod3GravityMatchPrecision->value - fabsf(cls.fpsGuess.method3EffectiveFPSGravities[possibleMsecValue] - cls.fpsGuess.method3MeasuredEffectiveGravity)) / cl_fpsGuessMethod3GravityMatchPrecision->value);
				thisFPSColor[3] = matchPrecisionHere / 2.0f + 0.5f;
				SCR_DrawSmallStringExt(120, 340 + i * 20, va("%d fps (grav %d)", 1000 / possibleMsecValue, cls.fpsGuess.method3EffectiveFPSGravities[possibleMsecValue]), thisFPSColor, qfalse);
				//Q_strcat(fpsGuessMethod3String, sizeof(fpsGuessMethod3String), i == 0 ? va("%d", 1000 / cls.fpsGuess.method3PossibleMsecValues[i]) : va("/%d", 1000 / cls.fpsGuess.method3PossibleMsecValues[i]));
			}
		}
		{
			int height = 200;
			static float oldUpperBound = 800.0f + cl_fpsGuessMethod3GravityMatchPrecision->value * 2;
			static float oldLowerBound = 800.0f - cl_fpsGuessMethod3GravityMatchPrecision->value * 2;
			float lowerBound = MAX(cls.fpsGuess.method3MeasuredEffectiveGravity, 650) - cl_fpsGuessMethod3GravityMatchPrecision->value * 2;
			float upperBound = MIN(cls.fpsGuess.method3MeasuredEffectiveGravity, 1050) + cl_fpsGuessMethod3GravityMatchPrecision->value * 2;
			float adjustmentSpeedMultiplier = (float)cls.frametime / 7.0f;
			if (cls.fpsGuess.method3MeasuredEffectiveGravity) {
				if (lowerBound > oldLowerBound) {
					lowerBound = oldLowerBound + 0.1f * adjustmentSpeedMultiplier;
				}
				else if (lowerBound < oldLowerBound) {
					lowerBound = oldLowerBound - 0.1f * adjustmentSpeedMultiplier;
				}
				if (upperBound > oldUpperBound) {
					upperBound = oldUpperBound + 0.1f * adjustmentSpeedMultiplier;
				}
				else if (upperBound < oldUpperBound) {
					upperBound = oldUpperBound - 0.1f * adjustmentSpeedMultiplier;
				}
			}
			else {
				lowerBound = oldLowerBound;
				upperBound = oldUpperBound;
			}
			oldUpperBound = upperBound;
			oldLowerBound = lowerBound;
			float range = upperBound - lowerBound;
			float basePositionY = cls.glconfig.vidHeight - 300;

			std::vector<std::tuple<float, std::string, bool>> referenceLines;

			const char* referenceLinesString = cl_fpsGuessMethod3ReferenceLines->string;
			if (strstr(referenceLinesString, "float")) {
				referenceLines.push_back({ 800.0f, "float", true });
			}
			while (true) { // Parse reference lines wanted by user. TODO: don't do the string analysis on every frame, it's wasteful
				int parsedNumber = atoi(referenceLinesString);
				if (parsedNumber) {
					int msec = 1000 / parsedNumber;
					if (msec > 0 && msec < FPS_GUESS_METHOD3_MSEC_LIMIT) {
						referenceLines.push_back({ cls.fpsGuess.method3EffectiveFPSGravities[msec], va("%d",parsedNumber), false });
					}
				}
				referenceLinesString = strstr(referenceLinesString, ",");
				if (!referenceLinesString) break;
				referenceLinesString++;
			}


			/*for (int i = 0; i < FPS_GUESS_METHOD3_POSSIBILITIES_DISPLAY; i++) {

				static vec4_t thisFPSLineColor{ 1.0f,1.0f,1.0f,1.0f };
				int possibleMsecValue = cls.fpsGuess.method3PossibleMsecValues[i];
				int gravityHere = cls.fpsGuess.method3EffectiveFPSGravities[possibleMsecValue];
				float positionRatio = ((float)gravityHere - lowerBound) / range;
				float positionYOffset = (float)height * positionRatio;

				thisFPSLineColor[3] = matchPrecisions[i] / 2.0f + 0.5f;

				re.SetColor(thisFPSLineColor);
				re.DrawStretchPic(50, basePositionY+height-positionYOffset, cls.glconfig.vidWidth-100, 1,
					0, 0, 0, 0, cls.whiteShader, cls.xadjust, cls.yadjust);
				re.SetColor(NULL);
			}*/

			// Draw history.
			int oldestSampleIndex = MAX(0, cls.fpsGuess.method3MeasuredGravitySamplesIndex - 1 - FPS_GUESS_METHOD3_HISTORY_LINE_DRAW_SAMPLES + 1);
			fpsGuessMethod3HistorySample_t* oldestSample = &cls.fpsGuess.method3MeasuredGravitySamples[oldestSampleIndex % FPS_GUESS_METHOD3_HISTORY_LINE_DRAW_SAMPLES];
			fpsGuessMethod3HistorySample_t* currentSample = &cls.fpsGuess.method3MeasuredGravitySamples[(cls.fpsGuess.method3MeasuredGravitySamplesIndex - 1) % FPS_GUESS_METHOD3_HISTORY_LINE_DRAW_SAMPLES];
			while (oldestSample->globalTime >= cls.fpsGuess.method3MeasuredGravityGlobalTime && oldestSampleIndex < (cls.fpsGuess.method3MeasuredGravitySamplesIndex - 1)) {
				// When map change, discard older samples with higher serverTime.
				oldestSampleIndex++;
				oldestSample = &cls.fpsGuess.method3MeasuredGravitySamples[oldestSampleIndex % FPS_GUESS_METHOD3_HISTORY_LINE_DRAW_SAMPLES];
			}
			int oldestTime = oldestSample->globalTime;
			int newestTime = cls.fpsGuess.method3MeasuredGravityGlobalTime;
			int totalTimeDelta = newestTime - oldestTime;
			float yPosCurrent = 0;
			float lowestSampleSeen = 9999999;
			float highestSampleSeen = -999999;
			if (totalTimeDelta > 0) { // Might have wrapped around otherwise idk... fuck it.

				int oldXPos = 50;
				for (int i = oldestSampleIndex + 1; i < cls.fpsGuess.method3MeasuredGravitySamplesIndex; i++) {
					fpsGuessMethod3HistorySample_t* previousSample = &cls.fpsGuess.method3MeasuredGravitySamples[(i - 1) % FPS_GUESS_METHOD3_HISTORY_LINE_DRAW_SAMPLES];
					fpsGuessMethod3HistorySample_t* currentSample = &cls.fpsGuess.method3MeasuredGravitySamples[i % FPS_GUESS_METHOD3_HISTORY_LINE_DRAW_SAMPLES];
					float oldXPos = leftOffset + (((float)previousSample->globalTime - (float)oldestTime) / (float)totalTimeDelta) * ((float)cls.glconfig.vidWidth - 50.0f - leftOffset);
					float currentXPos = leftOffset + (((float)currentSample->globalTime - (float)oldestTime) / (float)totalTimeDelta) * ((float)cls.glconfig.vidWidth - 50.0f - leftOffset);
					int timeDelta = currentSample->globalTime - previousSample->globalTime;

					if (currentSample->measuredEffectiveGravity > highestSampleSeen) {
						highestSampleSeen = currentSample->measuredEffectiveGravity;
					}
					if (currentSample->measuredEffectiveGravity < lowestSampleSeen) {
						lowestSampleSeen = currentSample->measuredEffectiveGravity;
					}

					if (timeDelta < 0) continue; // Idk could happen maybe? whatever

					float positionRatio = (currentSample->measuredEffectiveGravity - lowerBound) / range;
					float positionYOffset = (float)height * positionRatio;
					float yPos = basePositionY + height - positionYOffset;
					if (i == cls.fpsGuess.method3MeasuredGravitySamplesIndex - 1) {
						yPosCurrent = yPos;
					}
					switch (currentSample->sampleType) {
					case FPSGUESSSAMPLE_MEASURED:
						re.SetColor(colorRed);
						break;
					case FPSGUESSSAMPLE_MEASURED_SLIDE:
					default:
						re.SetColor(colorBlue);
						break;
					case FPSGUESSSAMPLE_REPEAT:
						re.SetColor(colorYellow);
						break;
					}
					re.DrawStretchPic(oldXPos, yPos, currentXPos - oldXPos, 2,
						0, 0, 0, 0, cls.whiteShader, cls.xadjust, cls.yadjust);
				}
				re.SetColor(NULL);
			}

			// Draw the reference fps lines
			for (int i = 0; i < referenceLines.size(); i++) {
				static vec4_t thisFPSLineColor{ 1.0f,1.0f,1.0f,1.0f };

				int gravityHere = std::get<float>(referenceLines[i]);

				if ((gravityHere > upperBound || gravityHere < lowerBound)
					&& fabsf(cls.fpsGuess.method3MeasuredEffectiveGravity - (float)gravityHere) > (cl_fpsGuessMethod3GravityMatchPrecision->value * 2.0f)
					&& ((float)gravityHere > (highestSampleSeen + cl_fpsGuessMethod3GravityMatchPrecision->value * 2.0f) || (float)gravityHere < (lowestSampleSeen - cl_fpsGuessMethod3GravityMatchPrecision->value * 2.0f))
					) continue;

				bool isFloatLine = std::get<bool>(referenceLines[i]);
				float positionRatio = ((float)gravityHere - lowerBound) / range;
				float positionYOffset = (float)height * positionRatio;

				if (isFloatLine) {
					thisFPSLineColor[0] = thisFPSLineColor[2] = 0.0f;
				}
				else {
					thisFPSLineColor[0] = thisFPSLineColor[2] = 1.0f;
				}

				//float matchPrecisionHere = MIN(1.0f, MAX(0.0f, cl_fpsGuessMethod3GravityMatchPrecision->value - fabsf(gravityHere - cls.fpsGuess.method3MeasuredEffectiveGravity)) / cl_fpsGuessMethod3GravityMatchPrecision->value);
				//thisFPSLineColor[3] = matchPrecisions[i] / 2.0f + 0.5f;
				SCR_DrawSmallStringExt(10, basePositionY + height - positionYOffset - 5, va("%d (%s)", gravityHere, std::get<std::string>(referenceLines[i]).c_str()), thisFPSLineColor, qfalse);
				re.SetColor(thisFPSLineColor);
				re.DrawStretchPic(leftOffset, basePositionY + height - positionYOffset, cls.glconfig.vidWidth - 50 - leftOffset, 1,
					0, 0, 0, 0, cls.whiteShader, cls.xadjust, cls.yadjust);
				re.SetColor(NULL);
			}

			static char fpsGuessMethod3String[2048];
			fpsGuessMethod3String[0] = 0;
			//Q_strcat(fpsGuessMethod3String, sizeof(fpsGuessMethod3String), va("%sgrav: %d; %d-%d, %d", cls.fpsGuess.lastFrameWasMeasured ? " " : "_", (int)cls.fpsGuess.method3MeasuredEffectiveGravity, (int)lowerBound, (int)upperBound,(int)yPosCurrent));
			Q_strcat(fpsGuessMethod3String, sizeof(fpsGuessMethod3String), va("%sgrav: %d", cls.fpsGuess.lastFrameWasMeasured ? (cls.fpsGuess.lastFrameWasSlide ? "-" : " ") : "_", (int)cls.fpsGuess.method3MeasuredEffectiveGravity));
			/*for (int i = 0; i < FPS_GUESS_METHOD3_POSSIBILITIES_DISPLAY; i++) {
				if (cls.fpsGuess.method3PossibleMsecValues[i]) {

					Q_strcat(fpsGuessMethod3String, sizeof(fpsGuessMethod3String), i==0 ? va("%d", 1000/cls.fpsGuess.method3PossibleMsecValues[i]) : va("/%d", 1000/cls.fpsGuess.method3PossibleMsecValues[i]));
				}
			}*/
			SCR_DrawBigString(300, 400, fpsGuessMethod3String, 1.0f);

			/*
			// Draw debug graph like graph of history
			int		a, x, y, w, i, h;
			float	v;
			int		color;

			//
			// draw the graph
			//
			w = cls.glconfig.vidWidth;
			x = 0;
			y = cls.glconfig.vidHeight;
			re.SetColor(g_color_table[0]);
			re.DrawStretchPic(x, y - cl_graphheight->integer, w, cl_graphheight->integer,
				0, 0, 0, 0, cls.whiteShader, cls.xadjust, cls.yadjust);
			re.SetColor(NULL);

			for (a = 0; a < w; a++)
			{
				i = (current - 1 - a + 1024) & 1023;
				v = values[i].value;
				color = values[i].color;
				v = v * cl_graphscale->integer + cl_graphshift->integer;

				if (v < 0)
					v += cl_graphheight->integer * (1 + (int)(-v / cl_graphheight->integer));
				h = (int)v % cl_graphheight->integer;
				re.DrawStretchPic(x + w - 1 - a, y - h, 1, h,
					0, 0, 0, 0, cls.whiteShader, cls.xadjust, cls.yadjust);
			}
			*/
		}
	}
	if (cl_showVelocity->integer) {
		SCR_DrawStringExt(100, 260, 10, va("mV:%.2f, mVh:%.2f, mVv: %.2f", cls.showVelocity.maxVelocity, cls.showVelocity.maxVelocityH, cls.showVelocity.maxVelocityV), colorWhite, qfalse);
		SCR_DrawStringExt(100, 270, 10, va("mDV:%.2f, mDVh:%.2f, mDVv: %.2f", cls.showVelocity.maxVelocityDelta, cls.showVelocity.maxVelocityDeltaH, cls.showVelocity.maxVelocityDeltaV), colorWhite, qfalse);
	}
}

/*
==================
SCR_DrawScreenField

This will be called twice if rendering in stereo mode
==================
*/
void SCR_DrawScreenField( stereoFrame_t stereoFrame ) {
	qboolean skipBackend = (qboolean)(com_minimized->integer && !CL_VideoRecording());

	re.BeginFrame( stereoFrame, skipBackend );

	if ( !uivm ) {
		Com_DPrintf("draw screen without UI loaded\n");
		return;
	}

	// if the menu is going to cover the entire screen, we
	// don't need to render anything under it
	if (!VM_Call(uivm, UI_IS_FULLSCREEN)) {
		switch( cls.state ) {
		default:
			Com_Error( ERR_FATAL, "SCR_DrawScreenField: bad cls.state" );
			break;
		case CA_CINEMATIC:
			SCR_DrawCinematic();
			break;
		case CA_DISCONNECTED:
			// force menu up
			S_StopAllSounds();
			VM_Call(uivm, UI_SET_ACTIVE_MENU, UIMENU_MAIN);
			break;
		case CA_CONNECTING:
		case CA_CHALLENGING:
		case CA_CONNECTED:
			{
				// workaround for ingame UI not loading connect.menu
				qhandle_t hShader = re.RegisterShader("menu/art/unknownmap");
				const float xOffset = 0.5f * (((float)SCREEN_HEIGHT * cls.glconfig.vidWidth / cls.glconfig.vidHeight) - SCREEN_WIDTH);
				re.SetColor(colorBlack);
				re.DrawStretchPic(0, 0, xOffset, SCREEN_HEIGHT, 0, 0, 1, 1, cls.whiteShader, cls.cgxadj, cls.cgyadj);
				re.DrawStretchPic(xOffset + SCREEN_WIDTH, 0, xOffset, SCREEN_HEIGHT, 0, 0, 1, 1, cls.whiteShader, cls.cgxadj, cls.cgyadj);
				re.SetColor(NULL);
				re.DrawStretchPic(xOffset, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 1, 1, hShader, cls.cgxadj, cls.cgyadj);
			}
			// connecting clients will only show the connection dialog
			// refresh to update the time
			VM_Call(uivm, UI_REFRESH, cls.realtime);
			VM_Call(uivm, UI_DRAW_CONNECT_SCREEN, qfalse);
			break;
		case CA_LOADING:
		case CA_PRIMED:
			// draw the game information screen and loading progress
			CL_CGameRendering( stereoFrame );

			MV_DrawConnectingInfo();

			// also draw the connection information, so it doesn't
			// flash away too briefly on local or lan games
			// refresh to update the time
			VM_Call(uivm, UI_REFRESH, cls.realtime);
			VM_Call(uivm, UI_DRAW_CONNECT_SCREEN, qtrue);
			break;
		case CA_ACTIVE:
			CL_CGameRendering( stereoFrame );
			SCR_DrawDemoRecording();
			break;
		}
	}

	// the menu draws next
	if ( cls.keyCatchers & KEYCATCH_UI && uivm ) {
		VM_Call(uivm, UI_REFRESH, cls.realtime);
	}

	SCR_DrawFPSGuess();
	SCR_DrawShowMouse();

	SCR_DrawPS();

	// console draws next
	Con_DrawConsole ();

	// debug graph can be drawn on top of anything
	if ( cl_debuggraph->integer || cl_timegraph->integer || cl_debugMove->integer ) {
		SCR_DrawDebugGraph ();
	}

	re.EndFrame();
}


/*
==================
SCR_UpdateScreen

This is called every frame, and can also be called explicitly to flush
text to the screen.
==================
*/
void SCR_UpdateScreen( void ) {
	static int	recursive;

	if ( !scr_initialized ) {
		return;				// not initialized yet
	}

	if ( ++recursive > 2 ) {
		Com_Error( ERR_FATAL, "SCR_UpdateScreen: recursively called" );
	}
	recursive = 1;

	CL_UpdateRefConfig( );

	// if running in stereo, we need to draw the frame twice
	if ( cls.glconfig.stereoEnabled ) {
		SCR_DrawScreenField( STEREO_LEFT );
		SCR_DrawScreenField( STEREO_RIGHT );
	} else {
		SCR_DrawScreenField( STEREO_CENTER );
	}

	CL_TakeVideoFrame();

	


	if ( com_speeds->integer ) {
		re.SwapBuffers( &time_frontend, &time_backend );
	} else {
		re.SwapBuffers( NULL, NULL );
	}

	recursive = 0;
}

#define MAX_SCR_LINES 10

static float		scr_centertime_off;
int					scr_center_y;
//static string		scr_font;
static char			scr_centerstring[1024];
static int			scr_center_lines;
static int			scr_center_widths[MAX_SCR_LINES];

cvar_t		*scr_centertime;

void SCR_CenterPrint (char *str)//, PalIdx_t colour)
{
	char	*s, *last, *start, *write_pos, *save_pos;
	int		num_chars;
	int		num_lines;
	int		width;
	bool	done = false;
	bool	spaced;

	if (!str)
	{
		scr_centertime_off = 0;
		return;
	}

//	scr_font = string("medium");

	// RWL - commented out
//	width = viddef.width / 8;	// rjr hardcoded yuckiness
	width = 640 / 8;	// rjr hardcoded yuckiness
	width -= 4;

	// RWL - commented out
/*
	if (cl.frame.playerstate.remote_type != REMOTE_TYPE_LETTERBOX)
	{
		width -= 30;
	}
*/

	scr_centertime_off = scr_centertime->value;

	Com_Printf("\n");

	num_lines = 0;
	write_pos = scr_centerstring;
	scr_center_lines = 0;
	spaced = false;
	for(s = start = str, last=NULL, num_chars = 0; !done ; s++)
	{
		num_chars++;
		if ((*s) == ' ')
		{
			spaced = true;
			last = s;
			scr_centertime_off += 0.2f;//give them an extra 0.05 second for each character
		}

		if ((*s) == '\n' || (*s) == 0)
		{
			last = s;
			num_chars = width;
			spaced = true;
		}

		if (num_chars >= width)
		{
			scr_centertime_off += 0.8f;//give them an extra half second for each newline
			if (!last)
			{
				last = s;
			}
			if (!spaced)
			{
				last++;
			}

			save_pos = write_pos;
			strncpy(write_pos, start, last-start);
			write_pos += last-start;
			*write_pos = 0;
			write_pos++;

			Com_Printf ("%s\n", save_pos);

			// RWL - commented out
//			scr_center_widths[scr_center_lines] = re.StrlenFont(save_pos, scr_font);;
			scr_center_widths[scr_center_lines] = 640;


			scr_center_lines++;

			if ((*s) == 0 || scr_center_lines >= MAX_SCR_LINES)
			{
				done = true;
			}
			else
			{
				s = last;
				if (spaced)
				{
					last++;
				}
				start = last;
				last = NULL;
				num_chars = 0;
				spaced = false;
			}
			continue;
		}
	}

	// echo it to the console
	Com_Printf("\n\n");
	Con_ClearNotify ();
}
