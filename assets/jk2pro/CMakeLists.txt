# Make sure the user is not executing this script directly
if(NOT InMV)
	message(FATAL_ERROR "Use the top-level cmake script!")
endif(NOT InMV)

set(AssetsFiles
	"gfx/2d/crosshaira.tga"
	"gfx/2d/crosshairj.tga"
	"gfx/2d/mp_yteam_symbol.tga"
	
	"gfx/misc/tcRenderShader.jpg"
	"gfx/misc/tcRenderShader2.jpg"

	"gfx/effects/mp_y_forcefield.jpg"
	"gfx/effects/mp_y_forcefield_d.jpg"
	"gfx/effects/mp_y_forcefield_d1.jpg"

	"gfx/hud/ammo_tic_1.tga"
	"gfx/hud/ammo_tic_2.tga"
	"gfx/hud/ammo_tic_3.tga"
	"gfx/hud/ammo_tic_4.tga"
	"gfx/hud/armor_tic_1.tga"
	"gfx/hud/armor_tic_2.tga"
	"gfx/hud/armor_tic_3.tga"
	"gfx/hud/armor_tic_4.tga"
	"gfx/hud/force_tic_1.tga"
	"gfx/hud/force_tic_2.tga"
	"gfx/hud/force_tic_3.tga"
	"gfx/hud/force_tic_4.tga"
	"gfx/hud/health_tic_1.tga"
	"gfx/hud/health_tic_2.tga"
	"gfx/hud/health_tic_3.tga"
	"gfx/hud/health_tic_4.tga"
	"gfx/hud/hudleft_jka.tga"
	"gfx/hud/saber_fast.tga"
	"gfx/hud/saber_med.tga"
	"gfx/hud/saber_strong.tga"

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

	"shaders/ctf3_yellowteam.shader"
	"shaders/japro_tcRender.shader"
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
	"ui/jk2mp/menudef.h"
	"ui/jk2mpingame.txt"
	"ui/jahud.menu"
	"ui/jahud.txt"

	"ext_data/sabers/default.sab"
	"ext_data/sabers/desann.sab"
	"ext_data/sabers/luke.sab"
	"ext_data/sabers/reborn.sab"

	"gfx/menus/configforce.jpg"
	"gfx/menus/saber_icon_blue.jpg"
	"gfx/menus/saber_icon_green.jpg"
	"gfx/menus/saber_icon_orange.jpg"
	"gfx/menus/saber_icon_purple.jpg"
	"gfx/menus/saber_icon_red.jpg"
	"gfx/menus/saber_icon_yellow.jpg"
	"gfx/menus/saberonly_jka.jpg"
	"gfx/mp/custom_mp_default.jpg"
	"strings/English/eternal.str"
	"ui/jk2mp/ingame_player.menu_jka"
	"ui/jk2mp/ingame_player2.menu_jka"
	"ui/jk2mp/ingame_saber.menu_jka"

	"Readme_QuiGonJinn_Skin.txt"
	"sound/chars/secret_quigon/misc/choke1.mp3"
	"sound/chars/secret_quigon/misc/choke2.mp3"
	"sound/chars/secret_quigon/misc/choke3.mp3"
	"sound/chars/secret_quigon/misc/death1.mp3"
	"sound/chars/secret_quigon/misc/death2.mp3"
	"sound/chars/secret_quigon/misc/death3.mp3"
	"sound/chars/secret_quigon/misc/falling1.mp3"
	"sound/chars/secret_quigon/misc/gasp.mp3"
	"sound/chars/secret_quigon/misc/jump1.mp3"
	"sound/chars/secret_quigon/misc/land1.mp3"
	"sound/chars/secret_quigon/misc/pain25.mp3"
	"sound/chars/secret_quigon/misc/pain50.mp3"
	"sound/chars/secret_quigon/misc/pain75.mp3"
	"sound/chars/secret_quigon/misc/pain100.mp3"
	"sound/chars/secret_quigon/misc/taunt.mp3"
	"shaders/secret_quigon.shader"
	"models/players/secret_quigon/animsounds.cfg"
	"models/players/secret_quigon/belt.jpg"
	"models/players/secret_quigon/blue_glow.jpg"
	"models/players/secret_quigon/body.jpg"
	"models/players/secret_quigon/boots.jpg"
	"models/players/secret_quigon/face1a.jpg"
	"models/players/secret_quigon/hair.jpg"
	"models/players/secret_quigon/hair3.jpg"
	"models/players/secret_quigon/head.jpg"
	"models/players/secret_quigon/icon_blue.jpg"
	"models/players/secret_quigon/icon_red.jpg"
	"models/players/secret_quigon/icon_default.jpg"
	"models/players/secret_quigon/model.glm"
	"models/players/secret_quigon/model_blue.skin"
	"models/players/secret_quigon/model_red.skin"
	"models/players/secret_quigon/model_default.skin"
	"models/players/secret_quigon/red_glow.jpg"
	"models/players/secret_quigon/skin.jpg"
	"models/players/secret_quigon/sounds.cfg"

	"models/players/cultist/icon_brown.jpg"
	"models/players/human_merc/icon_key_carrier.jpg"
	"models/players/human_merc/icon_racto.jpg"
	"models/players/imperial/icon_commander.jpg"
	"models/players/imperial/icon_officer.jpg"
	"models/players/jawa/icon_default.jpg"
	"models/players/jedi/icon_j2.jpg"
	"models/players/kyle/icon_fpls.jpg"
	"models/players/kyle/icon_fpls2.jpg"
	"models/players/morgan/icon_default.jpg"
	"models/players/reborn/icon_acrobat.jpg"
	"models/players/reborn/icon_boss.jpg"
	"models/players/reborn/icon_default.jpg"
	"models/players/reborn/icon_fencer.jpg"
	"models/players/reborn/icon_forceuser.jpg"
	"models/players/reborn_twin/icon_boss.jpg"
	"models/players/tavion_new/icon_possessed.jpg"
	"models/players/trandoshan/icon_sp.jpg"
	"models/players/weequay/icon_sp.jpg"
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

add_custom_target(assets-jk2pro ALL DEPENDS "${CMAKE_CURRENT_BINARY_DIR}/jk2pro-assets.pk3" ${AssetsFiles})

if(WIN32 OR BuildPortableVersion)
	install(FILES ${CMAKE_CURRENT_BINARY_DIR}/jk2pro-assets.pk3 DESTINATION "eternaljk2")
elseif(APPLE)
	install(FILES ${CMAKE_CURRENT_BINARY_DIR}/jk2pro-assets.pk3 DESTINATION "jk2mvmp.app/Contents/MacOS/eternaljk2")
else()
	install(FILES ${CMAKE_CURRENT_BINARY_DIR}/jk2pro-assets.pk3 DESTINATION "share/jk2mv/eternaljk2")
endif()
