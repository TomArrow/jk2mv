data
export menuScoreboard
align 4
LABELV menuScoreboard
byte 4 0
export bluehudtint
align 4
LABELV bluehudtint
byte 4 1056964608
byte 4 1056964608
byte 4 1065353216
byte 4 1065353216
export redhudtint
align 4
LABELV redhudtint
byte 4 1065353216
byte 4 1056964608
byte 4 1056964608
byte 4 1065353216
export yellowhudtint
align 4
LABELV yellowhudtint
byte 4 1065353216
byte 4 1065353216
byte 4 1056964608
byte 4 1065353216
export armorTicName
align 4
LABELV armorTicName
address $166
address $167
address $168
address $169
export healthTicName
align 4
LABELV healthTicName
address $170
address $171
address $172
address $173
export forceTicName
align 4
LABELV forceTicName
address $174
address $175
address $176
address $177
export ammoTicName
align 4
LABELV ammoTicName
address $178
address $179
address $180
address $181
export showPowersName
align 4
LABELV showPowersName
address $182
address $183
address $184
address $185
address $186
address $187
address $188
address $189
address $190
address $191
address $192
address $193
address $194
address $195
address $196
address $197
address $198
address $199
byte 4 0
export MenuFontToHandle
code
proc MenuFontToHandle 0 0
endproc MenuFontToHandle 0 0
export CG_Text_Width
proc CG_Text_Width 0 0
endproc CG_Text_Width 0 0
export CG_Text_Height
proc CG_Text_Height 0 0
endproc CG_Text_Height 0 0
export CG_Text_Paint
proc CG_Text_Paint 0 0
endproc CG_Text_Paint 0 0
data
align 4
LABELV $268
byte 4 1
code
proc CG_DrawZoomMask 0 0
endproc CG_DrawZoomMask 0 0
export CG_Draw3DModel
proc CG_Draw3DModel 0 0
endproc CG_Draw3DModel 0 0
export CG_DrawHead
proc CG_DrawHead 0 0
endproc CG_DrawHead 0 0
export CG_DrawFlagModel
proc CG_DrawFlagModel 0 0
endproc CG_DrawFlagModel 0 0
export CG_DrawHUDLeftFrame1
proc CG_DrawHUDLeftFrame1 0 0
endproc CG_DrawHUDLeftFrame1 0 0
export CG_DrawHUDLeftFrame2
proc CG_DrawHUDLeftFrame2 0 0
endproc CG_DrawHUDLeftFrame2 0 0
export CG_DrawHealth
proc CG_DrawHealth 0 0
endproc CG_DrawHealth 0 0
export CG_DrawHealthJKA
proc CG_DrawHealthJKA 0 0
endproc CG_DrawHealthJKA 0 0
export CG_DrawArmor
proc CG_DrawArmor 0 0
endproc CG_DrawArmor 0 0
export CG_DrawArmorJKA
proc CG_DrawArmorJKA 0 0
endproc CG_DrawArmorJKA 0 0
export CG_DrawHUDRightFrame1
proc CG_DrawHUDRightFrame1 0 0
endproc CG_DrawHUDRightFrame1 0 0
export CG_DrawHUDRightFrame2
proc CG_DrawHUDRightFrame2 0 0
endproc CG_DrawHUDRightFrame2 0 0
proc CG_DrawSaberStyle 0 0
endproc CG_DrawSaberStyle 0 0
proc CG_DrawAmmo 0 0
endproc CG_DrawAmmo 0 0
proc CG_DrawAmmoJKA 0 0
endproc CG_DrawAmmoJKA 0 0
export CG_DrawForcePower
proc CG_DrawForcePower 0 0
endproc CG_DrawForcePower 0 0
export CG_DrawForcePowerJKA
proc CG_DrawForcePowerJKA 0 0
endproc CG_DrawForcePowerJKA 0 0
lit
align 1
LABELV $844
byte 1 0
skip 6
code
proc CG_DrawSimpleSaberStyle 0 0
endproc CG_DrawSimpleSaberStyle 0 0
lit
align 1
LABELV $873
byte 1 0
skip 15
code
proc CG_DrawSimpleAmmo 0 0
endproc CG_DrawSimpleAmmo 0 0
lit
align 1
LABELV $903
byte 1 0
skip 15
align 4
LABELV $904
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
code
proc CG_DrawSimpleForcePower 0 0
endproc CG_DrawSimpleForcePower 0 0
lit
align 1
LABELV $951
byte 1 0
skip 99
align 1
LABELV $952
byte 1 0
skip 47
align 4
LABELV $953
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
export DF_RaceTimer
code
proc DF_RaceTimer 0 0
endproc DF_RaceTimer 0 0
data
align 4
LABELV speedometerXPos
byte 4 0
align 4
LABELV chatBoxYPos
byte 4 0
