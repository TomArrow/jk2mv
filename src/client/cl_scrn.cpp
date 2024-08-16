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
		if ( Q_IsColorString( s ) || (use102color && Q_IsColorString_1_02( s ))) {
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
		if ( Q_IsColorString( s ) || (use102color && Q_IsColorString_1_02( s ))) {
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
		if ( Q_IsColorString( s ) || (use102color && Q_IsColorString_1_02( s ))) {
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
		if ( Q_IsColorString( s ) || (use102color && Q_IsColorString_1_02( s ))) {
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
	cl_fpsGuess = Cvar_Get("cl_fpsGuess", "0", CVAR_ARCHIVE);
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

/*
==================
SCR_DrawScreenField

This will be called twice if rendering in stereo mode
==================
*/
void SCR_DrawScreenField( stereoFrame_t stereoFrame ) {
	re.BeginFrame( stereoFrame );

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

	// console draws next
	Con_DrawConsole ();

	// debug graph can be drawn on top of anything
	if ( cl_debuggraph->integer || cl_timegraph->integer || cl_debugMove->integer ) {
		SCR_DrawDebugGraph ();
	}
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

	// if running in stereo, we need to draw the frame twice
	if ( cls.glconfig.stereoEnabled ) {
		SCR_DrawScreenField( STEREO_LEFT );
		SCR_DrawScreenField( STEREO_RIGHT );
	} else {
		SCR_DrawScreenField( STEREO_CENTER );
	}

	if (cl_fpsGuess->integer == 1) {
		bool notTooOld = (cl.snap.serverTime - cls.fpsGuess.lastGuessedFpsServerTime < 1000);
		SCR_DrawBigString(320, 240, va("%d:%d/%d(%d%%)",cl_fpsGuessMode->integer, cls.fpsGuess.lastCertainGuessedFps, notTooOld ? cls.fpsGuess.lastGuessedFps:0, notTooOld ? cls.fpsGuess.lastGuessedFpsPercentage: 0), 1.0f);
	}
	else if (cl_fpsGuess->integer == 2) {
		static char fpsGuessMethod2String[2048];
		fpsGuessMethod2String[0] = 0;
		for (int i = 0; i < FPS_GUESS_METHOD2_PRIME_REVERSE_LOOKUP_COUNT; i++) {
			if (cls.fpsGuess.method2PossibleMsecValues[i]) {

				Q_strcat(fpsGuessMethod2String, sizeof(fpsGuessMethod2String), i==0 ? va("%d", 1000/cls.fpsGuess.method2PossibleMsecValues[i]) : va("/%d", 1000/cls.fpsGuess.method2PossibleMsecValues[i]));
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
				float matchPrecisionHere = matchPrecisions[i] = MIN(1.0f,MAX(0.0f,cl_fpsGuessMethod3GravityMatchPrecision->value- fabsf(cls.fpsGuess.method3EffectiveFPSGravities[possibleMsecValue] - cls.fpsGuess.method3MeasuredEffectiveGravity))/ cl_fpsGuessMethod3GravityMatchPrecision->value);
				thisFPSColor[3] = matchPrecisionHere/2.0f+0.5f;
				SCR_DrawSmallStringExt(120,340+i*20, va("%d fps (grav %d)", 1000 / possibleMsecValue, cls.fpsGuess.method3EffectiveFPSGravities[possibleMsecValue]), thisFPSColor,qfalse);
				//Q_strcat(fpsGuessMethod3String, sizeof(fpsGuessMethod3String), i == 0 ? va("%d", 1000 / cls.fpsGuess.method3PossibleMsecValues[i]) : va("/%d", 1000 / cls.fpsGuess.method3PossibleMsecValues[i]));
			}
		}
		{
			int height = 200;
			static float oldUpperBound = 800.0f + cl_fpsGuessMethod3GravityMatchPrecision->value*2;
			static float oldLowerBound = 800.0f - cl_fpsGuessMethod3GravityMatchPrecision->value * 2;
			float lowerBound = MAX(cls.fpsGuess.method3MeasuredEffectiveGravity,650) - cl_fpsGuessMethod3GravityMatchPrecision->value * 2;
			float upperBound = MIN(cls.fpsGuess.method3MeasuredEffectiveGravity,1050) + cl_fpsGuessMethod3GravityMatchPrecision->value * 2;
			float adjustmentSpeedMultiplier = (float)cls.frametime/7.0f;
			if(cls.fpsGuess.method3MeasuredEffectiveGravity){
				if (lowerBound > oldLowerBound) {
					lowerBound = oldLowerBound+ 0.1f* adjustmentSpeedMultiplier;
				}
				else if (lowerBound < oldLowerBound) {
					lowerBound = oldLowerBound- 0.1f * adjustmentSpeedMultiplier;
				}
				if (upperBound > oldUpperBound) {
					upperBound = oldUpperBound+ 0.1f * adjustmentSpeedMultiplier;
				}
				else if (upperBound < oldUpperBound) {
					upperBound = oldUpperBound-0.1f * adjustmentSpeedMultiplier;
				}
			}
			else {
				lowerBound = oldLowerBound;
				upperBound = oldUpperBound;
			}
			oldUpperBound = upperBound;
			oldLowerBound = lowerBound;
			float range = upperBound - lowerBound;
			float basePositionY = cls.glconfig.vidHeight-300;
			
			std::vector<std::tuple<float, std::string, bool>> referenceLines;

			const char* referenceLinesString = cl_fpsGuessMethod3ReferenceLines->string;
			if (strstr(referenceLinesString, "float")) {
				referenceLines.push_back({ 800.0f, "float", true});
			}
			while (true) { // Parse reference lines wanted by user. TODO: don't do the string analysis on every frame, it's wasteful
				int parsedNumber = atoi(referenceLinesString);
				if (parsedNumber) {
					int msec = 1000 / parsedNumber;
					if (msec > 0 && msec < FPS_GUESS_METHOD3_MSEC_LIMIT) {
						referenceLines.push_back({ cls.fpsGuess.method3EffectiveFPSGravities[msec], va("%d",parsedNumber), false });
					}
				}
				referenceLinesString = strstr(referenceLinesString,",");
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
			int oldestSampleIndex = MAX(0, cls.fpsGuess.method3MeasuredGravitySamplesIndex - 1 - FPS_GUESS_METHOD3_HISTORY_LINE_DRAW_SAMPLES+1);
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
				for (int i = oldestSampleIndex+1; i < cls.fpsGuess.method3MeasuredGravitySamplesIndex; i++) {
					fpsGuessMethod3HistorySample_t* previousSample = &cls.fpsGuess.method3MeasuredGravitySamples[(i-1) % FPS_GUESS_METHOD3_HISTORY_LINE_DRAW_SAMPLES];
					fpsGuessMethod3HistorySample_t* currentSample = &cls.fpsGuess.method3MeasuredGravitySamples[i % FPS_GUESS_METHOD3_HISTORY_LINE_DRAW_SAMPLES];
					float oldXPos = leftOffset + (((float)previousSample->globalTime - (float)oldestTime) / (float)totalTimeDelta) * ((float)cls.glconfig.vidWidth - 50.0f- leftOffset);
					float currentXPos = leftOffset + (((float)currentSample->globalTime - (float)oldestTime) / (float)totalTimeDelta) * ((float)cls.glconfig.vidWidth - 50.0f- leftOffset);
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
					re.DrawStretchPic(oldXPos, yPos, currentXPos-oldXPos, 2,
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
					&& ((float)gravityHere > (highestSampleSeen+ cl_fpsGuessMethod3GravityMatchPrecision->value * 2.0f) || (float)gravityHere < (lowestSampleSeen - cl_fpsGuessMethod3GravityMatchPrecision->value * 2.0f))
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
			Q_strcat(fpsGuessMethod3String, sizeof(fpsGuessMethod3String), va("%sgrav: %d", cls.fpsGuess.lastFrameWasMeasured ? (cls.fpsGuess.lastFrameWasSlide? "-": " ") : "_", (int)cls.fpsGuess.method3MeasuredEffectiveGravity));
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
		SCR_DrawStringExt(100, 260,10, va("mV:%.2f, mVh:%.2f, mVv: %.2f",cls.showVelocity.maxVelocity, cls.showVelocity.maxVelocityH, cls.showVelocity.maxVelocityV),colorWhite,qfalse);
		SCR_DrawStringExt(100, 270,10, va("mDV:%.2f, mDVh:%.2f, mDVv: %.2f",cls.showVelocity.maxVelocityDelta, cls.showVelocity.maxVelocityDeltaH, cls.showVelocity.maxVelocityDeltaV), colorWhite, qfalse);
	} 

	if ( com_speeds->integer ) {
		re.EndFrame( &time_frontend, &time_backend );
	} else {
		re.EndFrame( NULL, NULL );
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
