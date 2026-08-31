#pragma description Big (D)BS Records file

#pragma array_limit 2147483647
#pragma pattern_limit 2147483647
#pragma loop_limit 16384

import type.magic;
import std.string;

struct usercmd_t {
    s32 serverTime;
    s32 angles[3];
    s32 buttons;
    u8 weapon;
    u8 forcesel;
    u8 invensel;
    u8 generic_cmd;
    s8 forwardmove;
    s8 rightmove;
    s8 upmove;
    s8 filler;
};
struct  smallTime {
    //8 bytes. can we make it 4?
    u8 tm_sec;     /* seconds after the minute - [0,59] */
    u8 tm_min;     /* minutes after the hour - [0,59] */
    u8 tm_hour;    /* hours since midnight - [0,23] */
    u8 tm_mday;    /* day of the month - [1,31] */
    u8 tm_mon;     /* months since January - [0,11] */
    u8 tm_year;    /* years since 1900 */     //as of 2015, value is 115, so we still have a few years before we hit 127
    u8 tm_wday;    /* days since Sunday - [0,6] */
    u8 tm_isdst;   /* daylight savings time flag */
};
struct bsRecordBigEntry {
    usercmd_t   frames[32];
    char  name[21];
    char  uname[11];
    s32 sessionId;
    s32 clientNum;
    s32 unixtimeGameStart;
    s32 unixtime;
    smallTime time;
    u32 checksum;
};
struct bsRecordBigFile {
    bsRecordBigEntry records[while(!std::mem::eof())];
};
u32 size = sizeof(bsRecordBigEntry);
std::print(size);

bsRecordBigFile recordsFile @ 0x00;
