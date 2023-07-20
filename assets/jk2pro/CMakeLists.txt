# Make sure the user is not executing this script directly
if(NOT InMV)
	message(FATAL_ERROR "Use the top-level cmake script!")
endif(NOT InMV)

set(AssetsFiles
	"gfx/2d/crosshaira.tga"
	"gfx/2d/crosshairj.tga"
	"gfx/2d/mp_yteam_symbol.tga"

	"gfx/effects/mp_y_forcefield.jpg"
	"gfx/effects/mp_y_forcefield_d.jpg"
	"gfx/effects/mp_y_forcefield_d1.jpg"

	"gfx/hud/keys/back_off.tga"
	"gfx/hud/keys/back_on.tga"
	"gfx/hud/keys/crouch_off.tga"
	"gfx/hud/keys/crouch_on.tga"
	"gfx/hud/keys/forward_off.tga"
	"gfx/hud/keys/forward_on.tga"
	"gfx/hud/keys/jump_off.tga"
	"gfx/hud/keys/jump_on.tga"
	"gfx/hud/keys/left_off.tga"
	"gfx/hud/keys/left_on.tga"
	"gfx/hud/keys/right_off.tga"
	"gfx/hud/keys/right_on.tga"

	"icons/iconf_neutral1.tga"
	"icons/iconf_neutral1_x.tga"

	"menu/medals/medal_assist.png"
	"menu/medals/medal_capture.png"
	"menu/medals/medal_defend.png"
	"menu/medals/medal_excellent.png"
	"menu/medals/medal_gauntlet.png"
	"menu/medals/medal_impressive.png"

	"models/flags/n_flag.md3"
	"models/map_objects/mp/flag3.jpg"
	"models/players/desann/sounds.cfg"
	"models/players/galak/sounds.cfg"
	"models/players/jeditrainer/sounds.cfg"
	"models/players/kyle/sounds.cfg"
	"models/players/lando/sounds.cfg"
	"models/players/luke/sounds.cfg"
	"models/players/morgan/sounds.cfg"
	"models/players/ugnaught/sounds.cfg"
	"models/players/weequay/sounds.cfg"

	"shaders/ctf3_yellowteam.shader"
	"shaders/q3mod.shader"

	"sound/chars/mothma/misc/40MOM017.mp3"
	"sound/chars/mothma/misc/40MOM019.mp3"
	"sound/chars/mothma/misc/40MOM024.mp3"
	"sound/chars/mothma/misc/40MOM025.mp3"
	"sound/chars/mothma/misc/40MOM026.mp3"
	"sound/chars/mothma/misc/40MOM053.mp3"
	"sound/chars/tavion/misc/jump1.mp3"
	"sound/common/warning.wav"

	"ui/jk2mp/ingame.menu"
	"ui/jk2mp/ingame_camera.menu"
	"ui/jk2mp/ingame_server.menu"
	"ui/jk2mpingame.txt"
)

source_group("jk2pro-assets" FILES ${AssetsFiles})

# generate jk2pro-assets.pk3
if(MultiConfigGenerator)
	set(OUTFILE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/$<CONFIG>/eternaljk2/jk2pro-assets.pk3)
else()
	set(OUTFILE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/eternaljk2/jk2pro-assets.pk3)
endif()

include(InstallZIP)
add_zip_command(${CMAKE_CURRENT_BINARY_DIR}/jk2pro-assets.pk3 ${OUTFILE}
	DIR "${CMAKE_SOURCE_DIR}/assets/jk2pro"
	FILES "${AssetsFiles}"
	DEPENDS "${AssetsFiles}"
)

add_custom_target(assets-jk2pro DEPENDS "${CMAKE_CURRENT_BINARY_DIR}/jk2pro-assets.pk3" ${AssetsFiles})

if(WIN32 OR BuildPortableVersion)
	install(FILES ${CMAKE_CURRENT_BINARY_DIR}/jk2pro-assets.pk3 DESTINATION "eternaljk2")
elseif(APPLE)
	install(FILES ${CMAKE_CURRENT_BINARY_DIR}/jk2pro-assets.pk3 DESTINATION "${MVMP}.app/Contents/MacOS/eternaljk2")
else()
	install(FILES ${CMAKE_CURRENT_BINARY_DIR}/jk2pro-assets.pk3 DESTINATION "share/jk2mv/eternaljk2")
endif()
