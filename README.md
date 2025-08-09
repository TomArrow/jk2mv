# JK2MV
https://jk2mv.org

JK2MV (Multi Version) is a modification for Jedi Knight II: Jedi Outcast. It supports all three game versions and comes with various features and optimizations.

Main Features:
- Supports 1.02, 1.03 & 1.04 in a single executable
- Supports most mods made for JK2 (maps, skins, (code)mods etc.)
- Fast ingame HTTP-Downloads with a dialogue asking you for permission before downloading files to your computer
- Multiplatform: Windows, Linux, MacOSX, FreeBSD
- Multiarchitecture: 32 and 64 bit support on all platforms
- Dynamic glow: Better looking lightsabers with the dynamic glow feature from JKA
- EAX/OpenAL sound fixed
- Support for modern screen resolutions
- Fixes for all known security bugs
- Minimizer: Press the Windows key / Command key in fullscreen mode to minimize
- Improved gamma correction
- Tons of other fixes and improvements in the engine, see the changelog for detailed information
- Opensource (GPLv2)

# Automated Builds
These builds are automatically generated on every push to the repository. For testing purposes only.

| GitHub Actions | Codacy |
| -------------- | ------ |
| [![GitHub Actions Badge](https://github.com/mvdevs/jk2mv/actions/workflows/build.yml/badge.svg)](https://github.com/mvdevs/jk2mv/actions?query=branch%3Amaster) | [![Codacy Badge](https://api.codacy.com/project/badge/Grade/872b979ad7dc46aebb6c63d66c1cea77)](https://www.codacy.com/app/mvdevs/jk2mv?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=mvdevs/jk2mv&amp;utm_campaign=Badge_Grade)

## Latency Compensation & Prediction Enhancements (Added)

These client-side systems improve responsiveness for medium/high latency players (≈40–300ms) while avoiding visual shake.

### 1. Automatic TimeNudge
`cl_autoNudge` derives a timenudge from recent median ping: Base = `-medianPing * cl_autoNudge`.

Core CVars:
- `cl_autoNudge` (0 disables; typical 0.3–0.6)
- `cl_autoNudgeSmoothing` (EMA weight 0..1, default 0.5)
- `cl_autoNudgeMax` (cap ms, default 30)
- `cl_effectiveTimeNudge` (read-only final applied)

Stabilizers:
- `cl_autoNudgeInterval` (ms between recomputes, default 125)
- `cl_autoNudgeDeadband` (ignore <N ms change, default 2)
- `cl_autoNudgeMaxStep` (max ms change per update, default 4)

Example (80–120ms ping):
```
seta cl_autoNudge 0.5
seta cl_autoNudgeSmoothing 0.4
seta cl_autoNudgeInterval 125
seta cl_autoNudgeDeadband 2
seta cl_autoNudgeMaxStep 3
```
Check: `echo ^3TN:$cl_effectiveTimeNudge$`.

### 2. High-Ping Adaptive Extension
Adds extra controlled lead for sustained high ping, damped by jitter.

CVars:
- `cl_hpAdaptive` (enable)
- `cl_hpMaxLead` (extra lead cap, default 45)
- `cl_hpJitterWindow` (samples for jitter, default 20)
- `cl_hpJitterDampen` (0..1 damping strength, default 0.5)

Suggested (150–200ms with jitter):
```
seta cl_autoNudge 0.55
seta cl_hpAdaptive 1
seta cl_hpMaxLead 45
seta cl_hpJitterWindow 20
seta cl_hpJitterDampen 0.65
seta cl_autoNudgeInterval 140
seta cl_autoNudgeDeadband 3
```

Stable very high ping (240ms+):
```
seta cl_autoNudge 0.6
seta cl_hpAdaptive 1
seta cl_hpJitterDampen 0.4
```

Disable auto & revert to manual:
```
seta cl_autoNudge 0
seta cl_timeNudge -20
```

### 3. Tuning Guidance
If output feels jittery: raise `cl_autoNudgeDeadband` or `cl_autoNudgeSmoothing`.
If too sluggish: lower interval or deadband, or slightly raise max step.

### 4. Safety
All values are clamped; cannot exceed conservative lead caps. Server reconciliation unchanged (client-only smoothing).

Planned (future): expose live jitter metrics, adaptive error smoothing, optional micro-extrapolation.

## 5. V24 Advanced Features

### Client-Side Operation
All V24 features now operate **client-side only** and work regardless of server settings. These features have been redesigned to bypass traditional cheat restrictions:

- **No server cheats required**: Features work on any server without `sv_cheats 1`
- **Universal compatibility**: Functions across all map types and server configurations
- **Client-controlled**: Full user control without server administrator intervention

### ESP / Wallhack Features

The V24 layer introduces optional gameplay visibility, training, and QoL tools. All are client-side; some may be disallowed competitively (respect server rules).

### Combat Assistance / Awareness
`cg_playerInfo` expanded target info; `cg_drawKillMessage` / `cg_showKills` enhanced kill feed; automation helpers (`cg_autoBackStab*`, `cg_autoKick*`, `cg_autoAim*`) with distance, prediction, debug, and safety sub-cvars; `cg_wallHack` (admin/debug only); `cg_debugSaberBox*` visualize saber collision.

### HUD & Visual Feedback
Timers (`cg_drawTimer`, `cg_drawTimerMsec`), ramps (`cg_drawRamps`), FPS telemetry (`cg_drawFPS*` family), strafe helper & factors (`cg_strafeHelper*`, `cg_drawStrafeBotFactor`), speed & race overlays (`cg_speedometer*`, `cg_raceTimer*`), position (`cg_showpos`), input display (`cg_movementKeys*`), crosshair customization (`cg_crosshair*`, `cg_dynamicCrosshair`), flag status (`cg_enhancedFlagStatus`), anti-loop indicator (`cg_antiLoopIndicator*`), chat/UI enhancements (`cg_chatBox*`, `cg_cleanChatbox`, `cg_newFont`, `cg_friendsChatsOnly`, `cg_chatSounds`).

### Prediction & Physics
Extended prediction (`cg_deluxePlayersPredict*`), error smoothing (`cg_errorDecay`), physics tick tweaks (`cg_specialPredictPhysicsFps*`), animation controls (`cg_animSpeed`, `cg_animBlend`, `cg_swingAngles`).

### Movement Training / Analytics
Strafe helpers persistent (`cg_drawStrafeHelperSpeedometerAlways`), real acceleration analytics (`cg_realAccel*` group), race timing customization (`cg_customizeRace`), force jump timing (`cg_fkDuration`, `cg_fkFirstJumpDuration`, `cg_fkSecondJumpDelay`).

### Audio / Sensory Aids
Alternate hit / movement sound cues (`cg_jumpSounds`, `cg_rollSounds`, `cg_hitSounds`, `cg_newSaberHitSounds`).

### Visual Models & Effects
Player visibility (`cg_brightskins`), hitbox render (`cg_drawHitBox`), saber mark / trail customization (`cg_saberDynamicMarks`, `cg_saberDynamicMarkTime`, `cg_saberContact`, `cg_saberTrail`, `cg_saberEndsGlow`), duel shells & shields (`cg_privateDuelShell`, `cg_teamRespawnShield`), flag alpha (`cg_thirdPersonFlagAlpha`).

### FOV & Camera
Aspect/FOV controls (`cg_fov`, `cg_fovAspectAdjust`, `cg_widescreen`, `cg_cameraFPS`), viewmodel FOV (`cg_fovViewmodel*`).

### Misc & QoL
LOD bias (`cg_playerLOD`), non-dueler visibility (`cg_drawNonDuelers`), auto-fall kill (`cg_autoKillWhenFalling`), force field opacity (`cg_forceFieldOpacity*`), dynamic remaps (`cg_remaps`).

### Usage Tips
1. Discover: `cvarlist cg_` then grep for the name in configs/source for defaults.
2. Create themed configs: combat.cfg (assist off), train.cfg (helpers on), stream.cfg (HUD overlays).
3. For demo analysis pair prediction toggles with visualization aids; e.g. `cg_nopredict 1` + `cg_debugSaberBox 1`.
4. Disable contentious aids on public/league servers: `cg_wallHack 0; cg_autoAim 0; cg_autoBackStab 0; cg_autoKick 0; cg_brightskins 0`.

Minimal clean movement HUD example:
```
seta cg_drawFPS 1; seta cg_speedometer 1; seta cg_raceTimer 1; seta cg_strafeHelper 1; seta cg_realAccelScale 1
```

Mass disable assistance quickly:
```
seta cg_autoBackStab 0; seta cg_autoKick 0; seta cg_autoAim 0; seta cg_wallHack 0; seta cg_brightskins 0
```

Refer to `cg_main.c` for the exhaustive list and any newly added advanced variables beyond this summary.

## Detailed V24 Additions & Usage (Extended Documentation)

Below is a focused reference for the most recently added / extended systems so you can configure and test them in–game quickly. All CVars are client-side (prefixed `cg_`) unless otherwise noted. Many are flagged cheat/admin; respect server rules.

### 1. WallHack / ESP Modular Overlay

Base toggle: `cg_wallHack` (bitmask in some builds; value >=1 enables baseline player ESP). New granular presentation CVars:

| CVar | Default | Purpose |
|------|---------|---------|
| `cg_wallHack_showNames` | 1 | Draw player names through walls / occlusion. |
| `cg_wallHack_showBoxes` | 1 | Draw compact 3D bounding boxes (depth‑hack) around players. |
| `cg_wallHack_showInfo`  | 1 | Enable detailed info layer (text or icons depending on `showIcons`). |
| `cg_wallHack_showIcons` | 1 | When on, replaces multi‑line text info with compact icon / bar HUD (health, armor, force activity, saber style). |
| `cg_wallHack_iconScale` | 1.0 | Scales size of icon bars/text (0.1–4.0 practical). |
| `cg_wallHack_iconOffsetZ` | 72 | World Z offset above player origin for overlay anchoring. |

Recommended minimal awareness (names only):
```
seta cg_wallHack 1
seta cg_wallHack_showBoxes 0
seta cg_wallHack_showInfo 0
```

Full debug (all layers):
```
seta cg_wallHack 1
seta cg_wallHack_showNames 1
seta cg_wallHack_showBoxes 1
seta cg_wallHack_showInfo 1
seta cg_wallHack_showIcons 1
seta cg_wallHack_iconScale 1.2
seta cg_wallHack_iconOffsetZ 78
```

Switch to textual stats instead of icons:
```
seta cg_wallHack_showIcons 0
```

Disable everything (quick safety):
```
seta cg_wallHack 0
```

Notes:
* Info lines / icons are positioned above player head (predicted origin) and update every frame.
* Health / Armor are decoded from `generic1` packing when available, else client info fallbacks.
* Force activity color block shows the first matched active power (priority: Rage/Grip > Lightning/Drain > Speed/Heal > Protect/Absorb > See). Gray if none.
* Saber style heuristic uses recent `saberMove` (F=fast/light, M=medium, S=strong/back) – approximate for quick glance.

### 2. Auto Kick System

**Client-Side Operation**: Auto kick now works universally without server cheat restrictions.

Purpose: Context-aware automatic melee kicks without blocking manual movement input or camera control.

Core CVars:
| CVar | Default | Description |
|------|---------|-------------|
| `cg_autoKick` | 0 | Master enable (0 off, >0 modes; current implementation treats >0 as on). |
| `cg_autoKick_distance` | 16.0 | Base activation distance. Set <=0 to enable fully dynamic distance derived from target velocity + lead factor. |
| `cg_autoKick_usePrediction` | 1 | Use latency & target motion prediction when evaluating distance. |
| `cg_autoKick_leadFactor` | 0.0 | Scales additional reach when targets are moving toward/away (dynamic extension). |
| `cg_autoKick_cooldown` | 750 | Minimum ms between automatic kicks. |
| `cg_autoKick_sideKickFirst` | 0 | Prefer initiating with a side kick variant when available/valid. |
| `cg_autoKick_indicator` | 0 | (If implemented) Visual readiness indicator overlay. |
| `cg_autoKick_checkRoll` | 1 | Require target not currently rolling (avoid wasted kick). |
| `cg_autoKick_checkAir` | 0 | If 1, allow evaluation while you are airborne. |
| `cg_autoKick_checkKnockdown` | 1 | Avoid triggering on already knocked-down opponents. |
| `cg_autoKick_minWallNormal` | 0 | Minimum wall alignment dot for wall-related special kicks (if applicable). |
| `cg_autoKick_minVelocityZ` | 0 | Vertical velocity threshold to consider aerial variants. |

Debugging:
```
seta cg_autoKick_debug 1
```
Shows trace / distance computations (console or overlay depending on build) and per-frame dynamic distance.

Tuning Examples:
* Tight dueling focus (short range, precise):
```
seta cg_autoKick 1
seta cg_autoKick_distance 14
seta cg_autoKick_leadFactor 0
```
* Adaptive chase (dynamic reach):
```
seta cg_autoKick 1
seta cg_autoKick_distance 0
seta cg_autoKick_leadFactor 0.35
```

### 3. Auto Backstab System

**Client-Side Operation**: Auto backstab now works universally without server cheat restrictions.

Purpose: Intelligent backstab detection with angle correction, prediction, and manual override controls.

Key CVars:
| CVar | Default | Description |
|------|---------|-------------|
| `cg_autoBackStab` | 0 | Mode selector (0 off; 1 basic trigger; 2 hold-style; >=3 advanced logic incl. angle safety & tracking). |
| `cg_autoBackStab_distance` | 128.0 | Base activation distance; <=0 enables dynamic computation (stores in `autoBackStabFrameDistance`). |
| `cg_autoBackStab_usePrediction` | 1 | Lead target position using velocity & latency. |
| `cg_autoBackStab_leadAdjust` | 0.0 | Units to push trace forward along predicted velocity vector. |
| `cg_autoBackStab_maxAngle` | 60 | Max yaw delta window (degrees) attacker vs target allowed. 0 disables angle gating. |
| `cg_autoBackStab_cooldown` | 750 | Min ms between automatic backstab attempts. |
| `cg_autoBackStab_crouch` | 0 | Permit crouched variant selection logic. |
| `cg_autoBackStab_track` | 0 | Enable gentle tracking (camera yaw interpolation) while executing (safeguards to avoid snap). |
| `cg_autoBackStab_trackTime` | 0 | Duration in ms to continue mild tracking after initiation. |

Debug overlay:
```
seta cg_autoBackStab_debug 1
```
Observes distance window, angular deltas, chosen variant.

Usage Patterns:
* Basic opportunistic stab:
```
seta cg_autoBackStab 1
```
* Predictive with angle gating & lead tweak:
```
seta cg_autoBackStab 3
seta cg_autoBackStab_maxAngle 50
seta cg_autoBackStab_leadAdjust 6
```

### 4. Auto Aim Assist (Training / Accessibility)

**Client-Side Operation**: Auto aim now works universally without server cheat restrictions.

Provides optional assist for target acquisition (non-projectile melee focus) with smoothing and lead. Disable on competitive servers.

Principal CVars:
| CVar | Default | Description |
|------|---------|-------------|
| `cg_autoAim` | 0 | Master mode (0 off; >0 enables). |
| `cg_autoAim_fov` | 60 | Acquisition FOV in degrees for scanning near-crosshair targets. |
| `cg_autoAim_usePrediction` | 1 | Predict future target position using velocity & latency window. |
| `cg_autoAim_leadFactor` | 0.0 | Fraction of (ping + command delay) used to compute forward lead time. |
| `cg_autoAim_maxLeadMs` | 0 | Clamp on lead milliseconds (0 uses internal default). |
| `cg_autoAim_retargetInterval` | 0 | Minimum ms between full distance/FOV scans (reduces per-frame cost). |
| `cg_autoAim_switchDelay` | 0 | Milliseconds before accepting a new closer target (reduces flicker). |
| `cg_autoAim_smooth` | 0 | Enable interpolation of assisted angle instead of snapping. |
| `cg_autoAim_smoothFactor` | 0.5 | (0..1) Lerp fraction per frame when smoothing. |
| `cg_autoAim_ignoreWalls` | 1 | If 0, performs visibility trace; if blocked target is ignored. |

Debug:
```
seta cg_autoAim_debug 1
```
Shows acquisition candidates, FOV angles, lead vector details.

Quick Moderate Assist Preset:
```
seta cg_autoAim 1
seta cg_autoAim_fov 50
seta cg_autoAim_smooth 1
seta cg_autoAim_smoothFactor 0.35
seta cg_autoAim_leadFactor 0.5
seta cg_autoAim_maxLeadMs 80
seta cg_autoAim_switchDelay 140
```

### 5. Precision Saber Debug Volume

### 5b. Master Advanced Prediction Toggle

`cg_advancedPrediction` (0/1) – When enabled, automatically forces prediction paths for supported V24 helpers (autoKick, autoBackStab, autoAim) even if their individual `*_usePrediction` cvars are 0, and activates adaptive parameters when their key distance/FOV cvars are set to 0. Use this for a “hands‑off” fully dynamic mode:
```
seta cg_advancedPrediction 1
seta cg_autoKick_distance 0
seta cg_autoBackStab_distance 0
seta cg_autoAim_fov 0
```
Disable to return to manual tuning:
```
seta cg_advancedPrediction 0
```

CVars:
| CVar | Default | Description |
|------|---------|-------------|
| `cg_debugSaberBox` | 0 | Master toggle drawing physically oriented saber blade volume(s) per frame. |
| `cg_debugSaberBox_usePrediction` | 1 | Use predicted player state for box alignment (client smoothing). |

Behavior:
* Renders an oriented box (or dual boxes) along actual saber blade direction & length rather than an approximate axis-aligned cube.
* Useful for validating hit detection timing & range when combined with `cg_nopredict` tests.

Usage:
```
seta cg_debugSaberBox 1
```
Optionally disable prediction for raw server interpolation view:
```
seta cg_debugSaberBox_usePrediction 0
```

### 6. Safety / Fair Play Quick Toggles

For public or competitive environments create a macro that disables contentious helpers:
```
bind F11 "seta cg_autoAim 0; seta cg_autoBackStab 0; seta cg_autoKick 0; seta cg_wallHack 0"
```

### 7. Troubleshooting & Verification

If an assist feature appears unresponsive:
1. Ensure its master cvar > 0.
2. Check cooldowns (e.g. backstab / kick) and angular gates (`cg_autoBackStab_maxAngle`).
3. Enable respective `*_debug` cvar to inspect gating metrics.
4. For prediction discrepancies, temporarily set related `*_usePrediction 0` and compare.

Performance Tips:
* Increase `cg_autoAim_retargetInterval` (e.g. 120) to reduce scan frequency on low-end CPUs.
* Disable `cg_wallHack_showInfo` if cluttered or to save minor draw calls.

### 8. Configuration Snippets

Training Profile:
```
seta cg_wallHack 1
seta cg_wallHack_showBoxes 1
seta cg_wallHack_showIcons 1
seta cg_autoBackStab 3
seta cg_autoBackStab_usePrediction 1
seta cg_autoKick 1
seta cg_autoKick_usePrediction 1
seta cg_autoAim 1
seta cg_autoAim_smooth 1
seta cg_debugSaberBox 1
```

Clean Competitive Profile:
```
seta cg_wallHack 0
seta cg_autoBackStab 0
seta cg_autoKick 0
seta cg_autoAim 0
seta cg_debugSaberBox 0
```

---
This extended section will be pruned / consolidated into formal docs once features stabilize; until then it serves as a living quickstart for V24 additions.

# Howto Build JK2MV
1. Clone the JK2MV repository
Clone the JK2MV repository including submodules (required if you also want to build the [mvsdk](https://github.com/mvdevs/mvsdk) modules), e.g.:
	* `git clone --recursive https://github.com/mvdevs/jk2mv`
2. Install CMake (minimum version 4.1 required). If your distribution or package manager does not yet provide 4.1 you must install a newer binary release from https://cmake.org.
3. Dependencies
 	* Windows: Requires at least Visual Studio 2013, required libraries are shipped with JK2MV in the `libs` directory.
		* If you plan to build the installer package get NSIS from http://nsis.sourceforge.net
	* Linux/FreeBSD: OpenGL, OpenAL, SDL2 and depending on your configuration libjpeg, libpng, libminizip, zlib.
		* Ubuntu/Debian: `apt-get install git debhelper devscripts libsdl2-dev libgl1-mesa-dev libopenal-dev libjpeg-dev libpng-dev zlib1g-dev libminizip-dev`
		* Fedora: `dnf install git SDL2-devel mesa-libGL-devel openal-soft-devel libjpeg-turbo-devel libpng-devel zlib-devel minizip-devel`
	* MacOSX: XCode on MacOSX >= 10.9
		* Configure / Build SDL2:
			1. `curl -O https://www.libsdl.org/release/SDL2-2.0.10.tar.gz`
			2. `tar xzf SDL2-2.0.10.tar.gz && cd SDL2-2.0.10/Xcode/SDL`
			4. `sed -i -e 's/@rpath//g' SDL.xcodeproj/project.pbxproj` (packaging fails otherwise)
			5. `xcodebuild -configuration Release`
			6. `mkdir -p ~/Library/Frameworks/`
			7. ``ln -s `pwd`/build/Release/SDL2.framework ~/Library/Frameworks``
4. Configuration
	* Either
		* Use the CMake GUI to configure JK2MV
		* Generate the default configuration by using the build scripts in the `build` directory.
	* Important Options
		* `BuildPortableVersion` Build portable version (does not read or write files from your user/home directory)
		* `BuildMVMP` Whether to create targets for the client (jk2mvmp & jk2mvmenu)
		* `BuildMVDED` Whether to create targets for the dedicated server (jk2mvded)
		* `BuildMVSDK` Whether to build and integrate the mvsdk modules.
		* `CMAKE_BUILD_TYPE=Debug/Release` Build for development/release.
5. Building
	* Common targets
		* `make` (or the default build command in your generator / IDE) builds all selected binaries and assets.
		* `make build-assets` builds only the packaged pk3 asset archives (no engine binaries). This is an alias for the meta target `mv-assets` which bundles:
			* `assetsmv2.pk3` (core assets)
			* `jk2pro-bins.pk3` (legacy/compatibility bins) when the SDK is enabled
		* `make install` Installs JK2MV to `/usr` on Linux. On MacOSX it finishes the App-Package.
		* `make package` Generates rpm/deb packages on Linux and a dmg image on MacOSX.

6. Performance (optional)
	* If NASM is installed it will be detected and used by the internal libjpeg-turbo to build SIMD accelerated routines. Without NASM the build is still functional but image decoding is slower.

# License
JK2MV is licensed under GPLv2 as free software. You are free to use, modify and redistribute JK2MV following the terms in the LICENSE file. Please be aware of the implications of the GPLv2 licence. In short, be prepared to share your code under the same GPLv2 licence.

# Credits
- openjk (https://github.com/JACoders/OpenJK) (SDL port, engine fixes, improvements etc.)
- ioq3 (https://github.com/ioquake/ioq3/) (SDL port, x64 qvm, engine fixes, improvements etc.)
- xLAva (https://github.com/xLAva/JediOutcastLinux) (openal fixes)
- Thoroughbred-Of-Sin (http://thoroughbred-of-sin.deviantart.com/) (icon)
