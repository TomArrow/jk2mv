bss
align 4
LABELV $49
skip 4096
export levenshtein_n
code
proc levenshtein_n 56 12
ADDRFP4 4
ADDRFP4 4
INDIRU4
ASGNU4
ADDRFP4 12
ADDRFP4 12
INDIRU4
ASGNU4
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\qcommon\levenshtein.c"
line 10
;1:// `levenshtein.c` - levenshtein
;2:// MIT licensed.
;3:// Copyright (c) 2015 Titus Wormer <tituswormer@gmail.com>
;4:
;5:#include "../qcommon/levenshtein.h"
;6:
;7:// Returns a size_t, depicting the difference between `a` and `b`.
;8:// See <https://en.wikipedia.org/wiki/Levenshtein_distance> for more information.
;9:size_t
;10:levenshtein_n(const char *a, const size_t length, const char *b, const size_t bLength) {
line 12
;11:  static size_t cache[MAX_STRING_CHARS];
;12:  const int cacheSize = sizeof(cache) / sizeof(cache[0]);
ADDRLP4 24
CNSTI4 1024
ASGNI4
line 14
;13:  //size_t *cache = calloc(length, sizeof(size_t));
;14:  size_t index = 0;
ADDRLP4 8
CNSTU4 0
ASGNU4
line 15
;15:  size_t bIndex = 0;
ADDRLP4 20
CNSTU4 0
ASGNU4
line 22
;16:  size_t distance;
;17:  size_t bDistance;
;18:  size_t result;
;19:  char code;
;20:
;21:  // Shortcut optimizations / degenerate cases.
;22:  if (a == b) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $50
line 23
;23:    return 0;
CNSTU4 0
RETU4
ADDRGP4 $48
JUMPV
LABELV $50
line 26
;24:  }
;25:
;26:  if (length == 0) {
ADDRFP4 4
INDIRU4
CNSTU4 0
NEU4 $52
line 27
;27:    return bLength;
ADDRFP4 12
INDIRU4
RETU4
ADDRGP4 $48
JUMPV
LABELV $52
line 30
;28:  }
;29:
;30:  if (bLength == 0) {
ADDRFP4 12
INDIRU4
CNSTU4 0
NEU4 $54
line 31
;31:    return length;
ADDRFP4 4
INDIRU4
RETU4
ADDRGP4 $48
JUMPV
LABELV $54
line 34
;32:  }
;33:
;34:  memset(cache, 0, length*sizeof(size_t)); // i hope this is correct. qvm cant alloc. calloc allocs and zeros. so i just zero as much as would be needed.
ADDRGP4 $49
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRU4
CNSTI4 2
LSHU4
ARGU4
ADDRGP4 memset
CALLP4
pop
line 36
;35:
;36:  if (cacheSize < length || cacheSize < bLength) {
ADDRLP4 28
ADDRLP4 24
INDIRI4
CVIU4 4
ASGNU4
ADDRLP4 28
INDIRU4
ADDRFP4 4
INDIRU4
LTU4 $58
ADDRLP4 28
INDIRU4
ADDRFP4 12
INDIRU4
GEU4 $64
LABELV $58
line 37
;37:	  Com_Printf("Levenshtein: Cannot compare strings, cache overflow: %s <=> %s", a,b);
ADDRGP4 $59
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 38
;38:	  return MAX(length,bLength);
ADDRFP4 4
INDIRU4
ADDRFP4 12
INDIRU4
LEU4 $61
ADDRLP4 32
ADDRFP4 4
INDIRU4
ASGNU4
ADDRGP4 $62
JUMPV
LABELV $61
ADDRLP4 32
ADDRFP4 12
INDIRU4
ASGNU4
LABELV $62
ADDRLP4 32
INDIRU4
RETU4
ADDRGP4 $48
JUMPV
LABELV $63
line 43
;39:  }
;40:
;41:
;42:  // initialize the vector.
;43:  while (index < length) {
line 44
;44:    cache[index] = index + 1;
ADDRLP4 8
INDIRU4
CNSTI4 2
LSHU4
ADDRGP4 $49
ADDP4
ADDRLP4 8
INDIRU4
CNSTU4 1
ADDU4
ASGNU4
line 45
;45:    index++;
ADDRLP4 8
ADDRLP4 8
INDIRU4
CNSTU4 1
ADDU4
ASGNU4
line 46
;46:  }
LABELV $64
line 43
ADDRLP4 8
INDIRU4
ADDRFP4 4
INDIRU4
LTU4 $63
ADDRGP4 $67
JUMPV
LABELV $66
line 49
;47:
;48:  // Loop.
;49:  while (bIndex < bLength) {
line 50
;50:    code = b[bIndex];
ADDRLP4 16
ADDRLP4 20
INDIRU4
ADDRFP4 8
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 51
;51:    result = distance = bIndex++;
ADDRLP4 32
ADDRLP4 20
INDIRU4
ASGNU4
ADDRLP4 20
ADDRLP4 32
INDIRU4
CNSTU4 1
ADDU4
ASGNU4
ADDRLP4 0
ADDRLP4 32
INDIRU4
ASGNU4
ADDRLP4 12
ADDRLP4 32
INDIRU4
ASGNU4
line 53
;52:#ifdef Q3_VM
;53:    index = UINT_MAX; // this is a bit horrifying ngl
ADDRLP4 8
CNSTU4 4294967295
ASGNU4
ADDRGP4 $70
JUMPV
LABELV $69
line 58
;54:#else 
;55:	index = SIZE_MAX;
;56:#endif
;57:
;58:    while (++index < length) {
line 59
;59:      bDistance = code == a[index] ? distance : distance + 1;
ADDRLP4 16
INDIRI1
CVII4 1
ADDRLP4 8
INDIRU4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
NEI4 $73
ADDRLP4 36
ADDRLP4 0
INDIRU4
ASGNU4
ADDRGP4 $74
JUMPV
LABELV $73
ADDRLP4 36
ADDRLP4 0
INDIRU4
CNSTU4 1
ADDU4
ASGNU4
LABELV $74
ADDRLP4 4
ADDRLP4 36
INDIRU4
ASGNU4
line 60
;60:      distance = cache[index];
ADDRLP4 0
ADDRLP4 8
INDIRU4
CNSTI4 2
LSHU4
ADDRGP4 $49
ADDP4
INDIRU4
ASGNU4
line 62
;61:
;62:      cache[index] = result = distance > result
ADDRLP4 0
INDIRU4
ADDRLP4 12
INDIRU4
LEU4 $78
ADDRLP4 4
INDIRU4
ADDRLP4 12
INDIRU4
LEU4 $80
ADDRLP4 44
ADDRLP4 12
INDIRU4
CNSTU4 1
ADDU4
ASGNU4
ADDRGP4 $81
JUMPV
LABELV $80
ADDRLP4 44
ADDRLP4 4
INDIRU4
ASGNU4
LABELV $81
ADDRLP4 40
ADDRLP4 44
INDIRU4
ASGNU4
ADDRGP4 $79
JUMPV
LABELV $78
ADDRLP4 4
INDIRU4
ADDRLP4 0
INDIRU4
LEU4 $82
ADDRLP4 48
ADDRLP4 0
INDIRU4
CNSTU4 1
ADDU4
ASGNU4
ADDRGP4 $83
JUMPV
LABELV $82
ADDRLP4 48
ADDRLP4 4
INDIRU4
ASGNU4
LABELV $83
ADDRLP4 40
ADDRLP4 48
INDIRU4
ASGNU4
LABELV $79
ADDRLP4 12
ADDRLP4 40
INDIRU4
ASGNU4
ADDRLP4 8
INDIRU4
CNSTI4 2
LSHU4
ADDRGP4 $49
ADDP4
ADDRLP4 40
INDIRU4
ASGNU4
line 69
;63:        ? bDistance > result
;64:          ? result + 1
;65:          : bDistance
;66:        : bDistance > distance
;67:          ? distance + 1
;68:          : bDistance;
;69:    }
LABELV $70
line 58
ADDRLP4 36
ADDRLP4 8
INDIRU4
CNSTU4 1
ADDU4
ASGNU4
ADDRLP4 8
ADDRLP4 36
INDIRU4
ASGNU4
ADDRLP4 36
INDIRU4
ADDRFP4 4
INDIRU4
LTU4 $69
line 70
;70:  }
LABELV $67
line 49
ADDRLP4 20
INDIRU4
ADDRFP4 12
INDIRU4
LTU4 $66
line 74
;71:
;72:  //free(cache);
;73:
;74:  return result;
ADDRLP4 12
INDIRU4
RETU4
LABELV $48
endproc levenshtein_n 56 12
export levenshtein
proc levenshtein 20 16
line 78
;75:}
;76:
;77:size_t
;78:levenshtein(const char *a, const char *b) {
line 79
;79:  const size_t length = strlen(a);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 0
ADDRLP4 8
INDIRU4
ASGNU4
line 80
;80:  const size_t bLength = strlen(b);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLU4
ASGNU4
ADDRLP4 4
ADDRLP4 12
INDIRU4
ASGNU4
line 82
;81:
;82:  return levenshtein_n(a, length, b, bLength);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRU4
ARGU4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRU4
ARGU4
ADDRLP4 16
ADDRGP4 levenshtein_n
CALLU4
ASGNU4
ADDRLP4 16
INDIRU4
RETU4
LABELV $84
endproc levenshtein 20 16
import clampedIntAdd
import clampedIntMult
import parseHex
import colorToHex
import safeatoi
import sanitizeFilename
import GetStringForID
import GetIDForString
import Q_irandExpectedIf
import Q_irand
import irand
import flrand
import Rand_Init
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_HasKey
import Info_ValueForKey
import va
import FloatSwap
import LongSwap
import ShortSwap
import Q_StripColor
import Q_strstrip
import Q_strchrs
import Q_CleanAsciiStr
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strnncpyz
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseVec4
import COM_ParseFloat
import COM_ParseInt
import COM_ParseString
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import SkipWhitespace
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clampi
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import ET_asin
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import Q_pown
import JK2_powf
import ClampShort
import ClampChar
import floatint
import intfloat
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table_nt
import g_color_table
import colorDkBlue
import colorLtBlue
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import colorTable
import bytedirs
import Hunk_Alloc
import forceSpeedLevels
import bsearch
import copysignf
import powf
import logf
import expf
import frexpf
import roundf
import asin
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcmp
import memcpy
import memset
import memmove
import sscanf
import vsnprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $59
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 115
byte 1 104
byte 1 116
byte 1 101
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 67
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 44
byte 1 32
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 60
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 115
byte 1 0
