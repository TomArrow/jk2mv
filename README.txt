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
      \cg_autoKick "1"
      \cg_autoKick_debug "1"
  Enable prediction:
      \cg_autoKick_usePrediction "1"
  Check prediction:
      \cg_showmiss "1"
  Prediction note:
      cg_showmiss will print misses and errors to the console when they occur
