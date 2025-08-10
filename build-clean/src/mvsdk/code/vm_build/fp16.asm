code
proc fp32_from_bits 4 0
file "D:\Workspace\jk2mv-tom\src\mvsdk\code\qcommon\fp16.c"
line 8
;1:
;2:#include "../qcommon/fp16.h"
;3:
;4:// this is a simplified version of https://github.com/Maratyszcza/FP16 without any intrinsics or whatever
;5:// also have to change uint16_t to short since qvm gets really angry at unsigned 16 bit ints
;6:// we're gonna use this for some encoding of float values in usercmd_t for strafebot (strafefactor)
;7:
;8:static float fp32_from_bits(uint32_t w) {
line 13
;9:	union {
;10:		uint32_t as_bits;
;11:		float as_value;
;12:	} fp32;
;13:	fp32.as_bits = w;
ADDRLP4 0
ADDRFP4 0
INDIRU4
ASGNU4
line 14
;14:	return fp32.as_value;
ADDRLP4 0
INDIRF4
RETF4
LABELV $59
endproc fp32_from_bits 4 0
proc fp32_to_bits 4 0
line 17
;15:}
;16:
;17:static uint32_t fp32_to_bits(float f) {
line 22
;18:	union {
;19:		float as_value;
;20:		uint32_t as_bits;
;21:	} fp32;
;22:	fp32.as_value = f;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ASGNF4
line 23
;23:	return fp32.as_bits;
ADDRLP4 0
INDIRU4
RETU4
LABELV $61
endproc fp32_to_bits 4 0
lit
align 1
LABELV $64
byte 1 31
byte 1 22
byte 1 30
byte 1 21
byte 1 18
byte 1 10
byte 1 29
byte 1 2
byte 1 20
byte 1 17
byte 1 15
byte 1 13
byte 1 9
byte 1 6
byte 1 28
byte 1 1
byte 1 23
byte 1 19
byte 1 11
byte 1 3
byte 1 16
byte 1 14
byte 1 7
byte 1 24
byte 1 12
byte 1 4
byte 1 8
byte 1 25
byte 1 5
byte 1 26
byte 1 27
byte 1 0
code
proc count_leading_zeros_32 20 0
line 30
;24:}
;25:
;26:
;27:// this function is actually from https://github.com/gagern/gnulib
;28:// since qvm doesnt really have __builtin_clz or such
;29:static int count_leading_zeros_32(unsigned int x)
;30:{
line 37
;31:	/* http://graphics.stanford.edu/~seander/bithacks.html */
;32:	static const char de_Bruijn_lookup[32] = {
;33:	  31, 22, 30, 21, 18, 10, 29, 2, 20, 17, 15, 13, 9, 6, 28, 1,
;34:	  23, 19, 11, 3, 16, 14, 7, 24, 12, 4, 8, 25, 5, 26, 27, 0
;35:	};
;36:
;37:	x |= x >> 1;
ADDRLP4 0
ADDRFP4 0
INDIRU4
ASGNU4
ADDRFP4 0
ADDRLP4 0
INDIRU4
ADDRLP4 0
INDIRU4
CNSTI4 1
RSHU4
BORU4
ASGNU4
line 38
;38:	x |= x >> 2;
ADDRLP4 4
ADDRFP4 0
INDIRU4
ASGNU4
ADDRFP4 0
ADDRLP4 4
INDIRU4
ADDRLP4 4
INDIRU4
CNSTI4 2
RSHU4
BORU4
ASGNU4
line 39
;39:	x |= x >> 4;
ADDRLP4 8
ADDRFP4 0
INDIRU4
ASGNU4
ADDRFP4 0
ADDRLP4 8
INDIRU4
ADDRLP4 8
INDIRU4
CNSTI4 4
RSHU4
BORU4
ASGNU4
line 40
;40:	x |= x >> 8;
ADDRLP4 12
ADDRFP4 0
INDIRU4
ASGNU4
ADDRFP4 0
ADDRLP4 12
INDIRU4
ADDRLP4 12
INDIRU4
CNSTI4 8
RSHU4
BORU4
ASGNU4
line 41
;41:	x |= x >> 16;
ADDRLP4 16
ADDRFP4 0
INDIRU4
ASGNU4
ADDRFP4 0
ADDRLP4 16
INDIRU4
ADDRLP4 16
INDIRU4
CNSTI4 16
RSHU4
BORU4
ASGNU4
line 42
;42:	return de_Bruijn_lookup[((x * 0x07c4acddU) & 0xffffffffU) >> 27];
CNSTU4 130329821
ADDRFP4 0
INDIRU4
MULU4
CNSTI4 27
RSHU4
ADDRGP4 $64
ADDP4
INDIRI1
CVII4 1
RETI4
LABELV $63
endproc count_leading_zeros_32 20 0
export fp16_ieee_to_fp32_bits
proc fp16_ieee_to_fp32_bits 36 4
line 51
;43:}
;44:
;45:/*
;46: * Convert a 16-bit floating-point number in IEEE half-precision format, in bit representation, to
;47: * a 32-bit floating-point number in IEEE single-precision format, in bit representation.
;48: *
;49: * @note The implementation doesn't use any floating-point operations.
;50: */
;51:uint32_t fp16_ieee_to_fp32_bits(uint32_t h) {
line 61
;52:	/*
;53:	 * Extend the half-precision floating-point number to 32 bits and shift to the upper part of the 32-bit word:
;54:	 *      +---+-----+------------+-------------------+
;55:	 *      | S |EEEEE|MM MMMM MMMM|0000 0000 0000 0000|
;56:	 *      +---+-----+------------+-------------------+
;57:	 * Bits  31  26-30    16-25            0-15
;58:	 *
;59:	 * S - sign bit, E - bits of the biased exponent, M - bits of the mantissa, 0 - zero bits.
;60:	 */
;61:	const uint32_t w = (uint32_t)h << 16;
ADDRLP4 8
ADDRFP4 0
INDIRU4
CNSTI4 16
LSHU4
ASGNU4
line 70
;62:	/*
;63:	 * Extract the sign of the input number into the high bit of the 32-bit word:
;64:	 *
;65:	 *      +---+----------------------------------+
;66:	 *      | S |0000000 00000000 00000000 00000000|
;67:	 *      +---+----------------------------------+
;68:	 * Bits  31                 0-31
;69:	 */
;70:	const uint32_t sign = w & UINT32_C(0x80000000);
ADDRLP4 12
ADDRLP4 8
INDIRU4
CNSTU4 2147483648
BANDU4
ASGNU4
line 79
;71:	/*
;72:	 * Extract mantissa and biased exponent of the input number into the bits 0-30 of the 32-bit word:
;73:	 *
;74:	 *      +---+-----+------------+-------------------+
;75:	 *      | 0 |EEEEE|MM MMMM MMMM|0000 0000 0000 0000|
;76:	 *      +---+-----+------------+-------------------+
;77:	 * Bits  30  27-31     17-26            0-16
;78:	 */
;79:	const uint32_t nonsign = w & UINT32_C(0x7FFFFFFF);
ADDRLP4 4
ADDRLP4 8
INDIRU4
CNSTU4 2147483647
BANDU4
ASGNU4
line 87
;80:	/*
;81:	 * Iff half-precision number has exponent of 15, the addition overflows it into bit 31,
;82:	 * and the subsequent shift turns the high 9 bits into 1. Thus
;83:	 *   inf_nan_mask ==
;84:	 *                   0x7F800000 if the half-precision number had exponent of 15 (i.e. was NaN or infinity)
;85:	 *                   0x00000000 otherwise
;86:	 */
;87:	const int32_t inf_nan_mask = ((int32_t)(nonsign + 0x04000000) >> 8) & INT32_C(0x7F800000);
ADDRLP4 16
ADDRLP4 4
INDIRU4
CNSTU4 67108864
ADDU4
CVUI4 4
CNSTI4 8
RSHI4
CNSTI4 2139095040
BANDI4
ASGNI4
line 95
;88:	/*
;89:	 * Iff nonsign is 0, it overflows into 0xFFFFFFFF, turning bit 31 into 1. Otherwise, bit 31 remains 0.
;90:	 * The signed shift right by 31 broadcasts bit 31 into all bits of the zero_mask. Thus
;91:	 *   zero_mask ==
;92:	 *                0xFFFFFFFF if the half-precision number was zero (+0.0h or -0.0h)
;93:	 *                0x00000000 otherwise
;94:	 */
;95:	const int32_t zero_mask = (int32_t)(nonsign - 1) >> 31;
ADDRLP4 20
ADDRLP4 4
INDIRU4
CNSTU4 1
SUBU4
CVUI4 4
CNSTI4 31
RSHI4
ASGNI4
line 104
;96:
;97:	/*
;98:	 * Renorm shift is the number of bits to shift mantissa left to make the half-precision number normalized.
;99:	 * If the initial number is normalized, some of its high 6 bits (sign == 0 and 5-bit exponent) equals one.
;100:	 * In this case renorm_shift == 0. If the number is denormalize, renorm_shift > 0. Note that if we shift
;101:	 * denormalized nonsign by renorm_shift, the unit bit of mantissa will shift into exponent, turning the
;102:	 * biased exponent into 1, and making mantissa normalized (i.e. without leading 1).
;103:	 */
;104:	uint32_t renorm_shift = count_leading_zeros_32(nonsign);
ADDRLP4 4
INDIRU4
ARGU4
ADDRLP4 24
ADDRGP4 count_leading_zeros_32
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
CVIU4 4
ASGNU4
line 105
;105:	renorm_shift = renorm_shift > 5 ? renorm_shift - 5 : 0;
ADDRLP4 0
INDIRU4
CNSTU4 5
LEU4 $67
ADDRLP4 28
ADDRLP4 0
INDIRU4
CNSTU4 5
SUBU4
ASGNU4
ADDRGP4 $68
JUMPV
LABELV $67
ADDRLP4 28
CNSTU4 0
ASGNU4
LABELV $68
ADDRLP4 0
ADDRLP4 28
INDIRU4
ASGNU4
line 119
;106:
;107:	/*
;108:	 * 1. Shift nonsign left by renorm_shift to normalize it (if the input was denormal)
;109:	 * 2. Shift nonsign right by 3 so the exponent (5 bits originally) becomes an 8-bit field and 10-bit mantissa
;110:	 *    shifts into the 10 high bits of the 23-bit mantissa of IEEE single-precision number.
;111:	 * 3. Add 0x70 to the exponent (starting at bit 23) to compensate the different in exponent bias
;112:	 *    (0x7F for single-precision number less 0xF for half-precision number).
;113:	 * 4. Subtract renorm_shift from the exponent (starting at bit 23) to account for renormalization. As renorm_shift
;114:	 *    is less than 0x70, this can be combined with step 3.
;115:	 * 5. Binary OR with inf_nan_mask to turn the exponent into 0xFF if the input was NaN or infinity.
;116:	 * 6. Binary ANDNOT with zero_mask to turn the mantissa and exponent into zero if the input was zero.
;117:	 * 7. Combine with the sign of the input number.
;118:	 */
;119:	return sign | ((((nonsign << renorm_shift >> 3) + ((0x70 - renorm_shift) << 23)) | inf_nan_mask) & ~zero_mask);
ADDRLP4 12
INDIRU4
ADDRLP4 4
INDIRU4
ADDRLP4 0
INDIRU4
CVUI4 4
LSHU4
CNSTI4 3
RSHU4
CNSTU4 112
ADDRLP4 0
INDIRU4
SUBU4
CNSTI4 23
LSHU4
ADDU4
ADDRLP4 16
INDIRI4
CVIU4 4
BORU4
ADDRLP4 20
INDIRI4
BCOMI4
CVIU4 4
BANDU4
BORU4
RETU4
LABELV $65
endproc fp16_ieee_to_fp32_bits 36 4
export fp16_ieee_to_fp32_value
proc fp16_ieee_to_fp32_value 84 4
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII2 4
ASGNI2
line 129
;120:}
;121:
;122:/*
;123: * Convert a 16-bit floating-point number in IEEE half-precision format, in bit representation, to
;124: * a 32-bit floating-point number in IEEE single-precision format.
;125: *
;126: * @note The implementation relies on IEEE-like (no assumption about rounding mode and no operations on denormals)
;127: * floating-point operations and bitcasts between integer and floating-point variables.
;128: */
;129:float fp16_ieee_to_fp32_value(short hShort) {
line 131
;130:
;131:	const uint32_t h = SHORT2USHORT(hShort);
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 0
GEI4 $71
ADDRLP4 48
ADDRFP4 0
INDIRI2
CVII4 2
CNSTI4 65535
ADDI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $72
JUMPV
LABELV $71
ADDRLP4 48
ADDRFP4 0
INDIRI2
CVII4 2
ASGNI4
LABELV $72
ADDRLP4 8
ADDRLP4 48
INDIRI4
CVIU4 4
ASGNU4
line 141
;132:	/*
;133:	 * Extend the half-precision floating-point number to 32 bits and shift to the upper part of the 32-bit word:
;134:	 *      +---+-----+------------+-------------------+
;135:	 *      | S |EEEEE|MM MMMM MMMM|0000 0000 0000 0000|
;136:	 *      +---+-----+------------+-------------------+
;137:	 * Bits  31  26-30    16-25            0-15
;138:	 *
;139:	 * S - sign bit, E - bits of the biased exponent, M - bits of the mantissa, 0 - zero bits.
;140:	 */
;141:	const uint32_t w = (uint32_t)h << 16;
ADDRLP4 0
ADDRLP4 8
INDIRU4
CNSTI4 16
LSHU4
ASGNU4
line 150
;142:	/*
;143:	 * Extract the sign of the input number into the high bit of the 32-bit word:
;144:	 *
;145:	 *      +---+----------------------------------+
;146:	 *      | S |0000000 00000000 00000000 00000000|
;147:	 *      +---+----------------------------------+
;148:	 * Bits  31                 0-31
;149:	 */
;150:	const uint32_t sign = w & UINT32_C(0x80000000);
ADDRLP4 12
ADDRLP4 0
INDIRU4
CNSTU4 2147483648
BANDU4
ASGNU4
line 159
;151:	/*
;152:	 * Extract mantissa and biased exponent of the input number into the high bits of the 32-bit word:
;153:	 *
;154:	 *      +-----+------------+---------------------+
;155:	 *      |EEEEE|MM MMMM MMMM|0 0000 0000 0000 0000|
;156:	 *      +-----+------------+---------------------+
;157:	 * Bits  27-31    17-26            0-16
;158:	 */
;159:	const uint32_t two_w = w + w;
ADDRLP4 4
ADDRLP4 0
INDIRU4
ADDRLP4 0
INDIRU4
ADDU4
ASGNU4
line 187
;160:
;161:	/*
;162:	 * Shift mantissa and exponent into bits 23-28 and bits 13-22 so they become mantissa and exponent
;163:	 * of a single-precision floating-point number:
;164:	 *
;165:	 *       S|Exponent |          Mantissa
;166:	 *      +-+---+-----+------------+----------------+
;167:	 *      |0|000|EEEEE|MM MMMM MMMM|0 0000 0000 0000|
;168:	 *      +-+---+-----+------------+----------------+
;169:	 * Bits   | 23-31   |           0-22
;170:	 *
;171:	 * Next, there are some adjustments to the exponent:
;172:	 * - The exponent needs to be corrected by the difference in exponent bias between single-precision and half-precision
;173:	 *   formats (0x7F - 0xF = 0x70)
;174:	 * - Inf and NaN values in the inputs should become Inf and NaN values after conversion to the single-precision number.
;175:	 *   Therefore, if the biased exponent of the half-precision input was 0x1F (max possible value), the biased exponent
;176:	 *   of the single-precision output must be 0xFF (max possible value). We do this correction in two steps:
;177:	 *   - First, we adjust the exponent by (0xFF - 0x1F) = 0xE0 (see exp_offset below) rather than by 0x70 suggested
;178:	 *     by the difference in the exponent bias (see above).
;179:	 *   - Then we multiply the single-precision result of exponent adjustment by 2**(-112) to reverse the effect of
;180:	 *     exponent adjustment by 0xE0 less the necessary exponent adjustment by 0x70 due to difference in exponent bias.
;181:	 *     The floating-point multiplication hardware would ensure than Inf and NaN would retain their value on at least
;182:	 *     partially IEEE754-compliant implementations.
;183:	 *
;184:	 * Note that the above operations do not handle denormal inputs (where biased exponent == 0). However, they also do not
;185:	 * operate on denormal inputs, and do not produce denormal results.
;186:	 */
;187:	const uint32_t exp_offset = UINT32_C(0xE0) << 23;
ADDRLP4 16
CNSTU4 1879048192
ASGNU4
line 189
;188:
;189:	const float exp_scale = fp32_from_bits(UINT32_C(0x7800000));
CNSTU4 125829120
ARGU4
ADDRLP4 56
ADDRGP4 fp32_from_bits
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 56
INDIRF4
ASGNF4
line 190
;190:	const float normalized_value = fp32_from_bits((two_w >> 4) + exp_offset) * exp_scale;
ADDRLP4 4
INDIRU4
CNSTI4 4
RSHU4
ADDRLP4 16
INDIRU4
ADDU4
ARGU4
ADDRLP4 60
ADDRGP4 fp32_from_bits
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 60
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 220
;191:
;192:	/*
;193:	 * Convert denormalized half-precision inputs into single-precision results (always normalized).
;194:	 * Zero inputs are also handled here.
;195:	 *
;196:	 * In a denormalized number the biased exponent is zero, and mantissa has on-zero bits.
;197:	 * First, we shift mantissa into bits 0-9 of the 32-bit word.
;198:	 *
;199:	 *                  zeros           |  mantissa
;200:	 *      +---------------------------+------------+
;201:	 *      |0000 0000 0000 0000 0000 00|MM MMMM MMMM|
;202:	 *      +---------------------------+------------+
;203:	 * Bits             10-31                0-9
;204:	 *
;205:	 * Now, remember that denormalized half-precision numbers are represented as:
;206:	 *    FP16 = mantissa * 2**(-24).
;207:	 * The trick is to construct a normalized single-precision number with the same mantissa and thehalf-precision input
;208:	 * and with an exponent which would scale the corresponding mantissa bits to 2**(-24).
;209:	 * A normalized single-precision floating-point number is represented as:
;210:	 *    FP32 = (1 + mantissa * 2**(-23)) * 2**(exponent - 127)
;211:	 * Therefore, when the biased exponent is 126, a unit change in the mantissa of the input denormalized half-precision
;212:	 * number causes a change of the constructud single-precision number by 2**(-24), i.e. the same ammount.
;213:	 *
;214:	 * The last step is to adjust the bias of the constructed single-precision number. When the input half-precision number
;215:	 * is zero, the constructed single-precision number has the value of
;216:	 *    FP32 = 1 * 2**(126 - 127) = 2**(-1) = 0.5
;217:	 * Therefore, we need to subtract 0.5 from the constructed single-precision number to get the numerical equivalent of
;218:	 * the input half-precision number.
;219:	 */
;220:	const uint32_t magic_mask = UINT32_C(126) << 23;
ADDRLP4 28
CNSTU4 1056964608
ASGNU4
line 221
;221:	const float magic_bias = 0.5f;
ADDRLP4 32
CNSTF4 1056964608
ASGNF4
line 222
;222:	const float denormalized_value = fp32_from_bits((two_w >> 17) | magic_mask) - magic_bias;
ADDRLP4 4
INDIRU4
CNSTI4 17
RSHU4
ADDRLP4 28
INDIRU4
BORU4
ARGU4
ADDRLP4 64
ADDRGP4 fp32_from_bits
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 64
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
ASGNF4
line 230
;223:
;224:	/*
;225:	 * - Choose either results of conversion of input as a normalized number, or as a denormalized number, depending on the
;226:	 *   input exponent. The variable two_w contains input exponent in bits 27-31, therefore if its smaller than 2**27, the
;227:	 *   input is either a denormal number, or zero.
;228:	 * - Combine the result of conversion of exponent and mantissa with the sign of the input number.
;229:	 */
;230:	const uint32_t denormalized_cutoff = UINT32_C(1) << 27;
ADDRLP4 40
CNSTU4 134217728
ASGNU4
line 231
;231:	const uint32_t result = sign |
ADDRLP4 4
INDIRU4
ADDRLP4 40
INDIRU4
GEU4 $74
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 fp32_to_bits
CALLU4
ASGNU4
ADDRLP4 68
ADDRLP4 72
INDIRU4
ASGNU4
ADDRGP4 $75
JUMPV
LABELV $74
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 76
ADDRGP4 fp32_to_bits
CALLU4
ASGNU4
ADDRLP4 68
ADDRLP4 76
INDIRU4
ASGNU4
LABELV $75
ADDRLP4 44
ADDRLP4 12
INDIRU4
ADDRLP4 68
INDIRU4
BORU4
ASGNU4
line 233
;232:		(two_w < denormalized_cutoff ? fp32_to_bits(denormalized_value) : fp32_to_bits(normalized_value));
;233:	return fp32_from_bits(result);
ADDRLP4 44
INDIRU4
ARGU4
ADDRLP4 80
ADDRGP4 fp32_from_bits
CALLF4
ASGNF4
ADDRLP4 80
INDIRF4
RETF4
LABELV $69
endproc fp16_ieee_to_fp32_value 84 4
export fp16_ieee_from_fp32_value
proc fp16_ieee_from_fp32_value 88 4
line 244
;234:
;235:}
;236:
;237:/*
;238: * Convert a 32-bit floating-point number in IEEE single-precision format to a 16-bit floating-point number in
;239: * IEEE half-precision format, in bit representation.
;240: *
;241: * @note The implementation relies on IEEE-like (no assumption about rounding mode and no operations on denormals)
;242: * floating-point operations and bitcasts between integer and floating-point variables.
;243: */
;244:short fp16_ieee_from_fp32_value(float f) {
line 247
;245:	uint32_t bits, exp_bits, mantissa_bits, nonsign;
;246:	uint32_t result;
;247:	const float scale_to_inf = fp32_from_bits(UINT32_C(0x77800000));
CNSTU4 2004877312
ARGU4
ADDRLP4 52
ADDRGP4 fp32_from_bits
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 52
INDIRF4
ASGNF4
line 248
;248:	const float scale_to_zero = fp32_from_bits(UINT32_C(0x08800000));
CNSTU4 142606336
ARGU4
ADDRLP4 56
ADDRGP4 fp32_from_bits
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 56
INDIRF4
ASGNF4
line 250
;249:
;250:	const float saturated_f = fabsf(f) * scale_to_inf;
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 60
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 252
;251:
;252:	float base = saturated_f * scale_to_zero;
ADDRLP4 4
ADDRLP4 44
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 254
;253:
;254:	const uint32_t w = fp32_to_bits(f);
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 fp32_to_bits
CALLU4
ASGNU4
ADDRLP4 8
ADDRLP4 64
INDIRU4
ASGNU4
line 255
;255:	const uint32_t shl1_w = w + w;
ADDRLP4 20
ADDRLP4 8
INDIRU4
ADDRLP4 8
INDIRU4
ADDU4
ASGNU4
line 256
;256:	const uint32_t sign = w & UINT32_C(0x80000000);
ADDRLP4 48
ADDRLP4 8
INDIRU4
CNSTU4 2147483648
BANDU4
ASGNU4
line 257
;257:	uint32_t bias = shl1_w & UINT32_C(0xFF000000);
ADDRLP4 12
ADDRLP4 20
INDIRU4
CNSTU4 4278190080
BANDU4
ASGNU4
line 258
;258:	if (bias < UINT32_C(0x71000000)) {
ADDRLP4 12
INDIRU4
CNSTU4 1895825408
GEU4 $77
line 259
;259:		bias = UINT32_C(0x71000000);
ADDRLP4 12
CNSTU4 1895825408
ASGNU4
line 260
;260:	}
LABELV $77
line 262
;261:
;262:	base = fp32_from_bits((bias >> 1) + UINT32_C(0x07800000)) + base;
ADDRLP4 12
INDIRU4
CNSTI4 1
RSHU4
CNSTU4 125829120
ADDU4
ARGU4
ADDRLP4 72
ADDRGP4 fp32_from_bits
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 72
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 265
;263:
;264:	// declarations moved to start of fucntion for qvm
;265:	bits = fp32_to_bits(base);
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 76
ADDRGP4 fp32_to_bits
CALLU4
ASGNU4
ADDRLP4 16
ADDRLP4 76
INDIRU4
ASGNU4
line 266
;266:	exp_bits = (bits >> 13) & UINT32_C(0x00007C00);
ADDRLP4 24
ADDRLP4 16
INDIRU4
CNSTI4 13
RSHU4
CNSTU4 31744
BANDU4
ASGNU4
line 267
;267:	mantissa_bits = bits & UINT32_C(0x00000FFF);
ADDRLP4 28
ADDRLP4 16
INDIRU4
CNSTU4 4095
BANDU4
ASGNU4
line 268
;268:	nonsign = exp_bits + mantissa_bits;
ADDRLP4 32
ADDRLP4 24
INDIRU4
ADDRLP4 28
INDIRU4
ADDU4
ASGNU4
line 269
;269:	result = (sign >> 16) | (shl1_w > UINT32_C(0xFF000000) ? UINT32_C(0x7E00) : nonsign); // changed UINT16_C to UINT32_C. prolly irrelevant but whatever. qvm doesnt like 16 bit unsigned ints :(
ADDRLP4 20
INDIRU4
CNSTU4 4278190080
LEU4 $80
ADDRLP4 80
CNSTU4 32256
ASGNU4
ADDRGP4 $81
JUMPV
LABELV $80
ADDRLP4 80
ADDRLP4 32
INDIRU4
ASGNU4
LABELV $81
ADDRLP4 0
ADDRLP4 48
INDIRU4
CNSTI4 16
RSHU4
ADDRLP4 80
INDIRU4
BORU4
ASGNU4
line 271
;270:
;271:	return USHORT2SHORT(result);
ADDRLP4 0
INDIRU4
CNSTU4 32767
LEU4 $83
ADDRLP4 84
ADDRLP4 0
INDIRU4
CNSTU4 65535
SUBU4
CNSTU4 1
SUBU4
ASGNU4
ADDRGP4 $84
JUMPV
LABELV $83
ADDRLP4 84
ADDRLP4 0
INDIRU4
ASGNU4
LABELV $84
ADDRLP4 84
INDIRU4
CVUI4 4
CVII2 4
CVII4 2
RETI4
LABELV $76
endproc fp16_ieee_from_fp32_value 88 4
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
