V24 features:

* Fixes from JK2MV.
  See files mvsdk_log.txt and jk2mv_log.txt

* Allow to change cheat cvars:
      \set com_overrideCheats "1"

* Allow to change cvars:
      JK2MV, cg_MVSDK, g_MVSDK, ui_MVSDK

* Wallhack.
  Enable:
      \set cg_wallHack "1"

* Autokick.
  Enable:
      \set com_overrideCheats "1"
  Toggle:
      \bind V "toggle cg_autoKick"
  Press:
      \bind V "+autoKick"
  Change distance:
      \set cg_autoKick_distance "16.0"
  Distance affect:
      1.02 side kicks and front kicks; 
      1.03 side kicks only;
      1.04 side kicks only.
  Change priority:
      \set cg_autoKick_sideKickFirst "1"
  Priority example:
      "cg_autoKick_sideKickFirst 0" + "can kick side" + "can kick front" = "kick front"
      "cg_autoKick_sideKickFirst 1" + "can kick side" + "can kick front" = "kick side"
  Enable debug:
      \set cg_autoKick "1"
      \set cg_autoKick_debug "1"
  Enable prediction:
      \set cg_autoKick_usePrediction "1"
  Check prediction:
      \set cg_showmiss "1"
  Prediction note:
      cg_showmiss will print misses and errors to the console when they occur
  Enable indicator:
      \set cg_movementKeys "1"
      \set cg_autoKick_indicator "1"
  Disable checks:
      \set cg_autoKick_checkRoll "0"
      \set cg_autoKick_checkAir "0"
      \set cg_autoKick_checkKnockdown "0"

* Kill messages
  Disable:
      \set cg_drawKillMessage "0"
  Enable default:
      \set cg_drawKillMessage "1"
  Enable multikill:
      \set cg_drawKillMessage "2"

* Friends list
  Description:
      Clients in this list will be ignored by autokick and auto backstab
  Add friend:
      \friendAdd <client_id or name or all>
  Remove friend:
      \friendRemove <client_id or name or all>
  List friends:
      \friendsList
  List all clients:
      \clientlist
  Examples:
      \friendAdd Padawan
      \friendAdd 6
      \friendAdd all
      \friendRemove Luke
      \friendRemove 19
      \friendRemove all

* Auto backstab
  Enable normal backstab (toggle):
      \bind V "toggle cg_autoBackStab"
  Enable crouched backstab with jump (toggle):
      \bind V "toggle cg_autoBackStab 0 2"
  Enable normal backstab (press):
      \set cg_autoBackStab "3"
      \bind V "+autoBackStab"
  Enable crouched backstab with jump (press):
      \set cg_autoBackStab "4"
      \bind V "+autoBackStab"
  Change distance:
      \set cg_autoBackStab_distance "128.0"
  Enable debug:
      \set cg_autoBackStab "1"
      \set cg_autoBackStab_debug "1"
  Enable prediction:
      \set cg_autoBackStab_usePrediction "1"

* Saber box visualization
  Enable:
      \set cg_debugSaberBox "1"
  Enable prediction:
      \set cg_debugSaberBox_usePrediction "1"

* Score counter
  Enable:
      \set cg_scoreCounter "1"
  Example message:
      Luke (15) was sabered by Lando (34)

* Chat only from friends
  Enable:
      \set cg_friendsChatsOnly "1"
