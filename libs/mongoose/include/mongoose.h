/*
 * Copyright (c) 2004-2013 Sergey Lyubka
 * Copyright (c) 2013-2020 Cesanta Software Limited
 * All rights reserved
 *
 * This software is dual-licensed: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation. For the terms of this
 * license, see <http://www.gnu.org/licenses/>.
 *
 * You are free to use this software under the terms of the GNU General
 * Public License, but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * Alternatively, you can license this software under a commercial
 * license, as set out in <https://www.cesanta.com/license>.
 */

#ifdef MG_MODULE_LINES
#line 1 "mongoose/src/mg_common.h"
#endif
#ifndef CS_MONGOOSE_SRC_COMMON_H_
#define CS_MONGOOSE_SRC_COMMON_H_

#define MG_VERSION "6.18"

#ifdef __cplusplus
extern "C" {
#endif


#define MG_ARCH_CUSTOM 0        // User creates its own mongoose_config.h
#define MG_ARCH_UNIX 1          // Linux, BSD, Mac, ...
#define MG_ARCH_WIN32 2         // Windows
#define MG_ARCH_ESP32 3         // ESP32
#define MG_ARCH_ESP8266 4       // ESP8266
#define MG_ARCH_FREERTOS 5      // FreeRTOS
#define MG_ARCH_AZURERTOS 6     // MS Azure RTOS
#define MG_ARCH_ZEPHYR 7        // Zephyr RTOS
#define MG_ARCH_NEWLIB 8        // Bare metal ARM
#define MG_ARCH_CMSIS_RTOS1 9   // CMSIS-RTOS API v1 (Keil RTX)
#define MG_ARCH_TIRTOS 10       // Texas Semi TI-RTOS
#define MG_ARCH_PICOSDK 11      // Raspberry Pi Pico-SDK (RP2040, RP2350)
#define MG_ARCH_ARMCC 12        // Keil MDK-Core with Configuration Wizard
#define MG_ARCH_CMSIS_RTOS2 13  // CMSIS-RTOS API v2 (Keil RTX5, FreeRTOS)
#define MG_ARCH_RTTHREAD 14     // RT-Thread RTOS
#define MG_ARCH_ARMCGT 15       // Texas Semi ARM-CGT

#if !defined(MG_ARCH)
#if defined(__unix__) || defined(__APPLE__)
#define MG_ARCH MG_ARCH_UNIX
#elif defined(_WIN32)
#define MG_ARCH MG_ARCH_WIN32
#endif
#endif  // !defined(MG_ARCH)

#if !defined(MG_ARCH) || (MG_ARCH == MG_ARCH_CUSTOM)
#include "mongoose_config.h"  // keep this include
#endif

#if !defined(MG_ARCH)
#error "MG_ARCH is not specified and we couldn't guess it. Define MG_ARCH=... in your compiler"
#endif

// http://esr.ibiblio.org/?p=5095
#define MG_BIG_ENDIAN (*(uint16_t *) "\0\xff" < 0x100)















#if MG_ARCH == MG_ARCH_ARMCGT

#include <ctype.h>
#include <errno.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <time.h>

#define MG_PATH_MAX 100
#define MG_ENABLE_SOCKET 0
#define MG_ENABLE_DIRLIST 0

#endif


#if MG_ARCH == MG_ARCH_AZURERTOS

#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <time.h>

#include <fx_api.h>
#include <tx_api.h>

#include <nx_api.h>
#include <nx_bsd.h>
#include <nx_port.h>
#include <tx_port.h>

#define PATH_MAX FX_MAXIMUM_PATH
#define MG_DIRSEP '\\'

#define socklen_t int
#define closesocket(x) soc_close(x)

#undef FOPEN_MAX

#endif


#if MG_ARCH == MG_ARCH_ESP32

#include <ctype.h>
#include <dirent.h>
#include <errno.h>
#include <fcntl.h>
#include <limits.h>
#include <netdb.h>
#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>

#include <esp_ota_ops.h>  // Use angle brackets to avoid
#include <esp_timer.h>    // amalgamation ditching them

#define MG_PATH_MAX 128

#endif


#if MG_ARCH == MG_ARCH_ESP8266

#include <ctype.h>

#ifdef _MSC_VER
#pragma comment(lib, "ws2_32.lib") /* Linking with winsock library */
#endif

#include <winsock2.h>
#include <ws2tcpip.h>
#include <windows.h>
#include <process.h>

#if defined(_MSC_VER) && (_MSC_VER < 1700)
typedef int bool;
#else
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/types.h>
#include <time.h>

#include <esp_system.h>

#define MG_PATH_MAX 128

#endif


#if MG_ARCH == MG_ARCH_FREERTOS

#include <ctype.h>
#if !defined(MG_ENABLE_LWIP) || !MG_ENABLE_LWIP
#include <errno.h>
#endif
#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>  // rand(), strtol(), atoi()
#include <string.h>
#if defined(__ARMCC_VERSION)
#define mode_t size_t
#include <alloca.h>
#include <time.h>
#elif defined(__CCRH__)
#else
#include <sys/stat.h>
#endif

#include <FreeRTOS.h>
#include <task.h>

#define calloc(a, b) mg_calloc(a, b)
#define free(a) vPortFree(a)
#define malloc(a) pvPortMalloc(a)
#define strdup(s) ((char *) mg_strdup(mg_str(s)).buf)

// Re-route calloc/free to the FreeRTOS's functions, don't use stdlib
static inline void *mg_calloc(size_t cnt, size_t size) {
  void *p = pvPortMalloc(cnt * size);
  if (p != NULL) memset(p, 0, size * cnt);
  return p;
}

#define mkdir(a, b) mg_mkdir(a, b)
static inline int mg_mkdir(const char *path, mode_t mode) {
  (void) path, (void) mode;
  return -1;
}

#endif  // MG_ARCH == MG_ARCH_FREERTOS


#if MG_ARCH == MG_ARCH_NEWLIB
#define _POSIX_TIMERS

#include <ctype.h>
#include <errno.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>

#define MG_PATH_MAX 100
#define MG_ENABLE_SOCKET 0
#define MG_ENABLE_DIRLIST 0

#endif


#if MG_ARCH == MG_ARCH_PICOSDK
#include <errno.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include <pico/stdlib.h>
#include <pico/rand.h>
int mkdir(const char *, mode_t);

#if MG_OTA == MG_OTA_PICOSDK
#include <hardware/flash.h>
#if PICO_RP2040
#include <pico/bootrom.h>
#endif
#endif

#endif


#if MG_ARCH == MG_ARCH_RTTHREAD

#include <rtthread.h>
#include <ctype.h>
#include <errno.h>
#include <fcntl.h>
#include <sys/socket.h>
#include <sys/select.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <time.h>

#ifndef MG_IO_SIZE
#define MG_IO_SIZE 1460
#endif

#endif // MG_ARCH == MG_ARCH_RTTHREAD


#if MG_ARCH == MG_ARCH_ARMCC || MG_ARCH == MG_ARCH_CMSIS_RTOS1 || \
    MG_ARCH == MG_ARCH_CMSIS_RTOS2

#include <ctype.h>
#include <errno.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <alloca.h>
#include <string.h>
#include <time.h>
#if MG_ARCH == MG_ARCH_CMSIS_RTOS1
#include "cmsis_os.h"  // keep this include
// https://developer.arm.com/documentation/ka003821/latest
extern uint32_t rt_time_get(void);
#elif MG_ARCH == MG_ARCH_CMSIS_RTOS2
#include "cmsis_os2.h"  // keep this include
#endif

#define strdup(s) ((char *) mg_strdup(mg_str(s)).buf)

#if defined(__ARMCC_VERSION)
#define mode_t size_t
#define mkdir(a, b) mg_mkdir(a, b)
static inline int mg_mkdir(const char *path, mode_t mode) {
  (void) path, (void) mode;
  return -1;
}
#endif

#if (MG_ARCH == MG_ARCH_CMSIS_RTOS1 || MG_ARCH == MG_ARCH_CMSIS_RTOS2) &&     \
    !defined MG_ENABLE_RL && (!defined(MG_ENABLE_LWIP) || !MG_ENABLE_LWIP) && \
    (!defined(MG_ENABLE_TCPIP) || !MG_ENABLE_TCPIP)
#define MG_ENABLE_RL 1
#ifndef MG_SOCK_LISTEN_BACKLOG_SIZE
#define MG_SOCK_LISTEN_BACKLOG_SIZE 3
#endif
#endif

#endif


#if MG_ARCH == MG_ARCH_TIRTOS

#include <stdlib.h>
#include <ctype.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

#include <serrno.h>
#include <sys/socket.h>

#include <ti/sysbios/knl/Clock.h>

#endif


#if MG_ARCH == MG_ARCH_UNIX

#define _DARWIN_UNLIMITED_SELECT 1  // No limit on file descriptors

#if defined(__APPLE__)
#include <mach/mach_time.h>
#endif

#if !defined(MG_ENABLE_EPOLL) && defined(__linux__)
#define MG_ENABLE_EPOLL 1
#elif !defined(MG_ENABLE_POLL)
#define MG_ENABLE_POLL 1
#endif

#include <arpa/inet.h>
#include <ctype.h>
#include <dirent.h>
#include <errno.h>
#include <fcntl.h>
#include <inttypes.h>
#include <limits.h>
#include <netdb.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <signal.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#if defined(MG_ENABLE_EPOLL) && MG_ENABLE_EPOLL
#include <sys/epoll.h>
#elif defined(MG_ENABLE_POLL) && MG_ENABLE_POLL
#include <poll.h>
#else
#include <sys/select.h>
#endif

#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>

#ifndef MG_ENABLE_DIRLIST
#define MG_ENABLE_DIRLIST 1
#endif
#endif

/*
 * osx correctly avoids defining strtoll when compiling in strict ansi mode.
 * c++ 11 standard defines strtoll as well.
 * We require strtoll, and if your embedded pre-c99 compiler lacks one, please
 * implement a shim.
 */
#if !(defined(__cplusplus) && __cplusplus >= 201103L) && \
    !(defined(__DARWIN_C_LEVEL) && __DARWIN_C_LEVEL >= 200809L)
long long strtoll(const char *, char **, int);
#endif

typedef int sock_t;
#define INVALID_SOCKET (-1)
#define SIZE_T_FMT "zu"
typedef struct stat cs_stat_t;
#define DIRSEP '/'
#define to64(x) strtoll(x, NULL, 10)
#define INT64_FMT PRId64
#define INT64_X_FMT PRIx64

#ifndef __cdecl
#define __cdecl
#endif

#ifndef va_copy
#ifdef __va_copy
#define va_copy __va_copy
#else
#define va_copy(x, y) (x) = (y)
#endif
#endif

#define closesocket(x) close(x)

#ifndef MG_MAX_HTTP_REQUEST_SIZE
#define MG_MAX_HTTP_REQUEST_SIZE 8192
#endif

#ifndef MG_MAX_HTTP_SEND_MBUF
#define MG_MAX_HTTP_SEND_MBUF 4096
#endif

#ifndef MG_MAX_HTTP_HEADERS
#define MG_MAX_HTTP_HEADERS 40
#endif

#ifndef CS_ENABLE_STDIO
#define CS_ENABLE_STDIO 1
#endif

#ifndef MG_ENABLE_BROADCAST
#define MG_ENABLE_BROADCAST 1
#endif

#ifndef MG_ENABLE_DIRECTORY_LISTING
#define MG_ENABLE_DIRECTORY_LISTING 1
#endif

#ifndef MG_ENABLE_FILESYSTEM
#define MG_ENABLE_FILESYSTEM 1
#endif

#ifndef MG_ENABLE_HTTP_CGI
#define MG_ENABLE_HTTP_CGI MG_ENABLE_FILESYSTEM
#endif

#ifndef MG_NET_IF
#define MG_NET_IF MG_NET_IF_SOCKET
#endif

#ifndef MG_HOSTS_FILE_NAME
#define MG_HOSTS_FILE_NAME "/etc/hosts"
#endif

#ifndef MG_RESOLV_CONF_FILE_NAME
#define MG_RESOLV_CONF_FILE_NAME "/etc/resolv.conf"
#endif

#endif /* CS_PLATFORM == CS_P_UNIX */
#endif /* CS_COMMON_PLATFORMS_PLATFORM_UNIX_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/platforms/platform_esp32.h"
#endif

#ifndef CS_COMMON_PLATFORMS_PLATFORM_ESP32_H_
#define CS_COMMON_PLATFORMS_PLATFORM_ESP32_H_
#if CS_PLATFORM == CS_P_ESP32

#include <assert.h>
#include <ctype.h>
#include <dirent.h>
#include <fcntl.h>
#include <inttypes.h>
#include <machine/endian.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/time.h>

#define SIZE_T_FMT "u"
typedef struct stat cs_stat_t;
#define DIRSEP '/'
#define to64(x) strtoll(x, NULL, 10)
#define INT64_FMT PRId64
#define INT64_X_FMT PRIx64
#define __cdecl
#define _FILE_OFFSET_BITS 32

#define MG_LWIP 1

#ifndef MG_NET_IF
#define MG_NET_IF MG_NET_IF_SOCKET
#endif

#ifndef CS_ENABLE_STDIO
#define CS_ENABLE_STDIO 1
#endif

#endif /* CS_PLATFORM == CS_P_ESP32 */
#endif /* CS_COMMON_PLATFORMS_PLATFORM_ESP32_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/platforms/platform_esp8266.h"
#endif

#ifndef CS_COMMON_PLATFORMS_PLATFORM_ESP8266_H_
#define CS_COMMON_PLATFORMS_PLATFORM_ESP8266_H_
#if CS_PLATFORM == CS_P_ESP8266

#include <assert.h>
#include <ctype.h>
#include <fcntl.h>
#include <inttypes.h>
#include <machine/endian.h>
#include <stdbool.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/time.h>

#define SIZE_T_FMT "u"
typedef struct stat cs_stat_t;
#define DIRSEP '/'
#if !defined(MGOS_VFS_DEFINE_DIRENT)
#define CS_DEFINE_DIRENT
#endif

#define to64(x) strtoll(x, NULL, 10)
#define INT64_FMT PRId64
#define INT64_X_FMT PRIx64
#define __cdecl
#define _FILE_OFFSET_BITS 32

#define MG_LWIP 1

/* struct timeval is defined in sys/time.h. */
#define LWIP_TIMEVAL_PRIVATE 0

#ifndef MG_NET_IF
#include <lwip/opt.h>
#if LWIP_SOCKET /* RTOS SDK has LWIP sockets */
#define MG_NET_IF MG_NET_IF_SOCKET
#else
#define MG_NET_IF MG_NET_IF_LWIP_LOW_LEVEL
#endif
#endif

#ifndef CS_ENABLE_STDIO
#define CS_ENABLE_STDIO 1
#endif

#define inet_ntop(af, src, dst, size)                                          \
  (((af) == AF_INET) ? ipaddr_ntoa_r((const ip_addr_t *) (src), (dst), (size)) \
                     : NULL)
#define inet_pton(af, src, dst) \
  (((af) == AF_INET) ? ipaddr_aton((src), (ip_addr_t *) (dst)) : 0)

#endif /* CS_PLATFORM == CS_P_ESP8266 */
#endif /* CS_COMMON_PLATFORMS_PLATFORM_ESP8266_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/platforms/platform_cc3100.h"
#endif

#ifndef CS_COMMON_PLATFORMS_PLATFORM_CC3100_H_
#define CS_COMMON_PLATFORMS_PLATFORM_CC3100_H_
#if CS_PLATFORM == CS_P_CC3100

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <inttypes.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

#define MG_NET_IF MG_NET_IF_SIMPLELINK
#define MG_SSL_IF MG_SSL_IF_SIMPLELINK

/*
 * CC3100 SDK and STM32 SDK include headers w/out path, just like
 * #include "simplelink.h". As result, we have to add all required directories
 * into Makefile IPATH and do the same thing (include w/out path)
 */

#include <simplelink.h>
#include <netapp.h>
#undef timeval

typedef int sock_t;
#define INVALID_SOCKET (-1)

#define to64(x) strtoll(x, NULL, 10)
#define INT64_FMT PRId64
#define INT64_X_FMT PRIx64
#define SIZE_T_FMT "u"

#define SOMAXCONN 8

const char *inet_ntop(int af, const void *src, char *dst, socklen_t size);
char *inet_ntoa(struct in_addr in);
int inet_pton(int af, const char *src, void *dst);

#endif /* CS_PLATFORM == CS_P_CC3100 */
#endif /* CS_COMMON_PLATFORMS_PLATFORM_CC3100_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/platforms/platform_cc3200.h"
#endif

#ifndef CS_COMMON_PLATFORMS_PLATFORM_CC3200_H_
#define CS_COMMON_PLATFORMS_PLATFORM_CC3200_H_
#if CS_PLATFORM == CS_P_CC3200

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

#ifndef __TI_COMPILER_VERSION__
#include <fcntl.h>
#include <sys/time.h>
#endif

#define MG_NET_IF MG_NET_IF_SIMPLELINK
#define MG_SSL_IF MG_SSL_IF_SIMPLELINK

/* Only SPIFFS supports directories, SLFS does not. */
#if defined(CC3200_FS_SPIFFS) && !defined(MG_ENABLE_DIRECTORY_LISTING)
#define MG_ENABLE_DIRECTORY_LISTING 1
#endif

/* Amalgamated: #include "common/platforms/simplelink/cs_simplelink.h" */

typedef int sock_t;
#define INVALID_SOCKET (-1)
#define SIZE_T_FMT "u"
typedef struct stat cs_stat_t;
#define DIRSEP '/'
#define to64(x) strtoll(x, NULL, 10)
#define INT64_FMT PRId64
#define INT64_X_FMT PRIx64
#define __cdecl

#define fileno(x) -1

/* Some functions we implement for Mongoose. */

#ifdef __cplusplus
extern "C" {
#endif

#ifdef __TI_COMPILER_VERSION__
struct SlTimeval_t;
#define timeval SlTimeval_t
int gettimeofday(struct timeval *t, void *tz);
int settimeofday(const struct timeval *tv, const void *tz);

int asprintf(char **strp, const char *fmt, ...);

#endif

/* TI's libc does not have stat & friends, add them. */
#ifdef __TI_COMPILER_VERSION__

#include <file.h>

typedef unsigned int mode_t;
typedef size_t _off_t;
typedef long ssize_t;

struct stat {
  int st_ino;
  mode_t st_mode;
  int st_nlink;
  time_t st_mtime;
  off_t st_size;
};

int _stat(const char *pathname, struct stat *st);
int stat(const char *pathname, struct stat *st);

#define __S_IFMT 0170000

#define __S_IFDIR 0040000
#define __S_IFCHR 0020000
#define __S_IFREG 0100000

#define __S_ISTYPE(mode, mask) (((mode) &__S_IFMT) == (mask))

#define S_IFDIR __S_IFDIR
#define S_IFCHR __S_IFCHR
#define S_IFREG __S_IFREG
#define S_ISDIR(mode) __S_ISTYPE((mode), __S_IFDIR)
#define S_ISREG(mode) __S_ISTYPE((mode), __S_IFREG)

/* 5.x series compilers don't have va_copy, 16.x do. */
#if __TI_COMPILER_VERSION__ < 16000000
#define va_copy(apc, ap) ((apc) = (ap))
#endif

#endif /* __TI_COMPILER_VERSION__ */

#ifdef CC3200_FS_SLFS
#define MG_FS_SLFS
#endif

#if (defined(CC3200_FS_SPIFFS) || defined(CC3200_FS_SLFS)) && \
    !defined(MG_ENABLE_FILESYSTEM)
#define MG_ENABLE_FILESYSTEM 1
#define CS_DEFINE_DIRENT
#endif

#ifndef CS_ENABLE_STDIO
#define CS_ENABLE_STDIO 1
#endif

#ifdef __cplusplus
}
#endif

#endif /* CS_PLATFORM == CS_P_CC3200 */
#endif /* CS_COMMON_PLATFORMS_PLATFORM_CC3200_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/platforms/platform_cc3220.h"
#endif

#ifndef CS_COMMON_PLATFORMS_PLATFORM_CC3220_H_
#define CS_COMMON_PLATFORMS_PLATFORM_CC3220_H_
#if CS_PLATFORM == CS_P_CC3220

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

#ifndef __TI_COMPILER_VERSION__
#include <fcntl.h>
#include <sys/time.h>
#endif

#define MG_NET_IF MG_NET_IF_SIMPLELINK
#ifndef MG_SSL_IF
#define MG_SSL_IF MG_SSL_IF_SIMPLELINK
#endif

/* Only SPIFFS supports directories, SLFS does not. */
#if defined(CC3220_FS_SPIFFS) && !defined(MG_ENABLE_DIRECTORY_LISTING)
#define MG_ENABLE_DIRECTORY_LISTING 1
#endif

/* Amalgamated: #include "common/platforms/simplelink/cs_simplelink.h" */

typedef int sock_t;
#define INVALID_SOCKET (-1)
#define SIZE_T_FMT "u"
typedef struct stat cs_stat_t;
#define DIRSEP '/'
#define to64(x) strtoll(x, NULL, 10)
#define INT64_FMT PRId64
#define INT64_X_FMT PRIx64
#define __cdecl

#define fileno(x) -1

/* Some functions we implement for Mongoose. */

#ifdef __cplusplus
extern "C" {
#endif

#ifdef __TI_COMPILER_VERSION__
struct SlTimeval_t;
#define timeval SlTimeval_t
int gettimeofday(struct timeval *t, void *tz);
int settimeofday(const struct timeval *tv, const void *tz);

int asprintf(char **strp, const char *fmt, ...);

#endif

/* TI's libc does not have stat & friends, add them. */
#ifdef __TI_COMPILER_VERSION__

#include <file.h>

typedef unsigned int mode_t;
typedef size_t _off_t;
typedef long ssize_t;

struct stat {
  int st_ino;
  mode_t st_mode;
  int st_nlink;
  time_t st_mtime;
  off_t st_size;
};

int _stat(const char *pathname, struct stat *st);
int stat(const char *pathname, struct stat *st);

#define __S_IFMT 0170000

#define __S_IFDIR 0040000
#define __S_IFCHR 0020000
#define __S_IFREG 0100000

#define __S_ISTYPE(mode, mask) (((mode) &__S_IFMT) == (mask))

#define S_IFDIR __S_IFDIR
#define S_IFCHR __S_IFCHR
#define S_IFREG __S_IFREG
#define S_ISDIR(mode) __S_ISTYPE((mode), __S_IFDIR)
#define S_ISREG(mode) __S_ISTYPE((mode), __S_IFREG)

#endif /* __TI_COMPILER_VERSION__ */

#ifndef CS_ENABLE_STDIO
#define CS_ENABLE_STDIO 1
#endif

#ifdef __cplusplus
}
#endif

#endif /* CS_PLATFORM == CS_P_CC3220 */
#endif /* CS_COMMON_PLATFORMS_PLATFORM_CC3200_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/platforms/platform_msp432.h"
#endif

#ifndef CS_COMMON_PLATFORMS_PLATFORM_MSP432_H_
#define CS_COMMON_PLATFORMS_PLATFORM_MSP432_H_
#if CS_PLATFORM == CS_P_MSP432

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <inttypes.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

#ifndef __TI_COMPILER_VERSION__
#include <fcntl.h>
#include <sys/time.h>
#endif

#define MG_NET_IF MG_NET_IF_SIMPLELINK
#define MG_SSL_IF MG_SSL_IF_SIMPLELINK

/* Amalgamated: #include "common/platforms/simplelink/cs_simplelink.h" */

typedef int sock_t;
#define INVALID_SOCKET (-1)
#define SIZE_T_FMT "u"
typedef struct stat cs_stat_t;
#define DIRSEP '/'
#define to64(x) strtoll(x, NULL, 10)
#define INT64_FMT PRId64
#define INT64_X_FMT PRIx64
#define __cdecl

#define fileno(x) -1

/* Some functions we implement for Mongoose. */

#ifdef __cplusplus
extern "C" {
#endif

#ifdef __TI_COMPILER_VERSION__
struct SlTimeval_t;
#define timeval SlTimeval_t
int gettimeofday(struct timeval *t, void *tz);
#endif

/* TI's libc does not have stat & friends, add them. */
#ifdef __TI_COMPILER_VERSION__

#include <file.h>

typedef unsigned int mode_t;
typedef size_t _off_t;
typedef long ssize_t;

struct stat {
  int st_ino;
  mode_t st_mode;
  int st_nlink;
  time_t st_mtime;
  off_t st_size;
};

int _stat(const char *pathname, struct stat *st);
#define stat(a, b) _stat(a, b)

#define __S_IFMT 0170000

#define __S_IFDIR 0040000
#define __S_IFCHR 0020000
#define __S_IFREG 0100000

#define __S_ISTYPE(mode, mask) (((mode) &__S_IFMT) == (mask))

#define S_IFDIR __S_IFDIR
#define S_IFCHR __S_IFCHR
#define S_IFREG __S_IFREG
#define S_ISDIR(mode) __S_ISTYPE((mode), __S_IFDIR)
#define S_ISREG(mode) __S_ISTYPE((mode), __S_IFREG)

/* As of 5.2.7, TI compiler does not support va_copy() yet. */
#define va_copy(apc, ap) ((apc) = (ap))

#endif /* __TI_COMPILER_VERSION__ */

#ifndef CS_ENABLE_STDIO
#define CS_ENABLE_STDIO 1
#endif

#ifndef MG_ENABLE_POSIX_FS
#define MG_ENABLE_POSIX_FS 1
#endif

#ifndef MG_IO_SIZE
#define MG_IO_SIZE 16384
#endif

#endif


#if MG_ARCH == MG_ARCH_WIN32

#ifndef _CRT_RAND_S
#define _CRT_RAND_S
#endif

#define SIZE_T_FMT "u"
typedef struct stat cs_stat_t;
#define DIRSEP '/'
#define to64(x) strtoll(x, NULL, 10)
#define INT64_FMT PRId64
#define INT64_X_FMT PRIx64
#define __cdecl

#ifndef MG_NET_IF
#include <lwip/opt.h>
#if LWIP_SOCKET
#define MG_NET_IF MG_NET_IF_SOCKET
#else
#define MG_NET_IF MG_NET_IF_LWIP_LOW_LEVEL
#endif
#define MG_LWIP 1
#elif MG_NET_IF == MG_NET_IF_SIMPLELINK
/* Amalgamated: #include "common/platforms/simplelink/cs_simplelink.h" */
#endif

#ifndef CS_ENABLE_STDIO
#define CS_ENABLE_STDIO 1
#endif

#ifdef __TI_COMPILER_VERSION__
/* As of 5.2.8, TI compiler does not support va_copy() yet. */
#define va_copy(apc, ap) ((apc) = (ap))
#endif /* __TI_COMPILER_VERSION__ */

#ifdef __cplusplus
}
#endif

#endif /* CS_PLATFORM == CS_P_TM4C129 */
#endif /* CS_COMMON_PLATFORMS_PLATFORM_TM4C129_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/platforms/platform_mbed.h"
#endif

#ifndef CS_COMMON_PLATFORMS_PLATFORM_MBED_H_
#define CS_COMMON_PLATFORMS_PLATFORM_MBED_H_
#if CS_PLATFORM == CS_P_MBED

/*
 * mbed.h contains C++ code (e.g. templates), thus, it should be processed
 * only if included directly to startup file (ex: main.cpp)
 */
#ifdef __cplusplus
/* Amalgamated: #include "mbed.h" */
#endif /* __cplusplus */

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <inttypes.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include <stdio.h>

typedef struct stat cs_stat_t;
#define DIRSEP '/'

#ifndef CS_ENABLE_STDIO
#define CS_ENABLE_STDIO 1
#endif

/*
 * mbed can be compiled with the ARM compiler which
 * just doesn't come with a gettimeofday shim
 * because it's a BSD API and ARM targets embedded
 * non-unix platforms.
 */
#if defined(__ARMCC_VERSION) || defined(__ICCARM__)
#define _TIMEVAL_DEFINED
#define gettimeofday _gettimeofday

/* copied from GCC on ARM; for some reason useconds are signed */
typedef long suseconds_t; /* microseconds (signed) */
struct timeval {
  time_t tv_sec;       /* seconds */
  suseconds_t tv_usec; /* and microseconds */
};

#endif

#if MG_NET_IF == MG_NET_IF_SIMPLELINK

#define MG_SIMPLELINK_NO_OSI 1

#include <simplelink.h>

typedef int sock_t;
#define INVALID_SOCKET (-1)

#define to64(x) strtoll(x, NULL, 10)
#define INT64_FMT PRId64
#define INT64_X_FMT PRIx64
#define SIZE_T_FMT "u"

#define SOMAXCONN 8

const char *inet_ntop(int af, const void *src, char *dst, socklen_t size);
char *inet_ntoa(struct in_addr in);
int inet_pton(int af, const char *src, void *dst);
int inet_aton(const char *cp, struct in_addr *inp);
in_addr_t inet_addr(const char *cp);

#endif /* MG_NET_IF == MG_NET_IF_SIMPLELINK */

#endif /* CS_PLATFORM == CS_P_MBED */
#endif /* CS_COMMON_PLATFORMS_PLATFORM_MBED_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/platforms/platform_nrf51.h"
#endif
#ifndef CS_COMMON_PLATFORMS_PLATFORM_NRF51_H_
#define CS_COMMON_PLATFORMS_PLATFORM_NRF51_H_
#if CS_PLATFORM == CS_P_NRF51

#include <assert.h>
#include <ctype.h>
#include <inttypes.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

#define to64(x) strtoll(x, NULL, 10)

#define MG_NET_IF MG_NET_IF_LWIP_LOW_LEVEL
#define MG_LWIP 1
#define MG_ENABLE_IPV6 1

/*
 * For ARM C Compiler, make lwip to export `struct timeval`; for other
 * compilers, suppress it.
 */
#if !defined(__ARMCC_VERSION)
#define LWIP_TIMEVAL_PRIVATE 0
#else
struct timeval;
int gettimeofday(struct timeval *tp, void *tzp);
#endif

#define INT64_FMT PRId64
#define SIZE_T_FMT "u"

/*
 * ARM C Compiler doesn't have strdup, so we provide it
 */
#define CS_ENABLE_STRDUP defined(__ARMCC_VERSION)

#endif /* CS_PLATFORM == CS_P_NRF51 */
#endif /* CS_COMMON_PLATFORMS_PLATFORM_NRF51_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/platforms/platform_nrf52.h"
#endif
#ifndef CS_COMMON_PLATFORMS_PLATFORM_NRF52_H_
#define CS_COMMON_PLATFORMS_PLATFORM_NRF52_H_
#if CS_PLATFORM == CS_P_NRF52

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <time.h>

#define to64(x) strtoll(x, NULL, 10)

#define MG_NET_IF MG_NET_IF_LWIP_LOW_LEVEL
#define MG_LWIP 1
#define MG_ENABLE_IPV6 1

#if !defined(ENOSPC)
#define ENOSPC 28 /* No space left on device */
#endif

/*
 * For ARM C Compiler, make lwip to export `struct timeval`; for other
 * compilers, suppress it.
 */
#if !defined(__ARMCC_VERSION)
#define LWIP_TIMEVAL_PRIVATE 0
#endif

#define INT64_FMT PRId64
#define SIZE_T_FMT "u"

/*
 * ARM C Compiler doesn't have strdup, so we provide it
 */
#define CS_ENABLE_STRDUP defined(__ARMCC_VERSION)

#endif /* CS_PLATFORM == CS_P_NRF52 */
#endif /* CS_COMMON_PLATFORMS_PLATFORM_NRF52_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/platforms/simplelink/cs_simplelink.h"
#endif

#ifndef CS_COMMON_PLATFORMS_SIMPLELINK_CS_SIMPLELINK_H_
#define CS_COMMON_PLATFORMS_SIMPLELINK_CS_SIMPLELINK_H_

#if defined(MG_NET_IF) && MG_NET_IF == MG_NET_IF_SIMPLELINK

/* If simplelink.h is already included, all bets are off. */
#if !defined(__SIMPLELINK_H__)

#include <stdbool.h>

#ifndef __TI_COMPILER_VERSION__
#undef __CONCAT
#undef FD_CLR
#undef FD_ISSET
#undef FD_SET
#undef FD_SETSIZE
#undef FD_ZERO
#undef fd_set
#endif

#if CS_PLATFORM == CS_P_CC3220
#include <ti/drivers/net/wifi/porting/user.h>
#include <ti/drivers/net/wifi/simplelink.h>
#include <ti/drivers/net/wifi/sl_socket.h>
#include <ti/drivers/net/wifi/netapp.h>
#else
/* We want to disable SL_INC_STD_BSD_API_NAMING, so we include user.h ourselves
 * and undef it. */
#define PROVISIONING_API_H_
#include <simplelink/user.h>
#undef PROVISIONING_API_H_
#undef SL_INC_STD_BSD_API_NAMING

#include <simplelink/include/simplelink.h>
#include <simplelink/include/netapp.h>
#endif /* CS_PLATFORM == CS_P_CC3220 */

/* Now define only the subset of the BSD API that we use.
 * Notably, close(), read() and write() are not defined. */
#define AF_INET SL_AF_INET

#define socklen_t SlSocklen_t
#define sockaddr SlSockAddr_t
#define sockaddr_in SlSockAddrIn_t
#define in_addr SlInAddr_t

#define SOCK_STREAM SL_SOCK_STREAM
#define SOCK_DGRAM SL_SOCK_DGRAM

#define htonl sl_Htonl
#define ntohl sl_Ntohl
#define htons sl_Htons
#define ntohs sl_Ntohs

#ifndef EACCES
#define EACCES SL_EACCES
#endif
#ifndef EAFNOSUPPORT
#define EAFNOSUPPORT SL_EAFNOSUPPORT
#endif
#ifndef EAGAIN
#define EAGAIN SL_EAGAIN
#endif
#ifndef EBADF
#define EBADF SL_EBADF
#endif
#ifndef EINVAL
#define EINVAL SL_EINVAL
#endif
#ifndef ENOMEM
#define ENOMEM SL_ENOMEM
#endif
#ifndef EWOULDBLOCK
#define EWOULDBLOCK SL_EWOULDBLOCK
#endif

#define SOMAXCONN 8

#ifdef __cplusplus
extern "C" {
#endif

const char *inet_ntop(int af, const void *src, char *dst, socklen_t size);
char *inet_ntoa(struct in_addr in);
int inet_pton(int af, const char *src, void *dst);

struct mg_mgr;
struct mg_connection;

typedef void (*mg_init_cb)(struct mg_mgr *mgr);
bool mg_start_task(int priority, int stack_size, mg_init_cb mg_init);

void mg_run_in_task(void (*cb)(struct mg_mgr *mgr, void *arg), void *cb_arg);

int sl_fs_init(void);

void sl_restart_cb(struct mg_mgr *mgr);

int sl_set_ssl_opts(int sock, struct mg_connection *nc);

#ifdef __cplusplus
}
#endif

#endif /* !defined(__SIMPLELINK_H__) */

/* Compatibility with older versions of SimpleLink */
#if SL_MAJOR_VERSION_NUM < 2

#define SL_ERROR_BSD_EAGAIN SL_EAGAIN
#define SL_ERROR_BSD_EALREADY SL_EALREADY
#define SL_ERROR_BSD_ENOPROTOOPT SL_ENOPROTOOPT
#define SL_ERROR_BSD_ESECDATEERROR SL_ESECDATEERROR
#define SL_ERROR_BSD_ESECSNOVERIFY SL_ESECSNOVERIFY
#define SL_ERROR_FS_FAILED_TO_ALLOCATE_MEM SL_FS_ERR_FAILED_TO_ALLOCATE_MEM
#define SL_ERROR_FS_FILE_HAS_NOT_BEEN_CLOSE_CORRECTLY \
  SL_FS_FILE_HAS_NOT_BEEN_CLOSE_CORRECTLY
#define SL_ERROR_FS_FILE_NAME_EXIST SL_FS_FILE_NAME_EXIST
#define SL_ERROR_FS_FILE_NOT_EXISTS SL_FS_ERR_FILE_NOT_EXISTS
#define SL_ERROR_FS_NO_AVAILABLE_NV_INDEX SL_FS_ERR_NO_AVAILABLE_NV_INDEX
#define SL_ERROR_FS_NOT_ENOUGH_STORAGE_SPACE SL_FS_ERR_NO_AVAILABLE_BLOCKS
#define SL_ERROR_FS_NOT_SUPPORTED SL_FS_ERR_NOT_SUPPORTED
#define SL_ERROR_FS_WRONG_FILE_NAME SL_FS_WRONG_FILE_NAME
#define SL_ERROR_FS_INVALID_HANDLE SL_FS_ERR_INVALID_HANDLE
#define SL_NETCFG_MAC_ADDRESS_GET SL_MAC_ADDRESS_GET
#define SL_SOCKET_FD_ZERO SL_FD_ZERO
#define SL_SOCKET_FD_SET SL_FD_SET
#define SL_SOCKET_FD_ISSET SL_FD_ISSET
#define SL_SO_SECURE_DOMAIN_NAME_VERIFICATION SO_SECURE_DOMAIN_NAME_VERIFICATION

#define SL_FS_READ FS_MODE_OPEN_READ
#define SL_FS_WRITE FS_MODE_OPEN_WRITE

#define SL_FI_FILE_SIZE(fi) ((fi).FileLen)
#define SL_FI_FILE_MAX_SIZE(fi) ((fi).AllocatedLen)

#define SlDeviceVersion_t SlVersionFull
#define sl_DeviceGet sl_DevGet
#define SL_DEVICE_GENERAL SL_DEVICE_GENERAL_CONFIGURATION
#define SL_LEN_TYPE _u8
#define SL_OPT_TYPE _u8

#else /* SL_MAJOR_VERSION_NUM >= 2 */

#define FS_MODE_OPEN_CREATE(max_size, flag) \
  (SL_FS_CREATE | SL_FS_CREATE_MAX_SIZE(max_size))
#define SL_FI_FILE_SIZE(fi) ((fi).Len)
#define SL_FI_FILE_MAX_SIZE(fi) ((fi).MaxSize)

#define SL_LEN_TYPE _u16
#define SL_OPT_TYPE _u16

#endif /* SL_MAJOR_VERSION_NUM < 2 */

int slfs_open(const unsigned char *fname, uint32_t flags, uint32_t *token);

#endif /* MG_NET_IF == MG_NET_IF_SIMPLELINK */

#endif /* CS_COMMON_PLATFORMS_SIMPLELINK_CS_SIMPLELINK_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/platforms/platform_wince.h"
#endif
#ifndef CS_COMMON_PLATFORMS_PLATFORM_WINCE_H_
#define CS_COMMON_PLATFORMS_PLATFORM_WINCE_H_

#if CS_PLATFORM == CS_P_WINCE

/*
 * MSVC++ 14.0 _MSC_VER == 1900 (Visual Studio 2015)
 * MSVC++ 12.0 _MSC_VER == 1800 (Visual Studio 2013)
 * MSVC++ 11.0 _MSC_VER == 1700 (Visual Studio 2012)
 * MSVC++ 10.0 _MSC_VER == 1600 (Visual Studio 2010)
 * MSVC++ 9.0  _MSC_VER == 1500 (Visual Studio 2008)
 * MSVC++ 8.0  _MSC_VER == 1400 (Visual Studio 2005)
 * MSVC++ 7.1  _MSC_VER == 1310 (Visual Studio 2003)
 * MSVC++ 7.0  _MSC_VER == 1300
 * MSVC++ 6.0  _MSC_VER == 1200
 * MSVC++ 5.0  _MSC_VER == 1100
 */
#pragma warning(disable : 4127) /* FD_SET() emits warning, disable it */
#pragma warning(disable : 4204) /* missing c99 support */

#ifndef _WINSOCK_DEPRECATED_NO_WARNINGS
#define _WINSOCK_DEPRECATED_NO_WARNINGS 1
#endif

#ifndef _CRT_SECURE_NO_WARNINGS
#define _CRT_SECURE_NO_WARNINGS
#endif

#ifndef _WINSOCK_DEPRECATED_NO_WARNINGS
#define _WINSOCK_DEPRECATED_NO_WARNINGS
#endif

#include <ctype.h>
#include <direct.h>
#include <errno.h>
#include <fcntl.h>
#include <limits.h>
#include <signal.h>
#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>

#if defined(_MSC_VER) && _MSC_VER < 1700
#define __func__ ""
typedef __int64 int64_t;
typedef unsigned __int64 uint64_t;
typedef unsigned char uint8_t;
typedef char int8_t;
typedef unsigned short uint16_t;
typedef short int16_t;
typedef unsigned int uint32_t;
typedef int int32_t;
typedef enum { false = 0, true = 1 } bool;
#else
#include <stdbool.h>
#include <stdint.h>
#include <ws2tcpip.h>
#endif

#include <process.h>
#include <winerror.h>
#include <winsock2.h>

// For mg_random()
#if defined(_MSC_VER) && _MSC_VER < 1700
#ifndef _WIN32_WINNT
#define _WIN32_WINNT 0x400  // Let vc98 pick up wincrypt.h
#endif
#include <wincrypt.h>
#pragma comment(lib, "advapi32.lib")
#endif

// Protect from calls like std::snprintf in app code
// See https://github.com/cesanta/mongoose/issues/1047
#ifndef __cplusplus
#define snprintf _snprintf
#define vsnprintf _vsnprintf
#ifndef strdup  // For MSVC with _DEBUG, see #1359
#define strdup(x) _strdup(x)
#endif
#endif

#define MG_INVALID_SOCKET INVALID_SOCKET
#define MG_SOCKET_TYPE SOCKET
typedef unsigned long nfds_t;
#if defined(_MSC_VER)
#pragma comment(lib, "ws2_32.lib")
#ifndef alloca
#define alloca(a) _alloca(a)
#endif
#endif
#define poll(a, b, c) WSAPoll((a), (b), (c))
#define closesocket(x) closesocket(x)

typedef int socklen_t;
#define MG_DIRSEP '\\'

#ifndef MG_PATH_MAX
#define MG_PATH_MAX FILENAME_MAX
#endif

#ifndef SO_EXCLUSIVEADDRUSE
#define SO_EXCLUSIVEADDRUSE ((int) (~SO_REUSEADDR))
#endif

#define MG_SOCK_ERR(errcode) ((errcode) < 0 ? WSAGetLastError() : 0)

#define MG_SOCK_PENDING(errcode)                                            \
  (((errcode) < 0) &&                                                       \
   (WSAGetLastError() == WSAEINTR || WSAGetLastError() == WSAEINPROGRESS || \
    WSAGetLastError() == WSAEWOULDBLOCK))

#define MG_SOCK_RESET(errcode) \
  (((errcode) < 0) && (WSAGetLastError() == WSAECONNRESET))

#define realpath(a, b) _fullpath((b), (a), MG_PATH_MAX)
#define sleep(x) Sleep((x) * 1000)
#define mkdir(a, b) _mkdir(a)
#define timegm(x) _mkgmtime(x)

#ifndef S_ISDIR
#define S_ISDIR(x) (((x) & _S_IFMT) == _S_IFDIR)
#endif

#ifndef MG_ENABLE_DIRLIST
#define MG_ENABLE_DIRLIST 1
#endif

#ifndef SIGPIPE
#define SIGPIPE 0
#endif

#ifndef MG_ENABLE_POSIX_FS
#define MG_ENABLE_POSIX_FS 1
#endif

#ifndef MG_IO_SIZE
#define MG_IO_SIZE 16384
#endif

#endif

#endif /* CS_PLATFORM == CS_P_NXP_LPC */
#endif /* CS_COMMON_PLATFORMS_PLATFORM_NXP_LPC_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/platforms/platform_nxp_kinetis.h"
#endif

#if MG_ARCH == MG_ARCH_ZEPHYR

#if CS_PLATFORM == CS_P_NXP_KINETIS

#include <ctype.h>
#include <inttypes.h>
#include <string.h>
#include <sys/time.h>

#define SIZE_T_FMT "u"
typedef struct stat cs_stat_t;
#define to64(x) strtoll(x, NULL, 10)
#define INT64_FMT "lld"
#define INT64_X_FMT "llx"
#define __cdecl

#define MG_LWIP 1

#define MG_NET_IF MG_NET_IF_LWIP_LOW_LEVEL

/* struct timeval is defined in sys/time.h. */
#define LWIP_TIMEVAL_PRIVATE 0

#endif /* CS_PLATFORM == CS_P_NXP_KINETIS */
#endif /* CS_COMMON_PLATFORMS_PLATFORM_NXP_KINETIS_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/platforms/platform_pic32.h"
#endif

#ifndef CS_COMMON_PLATFORMS_PLATFORM_PIC32_H_
#define CS_COMMON_PLATFORMS_PLATFORM_PIC32_H_

#if CS_PLATFORM == CS_P_PIC32

#define MG_NET_IF MG_NET_IF_PIC32

#include <stdint.h>
#include <time.h>
#include <ctype.h>
#include <stdlib.h>

#include <system_config.h>
#include <system_definitions.h>

#include <sys/types.h>

typedef TCP_SOCKET sock_t;
#define to64(x) strtoll(x, NULL, 10)

#define SIZE_T_FMT "lu"
#define INT64_FMT "lld"

#ifndef CS_ENABLE_STDIO
#define CS_ENABLE_STDIO 1
#endif

char *inet_ntoa(struct in_addr in);

#endif /* CS_PLATFORM == CS_P_PIC32 */

#endif /* CS_COMMON_PLATFORMS_PLATFORM_PIC32_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/platforms/platform_rs14100.h"
#endif

#ifndef CS_COMMON_PLATFORMS_PLATFORM_RS14100_H_
#define CS_COMMON_PLATFORMS_PLATFORM_RS14100_H_
#if CS_PLATFORM == CS_P_RS14100

#include <ctype.h>
#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>

#ifdef MGOS_HAVE_VFS_COMMON
#include <mgos_vfs.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

#define to64(x) strtoll(x, NULL, 10)
#define INT64_FMT "lld"
#define SIZE_T_FMT "u"
typedef struct stat cs_stat_t;
#define DIRSEP '/'

#ifndef CS_ENABLE_STDIO
#define CS_ENABLE_STDIO 1
#endif

#ifndef MG_ENABLE_FILESYSTEM
#define MG_ENABLE_FILESYSTEM 1
#endif

#ifdef __cplusplus
}
#endif

#endif /* CS_PLATFORM == CS_P_RS14100 */
#endif /* CS_COMMON_PLATFORMS_PLATFORM_RS14100_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/platforms/platform_stm32.h"
#endif

#ifndef CS_COMMON_PLATFORMS_PLATFORM_STM32_H_
#define CS_COMMON_PLATFORMS_PLATFORM_STM32_H_
#if CS_PLATFORM == CS_P_STM32

#include <ctype.h>
#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/types.h>
#include <unistd.h>
#include <dirent.h>

#include <stm32_sdk_hal.h>

#define to64(x) strtoll(x, NULL, 10)
#define INT64_FMT "lld"
#define SIZE_T_FMT "u"
typedef struct stat cs_stat_t;
#define DIRSEP '/'

#ifndef CS_ENABLE_STDIO
#define CS_ENABLE_STDIO 1
#endif

#ifndef MG_ENABLE_FILESYSTEM
#define MG_ENABLE_FILESYSTEM 1
#endif

#endif /* CS_PLATFORM == CS_P_STM32 */
#endif /* CS_COMMON_PLATFORMS_PLATFORM_STM32_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/platforms/lwip/mg_lwip.h"
#endif

#ifndef CS_COMMON_PLATFORMS_LWIP_MG_LWIP_H_
#define CS_COMMON_PLATFORMS_LWIP_MG_LWIP_H_

#ifndef MG_LWIP
#define MG_LWIP 0
#endif

#if MG_LWIP

/*
 * When compiling for nRF5x chips with arm-none-eabi-gcc, it has BYTE_ORDER
 * already defined, so in order to avoid warnings in lwip, we have to undefine
 * it.
 *
 * TODO: Check if in the future versions of nRF5 SDK that changes.
 *       Current version of nRF51 SDK: 0.8.0
 *                          nRF5 SDK:  0.9.0
 */
#if CS_PLATFORM == CS_P_NRF51 || CS_PLATFORM == CS_P_NRF52
#undef BYTE_ORDER
#endif

#include <lwip/opt.h>
#include <lwip/err.h>
#include <lwip/ip_addr.h>
#include <lwip/inet.h>
#include <lwip/netdb.h>
#include <lwip/dns.h>

#ifndef LWIP_PROVIDE_ERRNO
#include <errno.h>
#endif

#if LWIP_SOCKET
#include <lwip/sockets.h>
#else
/* We really need the definitions from sockets.h. */
#undef LWIP_SOCKET
#define LWIP_SOCKET 1
#include <lwip/sockets.h>
#undef LWIP_SOCKET
#define LWIP_SOCKET 0
#endif

#define INVALID_SOCKET (-1)
#define SOMAXCONN 10
typedef int sock_t;

#if MG_NET_IF == MG_NET_IF_LWIP_LOW_LEVEL
struct mg_mgr;
struct mg_connection;
void mg_lwip_set_keepalive_params(struct mg_connection *nc, int idle,
                                  int interval, int count);
#endif

/* For older version of LWIP */
#ifndef ipX_2_ip
#define ipX_2_ip(x) (x)
#endif

#endif /* MG_LWIP */

#endif /* CS_COMMON_PLATFORMS_LWIP_MG_LWIP_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/cs_md5.h"
#endif

#ifndef CS_COMMON_MD5_H_
#define CS_COMMON_MD5_H_

/* Amalgamated: #include "common/platform.h" */

#ifndef CS_DISABLE_MD5
#define CS_DISABLE_MD5 0
#endif

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

typedef struct {
  uint32_t buf[4];
  uint32_t bits[2];
  unsigned char in[64];
} cs_md5_ctx;

void cs_md5_init(cs_md5_ctx *c);
void cs_md5_update(cs_md5_ctx *c, const unsigned char *data, size_t len);
void cs_md5_final(unsigned char *md, cs_md5_ctx *c);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* CS_COMMON_MD5_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/cs_sha1.h"
#endif

#ifndef CS_COMMON_SHA1_H_
#define CS_COMMON_SHA1_H_

#ifndef CS_DISABLE_SHA1
#define CS_DISABLE_SHA1 0
#endif

#if !CS_DISABLE_SHA1

/* Amalgamated: #include "common/platform.h" */

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

typedef struct {
  uint32_t state[5];
  uint32_t count[2];
  unsigned char buffer[64];
} cs_sha1_ctx;

void cs_sha1_init(cs_sha1_ctx *);
void cs_sha1_update(cs_sha1_ctx *, const unsigned char *data, uint32_t len);
void cs_sha1_final(unsigned char digest[20], cs_sha1_ctx *);
void cs_hmac_sha1(const unsigned char *key, size_t key_len,
                  const unsigned char *text, size_t text_len,
                  unsigned char out[20]);
#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* CS_DISABLE_SHA1 */

#endif /* CS_COMMON_SHA1_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/cs_time.h"
#endif

#ifndef CS_COMMON_CS_TIME_H_
#define CS_COMMON_CS_TIME_H_

#include <time.h>

/* Amalgamated: #include "common/platform.h" */

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

/* Sub-second granularity time(). */
double cs_time(void);

/*
 * Similar to (non-standard) timegm, converts broken-down time into the number
 * of seconds since Unix Epoch.
 */
double cs_timegm(const struct tm *tm);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* CS_COMMON_CS_TIME_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/mg_str.h"
#endif

#ifndef CS_COMMON_MG_STR_H_
#define CS_COMMON_MG_STR_H_

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Describes chunk of memory */
struct mg_str {
  const char *p; /* Memory chunk pointer */
  size_t len;    /* Memory chunk length */
};

/*
 * Helper function for creating mg_str struct from plain C string.
 * `NULL` is allowed and becomes `{NULL, 0}`.
 */
struct mg_str mg_mk_str(const char *s);

/*
 * Like `mg_mk_str`, but takes string length explicitly.
 */
struct mg_str mg_mk_str_n(const char *s, size_t len);

/* Macro for initializing mg_str. */
#define MG_MK_STR(str_literal) \
  { str_literal, sizeof(str_literal) - 1 }
#define MG_MK_STR_N(str_literal, len) \
  { str_literal, len }
#define MG_NULL_STR \
  { NULL, 0 }

/*
 * Cross-platform version of `strcmp()` where where first string is
 * specified by `struct mg_str`.
 */
int mg_vcmp(const struct mg_str *str2, const char *str1);

/*
 * Cross-platform version of `strncasecmp()` where first string is
 * specified by `struct mg_str`.
 */
int mg_vcasecmp(const struct mg_str *str2, const char *str1);

/* Creates a copy of s (heap-allocated). */
struct mg_str mg_strdup(const struct mg_str s);

/*
 * Creates a copy of s (heap-allocated).
 * Resulting string is NUL-terminated (but NUL is not included in len).
 */
struct mg_str mg_strdup_nul(const struct mg_str s);

/*
 * Locates character in a string.
 */
const char *mg_strchr(const struct mg_str s, int c);

/*
 * Compare two `mg_str`s; return value is the same as `strcmp`.
 */
int mg_strcmp(const struct mg_str str1, const struct mg_str str2);

/*
 * Like `mg_strcmp`, but compares at most `n` characters.
 */
int mg_strncmp(const struct mg_str str1, const struct mg_str str2, size_t n);

/*
 * Compare two `mg_str`s ignoreing case; return value is the same as `strcmp`.
 */
int mg_strcasecmp(const struct mg_str str1, const struct mg_str str2);

/*
 * Free the string (assuming it was heap allocated).
 */
void mg_strfree(struct mg_str *s);

/*
 * Finds the first occurrence of a substring `needle` in the `haystack`.
 */
const char *mg_strstr(const struct mg_str haystack, const struct mg_str needle);

/* Strip whitespace at the start and the end of s */
struct mg_str mg_strstrip(struct mg_str s);

/* Returns 1 if s starts with the given prefix. */
int mg_str_starts_with(struct mg_str s, struct mg_str prefix);

#ifdef __cplusplus
}
#endif

#endif /* CS_COMMON_MG_STR_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/mbuf.h"
#endif

/*
 * Mbufs are mutable/growing memory buffers, like C++ strings.
 * Mbuf can append data to the end of a buffer or insert data into arbitrary
 * position in the middle of a buffer. The buffer grows automatically when
 * needed.
 */

#ifndef CS_COMMON_MBUF_H_
#define CS_COMMON_MBUF_H_

#include <stdlib.h>
/* Amalgamated: #include "common/platform.h" */

#if defined(__cplusplus)
extern "C" {
#endif

#ifndef MBUF_SIZE_MULTIPLIER
#define MBUF_SIZE_MULTIPLIER 1.5
#endif

#ifndef MBUF_SIZE_MAX_HEADROOM
#ifdef BUFSIZ
#define MBUF_SIZE_MAX_HEADROOM BUFSIZ
#else
#define MBUF_SIZE_MAX_HEADROOM 1024
#endif
#endif

/* Memory buffer descriptor */
struct mbuf {
  char *buf;   /* Buffer pointer */
  size_t len;  /* Data length. Data is located between offset 0 and len. */
  size_t size; /* Buffer size allocated by realloc(1). Must be >= len */
};

/*
 * Initialises an Mbuf.
 * `initial_capacity` specifies the initial capacity of the mbuf.
 */
void mbuf_init(struct mbuf *, size_t initial_capacity);

/* Frees the space allocated for the mbuffer and resets the mbuf structure. */
void mbuf_free(struct mbuf *);

/*
 * Appends data to the Mbuf.
 *
 * Returns the number of bytes appended or 0 if out of memory.
 */
size_t mbuf_append(struct mbuf *, const void *data, size_t data_size);

/*
 * Appends data to the Mbuf and frees it (data must be heap-allocated).
 *
 * Returns the number of bytes appended or 0 if out of memory.
 * data is freed irrespective of return value.
 */
size_t mbuf_append_and_free(struct mbuf *, void *data, size_t data_size);

/*
 * Inserts data at a specified offset in the Mbuf.
 *
 * Existing data will be shifted forwards and the buffer will
 * be grown if necessary.
 * Returns the number of bytes inserted.
 */
size_t mbuf_insert(struct mbuf *, size_t, const void *, size_t);

/* Removes `data_size` bytes from the beginning of the buffer. */
void mbuf_remove(struct mbuf *, size_t data_size);

/*
 * Resizes an Mbuf.
 *
 * If `new_size` is smaller than buffer's `len`, the
 * resize is not performed.
 */
void mbuf_resize(struct mbuf *, size_t new_size);

/* Moves the state from one mbuf to the other. */
void mbuf_move(struct mbuf *from, struct mbuf *to);

/* Removes all the data from mbuf (if any). */
void mbuf_clear(struct mbuf *);

/* Shrinks an Mbuf by resizing its `size` to `len`. */
void mbuf_trim(struct mbuf *);

#if defined(__cplusplus)
}
#endif /* __cplusplus */

#endif /* CS_COMMON_MBUF_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/cs_base64.h"
#endif

#ifndef CS_COMMON_CS_BASE64_H_
#define CS_COMMON_CS_BASE64_H_

#ifndef DISABLE_BASE64
#define DISABLE_BASE64 0
#endif

#if !DISABLE_BASE64

#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef void (*cs_base64_putc_t)(char, void *);

struct cs_base64_ctx {
  /* cannot call it putc because it's a macro on some environments */
  cs_base64_putc_t b64_putc;
  unsigned char chunk[3];
  int chunk_size;
  void *user_data;
};

void cs_base64_init(struct cs_base64_ctx *ctx, cs_base64_putc_t putc,
                    void *user_data);
void cs_base64_update(struct cs_base64_ctx *ctx, const char *str, size_t len);
void cs_base64_finish(struct cs_base64_ctx *ctx);

void cs_base64_encode(const unsigned char *src, int src_len, char *dst);
void cs_fprint_base64(FILE *f, const unsigned char *src, int src_len);

/*
 * Decodes a base64 string `s` length `len` into `dst`.
 * `dst` must have enough space to hold the result.
 * `*dec_len` will contain the resulting length of the string in `dst`
 * while return value will return number of processed bytes in `src`.
 * Return value == len indicates successful processing of all the data.
 */
int cs_base64_decode(const unsigned char *s, int len, char *dst, int *dec_len);

#ifdef __cplusplus
}
#endif

#endif /* DISABLE_BASE64 */

#endif /* CS_COMMON_CS_BASE64_H_ */
#ifdef MG_MODULE_LINES
#line 1 "common/str_util.h"
#endif

#ifndef CS_COMMON_STR_UTIL_H_
#define CS_COMMON_STR_UTIL_H_

#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <time.h>

#define MG_PUTCHAR(x) printk("%c", x)
#ifndef strdup
#define strdup(s) ((char *) mg_strdup(mg_str(s)).buf)
#endif
#define strerror(x) zsock_gai_strerror(x)

#ifndef FD_CLOEXEC
#define FD_CLOEXEC 0
#endif

#ifndef F_SETFD
#define F_SETFD 0
#endif

#define MG_ENABLE_SSI 0

int rand(void);
int sscanf(const char *, const char *, ...);

#endif


#if defined(MG_ENABLE_FREERTOS_TCP) && MG_ENABLE_FREERTOS_TCP

#include <limits.h>
#include <list.h>

#include <FreeRTOS_IP.h>
#include <FreeRTOS_Sockets.h>

#define MG_SOCKET_TYPE Socket_t
#define MG_INVALID_SOCKET FREERTOS_INVALID_SOCKET

// Why FreeRTOS-TCP did not implement a clean BSD API, but its own thing
// with FreeRTOS_ prefix, is beyond me
#define IPPROTO_TCP FREERTOS_IPPROTO_TCP
#define IPPROTO_UDP FREERTOS_IPPROTO_UDP
#define AF_INET FREERTOS_AF_INET
#define SOCK_STREAM FREERTOS_SOCK_STREAM
#define SOCK_DGRAM FREERTOS_SOCK_DGRAM
#define SO_BROADCAST 0
#define SO_ERROR 0
#define SOL_SOCKET 0
#define SO_REUSEADDR 0

#define MG_SOCK_ERR(errcode) ((errcode) < 0 ? (errcode) : 0)

#define MG_SOCK_PENDING(errcode)                 \
  ((errcode) == -pdFREERTOS_ERRNO_EWOULDBLOCK || \
   (errcode) == -pdFREERTOS_ERRNO_EISCONN ||     \
   (errcode) == -pdFREERTOS_ERRNO_EINPROGRESS || \
   (errcode) == -pdFREERTOS_ERRNO_EAGAIN)

#define MG_SOCK_RESET(errcode) ((errcode) == -pdFREERTOS_ERRNO_ENOTCONN)

// actually only if optional timeout is enabled
#define MG_SOCK_INTR(fd) (fd == NULL)

#define sockaddr_in freertos_sockaddr
#define sockaddr freertos_sockaddr
#if ipFR_TCP_VERSION_MAJOR >= 4
#define sin_addr sin_address.ulIP_IPv4
#endif
#define accept(a, b, c) FreeRTOS_accept((a), (b), (c))
#define connect(a, b, c) FreeRTOS_connect((a), (b), (c))
#define bind(a, b, c) FreeRTOS_bind((a), (b), (c))
#define listen(a, b) FreeRTOS_listen((a), (b))
#define socket(a, b, c) FreeRTOS_socket((a), (b), (c))
#define send(a, b, c, d) FreeRTOS_send((a), (b), (c), (d))
#define recv(a, b, c, d) FreeRTOS_recv((a), (b), (c), (d))
#define setsockopt(a, b, c, d, e) FreeRTOS_setsockopt((a), (b), (c), (d), (e))
#define sendto(a, b, c, d, e, f) FreeRTOS_sendto((a), (b), (c), (d), (e), (f))
#define recvfrom(a, b, c, d, e, f) \
  FreeRTOS_recvfrom((a), (b), (c), (d), (e), (f))
#define closesocket(x) FreeRTOS_closesocket(x)
#define gethostbyname(x) FreeRTOS_gethostbyname(x)
#define getsockname(a, b, c) mg_getsockname((a), (b), (c))
#define getpeername(a, b, c) mg_getpeername((a), (b), (c))

static inline int mg_getsockname(MG_SOCKET_TYPE fd, void *buf, socklen_t *len) {
  (void) fd, (void) buf, (void) len;
  return -1;
}

static inline int mg_getpeername(MG_SOCKET_TYPE fd, void *buf, socklen_t *len) {
  (void) fd, (void) buf, (void) len;
  return 0;
}
#endif


#if defined(MG_ENABLE_LWIP) && MG_ENABLE_LWIP

#if defined(__GNUC__) && !defined(__ARMCC_VERSION)
#include <sys/stat.h>
#endif

struct timeval;

#include <lwip/sockets.h>

#if !LWIP_TIMEVAL_PRIVATE
#if defined(__GNUC__) && !defined(__ARMCC_VERSION) // armclang sets both
#include <sys/time.h>
#else
struct timeval {
  time_t tv_sec;
  long tv_usec;
};
#endif
#endif

#if LWIP_SOCKET != 1
// Sockets support disabled in LWIP by default
#error Set LWIP_SOCKET variable to 1 (in lwipopts.h)
#endif

#ifndef CS_MONGOOSE_SRC_FEATURES_H_
#define CS_MONGOOSE_SRC_FEATURES_H_

#ifndef MG_DISABLE_HTTP_DIGEST_AUTH
#define MG_DISABLE_HTTP_DIGEST_AUTH 0
#endif


#if defined(MG_ENABLE_RL) && MG_ENABLE_RL
#include <rl_net.h>

#define closesocket(x) closesocket(x)

#define TCP_NODELAY SO_KEEPALIVE

#define MG_SOCK_ERR(errcode) ((errcode) < 0 ? (errcode) : 0)

#define MG_SOCK_PENDING(errcode)                                \
  ((errcode) == BSD_EWOULDBLOCK || (errcode) == BSD_EALREADY || \
   (errcode) == BSD_EINPROGRESS)

#define MG_SOCK_RESET(errcode) \
  ((errcode) == BSD_ECONNABORTED || (errcode) == BSD_ECONNRESET)

// In blocking mode, which is enabled by default, accept() waits for a
// connection request. In non blocking mode, you must call accept()
// again if the error code BSD_EWOULDBLOCK is returned.
#define MG_SOCK_INTR(fd) (fd == BSD_EWOULDBLOCK)

#define socklen_t int
#endif


#ifndef MG_ENABLE_LOG
#define MG_ENABLE_LOG 1
#endif

#ifndef MG_ENABLE_CUSTOM_LOG
#define MG_ENABLE_CUSTOM_LOG 0  // Let user define their own MG_LOG
#endif

#ifndef MG_ENABLE_TCPIP
#define MG_ENABLE_TCPIP 0  // Mongoose built-in network stack
#endif

#ifndef MG_ENABLE_LWIP
#define MG_ENABLE_LWIP 0  // lWIP network stack
#endif

#ifndef MG_ENABLE_FREERTOS_TCP
#define MG_ENABLE_FREERTOS_TCP 0  // Amazon FreeRTOS-TCP network stack
#endif

#ifndef MG_ENABLE_RL
#define MG_ENABLE_RL 0  // ARM MDK network stack
#endif

#ifndef MG_ENABLE_SOCKET
#define MG_ENABLE_SOCKET !MG_ENABLE_TCPIP
#endif

#ifndef MG_ENABLE_POLL
#define MG_ENABLE_POLL 0
#endif

#ifndef MG_ENABLE_EPOLL
#define MG_ENABLE_EPOLL 0
#endif

#ifndef MG_ENABLE_FATFS
#define MG_ENABLE_FATFS 0
#endif

#ifndef MG_ENABLE_SSI
#define MG_ENABLE_SSI 0
#endif

#ifndef MG_ENABLE_IPV6
#define MG_ENABLE_IPV6 0
#endif

#ifndef MG_IPV6_V6ONLY
#define MG_IPV6_V6ONLY 0  // IPv6 socket binds only to V6, not V4 address
#endif

#ifndef MG_ENABLE_MD5
#define MG_ENABLE_MD5 1
#endif

// Set MG_ENABLE_WINSOCK=0 for Win32 builds with external IP stack (like LWIP)
#ifndef MG_ENABLE_WINSOCK
#define MG_ENABLE_WINSOCK 1
#endif

#ifndef MG_ENABLE_DIRLIST
#define MG_ENABLE_DIRLIST 0
#endif

#ifndef MG_ENABLE_CUSTOM_RANDOM
#define MG_ENABLE_CUSTOM_RANDOM 0
#endif

#ifndef MG_ENABLE_CUSTOM_MILLIS
#define MG_ENABLE_CUSTOM_MILLIS 0
#endif

#ifndef MG_ENABLE_PACKED_FS
#define MG_ENABLE_PACKED_FS 0
#endif

#ifndef MG_ENABLE_ASSERT
#define MG_ENABLE_ASSERT 0
#endif

#ifndef MG_IO_SIZE
#define MG_IO_SIZE 256  // Granularity of the send/recv IO buffer growth
#endif

#ifndef MG_MAX_RECV_SIZE
#define MG_MAX_RECV_SIZE (3UL * 1024UL * 1024UL)  // Maximum recv IO buffer size
#endif

#ifndef MG_DATA_SIZE
#define MG_DATA_SIZE 32  // struct mg_connection :: data size
#endif

#ifndef MG_ENABLE_HTTP_URL_REWRITES
#define MG_ENABLE_HTTP_URL_REWRITES \
  (CS_PLATFORM == CS_P_WINDOWS || CS_PLATFORM == CS_P_UNIX)
#endif

#ifndef MG_ENABLE_SNTP
#define MG_ENABLE_SNTP 0
#endif

#ifndef MG_ENABLE_EXTRA_ERRORS_DESC
#define MG_ENABLE_EXTRA_ERRORS_DESC 0
#endif

#ifndef MG_ENABLE_CALLBACK_USERDATA
#define MG_ENABLE_CALLBACK_USERDATA 0
#endif

#if MG_ENABLE_CALLBACK_USERDATA
#define MG_UD_ARG(ud) , ud
#define MG_CB(cb, ud) cb, ud
#else
#define MG_UD_ARG(ud)
#define MG_CB(cb, ud) cb
#endif

#endif /* CS_MONGOOSE_SRC_FEATURES_H_ */
#ifdef MG_MODULE_LINES
#line 1 "mongoose/src/mg_net_if.h"
#endif

#ifndef CS_MONGOOSE_SRC_NET_IF_H_
#define CS_MONGOOSE_SRC_NET_IF_H_

/* Amalgamated: #include "common/platform.h" */

/*
 * Internal async networking core interface.
 * Consists of calls made by the core, which should not block,
 * and callbacks back into the core ("..._cb").
 * Callbacks may (will) cause methods to be invoked from within,
 * but methods are not allowed to invoke callbacks inline.
 *
 * Implementation must ensure that only one callback is invoked at any time.
 */

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

#define MG_MAIN_IFACE 0

struct mg_mgr;
struct mg_connection;
union socket_address;

struct mg_iface_vtable;

struct mg_iface {
  struct mg_mgr *mgr;
  void *data; /* Implementation-specific data */
  const struct mg_iface_vtable *vtable;
};

struct mg_iface_vtable {
  void (*init)(struct mg_iface *iface);
  void (*free)(struct mg_iface *iface);
  void (*add_conn)(struct mg_connection *nc);
  void (*remove_conn)(struct mg_connection *nc);
  time_t (*poll)(struct mg_iface *iface, int timeout_ms);

  /* Set up a listening TCP socket on a given address. rv = 0 -> ok. */
  int (*listen_tcp)(struct mg_connection *nc, union socket_address *sa);
  /* Request that a "listening" UDP socket be created. */
  int (*listen_udp)(struct mg_connection *nc, union socket_address *sa);

  /* Request that a TCP connection is made to the specified address. */
  void (*connect_tcp)(struct mg_connection *nc, const union socket_address *sa);
  /* Open a UDP socket. Doesn't actually connect anything. */
  void (*connect_udp)(struct mg_connection *nc);

  /* Send functions for TCP and UDP. Sent data is copied before return. */
  int (*tcp_send)(struct mg_connection *nc, const void *buf, size_t len);
  int (*udp_send)(struct mg_connection *nc, const void *buf, size_t len);

  int (*tcp_recv)(struct mg_connection *nc, void *buf, size_t len);
  int (*udp_recv)(struct mg_connection *nc, void *buf, size_t len,
                  union socket_address *sa, size_t *sa_len);

  /* Perform interface-related connection initialization. Return 1 on ok. */
  int (*create_conn)(struct mg_connection *nc);
  /* Perform interface-related cleanup on connection before destruction. */
  void (*destroy_conn)(struct mg_connection *nc);

  /* Associate a socket to a connection. */
  void (*sock_set)(struct mg_connection *nc, sock_t sock);

  /* Put connection's address into *sa, local (remote = 0) or remote. */
  void (*get_conn_addr)(struct mg_connection *nc, int remote,
                        union socket_address *sa);
};

extern const struct mg_iface_vtable *mg_ifaces[];
extern int mg_num_ifaces;

/* Creates a new interface instance. */
struct mg_iface *mg_if_create_iface(const struct mg_iface_vtable *vtable,
                                    struct mg_mgr *mgr);

/*
 * Find an interface with a given implementation. The search is started from
 * interface `from`, exclusive. Returns NULL if none is found.
 */
struct mg_iface *mg_find_iface(struct mg_mgr *mgr,
                               const struct mg_iface_vtable *vtable,
                               struct mg_iface *from);
/*
 * Deliver a new TCP connection. Returns NULL in case on error (unable to
 * create connection, in which case interface state should be discarded.
 * This is phase 1 of the two-phase process - MG_EV_ACCEPT will be delivered
 * when mg_if_accept_tcp_cb is invoked.
 */
struct mg_connection *mg_if_accept_new_conn(struct mg_connection *lc);
void mg_if_accept_tcp_cb(struct mg_connection *nc, union socket_address *sa,
                         size_t sa_len);

/* Callback invoked by connect methods. err = 0 -> ok, != 0 -> error. */
void mg_if_connect_cb(struct mg_connection *nc, int err);
/*
 * Callback that tells the core that data can be received.
 * Core will use tcp/udp_recv to retrieve the data.
 */
void mg_if_can_recv_cb(struct mg_connection *nc);
void mg_if_can_send_cb(struct mg_connection *nc);
/*
 * Receive callback.
 * buf must be heap-allocated and ownership is transferred to the core.
 */
void mg_if_recv_udp_cb(struct mg_connection *nc, void *buf, int len,
                       union socket_address *sa, size_t sa_len);

/* void mg_if_close_conn(struct mg_connection *nc); */

/* Deliver a POLL event to the connection. */
int mg_if_poll(struct mg_connection *nc, double now);

/*
 * Return minimal timer value amoung connections in the manager.
 * Returns 0 if there aren't any timers.
 */
double mg_mgr_min_timer(const struct mg_mgr *mgr);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* CS_MONGOOSE_SRC_NET_IF_H_ */
#ifdef MG_MODULE_LINES
#line 1 "mongoose/src/mg_ssl_if.h"
#endif

#ifndef CS_MONGOOSE_SRC_SSL_IF_H_
#define CS_MONGOOSE_SRC_SSL_IF_H_

#if MG_ENABLE_SSL

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

struct mg_ssl_if_ctx;
struct mg_connection;

void mg_ssl_if_init(void);

enum mg_ssl_if_result {
  MG_SSL_OK = 0,
  MG_SSL_WANT_READ = -1,
  MG_SSL_WANT_WRITE = -2,
  MG_SSL_ERROR = -3,
};

struct mg_ssl_if_conn_params {
  const char *cert;
  const char *key;
  const char *ca_cert;
  const char *server_name;
  const char *cipher_suites;
  const char *psk_identity;
  const char *psk_key;
};

enum mg_ssl_if_result mg_ssl_if_conn_init(
    struct mg_connection *nc, const struct mg_ssl_if_conn_params *params,
    const char **err_msg);
enum mg_ssl_if_result mg_ssl_if_conn_accept(struct mg_connection *nc,
                                            struct mg_connection *lc);
void mg_ssl_if_conn_close_notify(struct mg_connection *nc);
void mg_ssl_if_conn_free(struct mg_connection *nc);

enum mg_ssl_if_result mg_ssl_if_handshake(struct mg_connection *nc);
int mg_ssl_if_read(struct mg_connection *nc, void *buf, size_t buf_size);
int mg_ssl_if_write(struct mg_connection *nc, const void *data, size_t len);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* MG_ENABLE_SSL */

#endif /* CS_MONGOOSE_SRC_SSL_IF_H_ */
#ifdef MG_MODULE_LINES
#line 1 "mongoose/src/mg_net.h"
#endif

/*
 * === Core API: TCP/UDP/SSL
 *
 * NOTE: Mongoose manager is single threaded. It does not protect
 * its data structures by mutexes, therefore all functions that are dealing
 * with a particular event manager should be called from the same thread,
 * with exception of the `mg_broadcast()` function. It is fine to have different
 * event managers handled by different threads.
 */

#ifndef CS_MONGOOSE_SRC_NET_H_
#define CS_MONGOOSE_SRC_NET_H_

/* Amalgamated: #include "mg_common.h" */
/* Amalgamated: #include "mg_net_if.h" */
/* Amalgamated: #include "common/mbuf.h" */

#ifndef MG_VPRINTF_BUFFER_SIZE
#define MG_VPRINTF_BUFFER_SIZE 100
#endif

#ifdef MG_USE_READ_WRITE
#define MG_RECV_FUNC(s, b, l, f) read(s, b, l)
#define MG_SEND_FUNC(s, b, l, f) write(s, b, l)
#else
#define MG_RECV_FUNC(s, b, l, f) recv(s, b, l, f)
#define MG_SEND_FUNC(s, b, l, f) send(s, b, l, f)
#endif

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

union socket_address {
  struct sockaddr sa;
  struct sockaddr_in sin;
#if MG_ENABLE_IPV6
  struct sockaddr_in6 sin6;
#else
  struct sockaddr sin6;
#endif
};

struct mg_connection;

/*
 * Callback function (event handler) prototype. Must be defined by the user.
 * Mongoose calls the event handler, passing the events defined below.
 */
typedef void (*mg_event_handler_t)(struct mg_connection *nc, int ev,
                                   void *ev_data MG_UD_ARG(void *user_data));

/* Events. Meaning of event parameter (evp) is given in the comment. */
#define MG_EV_POLL 0    /* Sent to each connection on each mg_mgr_poll() call */
#define MG_EV_ACCEPT 1  /* New connection accepted. union socket_address * */
#define MG_EV_CONNECT 2 /* connect() succeeded or failed. int *  */
#define MG_EV_RECV 3    /* Data has been received. int *num_bytes */
#define MG_EV_SEND 4    /* Data has been written to a socket. int *num_bytes */
#define MG_EV_CLOSE 5   /* Connection is closed. NULL */
#define MG_EV_TIMER 6   /* now >= conn->ev_timer_time. double * */

/*
 * Mongoose event manager.
 */
struct mg_mgr {
  struct mg_connection *active_connections;
#if MG_ENABLE_HEXDUMP
  const char *hexdump_file; /* Debug hexdump file path */
#endif
#if MG_ENABLE_BROADCAST
  sock_t ctl[2]; /* Socketpair for mg_broadcast() */
#endif
  void *user_data; /* User data */
  int num_ifaces;
  int num_calls;
  struct mg_iface **ifaces; /* network interfaces */
  const char *nameserver;   /* DNS server to use */
};

/*
 * Mongoose connection.
 */
struct mg_connection {
  struct mg_connection *next, *prev; /* mg_mgr::active_connections linkage */
  struct mg_connection *listener;    /* Set only for accept()-ed connections */
  struct mg_mgr *mgr;                /* Pointer to containing manager */

  sock_t sock; /* Socket to the remote peer */
  int err;
  union socket_address sa; /* Remote peer address */
  size_t recv_mbuf_limit;  /* Max size of recv buffer */
  struct mbuf recv_mbuf;   /* Received data */
  struct mbuf send_mbuf;   /* Data scheduled for sending */
  time_t last_io_time;     /* Timestamp of the last socket IO */
  double ev_timer_time;    /* Timestamp of the future MG_EV_TIMER */
  mg_event_handler_t proto_handler; /* Protocol-specific event handler */
  void *proto_data;                 /* Protocol-specific data */
  void (*proto_data_destructor)(void *proto_data);
  mg_event_handler_t handler; /* Event handler function */
  void *user_data;            /* User-specific data */
  union {
    void *v;
    /*
     * the C standard is fussy about fitting function pointers into
     * void pointers, since some archs might have fat pointers for functions.
     */
    mg_event_handler_t f;
  } priv_1;
  void *priv_2;
  void *mgr_data; /* Implementation-specific event manager's data. */
  struct mg_iface *iface;
  unsigned long flags;
/* Flags set by Mongoose */
#define MG_F_LISTENING (1 << 0)          /* This connection is listening */
#define MG_F_UDP (1 << 1)                /* This connection is UDP */
#define MG_F_RESOLVING (1 << 2)          /* Waiting for async resolver */
#define MG_F_CONNECTING (1 << 3)         /* connect() call in progress */
#define MG_F_SSL (1 << 4)                /* SSL is enabled on the connection */
#define MG_F_SSL_HANDSHAKE_DONE (1 << 5) /* SSL hanshake has completed */
#define MG_F_WANT_READ (1 << 6)          /* SSL specific */
#define MG_F_WANT_WRITE (1 << 7)         /* SSL specific */
#define MG_F_IS_WEBSOCKET (1 << 8)       /* Websocket specific */
#define MG_F_RECV_AND_CLOSE (1 << 9) /* Drain rx and close the connection. */

/* Flags that are settable by user */
#define MG_F_SEND_AND_CLOSE (1 << 10)      /* Push remaining data and close  */
#define MG_F_CLOSE_IMMEDIATELY (1 << 11)   /* Disconnect */

/* Flags for protocol handlers */
#define MG_F_PROTO_1 (1 << 12)
#define MG_F_PROTO_2 (1 << 13)
#define MG_F_ENABLE_BROADCAST (1 << 14)    /* Allow broadcast address usage */

/* Flags left for application */
#define MG_F_USER_1 (1 << 20)
#define MG_F_USER_2 (1 << 21)
#define MG_F_USER_3 (1 << 22)
#define MG_F_USER_4 (1 << 23)
#define MG_F_USER_5 (1 << 24)
#define MG_F_USER_6 (1 << 25)

#if MG_ENABLE_SSL
  void *ssl_if_data; /* SSL library data. */
#else
  void *unused_ssl_if_data; /* To keep the size of the structure the same. */
#endif
};

/*
 * Initialise Mongoose manager. Side effect: ignores SIGPIPE signal.
 * `mgr->user_data` field will be initialised with a `user_data` parameter.
 * That is an arbitrary pointer, where the user code can associate some data
 * with the particular Mongoose manager. For example, a C++ wrapper class
 * could be written in which case `user_data` can hold a pointer to the
 * class instance.
 */
void mg_mgr_init(struct mg_mgr *mgr, void *user_data);

/*
 * Optional parameters to `mg_mgr_init_opt()`.
 *
 * If `main_iface` is not NULL, it will be used as the main interface in the
 * default interface set. The pointer will be free'd by `mg_mgr_free`.
 * Otherwise, the main interface will be autodetected based on the current
 * platform.
 *
 * If `num_ifaces` is 0 and `ifaces` is NULL, the default interface set will be
 * used.
 * This is an advanced option, as it requires you to construct a full interface
 * set, including special networking interfaces required by some optional
 * features such as TCP tunneling. Memory backing `ifaces` and each of the
 * `num_ifaces` pointers it contains will be reclaimed by `mg_mgr_free`.
 */
struct mg_mgr_init_opts {
  const struct mg_iface_vtable *main_iface;
  int num_ifaces;
  const struct mg_iface_vtable **ifaces;
  const char *nameserver;
};

/*
 * Like `mg_mgr_init` but with more options.
 *
 * Notably, this allows you to create a manger and choose
 * dynamically which networking interface implementation to use.
 */
void mg_mgr_init_opt(struct mg_mgr *mgr, void *user_data,
                     struct mg_mgr_init_opts opts);

/*
 * De-initialises Mongoose manager.
 *
 * Closes and deallocates all active connections.
 */
void mg_mgr_free(struct mg_mgr *mgr);

/*
 * This function performs the actual IO and must be called in a loop
 * (an event loop). It returns number of user events generated (except POLLs).
 * `milli` is the maximum number of milliseconds to sleep.
 * `mg_mgr_poll()` checks all connections for IO readiness. If at least one
 * of the connections is IO-ready, `mg_mgr_poll()` triggers the respective
 * event handlers and returns.
 */
int mg_mgr_poll(struct mg_mgr *mgr, int milli);

#if MG_ENABLE_BROADCAST
/*
 * Passes a message of a given length to all connections.
 *
 * Must be called from a thread that does NOT call `mg_mgr_poll()`.
 * Note that `mg_broadcast()` is the only function
 * that can be, and must be, called from a different (non-IO) thread.
 *
 * `func` callback function will be called by the IO thread for each
 * connection. When called, the event will be `MG_EV_POLL`, and a message will
 * be passed as the `ev_data` pointer. Maximum message size is capped
 * by `MG_CTL_MSG_MESSAGE_SIZE` which is set to 8192 bytes by default.
 */
void mg_broadcast(struct mg_mgr *mgr, mg_event_handler_t cb, void *data,
                  size_t len);
#endif

/*
 * Iterates over all active connections.
 *
 * Returns the next connection from the list
 * of active connections or `NULL` if there are no more connections. Below
 * is the iteration idiom:
 *
 * ```c
 * for (c = mg_next(srv, NULL); c != NULL; c = mg_next(srv, c)) {
 *   // Do something with connection `c`
 * }
 * ```
 */
struct mg_connection *mg_next(struct mg_mgr *mgr, struct mg_connection *c);

/*
 * Optional parameters to `mg_add_sock_opt()`.
 *
 * `flags` is an initial `struct mg_connection::flags` bitmask to set,
 * see `MG_F_*` flags definitions.
 */
struct mg_add_sock_opts {
  void *user_data;           /* Initial value for connection's user_data */
  unsigned int flags;        /* Initial connection flags */
  const char **error_string; /* Placeholder for the error string */
  struct mg_iface *iface;    /* Interface instance */
};

/*
 * Creates a connection, associates it with the given socket and event handler
 * and adds it to the manager.
 *
 * For more options see the `mg_add_sock_opt` variant.
 */
struct mg_connection *mg_add_sock(struct mg_mgr *mgr, sock_t sock,
                                  MG_CB(mg_event_handler_t handler,
                                        void *user_data));

/*
 * Creates a connection, associates it with the given socket and event handler
 * and adds to the manager.
 *
 * See the `mg_add_sock_opts` structure for a description of the options.
 */
struct mg_connection *mg_add_sock_opt(struct mg_mgr *mgr, sock_t sock,
                                      MG_CB(mg_event_handler_t handler,
                                            void *user_data),
                                      struct mg_add_sock_opts opts);

/*
 * Optional parameters to `mg_bind_opt()`.
 *
 * `flags` is an initial `struct mg_connection::flags` bitmask to set,
 * see `MG_F_*` flags definitions.
 */
struct mg_bind_opts {
  void *user_data;           /* Initial value for connection's user_data */
  unsigned int flags;        /* Extra connection flags */
  const char **error_string; /* Placeholder for the error string */
  struct mg_iface *iface;    /* Interface instance */
#if MG_ENABLE_SSL
  /*
   * SSL settings.
   *
   * Server certificate to present to clients or client certificate to
   * present to tunnel dispatcher (for tunneled connections).
   */
  const char *ssl_cert;
  /* Private key corresponding to the certificate. If ssl_cert is set but
   * ssl_key is not, ssl_cert is used. */
  const char *ssl_key;
  /* CA bundle used to verify client certificates or tunnel dispatchers. */
  const char *ssl_ca_cert;
  /* Colon-delimited list of acceptable cipher suites.
   * Names depend on the library used, for example:
   *
   * ECDH-ECDSA-AES128-GCM-SHA256:DHE-RSA-AES128-SHA256 (OpenSSL)
   * TLS-ECDH-ECDSA-WITH-AES-128-GCM-SHA256:TLS-DHE-RSA-WITH-AES-128-GCM-SHA256
   *   (mbedTLS)
   *
   * For OpenSSL the list can be obtained by running "openssl ciphers".
   * For mbedTLS, names can be found in library/ssl_ciphersuites.c
   * If NULL, a reasonable default is used.
   */
  const char *ssl_cipher_suites;
#endif
};

/*
 * Creates a listening connection.
 *
 * See `mg_bind_opt` for full documentation.
 */
struct mg_connection *mg_bind(struct mg_mgr *mgr, const char *address,
                              MG_CB(mg_event_handler_t handler,
                                    void *user_data));
/*
 * Creates a listening connection.
 *
 * The `address` parameter specifies which address to bind to. It's format is
 * the same as for the `mg_connect()` call, where `HOST` part is optional.
 * `address` can be just a port number, e.g. `:8000`. To bind to a specific
 * interface, an IP address can be specified, e.g. `1.2.3.4:8000`. By default,
 * a TCP connection is created. To create UDP connection, prepend `udp://`
 * prefix, e.g. `udp://:8000`. To summarize, `address` parameter has following
 * format: `[PROTO://][IP_ADDRESS]:PORT`, where `PROTO` could be `tcp` or
 * `udp`.
 *
 * See the `mg_bind_opts` structure for a description of the optional
 * parameters.
 *
 * Returns a new listening connection or `NULL` on error.
 * NOTE: The connection remains owned by the manager, do not free().
 */
struct mg_connection *mg_bind_opt(struct mg_mgr *mgr, const char *address,
                                  MG_CB(mg_event_handler_t handler,
                                        void *user_data),
                                  struct mg_bind_opts opts);

/* Optional parameters to `mg_connect_opt()` */
struct mg_connect_opts {
  void *user_data;           /* Initial value for connection's user_data */
  unsigned int flags;        /* Extra connection flags */
  const char **error_string; /* Placeholder for the error string */
  struct mg_iface *iface;    /* Interface instance */
  const char *nameserver;    /* DNS server to use, NULL for default */
#if MG_ENABLE_SSL
  /*
   * SSL settings.
   * Client certificate to present to the server.
   */
  const char *ssl_cert;
  /*
   * Private key corresponding to the certificate.
   * If ssl_cert is set but ssl_key is not, ssl_cert is used.
   */
  const char *ssl_key;
  /*
   * Verify server certificate using this CA bundle. If set to "*", then SSL
   * is enabled but no cert verification is performed.
   */
  const char *ssl_ca_cert;
  /* Colon-delimited list of acceptable cipher suites.
   * Names depend on the library used, for example:
   *
   * ECDH-ECDSA-AES128-GCM-SHA256:DHE-RSA-AES128-SHA256 (OpenSSL)
   * TLS-ECDH-ECDSA-WITH-AES-128-GCM-SHA256:TLS-DHE-RSA-WITH-AES-128-GCM-SHA256
   *   (mbedTLS)
   *
   * For OpenSSL the list can be obtained by running "openssl ciphers".
   * For mbedTLS, names can be found in library/ssl_ciphersuites.c
   * If NULL, a reasonable default is used.
   */
  const char *ssl_cipher_suites;
  /*
   * Server name verification. If ssl_ca_cert is set and the certificate has
   * passed verification, its subject will be verified against this string.
   * By default (if ssl_server_name is NULL) hostname part of the address will
   * be used. Wildcard matching is supported. A special value of "*" disables
   * name verification.
   */
  const char *ssl_server_name;
  /*
   * PSK identity and key. Identity is a NUL-terminated string and key is a hex
   * string. Key must be either 16 or 32 bytes (32 or 64 hex digits) for AES-128
   * or AES-256 respectively.
   * Note: Default list of cipher suites does not include PSK suites, if you
   * want to use PSK you will need to set ssl_cipher_suites as well.
   */
  const char *ssl_psk_identity;
  const char *ssl_psk_key;
#endif
};

/*
 * Connects to a remote host.
 *
 * See `mg_connect_opt()` for full documentation.
 */
struct mg_connection *mg_connect(struct mg_mgr *mgr, const char *address,
                                 MG_CB(mg_event_handler_t handler,
                                       void *user_data));

/*
 * Connects to a remote host.
 *
 * The `address` format is `[PROTO://]HOST:PORT`. `PROTO` could be `tcp` or
 * `udp`. `HOST` could be an IP address,
 * IPv6 address (if Mongoose is compiled with `-DMG_ENABLE_IPV6`) or a host
 * name. If `HOST` is a name, Mongoose will resolve it asynchronously. Examples
 * of valid addresses: `google.com:80`, `udp://1.2.3.4:53`, `10.0.0.1:443`,
 * `[::1]:80`
 *
 * See the `mg_connect_opts` structure for a description of the optional
 * parameters.
 *
 * Returns a new outbound connection or `NULL` on error.
 *
 * NOTE: The connection remains owned by the manager, do not free().
 *
 * NOTE: To enable IPv6 addresses `-DMG_ENABLE_IPV6` should be specified
 * in the compilation flags.
 *
 * NOTE: The new connection will receive `MG_EV_CONNECT` as its first event
 * which will report the connect success status.
 * If the asynchronous resolution fails or the `connect()` syscall fails for
 * whatever reason (e.g. with `ECONNREFUSED` or `ENETUNREACH`), then
 * `MG_EV_CONNECT` event will report failure. Code example below:
 *
 * ```c
 * static void ev_handler(struct mg_connection *nc, int ev, void *ev_data) {
 *   int connect_status;
 *
 *   switch (ev) {
 *     case MG_EV_CONNECT:
 *       connect_status = * (int *) ev_data;
 *       if (connect_status == 0) {
 *         // Success
 *       } else  {
 *         // Error
 *         printf("connect() error: %s\n", strerror(connect_status));
 *       }
 *       break;
 *     ...
 *   }
 * }
 *
 *   ...
 *   mg_connect(mgr, "my_site.com:80", ev_handler);
 * ```
 */
struct mg_connection *mg_connect_opt(struct mg_mgr *mgr, const char *address,
                                     MG_CB(mg_event_handler_t handler,
                                           void *user_data),
                                     struct mg_connect_opts opts);

#if MG_ENABLE_SSL && MG_NET_IF != MG_NET_IF_SIMPLELINK
/*
 * Note: This function is deprecated. Please, use SSL options in
 * mg_connect_opt.
 *
 * Enables SSL for a given connection.
 * `cert` is a server certificate file name for a listening connection
 * or a client certificate file name for an outgoing connection.
 * The certificate files must be in PEM format. The server certificate file
 * must contain a certificate, concatenated with a private key, optionally
 * concatenated with DH parameters.
 * `ca_cert` is a CA certificate or NULL if peer verification is not
 * required.
 * Return: NULL on success or error message on error.
 */
const char *mg_set_ssl(struct mg_connection *nc, const char *cert,
                       const char *ca_cert);
#endif

/*
 * Sends data to the connection.
 *
 * Note that sending functions do not actually push data to the socket.
 * They just append data to the output buffer. MG_EV_SEND will be delivered when
 * the data has actually been pushed out.
 */
void mg_send(struct mg_connection *, const void *buf, int len);

/* Enables format string warnings for mg_printf */
#if defined(__GNUC__)
__attribute__((format(printf, 2, 3)))
#endif
/* don't separate from mg_printf declaration */

/*
 * Sends `printf`-style formatted data to the connection.
 *
 * See `mg_send` for more details on send semantics.
 */
int mg_printf(struct mg_connection *, const char *fmt, ...);

/* Same as `mg_printf()`, but takes `va_list ap` as an argument. */
int mg_vprintf(struct mg_connection *, const char *fmt, va_list ap);

/*
 * Creates a socket pair.
 * `sock_type` can be either `SOCK_STREAM` or `SOCK_DGRAM`.
 * Returns 0 on failure and 1 on success.
 */
int mg_socketpair(sock_t[2], int sock_type);

#if MG_ENABLE_SYNC_RESOLVER
/*
 * Convert domain name into IP address.
 *
 * This is a utility function. If compilation flags have
 * `-DMG_ENABLE_GETADDRINFO`, then `getaddrinfo()` call is used for name
 * resolution. Otherwise, `gethostbyname()` is used.
 *
 * CAUTION: this function can block.
 * Return 1 on success, 0 on failure.
 */
int mg_resolve(const char *domain_name, char *ip_addr_buf, size_t buf_len);
#endif

/*
 * Verify given IP address against the ACL.
 *
 * `remote_ip` - an IPv4 address to check, in host byte order
 * `acl` - a comma separated list of IP subnets: `x.x.x.x/x` or `x.x.x.x`.
 * Each subnet is
 * prepended by either a - or a + sign. A plus sign means allow, where a
 * minus sign means deny. If a subnet mask is omitted, such as `-1.2.3.4`,
 * it means that only that single IP address is denied.
 * Subnet masks may vary from 0 to 32, inclusive. The default setting
 * is to allow all access. On each request the full list is traversed,
 * and the last match wins. Example:
 *
 * `-0.0.0.0/0,+192.168/16` - deny all accesses, only allow 192.168/16 subnet
 *
 * To learn more about subnet masks, see this
 * link:https://en.wikipedia.org/wiki/Subnetwork[Wikipedia page on Subnetwork].
 *
 * Returns -1 if ACL is malformed, 0 if address is disallowed, 1 if allowed.
 */
int mg_check_ip_acl(const char *acl, uint32_t remote_ip);

/*
 * Schedules an MG_EV_TIMER event to be delivered at `timestamp` time.
 * `timestamp` is UNIX time (the number of seconds since Epoch). It is
 * `double` instead of `time_t` to allow for sub-second precision.
 * Returns the old timer value.
 *
 * Example: set the connect timeout to 1.5 seconds:
 *
 * ```
 *  c = mg_connect(&mgr, "cesanta.com", ev_handler);
 *  mg_set_timer(c, mg_time() + 1.5);
 *  ...
 *
 *  void ev_handler(struct mg_connection *c, int ev, void *ev_data) {
 *  switch (ev) {
 *    case MG_EV_CONNECT:
 *      mg_set_timer(c, 0);  // Clear connect timer
 *      break;
 *    case MG_EV_TIMER:
 *      log("Connect timeout");
 *      c->flags |= MG_F_CLOSE_IMMEDIATELY;
 *      break;
 * ```
 */
double mg_set_timer(struct mg_connection *c, double timestamp);

/*
 * A sub-second precision version of time().
 */
double mg_time(void);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* CS_MONGOOSE_SRC_NET_H_ */
#ifdef MG_MODULE_LINES
#line 1 "mongoose/src/mg_uri.h"
#endif

/*
 * === URI
 */

#ifndef CS_MONGOOSE_SRC_URI_H_
#define CS_MONGOOSE_SRC_URI_H_

/* Amalgamated: #include "mg_net.h" */

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

/*
 * Parses an URI and fills string chunks with locations of the respective
 * uri components within the input uri string. NULL pointers will be
 * ignored.
 *
 * General syntax:
 *
 *     [scheme://[user_info@]]host[:port][/path][?query][#fragment]
 *
 * Example:
 *
 *     foo.com:80
 *     tcp://foo.com:1234
 *     http://foo.com:80/bar?baz=1
 *     https://user:pw@foo.com:443/blah
 *
 * `path` will include the leading slash. `query` won't include the leading `?`.
 * `host` can contain embedded colons if surrounded by square brackets in order
 * to support IPv6 literal addresses.
 *
 *
 * Returns 0 on success, -1 on error.
 */
int mg_parse_uri(const struct mg_str uri, struct mg_str *scheme,
                 struct mg_str *user_info, struct mg_str *host,
                 unsigned int *port, struct mg_str *path, struct mg_str *query,
                 struct mg_str *fragment);

/*
 * Assemble URI from parts. Any of the inputs can be NULL or zero-length mg_str.
 *
 * If normalize_path is true, path is normalized by resolving relative refs.
 *
 * Result is a heap-allocated string (uri->p must be free()d after use).
 *
 * Returns 0 on success, -1 on error.
 */
int mg_assemble_uri(const struct mg_str *scheme, const struct mg_str *user_info,
                    const struct mg_str *host, unsigned int port,
                    const struct mg_str *path, const struct mg_str *query,
                    const struct mg_str *fragment, int normalize_path,
                    struct mg_str *uri);

int mg_normalize_uri_path(const struct mg_str *in, struct mg_str *out);

#ifdef __cplusplus
}
#endif /* __cplusplus */
#endif /* CS_MONGOOSE_SRC_URI_H_ */
#ifdef MG_MODULE_LINES
#line 1 "mongoose/src/mg_util.h"
#endif

/*
 * === Utility API
 */

#ifndef CS_MONGOOSE_SRC_UTIL_H_
#define CS_MONGOOSE_SRC_UTIL_H_

#include <stdio.h>

/* Amalgamated: #include "mg_common.h" */
/* Amalgamated: #include "mg_net_if.h" */

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

#ifndef MG_MAX_PATH
#ifdef PATH_MAX
#define MG_MAX_PATH PATH_MAX
#else
#define MG_MAX_PATH 256
#endif
#endif

/*
 * Fetches substring from input string `s`, `end` into `v`.
 * Skips initial delimiter characters. Records first non-delimiter character
 * at the beginning of substring `v`. Then scans the rest of the string
 * until a delimiter character or end-of-string is found.
 * `delimiters` is a 0-terminated string containing delimiter characters.
 * Either one of `delimiters` or `end_string` terminates the search.
 * Returns an `s` pointer, advanced forward where parsing has stopped.
 */
const char *mg_skip(const char *s, const char *end_string,
                    const char *delimiters, struct mg_str *v);

/*
 * Decodes base64-encoded string `s`, `len` into the destination `dst`.
 * The destination has to have enough space to hold the decoded buffer.
 * Decoding stops either when all strings have been decoded or invalid an
 * character appeared.
 * Destination is '\0'-terminated.
 * Returns the number of decoded characters. On success, that should be equal
 * to `len`. On error (invalid character) the return value is smaller then
 * `len`.
 */
int mg_base64_decode(const unsigned char *s, int len, char *dst);

/*
 * Base64-encode chunk of memory `src`, `src_len` into the destination `dst`.
 * Destination has to have enough space to hold encoded buffer.
 * Destination is '\0'-terminated.
 */
void mg_base64_encode(const unsigned char *src, int src_len, char *dst);

#if MG_ENABLE_FILESYSTEM
/*
 * Performs a 64-bit `stat()` call against a given file.
 *
 * `path` should be UTF8 encoded.
 *
 * Return value is the same as for `stat()` syscall.
 */
int mg_stat(const char *path, cs_stat_t *st);

/*
 * Opens the given file and returns a file stream.
 *
 * `path` and `mode` should be UTF8 encoded.
 *
 * Return value is the same as for the `fopen()` call.
 */
FILE *mg_fopen(const char *path, const char *mode);

/*
 * Opens the given file and returns a file stream.
 *
 * `path` should be UTF8 encoded.
 *
 * Return value is the same as for the `open()` syscall.
 */
int mg_open(const char *path, int flag, int mode);

/*
 * Reads data from the given file stream.
 *
 * Return value is a number of bytes readen.
 */
size_t mg_fread(void *ptr, size_t size, size_t count, FILE *f);

/*
 * Writes data to the given file stream.
 *
 * Return value is a number of bytes wtitten.
 */
size_t mg_fwrite(const void *ptr, size_t size, size_t count, FILE *f);

#endif /* MG_ENABLE_FILESYSTEM */

#if MG_ENABLE_THREADS
/*
 * Starts a new detached thread.
 * Arguments and semantics are the same as pthead's `pthread_create()`.
 * `thread_func` is a thread function, `thread_func_param` is a parameter
 * that is passed to the thread function.
 */
void *mg_start_thread(void *(*thread_func)(void *), void *thread_func_param);
#endif

void mg_set_close_on_exec(sock_t);

#define MG_SOCK_STRINGIFY_IP 1
#define MG_SOCK_STRINGIFY_PORT 2
#define MG_SOCK_STRINGIFY_REMOTE 4
/*
 * Converts a connection's local or remote address into string.
 *
 * The `flags` parameter is a bit mask that controls the behaviour,
 * see `MG_SOCK_STRINGIFY_*` definitions.
 *
 * - MG_SOCK_STRINGIFY_IP - print IP address
 * - MG_SOCK_STRINGIFY_PORT - print port number
 * - MG_SOCK_STRINGIFY_REMOTE - print remote peer's IP/port, not local address
 *
 * If both port number and IP address are printed, they are separated by `:`.
 * If compiled with `-DMG_ENABLE_IPV6`, IPv6 addresses are supported.
 * Return length of the stringified address.
 */
int mg_conn_addr_to_str(struct mg_connection *c, char *buf, size_t len,
                        int flags);
#if MG_NET_IF == MG_NET_IF_SOCKET
/* Legacy interface. */
void mg_sock_to_str(sock_t sock, char *buf, size_t len, int flags);
#endif

/*
 * Convert the socket's address into string.
 *
 * `flags` is MG_SOCK_STRINGIFY_IP and/or MG_SOCK_STRINGIFY_PORT.
 */
int mg_sock_addr_to_str(const union socket_address *sa, char *buf, size_t len,
                        int flags);

#if MG_ENABLE_HEXDUMP
/*
 * Generates a human-readable hexdump of memory chunk.
 *
 * Takes a memory buffer `buf` of length `len` and creates a hex dump of that
 * buffer in `dst`. The generated output is a-la hexdump(1).
 * Returns the length of generated string, excluding terminating `\0`. If
 * returned length is bigger than `dst_len`, the overflow bytes are discarded.
 */
int mg_hexdump(const void *buf, int len, char *dst, int dst_len);

/* Same as mg_hexdump, but with output going to file instead of a buffer. */
void mg_hexdumpf(FILE *fp, const void *buf, int len);

/*
 * Generates human-readable hexdump of the data sent or received by the
 * connection. `path` is a file name where hexdump should be written.
 * `num_bytes` is a number of bytes sent/received. `ev` is one of the `MG_*`
 * events sent to an event handler. This function is supposed to be called from
 * the event handler.
 */
void mg_hexdump_connection(struct mg_connection *nc, const char *path,
                           const void *buf, int num_bytes, int ev);
#endif

/*
 * Returns true if target platform is big endian.
 */
int mg_is_big_endian(void);

/*
 * Use with cs_base64_init/update/finish in order to write out base64 in chunks.
 */
void mg_mbuf_append_base64_putc(char ch, void *user_data);

/*
 * Encode `len` bytes starting at `data` as base64 and append them to an mbuf.
 */
void mg_mbuf_append_base64(struct mbuf *mbuf, const void *data, size_t len);

/*
 * Generate a Basic Auth header and appends it to buf.
 * If pass is NULL, then user is expected to contain the credentials pair
 * already encoded as `user:pass`.
 */
void mg_basic_auth_header(const struct mg_str user, const struct mg_str pass,
                          struct mbuf *buf);

/*
 * URL-escape the specified string.
 * All characters acept letters, numbers and characters listed in
 * `safe` are escaped. If `hex_upper`is true, `A-F` are used for hex digits.
 * Input need not be NUL-terminated, but the returned string is.
 * Returned string is heap-allocated and must be free()'d.
 */
#define MG_URL_ENCODE_F_SPACE_AS_PLUS (1 << 0)
#define MG_URL_ENCODE_F_UPPERCASE_HEX (1 << 1)
struct mg_str mg_url_encode_opt(const struct mg_str src,
                                const struct mg_str safe, unsigned int flags);

/* Same as `mg_url_encode_opt(src, "._-$,;~()/", 0)`. */
struct mg_str mg_url_encode(const struct mg_str src);

#ifdef __cplusplus
}
#endif /* __cplusplus */
#endif /* CS_MONGOOSE_SRC_UTIL_H_ */
#ifdef MG_MODULE_LINES
#line 1 "mongoose/src/mg_http.h"
#endif

/*
 * === Common API reference
 */

#ifndef CS_MONGOOSE_SRC_HTTP_H_
#define CS_MONGOOSE_SRC_HTTP_H_

#if MG_ENABLE_HTTP

/* Amalgamated: #include "common/mg_str.h" */
/* Amalgamated: #include "mg_net.h" */

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

#ifndef MG_MAX_HTTP_HEADERS
#define MG_MAX_HTTP_HEADERS 30
#endif

#ifndef MG_HTTP_INDEX
#define MG_HTTP_INDEX "index.html"
#endif

#ifndef MG_PATH_MAX
#ifdef PATH_MAX
#define MG_PATH_MAX PATH_MAX
#else
#define MG_PATH_MAX 128
#endif
#endif

#ifndef MG_SOCK_LISTEN_BACKLOG_SIZE
#define MG_SOCK_LISTEN_BACKLOG_SIZE 128
#endif

#ifndef MG_DIRSEP
#define MG_DIRSEP '/'
#endif

#ifndef MG_ENABLE_POSIX_FS
#define MG_ENABLE_POSIX_FS 0
#endif

#ifndef MG_INVALID_SOCKET
#define MG_INVALID_SOCKET (-1)
#endif

#ifndef MG_SOCKET_TYPE
#define MG_SOCKET_TYPE int
#endif

#ifndef MG_SOCKET_ERRNO
#define MG_SOCKET_ERRNO errno
#endif

#if MG_ENABLE_EPOLL
#define MG_EPOLL_ADD(c)                                                    \
  do {                                                                     \
    struct epoll_event ev = {EPOLLIN | EPOLLERR | EPOLLHUP, {c}};          \
    epoll_ctl(c->mgr->epoll_fd, EPOLL_CTL_ADD, (int) (size_t) c->fd, &ev); \
  } while (0)
#define MG_EPOLL_MOD(c, wr)                                                \
  do {                                                                     \
    struct epoll_event ev = {EPOLLIN | EPOLLERR | EPOLLHUP, {c}};          \
    if (wr) ev.events |= EPOLLOUT;                                         \
    epoll_ctl(c->mgr->epoll_fd, EPOLL_CTL_MOD, (int) (size_t) c->fd, &ev); \
  } while (0)
#else
#define MG_EPOLL_ADD(c)
#define MG_EPOLL_MOD(c, wr)
#endif

#ifndef MG_ENABLE_PROFILE
#define MG_ENABLE_PROFILE 0
#endif

#ifndef MG_ENABLE_TCPIP_DRIVER_INIT    // mg_mgr_init() will also initialize
#define MG_ENABLE_TCPIP_DRIVER_INIT 1  // enabled built-in driver for
#endif                                 // Mongoose built-in network stack

#ifndef MG_TCPIP_IP                      // e.g. MG_IPV4(192, 168, 0, 223)
#define MG_TCPIP_IP MG_IPV4(0, 0, 0, 0)  // Default is 0.0.0.0 (DHCP)
#endif

#ifndef MG_TCPIP_MASK
#define MG_TCPIP_MASK MG_IPV4(0, 0, 0, 0)  // Default is 0.0.0.0 (DHCP)
#endif

#ifndef MG_TCPIP_GW
#define MG_TCPIP_GW MG_IPV4(0, 0, 0, 0)  // Default is 0.0.0.0 (DHCP)
#endif

#ifndef MG_SET_MAC_ADDRESS
#define MG_SET_MAC_ADDRESS(mac)
#endif

#ifndef MG_ENABLE_TCPIP_PRINT_DEBUG_STATS
#define MG_ENABLE_TCPIP_PRINT_DEBUG_STATS 0
#endif




// Describes an arbitrary chunk of memory
struct mg_str {
  char *buf;   // String data
  size_t len;  // String length
};

// Using macro to avoid shadowing C++ struct constructor, see #1298
#define mg_str(s) mg_str_s(s)

struct mg_str mg_str(const char *s);
struct mg_str mg_str_n(const char *s, size_t n);
int mg_casecmp(const char *s1, const char *s2);
int mg_strcmp(const struct mg_str str1, const struct mg_str str2);
int mg_strcasecmp(const struct mg_str str1, const struct mg_str str2);
struct mg_str mg_strdup(const struct mg_str s);
bool mg_match(struct mg_str str, struct mg_str pattern, struct mg_str *caps);
bool mg_span(struct mg_str s, struct mg_str *a, struct mg_str *b, char delim);

bool mg_str_to_num(struct mg_str, int base, void *val, size_t val_len);




// Single producer, single consumer non-blocking queue

struct mg_queue {
  char *buf;
  size_t size;
  volatile size_t tail;
  volatile size_t head;
};

void mg_queue_init(struct mg_queue *, char *, size_t);        // Init queue
size_t mg_queue_book(struct mg_queue *, char **buf, size_t);  // Reserve space
void mg_queue_add(struct mg_queue *, size_t);                 // Add new message
size_t mg_queue_next(struct mg_queue *, char **);  // Get oldest message
void mg_queue_del(struct mg_queue *, size_t);      // Delete oldest message




typedef void (*mg_pfn_t)(char, void *);                  // Output function
typedef size_t (*mg_pm_t)(mg_pfn_t, void *, va_list *);  // %M printer

size_t mg_vxprintf(void (*)(char, void *), void *, const char *fmt, va_list *);
size_t mg_xprintf(void (*fn)(char, void *), void *, const char *fmt, ...);






// Convenience wrappers around mg_xprintf
size_t mg_vsnprintf(char *buf, size_t len, const char *fmt, va_list *ap);
size_t mg_snprintf(char *, size_t, const char *fmt, ...);
char *mg_vmprintf(const char *fmt, va_list *ap);
char *mg_mprintf(const char *fmt, ...);
size_t mg_queue_vprintf(struct mg_queue *, const char *fmt, va_list *);
size_t mg_queue_printf(struct mg_queue *, const char *fmt, ...);

// %M print helper functions
size_t mg_print_base64(void (*out)(char, void *), void *arg, va_list *ap);
size_t mg_print_esc(void (*out)(char, void *), void *arg, va_list *ap);
size_t mg_print_hex(void (*out)(char, void *), void *arg, va_list *ap);
size_t mg_print_ip(void (*out)(char, void *), void *arg, va_list *ap);
size_t mg_print_ip_port(void (*out)(char, void *), void *arg, va_list *ap);
size_t mg_print_ip4(void (*out)(char, void *), void *arg, va_list *ap);
size_t mg_print_ip6(void (*out)(char, void *), void *arg, va_list *ap);
size_t mg_print_mac(void (*out)(char, void *), void *arg, va_list *ap);

// Various output functions
void mg_pfn_iobuf(char ch, void *param);  // param: struct mg_iobuf *
void mg_pfn_stdout(char c, void *param);  // param: ignored

// A helper macro for printing JSON: mg_snprintf(buf, len, "%m", MG_ESC("hi"))
#define MG_ESC(str) mg_print_esc, 0, (str)






enum { MG_LL_NONE, MG_LL_ERROR, MG_LL_INFO, MG_LL_DEBUG, MG_LL_VERBOSE };
extern int mg_log_level;  // Current log level, one of MG_LL_*

void mg_log(const char *fmt, ...);
void mg_log_prefix(int ll, const char *file, int line, const char *fname);
// bool mg_log2(int ll, const char *file, int line, const char *fmt, ...);
void mg_hexdump(const void *buf, size_t len);
void mg_log_set_fn(mg_pfn_t fn, void *param);

#define mg_log_set(level_) mg_log_level = (level_)

#if MG_ENABLE_LOG
#define MG_LOG(level, args)                                 \
  do {                                                      \
    if ((level) <= mg_log_level) {                          \
      mg_log_prefix((level), __FILE__, __LINE__, __func__); \
      mg_log args;                                          \
    }                                                       \
  } while (0)
#else
#define MG_LOG(level, args) \
  do {                      \
    if (0) mg_log args;     \
  } while (0)
#endif

#define MG_ERROR(args) MG_LOG(MG_LL_ERROR, args)
#define MG_INFO(args) MG_LOG(MG_LL_INFO, args)
#define MG_DEBUG(args) MG_LOG(MG_LL_DEBUG, args)
#define MG_VERBOSE(args) MG_LOG(MG_LL_VERBOSE, args)




struct mg_timer {
  unsigned long id;         // Timer ID
  uint64_t period_ms;       // Timer period in milliseconds
  uint64_t expire;          // Expiration timestamp in milliseconds
  unsigned flags;           // Possible flags values below
#define MG_TIMER_ONCE 0     // Call function once
#define MG_TIMER_REPEAT 1   // Call function periodically
#define MG_TIMER_RUN_NOW 2  // Call immediately when timer is set
  void (*fn)(void *);       // Function to call
  void *arg;                // Function argument
  struct mg_timer *next;    // Linkage
};

void mg_timer_init(struct mg_timer **head, struct mg_timer *timer,
                   uint64_t milliseconds, unsigned flags, void (*fn)(void *),
                   void *arg);
void mg_timer_free(struct mg_timer **head, struct mg_timer *);
void mg_timer_poll(struct mg_timer **head, uint64_t new_ms);
bool mg_timer_expired(uint64_t *expiration, uint64_t period, uint64_t now);





enum { MG_FS_READ = 1, MG_FS_WRITE = 2, MG_FS_DIR = 4 };

// Filesystem API functions
// st() returns MG_FS_* flags and populates file size and modification time
// ls() calls fn() for every directory entry, allowing to list a directory
//
// NOTE: UNIX-style shorthand names for the API functions are deliberately
// chosen to avoid conflicts with some libraries that make macros for e.g.
// stat(), write(), read() calls.
struct mg_fs {
  int (*st)(const char *path, size_t *size, time_t *mtime);  // stat file
  void (*ls)(const char *path, void (*fn)(const char *, void *),
             void *);  // List directory entries: call fn(file_name, fn_data)
                       // for each directory entry
  void *(*op)(const char *path, int flags);             // Open file
  void (*cl)(void *fd);                                 // Close file
  size_t (*rd)(void *fd, void *buf, size_t len);        // Read file
  size_t (*wr)(void *fd, const void *buf, size_t len);  // Write file
  size_t (*sk)(void *fd, size_t offset);                // Set file position
  bool (*mv)(const char *from, const char *to);         // Rename file
  bool (*rm)(const char *path);                         // Delete file
  bool (*mkd)(const char *path);                        // Create directory
};

extern struct mg_fs mg_fs_posix;   // POSIX open/close/read/write/seek
extern struct mg_fs mg_fs_packed;  // Packed FS, see examples/device-dashboard
extern struct mg_fs mg_fs_fat;     // FAT FS

// File descriptor
struct mg_fd {
  void *fd;
  struct mg_fs *fs;
};

struct mg_fd *mg_fs_open(struct mg_fs *fs, const char *path, int flags);
void mg_fs_close(struct mg_fd *fd);
bool mg_fs_ls(struct mg_fs *fs, const char *path, char *buf, size_t len);
struct mg_str mg_file_read(struct mg_fs *fs, const char *path);
bool mg_file_write(struct mg_fs *fs, const char *path, const void *, size_t);
bool mg_file_printf(struct mg_fs *fs, const char *path, const char *fmt, ...);

// Packed API
const char *mg_unpack(const char *path, size_t *size, time_t *mtime);
const char *mg_unlist(size_t no);             // Get no'th packed filename
struct mg_str mg_unpacked(const char *path);  // Packed file as mg_str







#if MG_ENABLE_ASSERT
#include <assert.h>
#elif !defined(assert)
#define assert(x)
#endif

void mg_bzero(volatile unsigned char *buf, size_t len);
bool mg_random(void *buf, size_t len);
char *mg_random_str(char *buf, size_t len);
uint16_t mg_ntohs(uint16_t net);
uint32_t mg_ntohl(uint32_t net);
uint32_t mg_crc32(uint32_t crc, const char *buf, size_t len);
uint64_t mg_millis(void);  // Return milliseconds since boot
bool mg_path_is_sane(const struct mg_str path);

#define mg_htons(x) mg_ntohs(x)
#define mg_htonl(x) mg_ntohl(x)

#define MG_U32(a, b, c, d)                                           \
  (((uint32_t) ((a) & 255) << 24) | ((uint32_t) ((b) & 255) << 16) | \
   ((uint32_t) ((c) & 255) << 8) | (uint32_t) ((d) & 255))

#define MG_IPV4(a, b, c, d) mg_htonl(MG_U32(a, b, c, d))

// For printing IPv4 addresses: printf("%d.%d.%d.%d\n", MG_IPADDR_PARTS(&ip))
#define MG_U8P(ADDR) ((uint8_t *) (ADDR))
#define MG_IPADDR_PARTS(ADDR) \
  MG_U8P(ADDR)[0], MG_U8P(ADDR)[1], MG_U8P(ADDR)[2], MG_U8P(ADDR)[3]

#define MG_LOAD_BE16(p) ((uint16_t) ((MG_U8P(p)[0] << 8U) | MG_U8P(p)[1]))
#define MG_LOAD_BE24(p) \
  ((uint32_t) ((MG_U8P(p)[0] << 16U) | (MG_U8P(p)[1] << 8U) | MG_U8P(p)[2]))
#define MG_STORE_BE16(p, n)           \
  do {                                \
    MG_U8P(p)[0] = ((n) >> 8U) & 255; \
    MG_U8P(p)[1] = (n) &255;          \
  } while (0)

#define MG_REG(x) ((volatile uint32_t *) (x))[0]
#define MG_BIT(x) (((uint32_t) 1U) << (x))
#define MG_SET_BITS(R, CLRMASK, SETMASK) (R) = ((R) & ~(CLRMASK)) | (SETMASK)

#define MG_ROUND_UP(x, a) ((a) == 0 ? (x) : ((((x) + (a) -1) / (a)) * (a)))
#define MG_ROUND_DOWN(x, a) ((a) == 0 ? (x) : (((x) / (a)) * (a)))

#if defined(__GNUC__)
#define MG_ARM_DISABLE_IRQ() asm volatile("cpsid i" : : : "memory")
#define MG_ARM_ENABLE_IRQ() asm volatile("cpsie i" : : : "memory")
#elif defined(__CCRH__)
#define MG_RH850_DISABLE_IRQ() __DI()
#define MG_RH850_ENABLE_IRQ() __EI()
#else
#define MG_ARM_DISABLE_IRQ()
#define MG_ARM_ENABLE_IRQ()
#endif

#if defined(__CC_ARM)
#define MG_DSB() __dsb(0xf)
#elif defined(__ARMCC_VERSION)
#define MG_DSB() __builtin_arm_dsb(0xf)
#elif defined(__GNUC__) && defined(__arm__) && defined(__thumb__)
#define MG_DSB() asm("DSB 0xf")
#elif defined(__ICCARM__)
#define MG_DSB() __iar_builtin_DSB()
#else
#define MG_DSB()
#endif

struct mg_addr;
int mg_check_ip_acl(struct mg_str acl, struct mg_addr *remote_ip);

// Linked list management macros
#define LIST_ADD_HEAD(type_, head_, elem_) \
  do {                                     \
    (elem_)->next = (*head_);              \
    *(head_) = (elem_);                    \
  } while (0)

#define LIST_ADD_TAIL(type_, head_, elem_) \
  do {                                     \
    type_ **h = head_;                     \
    while (*h != NULL) h = &(*h)->next;    \
    *h = (elem_);                          \
  } while (0)

#define LIST_DELETE(type_, head_, elem_)   \
  do {                                     \
    type_ **h = head_;                     \
    while (*h != (elem_)) h = &(*h)->next; \
    *h = (elem_)->next;                    \
  } while (0)



unsigned short mg_url_port(const char *url);
int mg_url_is_ssl(const char *url);
struct mg_str mg_url_host(const char *url);
struct mg_str mg_url_user(const char *url);
struct mg_str mg_url_pass(const char *url);
const char *mg_url_uri(const char *url);




struct mg_iobuf {
  unsigned char *buf;  // Pointer to stored data
  size_t size;         // Total size available
  size_t len;          // Current number of bytes
  size_t align;        // Alignment during allocation
};

int mg_iobuf_init(struct mg_iobuf *, size_t, size_t);
int mg_iobuf_resize(struct mg_iobuf *, size_t);
void mg_iobuf_free(struct mg_iobuf *);
size_t mg_iobuf_add(struct mg_iobuf *, size_t, const void *, size_t);
size_t mg_iobuf_del(struct mg_iobuf *, size_t ofs, size_t len);


size_t mg_base64_update(unsigned char input_byte, char *buf, size_t len);
size_t mg_base64_final(char *buf, size_t len);
size_t mg_base64_encode(const unsigned char *p, size_t n, char *buf, size_t);
size_t mg_base64_decode(const char *src, size_t n, char *dst, size_t);




typedef struct {
  uint32_t buf[4];
  uint32_t bits[2];
  unsigned char in[64];
} mg_md5_ctx;

void mg_md5_init(mg_md5_ctx *c);
void mg_md5_update(mg_md5_ctx *c, const unsigned char *data, size_t len);
void mg_md5_final(mg_md5_ctx *c, unsigned char[16]);




typedef struct {
  uint32_t state[5];
  uint32_t count[2];
  unsigned char buffer[64];
} mg_sha1_ctx;

void mg_sha1_init(mg_sha1_ctx *);
void mg_sha1_update(mg_sha1_ctx *, const unsigned char *data, size_t len);
void mg_sha1_final(unsigned char digest[20], mg_sha1_ctx *);
// https://github.com/B-Con/crypto-algorithms
// Author:     Brad Conte (brad AT bradconte.com)
// Disclaimer: This code is presented "as is" without any guarantees.
// Details:    Defines the API for the corresponding SHA1 implementation.
// Copyright:  public domain





typedef struct {
  uint32_t state[8];
  uint64_t bits;
  uint32_t len;
  unsigned char buffer[64];
} mg_sha256_ctx;

void mg_sha256_init(mg_sha256_ctx *);
void mg_sha256_update(mg_sha256_ctx *, const unsigned char *data, size_t len);
void mg_sha256_final(unsigned char digest[32], mg_sha256_ctx *);
void mg_hmac_sha256(uint8_t dst[32], uint8_t *key, size_t keysz, uint8_t *data,
                    size_t datasz);
#ifndef TLS_X15519_H
#define TLS_X15519_H



#define X25519_BYTES 32
extern const uint8_t X25519_BASE_POINT[X25519_BYTES];

int mg_tls_x25519(uint8_t out[X25519_BYTES], const uint8_t scalar[X25519_BYTES],
                  const uint8_t x1[X25519_BYTES], int clamp);


#endif /* TLS_X15519_H */
/******************************************************************************
 *
 * THIS SOURCE CODE IS HEREBY PLACED INTO THE PUBLIC DOMAIN FOR THE GOOD OF ALL
 *
 * This is a simple and straightforward implementation of AES-GCM authenticated
 * encryption. The focus of this work was correctness & accuracy. It is written
 * in straight 'C' without any particular focus upon optimization or speed. It
 * should be endian (memory byte order) neutral since the few places that care
 * are handled explicitly.
 *
 * This implementation of AES-GCM was created by Steven M. Gibson of GRC.com.
 *
 * It is intended for general purpose use, but was written in support of GRC's
 * reference implementation of the SQRL (Secure Quick Reliable Login) client.
 *
 * See:    http://csrc.nist.gov/publications/nistpubs/800-38D/SP-800-38D.pdf
 *         http://csrc.nist.gov/groups/ST/toolkit/BCM/documents/proposedmodes/ \
 *         gcm/gcm-revised-spec.pdf
 *
 * NO COPYRIGHT IS CLAIMED IN THIS WORK, HOWEVER, NEITHER IS ANY WARRANTY MADE
 * REGARDING ITS FITNESS FOR ANY PARTICULAR PURPOSE. USE IT AT YOUR OWN RISK.
 *
 *******************************************************************************/
#ifndef TLS_AES128_H
#define TLS_AES128_H

/******************************************************************************
 *  AES_CONTEXT : cipher context / holds inter-call data
 ******************************************************************************/
typedef struct {
  int mode;          // 1 for Encryption, 0 for Decryption
  int rounds;        // keysize-based rounds count
  uint32_t *rk;      // pointer to current round key
  uint32_t buf[68];  // key expansion buffer
} aes_context;


#define GCM_AUTH_FAILURE 0x55555555  // authentication failure

/******************************************************************************
 *  GCM_CONTEXT : MUST be called once before ANY use of this library
 ******************************************************************************/
int mg_gcm_initialize(void);

//
//  aes-gcm.h
//  MKo
//
//  Created by Markus Kosmal on 20/11/14.
//
//
int mg_aes_gcm_encrypt(unsigned char *output, const unsigned char *input,
                       size_t input_length, const unsigned char *key,
                       const size_t key_len, const unsigned char *iv,
                       const size_t iv_len, unsigned char *aead,
                       size_t aead_len, unsigned char *tag,
                       const size_t tag_len);

int mg_aes_gcm_decrypt(unsigned char *output, const unsigned char *input,
                       size_t input_length, const unsigned char *key,
                       const size_t key_len, const unsigned char *iv,
                       const size_t iv_len);

#endif /* TLS_AES128_H */

// End of aes128 PD



#define MG_UECC_SUPPORTS_secp256r1 1
/* Copyright 2014, Kenneth MacKay. Licensed under the BSD 2-clause license. */

#ifndef _UECC_H_
#define _UECC_H_

/* Platform selection options.
If MG_UECC_PLATFORM is not defined, the code will try to guess it based on
compiler macros. Possible values for MG_UECC_PLATFORM are defined below: */
#define mg_uecc_arch_other 0
#define mg_uecc_x86 1
#define mg_uecc_x86_64 2
#define mg_uecc_arm 3
#define mg_uecc_arm_thumb 4
#define mg_uecc_arm_thumb2 5
#define mg_uecc_arm64 6
#define mg_uecc_avr 7

/* If desired, you can define MG_UECC_WORD_SIZE as appropriate for your platform
(1, 4, or 8 bytes). If MG_UECC_WORD_SIZE is not explicitly defined then it will
be automatically set based on your platform. */

/* Optimization level; trade speed for code size.
   Larger values produce code that is faster but larger.
   Currently supported values are 0 - 4; 0 is unusably slow for most
   applications. Optimization level 4 currently only has an effect ARM platforms
   where more than one curve is enabled. */
#ifndef MG_UECC_OPTIMIZATION_LEVEL
#define MG_UECC_OPTIMIZATION_LEVEL 2
#endif

/* MG_UECC_SQUARE_FUNC - If enabled (defined as nonzero), this will cause a
specific function to be used for (scalar) squaring instead of the generic
multiplication function. This can make things faster somewhat faster, but
increases the code size. */
#ifndef MG_UECC_SQUARE_FUNC
#define MG_UECC_SQUARE_FUNC 0
#endif

/* MG_UECC_VLI_NATIVE_LITTLE_ENDIAN - If enabled (defined as nonzero), this will
switch to native little-endian format for *all* arrays passed in and out of the
public API. This includes public and private keys, shared secrets, signatures
and message hashes. Using this switch reduces the amount of call stack memory
used by uECC, since less intermediate translations are required. Note that this
will *only* work on native little-endian processors and it will treat the
uint8_t arrays passed into the public API as word arrays, therefore requiring
the provided byte arrays to be word aligned on architectures that do not support
unaligned accesses. IMPORTANT: Keys and signatures generated with
MG_UECC_VLI_NATIVE_LITTLE_ENDIAN=1 are incompatible with keys and signatures
generated with MG_UECC_VLI_NATIVE_LITTLE_ENDIAN=0; all parties must use the same
endianness. */
#ifndef MG_UECC_VLI_NATIVE_LITTLE_ENDIAN
#define MG_UECC_VLI_NATIVE_LITTLE_ENDIAN 0
#endif

/* Curve support selection. Set to 0 to remove that curve. */
#ifndef MG_UECC_SUPPORTS_secp160r1
#define MG_UECC_SUPPORTS_secp160r1 0
#endif
#ifndef MG_UECC_SUPPORTS_secp192r1
#define MG_UECC_SUPPORTS_secp192r1 0
#endif
#ifndef MG_UECC_SUPPORTS_secp224r1
#define MG_UECC_SUPPORTS_secp224r1 0
#endif
#ifndef MG_UECC_SUPPORTS_secp256r1
#define MG_UECC_SUPPORTS_secp256r1 1
#endif
#ifndef MG_UECC_SUPPORTS_secp256k1
#define MG_UECC_SUPPORTS_secp256k1 0
#endif

/* Specifies whether compressed point format is supported.
   Set to 0 to disable point compression/decompression functions. */
#ifndef MG_UECC_SUPPORT_COMPRESSED_POINT
#define MG_UECC_SUPPORT_COMPRESSED_POINT 1
#endif

struct MG_UECC_Curve_t;
typedef const struct MG_UECC_Curve_t *MG_UECC_Curve;

#ifdef __cplusplus
extern "C" {
#endif

#if MG_UECC_SUPPORTS_secp160r1
MG_UECC_Curve mg_uecc_secp160r1(void);
#endif
#if MG_UECC_SUPPORTS_secp192r1
MG_UECC_Curve mg_uecc_secp192r1(void);
#endif
#if MG_UECC_SUPPORTS_secp224r1
MG_UECC_Curve mg_uecc_secp224r1(void);
#endif
#if MG_UECC_SUPPORTS_secp256r1
MG_UECC_Curve mg_uecc_secp256r1(void);
#endif
#if MG_UECC_SUPPORTS_secp256k1
MG_UECC_Curve mg_uecc_secp256k1(void);
#endif

/* MG_UECC_RNG_Function type
The RNG function should fill 'size' random bytes into 'dest'. It should return 1
if 'dest' was filled with random data, or 0 if the random data could not be
generated. The filled-in values should be either truly random, or from a
cryptographically-secure PRNG.

A correctly functioning RNG function must be set (using mg_uecc_set_rng())
before calling mg_uecc_make_key() or mg_uecc_sign().

Setting a correctly functioning RNG function improves the resistance to
side-channel attacks for mg_uecc_shared_secret() and
mg_uecc_sign_deterministic().

A correct RNG function is set by default when building for Windows, Linux, or OS
X. If you are building on another POSIX-compliant system that supports
/dev/random or /dev/urandom, you can define MG_UECC_POSIX to use the predefined
RNG. For embedded platforms there is no predefined RNG function; you must
provide your own.
*/
typedef int (*MG_UECC_RNG_Function)(uint8_t *dest, unsigned size);

/* mg_uecc_set_rng() function.
Set the function that will be used to generate random bytes. The RNG function
should return 1 if the random data was generated, or 0 if the random data could
not be generated.

On platforms where there is no predefined RNG function (eg embedded platforms),
this must be called before mg_uecc_make_key() or mg_uecc_sign() are used.

Inputs:
    rng_function - The function that will be used to generate random bytes.
*/
void mg_uecc_set_rng(MG_UECC_RNG_Function rng_function);

/* mg_uecc_get_rng() function.

Returns the function that will be used to generate random bytes.
*/
MG_UECC_RNG_Function mg_uecc_get_rng(void);

/* mg_uecc_curve_private_key_size() function.

Returns the size of a private key for the curve in bytes.
*/
int mg_uecc_curve_private_key_size(MG_UECC_Curve curve);

/* mg_uecc_curve_public_key_size() function.

Returns the size of a public key for the curve in bytes.
*/
int mg_uecc_curve_public_key_size(MG_UECC_Curve curve);

/* mg_uecc_make_key() function.
Create a public/private key pair.

Outputs:
    public_key  - Will be filled in with the public key. Must be at least 2 *
the curve size (in bytes) long. For example, if the curve is secp256r1,
public_key must be 64 bytes long. private_key - Will be filled in with the
private key. Must be as long as the curve order; this is typically the same as
the curve size, except for secp160r1. For example, if the curve is secp256r1,
private_key must be 32 bytes long.

                  For secp160r1, private_key must be 21 bytes long! Note that
the first byte will almost always be 0 (there is about a 1 in 2^80 chance of it
being non-zero).

Returns 1 if the key pair was generated successfully, 0 if an error occurred.
*/
int mg_uecc_make_key(uint8_t *public_key, uint8_t *private_key,
                     MG_UECC_Curve curve);

/* mg_uecc_shared_secret() function.
Compute a shared secret given your secret key and someone else's public key. If
the public key is not from a trusted source and has not been previously
verified, you should verify it first using mg_uecc_valid_public_key(). Note: It
is recommended that you hash the result of mg_uecc_shared_secret() before using
it for symmetric encryption or HMAC.

Inputs:
    public_key  - The public key of the remote party.
    private_key - Your private key.

Outputs:
    secret - Will be filled in with the shared secret value. Must be the same
size as the curve size; for example, if the curve is secp256r1, secret must be
32 bytes long.

Returns 1 if the shared secret was generated successfully, 0 if an error
occurred.
*/
int mg_uecc_shared_secret(const uint8_t *public_key, const uint8_t *private_key,
                          uint8_t *secret, MG_UECC_Curve curve);

#if MG_UECC_SUPPORT_COMPRESSED_POINT
/* mg_uecc_compress() function.
Compress a public key.

Inputs:
    public_key - The public key to compress.

Outputs:
    compressed - Will be filled in with the compressed public key. Must be at
least (curve size + 1) bytes long; for example, if the curve is secp256r1,
                 compressed must be 33 bytes long.
*/
void mg_uecc_compress(const uint8_t *public_key, uint8_t *compressed,
                      MG_UECC_Curve curve);

/* mg_uecc_decompress() function.
Decompress a compressed public key.

Inputs:
    compressed - The compressed public key.

Outputs:
    public_key - Will be filled in with the decompressed public key.
*/
void mg_uecc_decompress(const uint8_t *compressed, uint8_t *public_key,
                        MG_UECC_Curve curve);
#endif /* MG_UECC_SUPPORT_COMPRESSED_POINT */

/* mg_uecc_valid_public_key() function.
Check to see if a public key is valid.

Note that you are not required to check for a valid public key before using any
other uECC functions. However, you may wish to avoid spending CPU time computing
a shared secret or verifying a signature using an invalid public key.

Inputs:
    public_key - The public key to check.

Returns 1 if the public key is valid, 0 if it is invalid.
*/
int mg_uecc_valid_public_key(const uint8_t *public_key, MG_UECC_Curve curve);

/* mg_uecc_compute_public_key() function.
Compute the corresponding public key for a private key.

Inputs:
    private_key - The private key to compute the public key for

Outputs:
    public_key - Will be filled in with the corresponding public key

Returns 1 if the key was computed successfully, 0 if an error occurred.
*/
int mg_uecc_compute_public_key(const uint8_t *private_key, uint8_t *public_key,
                               MG_UECC_Curve curve);

/* mg_uecc_sign() function.
Generate an ECDSA signature for a given hash value.

Usage: Compute a hash of the data you wish to sign (SHA-2 is recommended) and
pass it in to this function along with your private key.

Inputs:
    private_key  - Your private key.
    message_hash - The hash of the message to sign.
    hash_size    - The size of message_hash in bytes.

Outputs:
    signature - Will be filled in with the signature value. Must be at least 2 *
curve size long. For example, if the curve is secp256r1, signature must be 64
bytes long.

Returns 1 if the signature generated successfully, 0 if an error occurred.
*/
int mg_uecc_sign(const uint8_t *private_key, const uint8_t *message_hash,
                 unsigned hash_size, uint8_t *signature, MG_UECC_Curve curve);

/* MG_UECC_HashContext structure.
This is used to pass in an arbitrary hash function to
mg_uecc_sign_deterministic(). The structure will be used for multiple hash
computations; each time a new hash is computed, init_hash() will be called,
followed by one or more calls to update_hash(), and finally a call to
finish_hash() to produce the resulting hash.

The intention is that you will create a structure that includes
MG_UECC_HashContext followed by any hash-specific data. For example:

typedef struct SHA256_HashContext {
    MG_UECC_HashContext uECC;
    SHA256_CTX ctx;
} SHA256_HashContext;

void init_SHA256(MG_UECC_HashContext *base) {
    SHA256_HashContext *context = (SHA256_HashContext *)base;
    SHA256_Init(&context->ctx);
}

void update_SHA256(MG_UECC_HashContext *base,
                   const uint8_t *message,
                   unsigned message_size) {
    SHA256_HashContext *context = (SHA256_HashContext *)base;
    SHA256_Update(&context->ctx, message, message_size);
}

void finish_SHA256(MG_UECC_HashContext *base, uint8_t *hash_result) {
    SHA256_HashContext *context = (SHA256_HashContext *)base;
    SHA256_Final(hash_result, &context->ctx);
}

... when signing ...
{
    uint8_t tmp[32 + 32 + 64];
    SHA256_HashContext ctx = {{&init_SHA256, &update_SHA256, &finish_SHA256, 64,
32, tmp}}; mg_uecc_sign_deterministic(key, message_hash, &ctx.uECC, signature);
}
*/
typedef struct MG_UECC_HashContext {
  void (*init_hash)(const struct MG_UECC_HashContext *context);
  void (*update_hash)(const struct MG_UECC_HashContext *context,
                      const uint8_t *message, unsigned message_size);
  void (*finish_hash)(const struct MG_UECC_HashContext *context,
                      uint8_t *hash_result);
  unsigned
      block_size; /* Hash function block size in bytes, eg 64 for SHA-256. */
  unsigned
      result_size; /* Hash function result size in bytes, eg 32 for SHA-256. */
  uint8_t *tmp;    /* Must point to a buffer of at least (2 * result_size +
                      block_size) bytes. */
} MG_UECC_HashContext;

/* mg_uecc_sign_deterministic() function.
Generate an ECDSA signature for a given hash value, using a deterministic
algorithm (see RFC 6979). You do not need to set the RNG using mg_uecc_set_rng()
before calling this function; however, if the RNG is defined it will improve
resistance to side-channel attacks.

Usage: Compute a hash of the data you wish to sign (SHA-2 is recommended) and
pass it to this function along with your private key and a hash context. Note
that the message_hash does not need to be computed with the same hash function
used by hash_context.

Inputs:
    private_key  - Your private key.
    message_hash - The hash of the message to sign.
    hash_size    - The size of message_hash in bytes.
    hash_context - A hash context to use.

Outputs:
    signature - Will be filled in with the signature value.

Returns 1 if the signature generated successfully, 0 if an error occurred.
*/
int mg_uecc_sign_deterministic(const uint8_t *private_key,
                               const uint8_t *message_hash, unsigned hash_size,
                               const MG_UECC_HashContext *hash_context,
                               uint8_t *signature, MG_UECC_Curve curve);

/* mg_uecc_verify() function.
Verify an ECDSA signature.

Usage: Compute the hash of the signed data using the same hash as the signer and
pass it to this function along with the signer's public key and the signature
values (r and s).

Inputs:
    public_key   - The signer's public key.
    message_hash - The hash of the signed data.
    hash_size    - The size of message_hash in bytes.
    signature    - The signature value.

Returns 1 if the signature is valid, 0 if it is invalid.
*/
int mg_uecc_verify(const uint8_t *public_key, const uint8_t *message_hash,
                   unsigned hash_size, const uint8_t *signature,
                   MG_UECC_Curve curve);

#ifdef __cplusplus
} /* end of extern "C" */
#endif

#endif /* _UECC_H_ */

/* Copyright 2015, Kenneth MacKay. Licensed under the BSD 2-clause license. */

#ifndef _UECC_TYPES_H_
#define _UECC_TYPES_H_

#ifndef MG_UECC_PLATFORM
#if defined(__AVR__) && __AVR__
#define MG_UECC_PLATFORM mg_uecc_avr
#elif defined(__thumb2__) || \
    defined(_M_ARMT) /* I think MSVC only supports Thumb-2 targets */
#define MG_UECC_PLATFORM mg_uecc_arm_thumb2
#elif defined(__thumb__)
#define MG_UECC_PLATFORM mg_uecc_arm_thumb
#elif defined(__arm__) || defined(_M_ARM)
#define MG_UECC_PLATFORM mg_uecc_arm
#elif defined(__aarch64__)
#define MG_UECC_PLATFORM mg_uecc_arm64
#elif defined(__i386__) || defined(_M_IX86) || defined(_X86_) || \
    defined(__I86__)
#define MG_UECC_PLATFORM mg_uecc_x86
#elif defined(__amd64__) || defined(_M_X64)
#define MG_UECC_PLATFORM mg_uecc_x86_64
#else
#define MG_UECC_PLATFORM mg_uecc_arch_other
#endif
#endif

#ifndef MG_UECC_ARM_USE_UMAAL
#if (MG_UECC_PLATFORM == mg_uecc_arm) && (__ARM_ARCH >= 6)
#define MG_UECC_ARM_USE_UMAAL 1
#elif (MG_UECC_PLATFORM == mg_uecc_arm_thumb2) && (__ARM_ARCH >= 6) && \
    (!defined(__ARM_ARCH_7M__) || !__ARM_ARCH_7M__)
#define MG_UECC_ARM_USE_UMAAL 1
#else
#define MG_UECC_ARM_USE_UMAAL 0
#endif
#endif

#ifndef MG_UECC_WORD_SIZE
#if MG_UECC_PLATFORM == mg_uecc_avr
#define MG_UECC_WORD_SIZE 1
#elif (MG_UECC_PLATFORM == mg_uecc_x86_64 || MG_UECC_PLATFORM == mg_uecc_arm64)
#define MG_UECC_WORD_SIZE 8
#else
#define MG_UECC_WORD_SIZE 4
#endif
#endif

#if (MG_UECC_WORD_SIZE != 1) && (MG_UECC_WORD_SIZE != 4) && \
    (MG_UECC_WORD_SIZE != 8)
#error "Unsupported value for MG_UECC_WORD_SIZE"
#endif

#if ((MG_UECC_PLATFORM == mg_uecc_avr) && (MG_UECC_WORD_SIZE != 1))
#pragma message("MG_UECC_WORD_SIZE must be 1 for AVR")
#undef MG_UECC_WORD_SIZE
#define MG_UECC_WORD_SIZE 1
#endif

#if ((MG_UECC_PLATFORM == mg_uecc_arm ||         \
      MG_UECC_PLATFORM == mg_uecc_arm_thumb ||   \
      MG_UECC_PLATFORM == mg_uecc_arm_thumb2) && \
     (MG_UECC_WORD_SIZE != 4))
#pragma message("MG_UECC_WORD_SIZE must be 4 for ARM")
#undef MG_UECC_WORD_SIZE
#define MG_UECC_WORD_SIZE 4
#endif

typedef int8_t wordcount_t;
typedef int16_t bitcount_t;
typedef int8_t cmpresult_t;

#if (MG_UECC_WORD_SIZE == 1)

typedef uint8_t mg_uecc_word_t;
typedef uint16_t mg_uecc_dword_t;

#define HIGH_BIT_SET 0x80
#define MG_UECC_WORD_BITS 8
#define MG_UECC_WORD_BITS_SHIFT 3
#define MG_UECC_WORD_BITS_MASK 0x07

#elif (MG_UECC_WORD_SIZE == 4)

typedef uint32_t mg_uecc_word_t;
typedef uint64_t mg_uecc_dword_t;

#define HIGH_BIT_SET 0x80000000
#define MG_UECC_WORD_BITS 32
#define MG_UECC_WORD_BITS_SHIFT 5
#define MG_UECC_WORD_BITS_MASK 0x01F

#elif (MG_UECC_WORD_SIZE == 8)

typedef uint64_t mg_uecc_word_t;

#define HIGH_BIT_SET 0x8000000000000000U
#define MG_UECC_WORD_BITS 64
#define MG_UECC_WORD_BITS_SHIFT 6
#define MG_UECC_WORD_BITS_MASK 0x03F

#endif /* MG_UECC_WORD_SIZE */

#endif /* _UECC_TYPES_H_ */

/* Copyright 2015, Kenneth MacKay. Licensed under the BSD 2-clause license. */

#ifndef _UECC_VLI_H_
#define _UECC_VLI_H_

// 
// 

/* Functions for raw large-integer manipulation. These are only available
   if uECC.c is compiled with MG_UECC_ENABLE_VLI_API defined to 1. */
#ifndef MG_UECC_ENABLE_VLI_API
#define MG_UECC_ENABLE_VLI_API 0
#endif

#ifdef __cplusplus
extern "C" {
#endif

#if MG_UECC_ENABLE_VLI_API

void mg_uecc_vli_clear(mg_uecc_word_t *vli, wordcount_t num_words);

/* Constant-time comparison to zero - secure way to compare long integers */
/* Returns 1 if vli == 0, 0 otherwise. */
mg_uecc_word_t mg_uecc_vli_isZero(const mg_uecc_word_t *vli,
                                  wordcount_t num_words);

/* Returns nonzero if bit 'bit' of vli is set. */
mg_uecc_word_t mg_uecc_vli_testBit(const mg_uecc_word_t *vli, bitcount_t bit);

/* Counts the number of bits required to represent vli. */
bitcount_t mg_uecc_vli_numBits(const mg_uecc_word_t *vli,
                               const wordcount_t max_words);

/* Sets dest = src. */
void mg_uecc_vli_set(mg_uecc_word_t *dest, const mg_uecc_word_t *src,
                     wordcount_t num_words);

/* Constant-time comparison function - secure way to compare long integers */
/* Returns one if left == right, zero otherwise */
mg_uecc_word_t mg_uecc_vli_equal(const mg_uecc_word_t *left,
                                 const mg_uecc_word_t *right,
                                 wordcount_t num_words);

/* Constant-time comparison function - secure way to compare long integers */
/* Returns sign of left - right, in constant time. */
cmpresult_t mg_uecc_vli_cmp(const mg_uecc_word_t *left,
                            const mg_uecc_word_t *right, wordcount_t num_words);

/* Computes vli = vli >> 1. */
void mg_uecc_vli_rshift1(mg_uecc_word_t *vli, wordcount_t num_words);

/* Computes result = left + right, returning carry. Can modify in place. */
mg_uecc_word_t mg_uecc_vli_add(mg_uecc_word_t *result,
                               const mg_uecc_word_t *left,
                               const mg_uecc_word_t *right,
                               wordcount_t num_words);

/* Computes result = left - right, returning borrow. Can modify in place. */
mg_uecc_word_t mg_uecc_vli_sub(mg_uecc_word_t *result,
                               const mg_uecc_word_t *left,
                               const mg_uecc_word_t *right,
                               wordcount_t num_words);

/* Computes result = left * right. Result must be 2 * num_words long. */
void mg_uecc_vli_mult(mg_uecc_word_t *result, const mg_uecc_word_t *left,
                      const mg_uecc_word_t *right, wordcount_t num_words);

/* Computes result = left^2. Result must be 2 * num_words long. */
void mg_uecc_vli_square(mg_uecc_word_t *result, const mg_uecc_word_t *left,
                        wordcount_t num_words);

/* Computes result = (left + right) % mod.
   Assumes that left < mod and right < mod, and that result does not overlap
   mod. */
void mg_uecc_vli_modAdd(mg_uecc_word_t *result, const mg_uecc_word_t *left,
                        const mg_uecc_word_t *right, const mg_uecc_word_t *mod,
                        wordcount_t num_words);

/* Computes result = (left - right) % mod.
   Assumes that left < mod and right < mod, and that result does not overlap
   mod. */
void mg_uecc_vli_modSub(mg_uecc_word_t *result, const mg_uecc_word_t *left,
                        const mg_uecc_word_t *right, const mg_uecc_word_t *mod,
                        wordcount_t num_words);

/* Computes result = product % mod, where product is 2N words long.
   Currently only designed to work for mod == curve->p or curve_n. */
void mg_uecc_vli_mmod(mg_uecc_word_t *result, mg_uecc_word_t *product,
                      const mg_uecc_word_t *mod, wordcount_t num_words);

/* Calculates result = product (mod curve->p), where product is up to
   2 * curve->num_words long. */
void mg_uecc_vli_mmod_fast(mg_uecc_word_t *result, mg_uecc_word_t *product,
                           MG_UECC_Curve curve);

/* Computes result = (left * right) % mod.
   Currently only designed to work for mod == curve->p or curve_n. */
void mg_uecc_vli_modMult(mg_uecc_word_t *result, const mg_uecc_word_t *left,
                         const mg_uecc_word_t *right, const mg_uecc_word_t *mod,
                         wordcount_t num_words);

/* Computes result = (left * right) % curve->p. */
void mg_uecc_vli_modMult_fast(mg_uecc_word_t *result,
                              const mg_uecc_word_t *left,
                              const mg_uecc_word_t *right, MG_UECC_Curve curve);

/* Computes result = left^2 % mod.
   Currently only designed to work for mod == curve->p or curve_n. */
void mg_uecc_vli_modSquare(mg_uecc_word_t *result, const mg_uecc_word_t *left,
                           const mg_uecc_word_t *mod, wordcount_t num_words);

/* Computes result = left^2 % curve->p. */
void mg_uecc_vli_modSquare_fast(mg_uecc_word_t *result,
                                const mg_uecc_word_t *left,
                                MG_UECC_Curve curve);

/* Computes result = (1 / input) % mod.*/
void mg_uecc_vli_modInv(mg_uecc_word_t *result, const mg_uecc_word_t *input,
                        const mg_uecc_word_t *mod, wordcount_t num_words);

#if MG_UECC_SUPPORT_COMPRESSED_POINT
/* Calculates a = sqrt(a) (mod curve->p) */
void mg_uecc_vli_mod_sqrt(mg_uecc_word_t *a, MG_UECC_Curve curve);
#endif

/* Converts an integer in uECC native format to big-endian bytes. */
void mg_uecc_vli_nativeToBytes(uint8_t *bytes, int num_bytes,
                               const mg_uecc_word_t *native);
/* Converts big-endian bytes to an integer in uECC native format. */
void mg_uecc_vli_bytesToNative(mg_uecc_word_t *native, const uint8_t *bytes,
                               int num_bytes);

unsigned mg_uecc_curve_num_words(MG_UECC_Curve curve);
unsigned mg_uecc_curve_num_bytes(MG_UECC_Curve curve);
unsigned mg_uecc_curve_num_bits(MG_UECC_Curve curve);
unsigned mg_uecc_curve_num_n_words(MG_UECC_Curve curve);
unsigned mg_uecc_curve_num_n_bytes(MG_UECC_Curve curve);
unsigned mg_uecc_curve_num_n_bits(MG_UECC_Curve curve);

const mg_uecc_word_t *mg_uecc_curve_p(MG_UECC_Curve curve);
const mg_uecc_word_t *mg_uecc_curve_n(MG_UECC_Curve curve);
const mg_uecc_word_t *mg_uecc_curve_G(MG_UECC_Curve curve);
const mg_uecc_word_t *mg_uecc_curve_b(MG_UECC_Curve curve);

int mg_uecc_valid_point(const mg_uecc_word_t *point, MG_UECC_Curve curve);

/* Multiplies a point by a scalar. Points are represented by the X coordinate
   followed by the Y coordinate in the same array, both coordinates are
   curve->num_words long. Note that scalar must be curve->num_n_words long (NOT
   curve->num_words). */
void mg_uecc_point_mult(mg_uecc_word_t *result, const mg_uecc_word_t *point,
                        const mg_uecc_word_t *scalar, MG_UECC_Curve curve);

/* Generates a random integer in the range 0 < random < top.
   Both random and top have num_words words. */
int mg_uecc_generate_random_int(mg_uecc_word_t *random,
                                const mg_uecc_word_t *top,
                                wordcount_t num_words);

#endif /* MG_UECC_ENABLE_VLI_API */

#ifdef __cplusplus
} /* end of extern "C" */
#endif

#endif /* _UECC_VLI_H_ */

// End of uecc BSD-2
// portable8439 v1.0.1
// Source: https://github.com/DavyLandman/portable8439
// Licensed under CC0-1.0
// Contains poly1305-donna e6ad6e091d30d7f4ec2d4f978be1fcfcbce72781 (Public
// Domain)




#ifndef __PORTABLE_8439_H
#define __PORTABLE_8439_H
#if defined(__cplusplus)
extern "C" {
#endif

// provide your own decl specificier like -DPORTABLE_8439_DECL=ICACHE_RAM_ATTR
#ifndef PORTABLE_8439_DECL
#define PORTABLE_8439_DECL
#endif

#define MG_F_WEBSOCKET_NO_DEFRAG MG_F_PROTO_1
#define MG_F_DELETE_CHUNK MG_F_PROTO_2

/*
 This library implements RFC 8439 a.k.a. ChaCha20-Poly1305 AEAD

 You can use this library to avoid attackers mutating or reusing your
 encrypted messages. This does assume you never reuse a nonce+key pair and,
 if possible, carefully pick your associated data.
*/

/* Make sure we are either nested in C++ or running in a C99+ compiler
#if !defined(__cplusplus) && !defined(_MSC_VER) && \
    (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 199901L)
#error "C99 or newer required"
#endif */

// #if CHAR_BIT > 8
// #    error "Systems without native octals not suppoted"
// #endif

#if defined(_MSC_VER) || defined(__cplusplus)
// add restrict support is possible
#if (defined(_MSC_VER) && _MSC_VER >= 1900) || defined(__clang__) || \
    defined(__GNUC__)
#define restrict __restrict
#else
#define restrict
#endif
#endif

#define RFC_8439_TAG_SIZE (16)
#define RFC_8439_KEY_SIZE (32)
#define RFC_8439_NONCE_SIZE (12)

/*
    Encrypt/Seal plain text bytes into a cipher text that can only be
    decrypted by knowing the key, nonce and associated data.

    input:
        - key: RFC_8439_KEY_SIZE bytes that all parties have agreed
            upon beforehand
        - nonce: RFC_8439_NONCE_SIZE bytes that should never be repeated
            for the same key. A counter or a pseudo-random value are fine.
        - ad: associated data to include with calculating the tag of the
            cipher text. Can be null for empty.
        - plain_text: data to be encrypted, pointer + size should not overlap
            with cipher_text pointer

    output:
        - cipher_text: encrypted plain_text with a tag appended. Make sure to
            allocate at least plain_text_size + RFC_8439_TAG_SIZE

    returns:
        - size of bytes written to cipher_text, can be -1 if overlapping
            pointers are passed for plain_text and cipher_text
*/
PORTABLE_8439_DECL size_t mg_chacha20_poly1305_encrypt(
    uint8_t *restrict cipher_text, const uint8_t key[RFC_8439_KEY_SIZE],
    const uint8_t nonce[RFC_8439_NONCE_SIZE], const uint8_t *restrict ad,
    size_t ad_size, const uint8_t *restrict plain_text, size_t plain_text_size);

/*
    Decrypt/unseal cipher text given the right key, nonce, and additional data.

    input:
        - key: RFC_8439_KEY_SIZE bytes that all parties have agreed
            upon beforehand
        - nonce: RFC_8439_NONCE_SIZE bytes that should never be repeated for
            the same key. A counter or a pseudo-random value are fine.
        - ad: associated data to include with calculating the tag of the
            cipher text. Can be null for empty.
        - cipher_text: encrypted message.

    output:
        - plain_text: data to be encrypted, pointer + size should not overlap
            with cipher_text pointer, leave at least enough room for
            cipher_text_size - RFC_8439_TAG_SIZE

    returns:
        - size of bytes written to plain_text, -1 signals either:
            - incorrect key/nonce/ad
            - corrupted cipher_text
            - overlapping pointers are passed for plain_text and cipher_text
*/
PORTABLE_8439_DECL size_t mg_chacha20_poly1305_decrypt(
    uint8_t *restrict plain_text, const uint8_t key[RFC_8439_KEY_SIZE],
    const uint8_t nonce[RFC_8439_NONCE_SIZE],
    const uint8_t *restrict cipher_text, size_t cipher_text_size);
#if defined(__cplusplus)
}
#endif
#endif


struct mg_connection;
typedef void (*mg_event_handler_t)(struct mg_connection *, int ev,
                                   void *ev_data);
void mg_call(struct mg_connection *c, int ev, void *ev_data);
void mg_error(struct mg_connection *c, const char *fmt, ...);

enum {
  MG_EV_ERROR,      // Error                        char *error_message
  MG_EV_OPEN,       // Connection created           NULL
  MG_EV_POLL,       // mg_mgr_poll iteration        uint64_t *uptime_millis
  MG_EV_RESOLVE,    // Host name is resolved        NULL
  MG_EV_CONNECT,    // Connection established       NULL
  MG_EV_ACCEPT,     // Connection accepted          NULL
  MG_EV_TLS_HS,     // TLS handshake succeeded      NULL
  MG_EV_READ,       // Data received from socket    long *bytes_read
  MG_EV_WRITE,      // Data written to socket       long *bytes_written
  MG_EV_CLOSE,      // Connection closed            NULL
  MG_EV_HTTP_HDRS,  // HTTP headers                 struct mg_http_message *
  MG_EV_HTTP_MSG,   // Full HTTP request/response   struct mg_http_message *
  MG_EV_WS_OPEN,    // Websocket handshake done     struct mg_http_message *
  MG_EV_WS_MSG,     // Websocket msg, text or bin   struct mg_ws_message *
  MG_EV_WS_CTL,     // Websocket control msg        struct mg_ws_message *
  MG_EV_MQTT_CMD,   // MQTT low-level command       struct mg_mqtt_message *
  MG_EV_MQTT_MSG,   // MQTT PUBLISH received        struct mg_mqtt_message *
  MG_EV_MQTT_OPEN,  // MQTT CONNACK received        int *connack_status_code
  MG_EV_SNTP_TIME,  // SNTP time received           uint64_t *epoch_millis
  MG_EV_WAKEUP,     // mg_wakeup() data received    struct mg_str *data
  MG_EV_USER        // Starting ID for user events
};









struct mg_dns {
  const char *url;          // DNS server URL
  struct mg_connection *c;  // DNS server connection
};

struct mg_addr {
  uint8_t ip[16];    // Holds IPv4 or IPv6 address, in network byte order
  uint16_t port;     // TCP or UDP port in network byte order
  uint8_t scope_id;  // IPv6 scope ID
  bool is_ip6;       // True when address is IPv6 address
};

struct mg_mgr {
  struct mg_connection *conns;  // List of active connections
  struct mg_dns dns4;           // DNS for IPv4
  struct mg_dns dns6;           // DNS for IPv6
  int dnstimeout;               // DNS resolve timeout in milliseconds
  bool use_dns6;                // Use DNS6 server by default, see #1532
  unsigned long nextid;         // Next connection ID
  unsigned long timerid;        // Next timer ID
  void *userdata;               // Arbitrary user data pointer
  void *tls_ctx;                // TLS context shared by all TLS sessions
  uint16_t mqtt_id;             // MQTT IDs for pub/sub
  void *active_dns_requests;    // DNS requests in progress
  struct mg_timer *timers;      // Active timers
  int epoll_fd;                 // Used when MG_EPOLL_ENABLE=1
  void *priv;                   // Used by the MIP stack
  size_t extraconnsize;         // Used by the MIP stack
  MG_SOCKET_TYPE pipe;          // Socketpair end for mg_wakeup()
#if MG_ENABLE_FREERTOS_TCP
  SocketSet_t ss;  // NOTE(lsm): referenced from socket struct
#endif
};

struct mg_connection {
  struct mg_connection *next;  // Linkage in struct mg_mgr :: connections
  struct mg_mgr *mgr;          // Our container
  struct mg_addr loc;          // Local address
  struct mg_addr rem;          // Remote address
  void *fd;                    // Connected socket, or LWIP data
  unsigned long id;            // Auto-incrementing unique connection ID
  struct mg_iobuf recv;        // Incoming data
  struct mg_iobuf send;        // Outgoing data
  struct mg_iobuf prof;        // Profile data enabled by MG_ENABLE_PROFILE
  struct mg_iobuf rtls;        // TLS only. Incoming encrypted data
  mg_event_handler_t fn;       // User-specified event handler function
  void *fn_data;               // User-specified function parameter
  mg_event_handler_t pfn;      // Protocol-specific handler function
  void *pfn_data;              // Protocol-specific function parameter
  char data[MG_DATA_SIZE];     // Arbitrary connection data
  void *tls;                   // TLS specific data
  unsigned is_listening : 1;   // Listening connection
  unsigned is_client : 1;      // Outbound (client) connection
  unsigned is_accepted : 1;    // Accepted (server) connection
  unsigned is_resolving : 1;   // Non-blocking DNS resolution is in progress
  unsigned is_arplooking : 1;  // Non-blocking ARP resolution is in progress
  unsigned is_connecting : 1;  // Non-blocking connect is in progress
  unsigned is_tls : 1;         // TLS-enabled connection
  unsigned is_tls_hs : 1;      // TLS handshake is in progress
  unsigned is_udp : 1;         // UDP connection
  unsigned is_websocket : 1;   // WebSocket connection
  unsigned is_mqtt5 : 1;       // For MQTT connection, v5 indicator
  unsigned is_hexdumping : 1;  // Hexdump in/out traffic
  unsigned is_draining : 1;    // Send remaining data, then close and free
  unsigned is_closing : 1;     // Close and free the connection immediately
  unsigned is_full : 1;        // Stop reads, until cleared
  unsigned is_resp : 1;        // Response is still being generated
  unsigned is_readable : 1;    // Connection is ready to read
  unsigned is_writable : 1;    // Connection is ready to write
  unsigned is_io_err : 1;      // Remember IO_ERR condition for later use
};

void mg_mgr_poll(struct mg_mgr *, int ms);
void mg_mgr_init(struct mg_mgr *);
void mg_mgr_free(struct mg_mgr *);

struct mg_connection *mg_listen(struct mg_mgr *, const char *url,
                                mg_event_handler_t fn, void *fn_data);
struct mg_connection *mg_connect(struct mg_mgr *, const char *url,
                                 mg_event_handler_t fn, void *fn_data);
struct mg_connection *mg_wrapfd(struct mg_mgr *mgr, int fd,
                                mg_event_handler_t fn, void *fn_data);
void mg_connect_resolved(struct mg_connection *);
bool mg_send(struct mg_connection *, const void *, size_t);
size_t mg_printf(struct mg_connection *, const char *fmt, ...);
size_t mg_vprintf(struct mg_connection *, const char *fmt, va_list *ap);
bool mg_aton(struct mg_str str, struct mg_addr *addr);

// These functions are used to integrate with custom network stacks
struct mg_connection *mg_alloc_conn(struct mg_mgr *);
void mg_close_conn(struct mg_connection *c);
bool mg_open_listener(struct mg_connection *c, const char *url);

// Utility functions
bool mg_wakeup(struct mg_mgr *, unsigned long id, const void *buf, size_t len);
bool mg_wakeup_init(struct mg_mgr *);
struct mg_timer *mg_timer_add(struct mg_mgr *mgr, uint64_t milliseconds,
                              unsigned flags, void (*fn)(void *), void *arg);








struct mg_http_header {
  struct mg_str name;   // Header name
  struct mg_str value;  // Header value
};

struct mg_http_message {
  struct mg_str method, uri, query, proto;             // Request/response line
  struct mg_http_header headers[MG_MAX_HTTP_HEADERS];  // Headers
  struct mg_str body;                                  // Body
  struct mg_str head;                                  // Request + headers
  struct mg_str message;  // Request + headers + body
};

// Parameter for mg_http_serve_dir()
struct mg_http_serve_opts {
  const char *root_dir;       // Web root directory, must be non-NULL
  const char *ssi_pattern;    // SSI file name pattern, e.g. #.shtml
  const char *extra_headers;  // Extra HTTP headers to add in responses
  const char *mime_types;     // Extra mime types, ext1=type1,ext2=type2,..
  const char *page404;        // Path to the 404 page, or NULL by default
  struct mg_fs *fs;           // Filesystem implementation. Use NULL for POSIX
};

// Parameter for mg_http_next_multipart
struct mg_http_part {
  struct mg_str name;      // Form field name
  struct mg_str filename;  // Filename for file uploads
  struct mg_str body;      // Part contents
};

int mg_http_parse(const char *s, size_t len, struct mg_http_message *);
int mg_http_get_request_len(const unsigned char *buf, size_t buf_len);
void mg_http_printf_chunk(struct mg_connection *cnn, const char *fmt, ...);
void mg_http_write_chunk(struct mg_connection *c, const char *buf, size_t len);
void mg_http_delete_chunk(struct mg_connection *c, struct mg_http_message *hm);
struct mg_connection *mg_http_listen(struct mg_mgr *, const char *url,
                                     mg_event_handler_t fn, void *fn_data);
struct mg_connection *mg_http_connect(struct mg_mgr *, const char *url,
                                      mg_event_handler_t fn, void *fn_data);
void mg_http_serve_dir(struct mg_connection *, struct mg_http_message *hm,
                       const struct mg_http_serve_opts *);
void mg_http_serve_file(struct mg_connection *, struct mg_http_message *hm,
                        const char *path, const struct mg_http_serve_opts *);
void mg_http_reply(struct mg_connection *, int status_code, const char *headers,
                   const char *body_fmt, ...);
struct mg_str *mg_http_get_header(struct mg_http_message *, const char *name);
struct mg_str mg_http_var(struct mg_str buf, struct mg_str name);
int mg_http_get_var(const struct mg_str *, const char *name, char *, size_t);
int mg_url_decode(const char *s, size_t n, char *to, size_t to_len, int form);
size_t mg_url_encode(const char *s, size_t n, char *buf, size_t len);
void mg_http_creds(struct mg_http_message *, char *, size_t, char *, size_t);
long mg_http_upload(struct mg_connection *c, struct mg_http_message *hm,
                    struct mg_fs *fs, const char *dir, size_t max_size);
void mg_http_bauth(struct mg_connection *, const char *user, const char *pass);
struct mg_str mg_http_get_header_var(struct mg_str s, struct mg_str v);
size_t mg_http_next_multipart(struct mg_str, size_t, struct mg_http_part *);
int mg_http_status(const struct mg_http_message *hm);
void mg_hello(const char *url);


void mg_http_serve_ssi(struct mg_connection *c, const char *root,
                       const char *fullpath);


#define MG_TLS_NONE 0     // No TLS support
#define MG_TLS_MBED 1     // mbedTLS
#define MG_TLS_OPENSSL 2  // OpenSSL
#define MG_TLS_WOLFSSL 5  // WolfSSL (based on OpenSSL)
#define MG_TLS_BUILTIN 3  // Built-in
#define MG_TLS_CUSTOM 4   // Custom implementation

#ifndef MG_TLS
#define MG_TLS MG_TLS_NONE
#endif





struct mg_tls_opts {
  struct mg_str ca;       // PEM or DER
  struct mg_str cert;     // PEM or DER
  struct mg_str key;      // PEM or DER
  struct mg_str name;     // If not empty, enable host name verification
  int skip_verification;  // Skip certificate and host name verification
};

void mg_tls_init(struct mg_connection *, const struct mg_tls_opts *opts);
void mg_tls_free(struct mg_connection *);
long mg_tls_send(struct mg_connection *, const void *buf, size_t len);
long mg_tls_recv(struct mg_connection *, void *buf, size_t len);
size_t mg_tls_pending(struct mg_connection *);
void mg_tls_handshake(struct mg_connection *);

// Private
void mg_tls_ctx_init(struct mg_mgr *);
void mg_tls_ctx_free(struct mg_mgr *);

// Low-level IO primives used by TLS layer
enum { MG_IO_ERR = -1, MG_IO_WAIT = -2, MG_IO_RESET = -3 };
long mg_io_send(struct mg_connection *c, const void *buf, size_t len);
long mg_io_recv(struct mg_connection *c, void *buf, size_t len);







#if MG_TLS == MG_TLS_MBED
#include <mbedtls/debug.h>
#include <mbedtls/net_sockets.h>
#include <mbedtls/ssl.h>
#include <mbedtls/ssl_ticket.h>

struct mg_tls_ctx {
  int dummy;
#ifdef MBEDTLS_SSL_SESSION_TICKETS
  mbedtls_ssl_ticket_context tickets;
#endif
};

struct mg_tls {
  mbedtls_x509_crt ca;      // Parsed CA certificate
  mbedtls_x509_crt cert;    // Parsed certificate
  mbedtls_pk_context pk;    // Private key context
  mbedtls_ssl_context ssl;  // SSL/TLS context
  mbedtls_ssl_config conf;  // SSL-TLS config
#ifdef MBEDTLS_SSL_SESSION_TICKETS
  mbedtls_ssl_ticket_context ticket;  // Session tickets context
#endif
};
#endif


#if MG_TLS == MG_TLS_OPENSSL || MG_TLS == MG_TLS_WOLFSSL

#include <openssl/err.h>
#include <openssl/ssl.h>

struct mg_tls {
  BIO_METHOD *bm;
  SSL_CTX *ctx;
  SSL *ssl;
};
#endif


#define WEBSOCKET_OP_CONTINUE 0
#define WEBSOCKET_OP_TEXT 1
#define WEBSOCKET_OP_BINARY 2
#define WEBSOCKET_OP_CLOSE 8
#define WEBSOCKET_OP_PING 9
#define WEBSOCKET_OP_PONG 10



struct mg_ws_message {
  struct mg_str data;  // Websocket message data
  uint8_t flags;       // Websocket message flags
};

struct mg_connection *mg_ws_connect(struct mg_mgr *, const char *url,
                                    mg_event_handler_t fn, void *fn_data,
                                    const char *fmt, ...);
void mg_ws_upgrade(struct mg_connection *, struct mg_http_message *,
                   const char *fmt, ...);
size_t mg_ws_send(struct mg_connection *, const void *buf, size_t len, int op);
size_t mg_ws_wrap(struct mg_connection *, size_t len, int op);
size_t mg_ws_printf(struct mg_connection *c, int op, const char *fmt, ...);
size_t mg_ws_vprintf(struct mg_connection *c, int op, const char *fmt,
                     va_list *);




struct mg_connection *mg_sntp_connect(struct mg_mgr *mgr, const char *url,
                                      mg_event_handler_t fn, void *fn_data);
void mg_sntp_request(struct mg_connection *c);
int64_t mg_sntp_parse(const unsigned char *buf, size_t len);

uint64_t mg_now(void);     // Return milliseconds since Epoch





#define MQTT_CMD_CONNECT 1
#define MQTT_CMD_CONNACK 2
#define MQTT_CMD_PUBLISH 3
#define MQTT_CMD_PUBACK 4
#define MQTT_CMD_PUBREC 5
#define MQTT_CMD_PUBREL 6
#define MQTT_CMD_PUBCOMP 7
#define MQTT_CMD_SUBSCRIBE 8
#define MQTT_CMD_SUBACK 9
#define MQTT_CMD_UNSUBSCRIBE 10
#define MQTT_CMD_UNSUBACK 11
#define MQTT_CMD_PINGREQ 12
#define MQTT_CMD_PINGRESP 13
#define MQTT_CMD_DISCONNECT 14
#define MQTT_CMD_AUTH 15

#define MQTT_PROP_PAYLOAD_FORMAT_INDICATOR 0x01
#define MQTT_PROP_MESSAGE_EXPIRY_INTERVAL 0x02
#define MQTT_PROP_CONTENT_TYPE 0x03
#define MQTT_PROP_RESPONSE_TOPIC 0x08
#define MQTT_PROP_CORRELATION_DATA 0x09
#define MQTT_PROP_SUBSCRIPTION_IDENTIFIER 0x0B
#define MQTT_PROP_SESSION_EXPIRY_INTERVAL 0x11
#define MQTT_PROP_ASSIGNED_CLIENT_IDENTIFIER 0x12
#define MQTT_PROP_SERVER_KEEP_ALIVE 0x13
#define MQTT_PROP_AUTHENTICATION_METHOD 0x15
#define MQTT_PROP_AUTHENTICATION_DATA 0x16
#define MQTT_PROP_REQUEST_PROBLEM_INFORMATION 0x17
#define MQTT_PROP_WILL_DELAY_INTERVAL 0x18
#define MQTT_PROP_REQUEST_RESPONSE_INFORMATION 0x19
#define MQTT_PROP_RESPONSE_INFORMATION 0x1A
#define MQTT_PROP_SERVER_REFERENCE 0x1C
#define MQTT_PROP_REASON_STRING 0x1F
#define MQTT_PROP_RECEIVE_MAXIMUM 0x21
#define MQTT_PROP_TOPIC_ALIAS_MAXIMUM 0x22
#define MQTT_PROP_TOPIC_ALIAS 0x23
#define MQTT_PROP_MAXIMUM_QOS 0x24
#define MQTT_PROP_RETAIN_AVAILABLE 0x25
#define MQTT_PROP_USER_PROPERTY 0x26
#define MQTT_PROP_MAXIMUM_PACKET_SIZE 0x27
#define MQTT_PROP_WILDCARD_SUBSCRIPTION_AVAILABLE 0x28
#define MQTT_PROP_SUBSCRIPTION_IDENTIFIER_AVAILABLE 0x29
#define MQTT_PROP_SHARED_SUBSCRIPTION_AVAILABLE 0x2A

enum {
  MQTT_PROP_TYPE_BYTE,
  MQTT_PROP_TYPE_STRING,
  MQTT_PROP_TYPE_STRING_PAIR,
  MQTT_PROP_TYPE_BINARY_DATA,
  MQTT_PROP_TYPE_VARIABLE_INT,
  MQTT_PROP_TYPE_INT,
  MQTT_PROP_TYPE_SHORT
};

enum { MQTT_OK, MQTT_INCOMPLETE, MQTT_MALFORMED };

struct mg_mqtt_prop {
  uint8_t id;         // Enumerated at MQTT5 Reference
  uint32_t iv;        // Integer value for 8-, 16-, 32-bit integers types
  struct mg_str key;  // Non-NULL only for user property type
  struct mg_str val;  // Non-NULL only for UTF-8 types and user properties
};

/*
 * Authenticates given response params against an opened password file.
 * Returns 1 if authenticated, 0 otherwise.
 *
 * It's used by mg_http_check_digest_auth().
 */
int mg_check_digest_auth(struct mg_str method, struct mg_str uri,
                         struct mg_str username, struct mg_str cnonce,
                         struct mg_str response, struct mg_str qop,
                         struct mg_str nc, struct mg_str nonce,
                         struct mg_str auth_domain, FILE *fp);

/*
 * Sends buffer `buf` of size `len` to the client using chunked HTTP encoding.
 * This function sends the buffer size as hex number + newline first, then
 * the buffer itself, then the newline. For example,
 * `mg_send_http_chunk(nc, "foo", 3)` will append the `3\r\nfoo\r\n` string
 * to the `nc->send_mbuf` output IO buffer.
 *
 * NOTE: The HTTP header "Transfer-Encoding: chunked" should be sent prior to
 * using this function.
 *
 * NOTE: do not forget to send an empty chunk at the end of the response,
 * to tell the client that everything was sent. Example:
 *
 * ```
 *   mg_printf_http_chunk(nc, "%s", "my response!");
 *   mg_send_http_chunk(nc, "", 0); // Tell the client we're finished
 * ```
 */
void mg_send_http_chunk(struct mg_connection *nc, const char *buf, size_t len);

/*
 * Sends a printf-formatted HTTP chunk.
 * Functionality is similar to `mg_send_http_chunk()`.
 */
void mg_printf_http_chunk(struct mg_connection *nc, const char *fmt, ...);

/*
 * Sends the response status line.
 * If `extra_headers` is not NULL, then `extra_headers` are also sent
 * after the response line. `extra_headers` must NOT end end with new line.
 * Example:
 *
 *      mg_send_response_line(nc, 200, "Access-Control-Allow-Origin: *");
 *
 * Will result in:
 *
 *      HTTP/1.1 200 OK\r\n
 *      Access-Control-Allow-Origin: *\r\n
 */
void mg_send_response_line(struct mg_connection *nc, int status_code,
                           const char *extra_headers);

/*
 * Sends an error response. If reason is NULL, the message will be inferred
 * from the error code (if supported).
 */
void mg_http_send_error(struct mg_connection *nc, int code, const char *reason);

/*
 * Sends a redirect response.
 * `status_code` should be either 301 or 302 and `location` point to the
 * new location.
 * If `extra_headers` is not empty, then `extra_headers` are also sent
 * after the response line. `extra_headers` must NOT end end with new line.
 *
 * Example:
 *
 *      mg_http_send_redirect(nc, 302, mg_mk_str("/login"), mg_mk_str(NULL));
 */
void mg_http_send_redirect(struct mg_connection *nc, int status_code,
                           const struct mg_str location,
                           const struct mg_str extra_headers);

/*
 * Sends the response line and headers.
 * This function sends the response line with the `status_code`, and
 * automatically
 * sends one header: either "Content-Length" or "Transfer-Encoding".
 * If `content_length` is negative, then "Transfer-Encoding: chunked" header
 * is sent, otherwise, "Content-Length" header is sent.
 *
 * NOTE: If `Transfer-Encoding` is `chunked`, then message body must be sent
 * using `mg_send_http_chunk()` or `mg_printf_http_chunk()` functions.
 * Otherwise, `mg_send()` or `mg_printf()` must be used.
 * Extra headers could be set through `extra_headers`. Note `extra_headers`
 * must NOT be terminated by a new line.
 */
void mg_send_head(struct mg_connection *n, int status_code,
                  int64_t content_length, const char *extra_headers);

/*
 * Sends a printf-formatted HTTP chunk, escaping HTML tags.
 */
void mg_printf_html_escape(struct mg_connection *nc, const char *fmt, ...);

#if MG_ENABLE_HTTP_URL_REWRITES
/*
 * Proxies a given request to a given upstream http server. The path prefix
 * in `mount` will be stripped of the path requested to the upstream server,
 * e.g. if mount is /api and upstream is http://localhost:8001/foo
 * then an incoming request to /api/bar will cause a request to
 * http://localhost:8001/foo/bar
 *
 * EXPERIMENTAL API. Please use http_serve_http + url_rewrites if a static
 * mapping is good enough.
 */
void mg_http_reverse_proxy(struct mg_connection *nc,
                           const struct http_message *hm, struct mg_str mount,
                           struct mg_str upstream);
#endif

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* MG_ENABLE_HTTP */

#endif /* CS_MONGOOSE_SRC_HTTP_SERVER_H_ */
#ifdef MG_MODULE_LINES
#line 1 "mongoose/src/mg_http_client.h"
#endif
/*
 * === Client API reference
 */

#ifndef CS_MONGOOSE_SRC_HTTP_CLIENT_H_
#define CS_MONGOOSE_SRC_HTTP_CLIENT_H_

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

/*
 * Helper function that creates an outbound HTTP connection.
 *
 * `url` is the URL to fetch. It must be properly URL-encoded, e.g. have
 * no spaces, etc. By default, `mg_connect_http()` sends the Connection and
 * Host headers. `extra_headers` is an extra HTTP header to send, e.g.
 * `"User-Agent: my-app\r\n"`.
 * If `post_data` is NULL, then a GET request is created. Otherwise, a POST
 * request is created with the specified POST data. Note that if the data being
 * posted is a form submission, the `Content-Type` header should be set
 * accordingly (see example below).
 *
 * Examples:
 *
 * ```c
 *   nc1 = mg_connect_http(mgr, ev_handler_1, "http://www.google.com", NULL,
 *                         NULL);
 *   nc2 = mg_connect_http(mgr, ev_handler_1, "https://github.com", NULL, NULL);
 *   nc3 = mg_connect_http(
 *       mgr, ev_handler_1, "my_server:8000/form_submit/",
 *       "Content-Type: application/x-www-form-urlencoded\r\n",
 *       "var_1=value_1&var_2=value_2");
 * ```
 */
struct mg_connection *mg_connect_http(
    struct mg_mgr *mgr,
    MG_CB(mg_event_handler_t event_handler, void *user_data), const char *url,
    const char *extra_headers, const char *post_data);

/*
 * Helper function that creates an outbound HTTP connection.
 *
 * Mostly identical to mg_connect_http, but allows you to provide extra
 *parameters
 * (for example, SSL parameters)
 */
struct mg_connection *mg_connect_http_opt(
    struct mg_mgr *mgr, MG_CB(mg_event_handler_t ev_handler, void *user_data),
    struct mg_connect_opts opts, const char *url, const char *extra_headers,
    const char *post_data);

/* Creates digest authentication header for a client request. */
int mg_http_create_digest_auth_header(char *buf, size_t buf_len,
                                      const char *method, const char *uri,
                                      const char *auth_domain, const char *user,
                                      const char *passwd, const char *nonce);

#ifdef __cplusplus
}
#endif /* __cplusplus */
#endif /* CS_MONGOOSE_SRC_HTTP_CLIENT_H_ */
#ifdef MG_MODULE_LINES
#line 1 "mongoose/src/mg_mqtt.h"
#endif

/*
 * === MQTT API reference
 */

#ifndef CS_MONGOOSE_SRC_MQTT_H_
#define CS_MONGOOSE_SRC_MQTT_H_

/* Amalgamated: #include "mg_net.h" */

struct mg_mqtt_message {
  struct mg_str topic;  // Parsed topic for PUBLISH
  struct mg_str data;   // Parsed message for PUBLISH
  struct mg_str dgram;  // Whole MQTT packet, including headers
  uint16_t id;          // For PUBACK, PUBREC, PUBREL, PUBCOMP, SUBACK, PUBLISH
  uint8_t cmd;          // MQTT command, one of MQTT_CMD_*
  uint8_t qos;          // Quality of service
  uint8_t ack;          // CONNACK return code, 0 = success
  size_t props_start;   // Offset to the start of the properties (MQTT5)
  size_t props_size;    // Length of the properties
};

struct mg_connection *mg_mqtt_connect(struct mg_mgr *, const char *url,
                                      const struct mg_mqtt_opts *opts,
                                      mg_event_handler_t fn, void *fn_data);
struct mg_connection *mg_mqtt_listen(struct mg_mgr *mgr, const char *url,
                                     mg_event_handler_t fn, void *fn_data);
void mg_mqtt_login(struct mg_connection *c, const struct mg_mqtt_opts *opts);
uint16_t mg_mqtt_pub(struct mg_connection *c, const struct mg_mqtt_opts *opts);
void mg_mqtt_sub(struct mg_connection *, const struct mg_mqtt_opts *opts);
int mg_mqtt_parse(const uint8_t *, size_t, uint8_t, struct mg_mqtt_message *);
void mg_mqtt_send_header(struct mg_connection *, uint8_t cmd, uint8_t flags,
                         uint32_t len);
void mg_mqtt_ping(struct mg_connection *);
void mg_mqtt_pong(struct mg_connection *);
void mg_mqtt_disconnect(struct mg_connection *, const struct mg_mqtt_opts *);
size_t mg_mqtt_next_prop(struct mg_mqtt_message *, struct mg_mqtt_prop *,
                         size_t ofs);





/* Message flags */
#define MG_MQTT_RETAIN 0x1
#define MG_MQTT_QOS(qos) ((qos) << 1)
#define MG_MQTT_GET_QOS(flags) (((flags) &0x6) >> 1)
#define MG_MQTT_SET_QOS(flags, qos) (flags) = ((flags) & ~0x6) | ((qos) << 1)
#define MG_MQTT_DUP 0x8

/* Connection flags */
#define MG_MQTT_CLEAN_SESSION 0x02
#define MG_MQTT_HAS_WILL 0x04
#define MG_MQTT_WILL_RETAIN 0x20
#define MG_MQTT_HAS_PASSWORD 0x40
#define MG_MQTT_HAS_USER_NAME 0x80
#define MG_MQTT_GET_WILL_QOS(flags) (((flags) &0x18) >> 3)
#define MG_MQTT_SET_WILL_QOS(flags, qos) \
  (flags) = ((flags) & ~0x18) | ((qos) << 3)

/* CONNACK return codes */
#define MG_EV_MQTT_CONNACK_ACCEPTED 0
#define MG_EV_MQTT_CONNACK_UNACCEPTABLE_VERSION 1
#define MG_EV_MQTT_CONNACK_IDENTIFIER_REJECTED 2
#define MG_EV_MQTT_CONNACK_SERVER_UNAVAILABLE 3
#define MG_EV_MQTT_CONNACK_BAD_AUTH 4
#define MG_EV_MQTT_CONNACK_NOT_AUTHORIZED 5

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

/*
 * Attaches a built-in MQTT event handler to the given connection.
 *
 * The user-defined event handler will receive following extra events:
 *
 * - MG_EV_MQTT_CONNACK
 * - MG_EV_MQTT_PUBLISH
 * - MG_EV_MQTT_PUBACK
 * - MG_EV_MQTT_PUBREC
 * - MG_EV_MQTT_PUBREL
 * - MG_EV_MQTT_PUBCOMP
 * - MG_EV_MQTT_SUBACK
 */
void mg_set_protocol_mqtt(struct mg_connection *nc);

/* Sends an MQTT handshake. */
void mg_send_mqtt_handshake(struct mg_connection *nc, const char *client_id);

/* Sends an MQTT handshake with optional parameters. */
void mg_send_mqtt_handshake_opt(struct mg_connection *nc, const char *client_id,
                                struct mg_send_mqtt_handshake_opts);

/* Publishes a message to a given topic. */
void mg_mqtt_publish(struct mg_connection *nc, const char *topic,
                     uint16_t message_id, int flags, const void *data,
                     size_t len);

/* Subscribes to a bunch of topics. */
void mg_mqtt_subscribe(struct mg_connection *nc,
                       const struct mg_mqtt_topic_expression *topics,
                       size_t topics_len, uint16_t message_id);

/* Unsubscribes from a bunch of topics. */
void mg_mqtt_unsubscribe(struct mg_connection *nc, char **topics,
                         size_t topics_len, uint16_t message_id);

/* Sends a DISCONNECT command. */
void mg_mqtt_disconnect(struct mg_connection *nc);

/* Sends a CONNACK command with a given `return_code`. */
void mg_mqtt_connack(struct mg_connection *nc, uint8_t return_code);

/* Sends a PUBACK command with a given `message_id`. */
void mg_mqtt_puback(struct mg_connection *nc, uint16_t message_id);

/* Sends a PUBREC command with a given `message_id`. */
void mg_mqtt_pubrec(struct mg_connection *nc, uint16_t message_id);

/* Sends a PUBREL command with a given `message_id`. */
void mg_mqtt_pubrel(struct mg_connection *nc, uint16_t message_id);

/* Sends a PUBCOMP command with a given `message_id`. */
void mg_mqtt_pubcomp(struct mg_connection *nc, uint16_t message_id);

/*
 * Sends a SUBACK command with a given `message_id`
 * and a sequence of granted QoSs.
 */
void mg_mqtt_suback(struct mg_connection *nc, uint8_t *qoss, size_t qoss_len,
                    uint16_t message_id);

/* Sends a UNSUBACK command with a given `message_id`. */
void mg_mqtt_unsuback(struct mg_connection *nc, uint16_t message_id);

/* Sends a PINGREQ command. */
void mg_mqtt_ping(struct mg_connection *nc);

/* Sends a PINGRESP command. */
void mg_mqtt_pong(struct mg_connection *nc);

/*
 * Extracts the next topic expression from a SUBSCRIBE command payload.
 *
 * The topic expression name will point to a string in the payload buffer.
 * Returns the pos of the next topic expression or -1 when the list
 * of topics is exhausted.
 */
int mg_mqtt_next_subscribe_topic(struct mg_mqtt_message *msg,
                                 struct mg_str *topic, uint8_t *qos, int pos);

/*
 * Matches a topic against a topic expression
 *
 * Returns 1 if it matches; 0 otherwise.
 */
int mg_mqtt_match_topic_expression(struct mg_str exp, struct mg_str topic);

/*
 * Same as `mg_mqtt_match_topic_expression()`, but takes `exp` as a
 * NULL-terminated string.
 */
int mg_mqtt_vmatch_topic_expression(const char *exp, struct mg_str topic);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* CS_MONGOOSE_SRC_MQTT_H_ */
#ifdef MG_MODULE_LINES
#line 1 "mongoose/src/mg_mqtt_server.h"
#endif

/*
 * === MQTT Server API reference
 */

#ifndef CS_MONGOOSE_SRC_MQTT_BROKER_H_
#define CS_MONGOOSE_SRC_MQTT_BROKER_H_

#if MG_ENABLE_MQTT_BROKER

/* Amalgamated: #include "common/queue.h" */
/* Amalgamated: #include "mg_mqtt.h" */

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

#ifndef MG_MQTT_MAX_SESSION_SUBSCRIPTIONS
#define MG_MQTT_MAX_SESSION_SUBSCRIPTIONS 512
#endif

struct mg_mqtt_broker;

/* MQTT session (Broker side). */
struct mg_mqtt_session {
  struct mg_mqtt_broker *brk;       /* Broker */
  LIST_ENTRY(mg_mqtt_session) link; /* mg_mqtt_broker::sessions linkage */
  struct mg_connection *nc;         /* Connection with the client */
  size_t num_subscriptions;         /* Size of `subscriptions` array */
  void *user_data;                  /* User data */
  struct mg_mqtt_topic_expression *subscriptions;
};

/* MQTT broker. */
struct mg_mqtt_broker {
  LIST_HEAD(_mg_sesshead, mg_mqtt_session) sessions; /* Session list */
  void *user_data;                                   /* User data */
};

/* Initialises a MQTT broker. */
void mg_mqtt_broker_init(struct mg_mqtt_broker *brk, void *user_data);

/*
 * Processes a MQTT broker message.
 *
 * The listening connection expects a pointer to an initialised
 * `mg_mqtt_broker` structure in the `user_data` field.
 *
 * Basic usage:
 *
 * ```c
 * mg_mqtt_broker_init(&brk, NULL);
 *
 * if ((nc = mg_bind(&mgr, address, mg_mqtt_broker)) == NULL) {
 *   // fail;
 * }
 * nc->user_data = &brk;
 * ```
 *
 * New incoming connections will receive a `mg_mqtt_session` structure
 * in the connection `user_data`. The original `user_data` will be stored
 * in the `user_data` field of the session structure. This allows the user
 * handler to store user data before `mg_mqtt_broker` creates the session.
 *
 * Since only the MG_EV_ACCEPT message is processed by the listening socket,
 * for most events the `user_data` will thus point to a `mg_mqtt_session`.
 */
void mg_mqtt_broker(struct mg_connection *brk, int ev, void *data);

/*
 * Iterates over all MQTT session connections. Example:
 *
 * ```c
 * struct mg_mqtt_session *s;
 * for (s = mg_mqtt_next(brk, NULL); s != NULL; s = mg_mqtt_next(brk, s)) {
 *   // Do something
 * }
 * ```
 */
struct mg_mqtt_session *mg_mqtt_next(struct mg_mqtt_broker *brk,
                                     struct mg_mqtt_session *s);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* MG_ENABLE_MQTT_BROKER */
#endif /* CS_MONGOOSE_SRC_MQTT_BROKER_H_ */
#ifdef MG_MODULE_LINES
#line 1 "mongoose/src/mg_dns.h"
#endif

/*
 * === DNS API reference
 */

#ifndef CS_MONGOOSE_SRC_DNS_H_
#define CS_MONGOOSE_SRC_DNS_H_

/* Amalgamated: #include "mg_net.h" */

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

#define MG_DNS_A_RECORD 0x01     /* Lookup IP address */
#define MG_DNS_CNAME_RECORD 0x05 /* Lookup CNAME */
#define MG_DNS_PTR_RECORD 0x0c   /* Lookup PTR */
#define MG_DNS_TXT_RECORD 0x10   /* Lookup TXT */
#define MG_DNS_AAAA_RECORD 0x1c  /* Lookup IPv6 address */
#define MG_DNS_SRV_RECORD 0x21   /* Lookup SRV */
#define MG_DNS_MX_RECORD 0x0f    /* Lookup mail server for domain */
#define MG_DNS_ANY_RECORD 0xff
#define MG_DNS_NSEC_RECORD 0x2f

#define MG_MAX_DNS_QUESTIONS 32
#define MG_MAX_DNS_ANSWERS 32

#define MG_DNS_MESSAGE 100 /* High-level DNS message event */

enum mg_dns_resource_record_kind {
  MG_DNS_INVALID_RECORD = 0,
  MG_DNS_QUESTION,
  MG_DNS_ANSWER
};

/* DNS resource record. */
struct mg_dns_resource_record {
  struct mg_str name; /* buffer with compressed name */
  int rtype;
  int rclass;
  int ttl;
  enum mg_dns_resource_record_kind kind;
  struct mg_str rdata; /* protocol data (can be a compressed name) */
};

/* DNS message (request and response). */
struct mg_dns_message {
  uint16_t txnid;       // Transaction ID
  bool resolved;        // Resolve successful, addr is set
  struct mg_addr addr;  // Resolved address
  char name[256];       // Host name
};

struct mg_dns_header {
  uint16_t txnid;  // Transaction ID
  uint16_t flags;
  uint16_t num_questions;
  uint16_t num_answers;
  uint16_t num_authority_prs;
  uint16_t num_other_prs;
};

// DNS resource record
struct mg_dns_rr {
  uint16_t nlen;    // Name or pointer length
  uint16_t atype;   // Address type
  uint16_t aclass;  // Address class
  uint16_t alen;    // Address length
};

void mg_resolve(struct mg_connection *, const char *url);
void mg_resolve_cancel(struct mg_connection *);
bool mg_dns_parse(const uint8_t *buf, size_t len, struct mg_dns_message *);
size_t mg_dns_parse_rr(const uint8_t *buf, size_t len, size_t ofs,
                       bool is_question, struct mg_dns_rr *);





/*
 * Encodes a DNS name.
 */
int mg_dns_encode_name(struct mbuf *io, const char *name, size_t len);
int mg_dns_encode_name_s(struct mbuf *io, struct mg_str name);

// Error return values - negative. Successful returns are >= 0
enum { MG_JSON_TOO_DEEP = -1, MG_JSON_INVALID = -2, MG_JSON_NOT_FOUND = -3 };
int mg_json_get(struct mg_str json, const char *path, int *toklen);

struct mg_str mg_json_get_tok(struct mg_str json, const char *path);
bool mg_json_get_num(struct mg_str json, const char *path, double *v);
bool mg_json_get_bool(struct mg_str json, const char *path, bool *v);
long mg_json_get_long(struct mg_str json, const char *path, long dflt);
char *mg_json_get_str(struct mg_str json, const char *path);
char *mg_json_get_hex(struct mg_str json, const char *path, int *len);
char *mg_json_get_b64(struct mg_str json, const char *path, int *len);

bool mg_json_unescape(struct mg_str str, char *buf, size_t len);
size_t mg_json_next(struct mg_str obj, size_t ofs, struct mg_str *key,
                    struct mg_str *val);




// JSON-RPC request descriptor
struct mg_rpc_req {
  struct mg_rpc **head;  // RPC handlers list head
  struct mg_rpc *rpc;    // RPC handler being called
  mg_pfn_t pfn;          // Response printing function
  void *pfn_data;        // Response printing function data
  void *req_data;        // Arbitrary request data
  struct mg_str frame;   // Request, e.g. {"id":1,"method":"add","params":[1,2]}
};

// JSON-RPC method handler
struct mg_rpc {
  struct mg_rpc *next;              // Next in list
  struct mg_str method;             // Method pattern
  void (*fn)(struct mg_rpc_req *);  // Handler function
  void *fn_data;                    // Handler function argument
};

void mg_rpc_add(struct mg_rpc **head, struct mg_str method_pattern,
                void (*handler)(struct mg_rpc_req *), void *handler_data);
void mg_rpc_del(struct mg_rpc **head, void (*handler)(struct mg_rpc_req *));
void mg_rpc_process(struct mg_rpc_req *);

// Helper functions to print result or error frame
void mg_rpc_ok(struct mg_rpc_req *, const char *fmt, ...);
void mg_rpc_vok(struct mg_rpc_req *, const char *fmt, va_list *ap);
void mg_rpc_err(struct mg_rpc_req *, int code, const char *fmt, ...);
void mg_rpc_verr(struct mg_rpc_req *, int code, const char *fmt, va_list *);
void mg_rpc_list(struct mg_rpc_req *r);
// Copyright (c) 2023 Cesanta Software Limited
// All rights reserved





#define MG_OTA_NONE 0       // No OTA support
#define MG_OTA_STM32H5 1    // STM32 H5
#define MG_OTA_STM32H7 2    // STM32 H7
#define MG_OTA_STM32H7_DUAL_CORE 3 // STM32 H7 dual core
#define MG_OTA_STM32F  4    // STM32 F7/F4/F2
#define MG_OTA_CH32V307 100 // WCH CH32V307
#define MG_OTA_U2A 200      // Renesas U2A16, U2A8, U2A6
#define MG_OTA_RT1020 300   // IMXRT1020
#define MG_OTA_RT1060 301   // IMXRT1060
#define MG_OTA_RT1064 302   // IMXRT1064
#define MG_OTA_RT1170 303   // IMXRT1170
#define MG_OTA_MCXN 310 	  // MCXN947
#define MG_OTA_FLASH 900    // OTA via an internal flash
#define MG_OTA_ESP32 910    // ESP32 OTA implementation
#define MG_OTA_PICOSDK 920  // RP2040/2350 using Pico-SDK hardware_flash
#define MG_OTA_CUSTOM 1000  // Custom implementation

#ifndef MG_OTA
#define MG_OTA MG_OTA_NONE
#else
#ifndef MG_IRAM
#if defined(__GNUC__)
#define MG_IRAM __attribute__((noinline, section(".iram")))
#else
#define MG_IRAM
#endif // compiler
#endif // IRAM
#endif // OTA

// Firmware update API
bool mg_ota_begin(size_t new_firmware_size);     // Start writing
bool mg_ota_write(const void *buf, size_t len);  // Write chunk, aligned to 1k
bool mg_ota_end(void);                           // Stop writing



#if MG_OTA != MG_OTA_NONE && MG_OTA != MG_OTA_CUSTOM

struct mg_flash {
  void *start;    // Address at which flash starts
  size_t size;    // Flash size
  size_t secsz;   // Sector size
  size_t align;   // Write alignment
  bool (*write_fn)(void *, const void *, size_t);  // Write function
  bool (*swap_fn)(void);                           // Swap partitions
};

bool mg_ota_flash_begin(size_t new_firmware_size, struct mg_flash *flash);
bool mg_ota_flash_write(const void *buf, size_t len, struct mg_flash *flash);
bool mg_ota_flash_end(struct mg_flash *flash);

#endif






#if defined(MG_ENABLE_TCPIP) && MG_ENABLE_TCPIP
struct mg_tcpip_if;  // Mongoose TCP/IP network interface
#define MG_TCPIP_IFACE(mgr_) ((struct mg_tcpip_if *) (mgr_)->priv)

struct mg_tcpip_driver {
  bool (*init)(struct mg_tcpip_if *);                         // Init driver
  size_t (*tx)(const void *, size_t, struct mg_tcpip_if *);   // Transmit frame
  size_t (*rx)(void *buf, size_t len, struct mg_tcpip_if *);  // Receive frame
  bool (*up)(struct mg_tcpip_if *);                           // Up/down status
};

typedef void (*mg_tcpip_event_handler_t)(struct mg_tcpip_if *ifp, int ev,
                                         void *ev_data);

enum {
  MG_TCPIP_EV_ST_CHG,     // state change             uint8_t * (&ifp->state)
  MG_TCPIP_EV_DHCP_DNS,   // DHCP DNS assignment      uint32_t *ipaddr
  MG_TCPIP_EV_DHCP_SNTP,  // DHCP SNTP assignment     uint32_t *ipaddr
  MG_TCPIP_EV_ARP,        // Got ARP packet           struct mg_str *
  MG_TCPIP_EV_TIMER_1S,   // 1 second timer           NULL
  MG_TCPIP_EV_USER        // Starting ID for user events
};

// Network interface
struct mg_tcpip_if {
  uint8_t mac[6];                  // MAC address. Must be set to a valid MAC
  uint32_t ip, mask, gw;           // IP address, mask, default gateway
  struct mg_str tx;                // Output (TX) buffer
  bool enable_dhcp_client;         // Enable DCHP client
  bool enable_dhcp_server;         // Enable DCHP server
  bool enable_get_gateway;         // DCHP server sets client as gateway
  bool enable_req_dns;             // DCHP client requests DNS server
  bool enable_req_sntp;            // DCHP client requests SNTP server
  bool enable_crc32_check;         // Do a CRC check on RX frames and strip it
  bool enable_mac_check;           // Do a MAC check on RX frames
  struct mg_tcpip_driver *driver;  // Low level driver
  void *driver_data;               // Driver-specific data
  mg_tcpip_event_handler_t fn;     // User-specified event handler function
  struct mg_mgr *mgr;              // Mongoose event manager
  struct mg_queue recv_queue;      // Receive queue
  uint16_t mtu;                    // Interface MTU
#define MG_TCPIP_MTU_DEFAULT 1500

  // Internal state, user can use it but should not change it
  uint8_t gwmac[6];             // Router's MAC
  uint64_t now;                 // Current time
  uint64_t timer_1000ms;        // 1000 ms timer: for DHCP and link state
  uint64_t lease_expire;        // Lease expiration time, in ms
  uint16_t eport;               // Next ephemeral port
  volatile uint32_t ndrop;      // Number of received, but dropped frames
  volatile uint32_t nrecv;      // Number of received frames
  volatile uint32_t nsent;      // Number of transmitted frames
  volatile uint32_t nerr;       // Number of driver errors
  uint8_t state;                // Current state
#define MG_TCPIP_STATE_DOWN 0   // Interface is down
#define MG_TCPIP_STATE_UP 1     // Interface is up
#define MG_TCPIP_STATE_REQ 2    // Interface is up, DHCP REQUESTING state
#define MG_TCPIP_STATE_IP 3     // Interface is up and has an IP assigned
#define MG_TCPIP_STATE_READY 4  // Interface has fully come up, ready to work
};

void mg_tcpip_init(struct mg_mgr *, struct mg_tcpip_if *);
void mg_tcpip_free(struct mg_tcpip_if *);
void mg_tcpip_qwrite(void *buf, size_t len, struct mg_tcpip_if *ifp);
void mg_tcpip_arp_request(struct mg_tcpip_if *ifp, uint32_t ip, uint8_t *mac);

extern struct mg_tcpip_driver mg_tcpip_driver_stm32f;
extern struct mg_tcpip_driver mg_tcpip_driver_w5500;
extern struct mg_tcpip_driver mg_tcpip_driver_tm4c;
extern struct mg_tcpip_driver mg_tcpip_driver_tms570;
extern struct mg_tcpip_driver mg_tcpip_driver_stm32h;
extern struct mg_tcpip_driver mg_tcpip_driver_imxrt;
extern struct mg_tcpip_driver mg_tcpip_driver_same54;
extern struct mg_tcpip_driver mg_tcpip_driver_cmsis;
extern struct mg_tcpip_driver mg_tcpip_driver_ra;
extern struct mg_tcpip_driver mg_tcpip_driver_xmc;
extern struct mg_tcpip_driver mg_tcpip_driver_xmc7;

// Drivers that require SPI, can use this SPI abstraction
struct mg_tcpip_spi {
  void *spi;                        // Opaque SPI bus descriptor
  void (*begin)(void *);            // SPI begin: slave select low
  void (*end)(void *);              // SPI end: slave select high
  uint8_t (*txn)(void *, uint8_t);  // SPI transaction: write 1 byte, read reply
};
#endif



// Macros to record timestamped events that happens with a connection.
// They are saved into a c->prof IO buffer, each event is a name and a 32-bit
// timestamp in milliseconds since connection init time.
//
// Test (run in two separate terminals):
//   make -C examples/http-server/ CFLAGS_EXTRA=-DMG_ENABLE_PROFILE=1
//   curl localhost:8000
// Output:
//   1ea1f1e7 2 net.c:150:mg_close_conn      3 profile:                                                            
//   1ea1f1e8 2 net.c:150:mg_close_conn      1ea1f1e6 init                                                         
//   1ea1f1e8 2 net.c:150:mg_close_conn          0 EV_OPEN
//   1ea1f1e8 2 net.c:150:mg_close_conn          0 EV_ACCEPT 
//   1ea1f1e8 2 net.c:150:mg_close_conn          0 EV_READ
//   1ea1f1e8 2 net.c:150:mg_close_conn          0 EV_HTTP_MSG
//   1ea1f1e8 2 net.c:150:mg_close_conn          0 EV_WRITE
//   1ea1f1e8 2 net.c:150:mg_close_conn          1 EV_CLOSE
//
// Usage:
//   Enable profiling by setting MG_ENABLE_PROFILE=1
//   Invoke MG_PROF_ADD(c, "MY_EVENT_1") in the places you'd like to measure

#if MG_ENABLE_PROFILE
struct mg_profitem {
  const char *name;    // Event name
  uint32_t timestamp;  // Milliseconds since connection creation (MG_EV_OPEN)
};

#define MG_PROFILE_ALLOC_GRANULARITY 256  // Can save 32 items wih to realloc

// Adding a profile item to the c->prof. Must be as fast as possible.
// Reallocation of the c->prof iobuf is not desirable here, that's why we
// pre-allocate c->prof with MG_PROFILE_ALLOC_GRANULARITY.
// This macro just inits and copies 8 bytes, and calls mg_millis(),
// which should be fast enough.
#define MG_PROF_ADD(c, name_)                                             \
  do {                                                                    \
    struct mg_iobuf *io = &c->prof;                                       \
    uint32_t inittime = ((struct mg_profitem *) io->buf)->timestamp;      \
    struct mg_profitem item = {name_, (uint32_t) mg_millis() - inittime}; \
    mg_iobuf_add(io, io->len, &item, sizeof(item));                       \
  } while (0)

// Initialising profile for a new connection. Not time sensitive
#define MG_PROF_INIT(c)                                          \
  do {                                                           \
    struct mg_profitem first = {"init", (uint32_t) mg_millis()}; \
    mg_iobuf_init(&(c)->prof, 0, MG_PROFILE_ALLOC_GRANULARITY);  \
    mg_iobuf_add(&c->prof, c->prof.len, &first, sizeof(first));  \
  } while (0)

#define MG_PROF_FREE(c) mg_iobuf_free(&(c)->prof)

// Dumping the profile. Not time sensitive
#define MG_PROF_DUMP(c)                                            \
  do {                                                             \
    struct mg_iobuf *io = &c->prof;                                \
    struct mg_profitem *p = (struct mg_profitem *) io->buf;        \
    struct mg_profitem *e = &p[io->len / sizeof(*p)];              \
    MG_INFO(("%lu profile:", c->id));                              \
    while (p < e) {                                                \
      MG_INFO(("%5lx %s", (unsigned long) p->timestamp, p->name)); \
      p++;                                                         \
    }                                                              \
  } while (0)

#else
#define MG_PROF_INIT(c)
#define MG_PROF_FREE(c)
#define MG_PROF_ADD(c, name)
#define MG_PROF_DUMP(c)
#endif


#if MG_ENABLE_TCPIP && defined(MG_ENABLE_DRIVER_CMSIS) && MG_ENABLE_DRIVER_CMSIS

#include "Driver_ETH_MAC.h"  // keep this include
#include "Driver_ETH_PHY.h"  // keep this include

#endif


#if MG_ENABLE_TCPIP && defined(MG_ENABLE_DRIVER_IMXRT) && MG_ENABLE_DRIVER_IMXRT

struct mg_tcpip_driver_imxrt_data {
  // MDC clock divider. MDC clock is derived from IPS Bus clock (ipg_clk),
  // must not exceed 2.5MHz. Configuration for clock range 2.36~2.50 MHz
  // 37.5.1.8.2, Table 37-46 : f = ipg_clk / (2(mdc_cr + 1))
  //    ipg_clk       mdc_cr VALUE
  //    --------------------------
  //                  -1  <-- TODO() tell driver to guess the value
  //    25 MHz         4
  //    33 MHz         6
  //    40 MHz         7
  //    50 MHz         9
  //    66 MHz        13
  int mdc_cr;  // Valid values: -1 to 63

  uint8_t phy_addr;  // PHY address
};

#ifndef MG_TCPIP_PHY_ADDR
#define MG_TCPIP_PHY_ADDR 2
#endif

#ifndef MG_DRIVER_MDC_CR
#define MG_DRIVER_MDC_CR 24
#endif

#define MG_TCPIP_DRIVER_INIT(mgr)                                \
  do {                                                           \
    static struct mg_tcpip_driver_imxrt_data driver_data_;       \
    static struct mg_tcpip_if mif_;                              \
    driver_data_.mdc_cr = MG_DRIVER_MDC_CR;                      \
    driver_data_.phy_addr = MG_TCPIP_PHY_ADDR;                   \
    mif_.ip = MG_TCPIP_IP;                                       \
    mif_.mask = MG_TCPIP_MASK;                                   \
    mif_.gw = MG_TCPIP_GW;                                       \
    mif_.driver = &mg_tcpip_driver_imxrt;                        \
    mif_.driver_data = &driver_data_;                            \
    MG_SET_MAC_ADDRESS(mif_.mac);                                \
    mg_tcpip_init(mgr, &mif_);                                   \
    MG_INFO(("Driver: imxrt, MAC: %M", mg_print_mac, mif_.mac)); \
  } while (0)

#endif




struct mg_phy {
  uint16_t (*read_reg)(uint8_t addr, uint8_t reg);
  void (*write_reg)(uint8_t addr, uint8_t reg, uint16_t value);
};

// PHY configuration settings, bitmask
enum {
  // Set if PHY LEDs are connected to ground
  MG_PHY_LEDS_ACTIVE_HIGH = (1 << 0),
  // Set when PHY clocks MAC. Otherwise, MAC clocks PHY
  MG_PHY_CLOCKS_MAC = (1 << 1),
};

enum { MG_PHY_SPEED_10M, MG_PHY_SPEED_100M, MG_PHY_SPEED_1000M };

void mg_phy_init(struct mg_phy *, uint8_t addr, uint8_t config);
bool mg_phy_up(struct mg_phy *, uint8_t addr, bool *full_duplex,
               uint8_t *speed);


#if MG_ENABLE_TCPIP && defined(MG_ENABLE_DRIVER_RA) && MG_ENABLE_DRIVER_RA

struct mg_tcpip_driver_ra_data {
  // MDC clock "divider". MDC clock is software generated,
  uint32_t clock;    // core clock frequency in Hz
  uint16_t irqno;    // IRQn, R_ICU->IELSR[irqno]
  uint8_t phy_addr;  // PHY address
};

#endif


#if MG_ENABLE_TCPIP && defined(MG_ENABLE_DRIVER_SAME54) && MG_ENABLE_DRIVER_SAME54

struct mg_tcpip_driver_same54_data {
    int mdc_cr;
};

#ifndef MG_DRIVER_MDC_CR
#define MG_DRIVER_MDC_CR 5
#endif

#endif


#if MG_ENABLE_TCPIP && defined(MG_ENABLE_DRIVER_STM32F) && \
    MG_ENABLE_DRIVER_STM32F

struct mg_tcpip_driver_stm32f_data {
  // MDC clock divider. MDC clock is derived from HCLK, must not exceed 2.5MHz
  //    HCLK range    DIVIDER    mdc_cr VALUE
  //    -------------------------------------
  //                                -1  <-- tell driver to guess the value
  //    60-100 MHz    HCLK/42        0
  //    100-150 MHz   HCLK/62        1
  //    20-35 MHz     HCLK/16        2
  //    35-60 MHz     HCLK/26        3
  //    150-216 MHz   HCLK/102       4  <-- value for Nucleo-F* on max speed
  //    216-310 MHz   HCLK/124       5
  //    110, 111 Reserved
  int mdc_cr;  // Valid values: -1, 0, 1, 2, 3, 4, 5

  uint8_t phy_addr;  // PHY address
};

#ifndef MG_TCPIP_PHY_ADDR
#define MG_TCPIP_PHY_ADDR 0
#endif

#ifndef MG_DRIVER_MDC_CR
#define MG_DRIVER_MDC_CR 4
#endif

#define MG_TCPIP_DRIVER_INIT(mgr)                                 \
  do {                                                            \
    static struct mg_tcpip_driver_stm32f_data driver_data_;       \
    static struct mg_tcpip_if mif_;                               \
    driver_data_.mdc_cr = MG_DRIVER_MDC_CR;                       \
    driver_data_.phy_addr = MG_TCPIP_PHY_ADDR;                    \
    mif_.ip = MG_TCPIP_IP;                                        \
    mif_.mask = MG_TCPIP_MASK;                                    \
    mif_.gw = MG_TCPIP_GW;                                        \
    mif_.driver = &mg_tcpip_driver_stm32f;                        \
    mif_.driver_data = &driver_data_;                             \
    MG_SET_MAC_ADDRESS(mif_.mac);                                 \
    mg_tcpip_init(mgr, &mif_);                                    \
    MG_INFO(("Driver: stm32f, MAC: %M", mg_print_mac, mif_.mac)); \
  } while (0)

#endif


#if MG_ENABLE_TCPIP
#if !defined(MG_ENABLE_DRIVER_STM32H)
#define MG_ENABLE_DRIVER_STM32H 0
#endif
#if !defined(MG_ENABLE_DRIVER_MCXN)
#define MG_ENABLE_DRIVER_MCXN 0
#endif
#if MG_ENABLE_DRIVER_STM32H || MG_ENABLE_DRIVER_MCXN

struct mg_tcpip_driver_stm32h_data {
  // MDC clock divider. MDC clock is derived from HCLK, must not exceed 2.5MHz
  //    HCLK range    DIVIDER    mdc_cr VALUE
  //    -------------------------------------
  //                                -1  <-- tell driver to guess the value
  //    60-100 MHz    HCLK/42        0
  //    100-150 MHz   HCLK/62        1
  //    20-35 MHz     HCLK/16        2
  //    35-60 MHz     HCLK/26        3
  //    150-250 MHz   HCLK/102       4  <-- value for max speed HSI
  //    250-300 MHz   HCLK/124       5  <-- value for Nucleo-H* on CSI
  //    300-500 MHz   HCLK/204       6
  //    500-800 MHz   HCLK/324       7
  int mdc_cr;  // Valid values: -1, 0, 1, 2, 3, 4, 5

  uint8_t phy_addr;  // PHY address
  uint8_t phy_conf;  // PHY config
};

#ifndef MG_TCPIP_PHY_CONF
#define MG_TCPIP_PHY_CONF MG_PHY_CLOCKS_MAC
#endif

#ifndef MG_TCPIP_PHY_ADDR
#define MG_TCPIP_PHY_ADDR 0
#endif

#ifndef MG_DRIVER_MDC_CR
#define MG_DRIVER_MDC_CR 4
#endif

#define MG_TCPIP_DRIVER_INIT(mgr)                                 \
  do {                                                            \
    static struct mg_tcpip_driver_stm32h_data driver_data_;       \
    static struct mg_tcpip_if mif_;                               \
    driver_data_.mdc_cr = MG_DRIVER_MDC_CR;                       \
    driver_data_.phy_addr = MG_TCPIP_PHY_ADDR;                    \
    driver_data_.phy_conf = MG_TCPIP_PHY_CONF;                    \
    mif_.ip = MG_TCPIP_IP;                                        \
    mif_.mask = MG_TCPIP_MASK;                                    \
    mif_.gw = MG_TCPIP_GW;                                        \
    mif_.driver = &mg_tcpip_driver_stm32h;                        \
    mif_.driver_data = &driver_data_;                             \
    MG_SET_MAC_ADDRESS(mif_.mac);                                 \
    mg_tcpip_init(mgr, &mif_);                                    \
    MG_INFO(("Driver: stm32h, MAC: %M", mg_print_mac, mif_.mac)); \
  } while (0)

#endif
#endif


#if MG_ENABLE_TCPIP && defined(MG_ENABLE_DRIVER_TM4C) && MG_ENABLE_DRIVER_TM4C

struct mg_tcpip_driver_tm4c_data {
  // MDC clock divider. MDC clock is derived from SYSCLK, must not exceed 2.5MHz
  //    SYSCLK range   DIVIDER   mdc_cr VALUE
  //    -------------------------------------
  //                                -1  <-- tell driver to guess the value
  //    60-100 MHz    SYSCLK/42      0
  //    100-150 MHz   SYSCLK/62      1  <-- value for EK-TM4C129* on max speed
  //    20-35 MHz     SYSCLK/16      2
  //    35-60 MHz     SYSCLK/26      3
  //    0x4-0xF Reserved
  int mdc_cr;  // Valid values: -1, 0, 1, 2, 3
};

#ifndef MG_DRIVER_MDC_CR
#define MG_DRIVER_MDC_CR 1
#endif

#define MG_TCPIP_DRIVER_INIT(mgr)                               \
  do {                                                          \
    static struct mg_tcpip_driver_tm4c_data driver_data_;       \
    static struct mg_tcpip_if mif_;                             \
    driver_data_.mdc_cr = MG_DRIVER_MDC_CR;                     \
    mif_.ip = MG_TCPIP_IP;                                      \
    mif_.mask = MG_TCPIP_MASK;                                  \
    mif_.gw = MG_TCPIP_GW;                                      \
    mif_.driver = &mg_tcpip_driver_tm4c;                        \
    mif_.driver_data = &driver_data_;                           \
    MG_SET_MAC_ADDRESS(mif_.mac);                               \
    mg_tcpip_init(mgr, &mif_);                                  \
    MG_INFO(("Driver: tm4c, MAC: %M", mg_print_mac, mif_.mac)); \
  } while (0)

#endif


#if MG_ENABLE_TCPIP && defined(MG_ENABLE_DRIVER_TMS570) && MG_ENABLE_DRIVER_TMS570
struct mg_tcpip_driver_tms570_data {
  int mdc_cr;
  int phy_addr;
};

#ifndef MG_TCPIP_PHY_ADDR
#define MG_TCPIP_PHY_ADDR 0
#endif

#ifndef MG_DRIVER_MDC_CR
#define MG_DRIVER_MDC_CR 1
#endif

#define MG_TCPIP_DRIVER_INIT(mgr)                               \
  do {                                                          \
    static struct mg_tcpip_driver_tms570_data driver_data_;     \
    static struct mg_tcpip_if mif_;                             \
    driver_data_.mdc_cr = MG_DRIVER_MDC_CR;                     \
    driver_data_.phy_addr = MG_TCPIP_PHY_ADDR;                  \
    mif_.ip = MG_TCPIP_IP;                                      \
    mif_.mask = MG_TCPIP_MASK;                                  \
    mif_.gw = MG_TCPIP_GW;                                      \
    mif_.driver = &mg_tcpip_driver_tms570;                      \
    mif_.driver_data = &driver_data_;                           \
    MG_SET_MAC_ADDRESS(mif_.mac);                               \
    mg_tcpip_init(mgr, &mif_);                                  \
    MG_INFO(("Driver: tms570, MAC: %M", mg_print_mac, mif_.mac));\
  } while (0)
#endif



#if MG_ENABLE_TCPIP && defined(MG_ENABLE_DRIVER_W5500) && MG_ENABLE_DRIVER_W5500

#endif


#if MG_ENABLE_TCPIP && defined(MG_ENABLE_DRIVER_XMC7) && MG_ENABLE_DRIVER_XMC7

struct mg_tcpip_driver_xmc7_data {
  int mdc_cr;  // Valid values: -1, 0, 1, 2, 3, 4, 5
  uint8_t phy_addr;
};

#ifndef MG_TCPIP_PHY_ADDR
#define MG_TCPIP_PHY_ADDR 0
#endif

#ifndef MG_DRIVER_MDC_CR
#define MG_DRIVER_MDC_CR 3
#endif

#define MG_TCPIP_DRIVER_INIT(mgr)                                 \
  do {                                                            \
    static struct mg_tcpip_driver_xmc7_data driver_data_;       \
    static struct mg_tcpip_if mif_;                               \
    driver_data_.mdc_cr = MG_DRIVER_MDC_CR;                       \
    driver_data_.phy_addr = MG_TCPIP_PHY_ADDR;                    \
    mif_.ip = MG_TCPIP_IP;                                        \
    mif_.mask = MG_TCPIP_MASK;                                    \
    mif_.gw = MG_TCPIP_GW;                                        \
    mif_.driver = &mg_tcpip_driver_xmc7;                        \
    mif_.driver_data = &driver_data_;                             \
    MG_SET_MAC_ADDRESS(mif_.mac);                                 \
    mg_tcpip_init(mgr, &mif_);                                    \
    MG_INFO(("Driver: xmc7, MAC: %M", mg_print_mac, mif_.mac)); \
  } while (0)

#endif



#if MG_ENABLE_TCPIP && defined(MG_ENABLE_DRIVER_XMC) && MG_ENABLE_DRIVER_XMC

struct mg_tcpip_driver_xmc_data {
  // 13.2.8.1 Station Management Functions
  // MDC clock divider (). MDC clock is derived from ETH MAC clock
  // It must not exceed 2.5MHz
  // ETH Clock range  DIVIDER       mdc_cr VALUE
  // --------------------------------------------
  //                                     -1  <-- tell driver to guess the value
  // 60-100 MHz       ETH Clock/42        0
  // 100-150 MHz      ETH Clock/62        1
  // 20-35 MHz        ETH Clock/16        2
  // 35-60 MHz        ETH Clock/26        3
  // 150-250 MHz      ETH Clock/102       4
  // 250-300 MHz      ETH Clock/124       5
  // 110, 111 Reserved
  int mdc_cr;  // Valid values: -1, 0, 1, 2, 3, 4, 5
  uint8_t phy_addr;
};

#ifndef MG_TCPIP_PHY_ADDR
#define MG_TCPIP_PHY_ADDR 0
#endif

#ifndef MG_DRIVER_MDC_CR
#define MG_DRIVER_MDC_CR 4
#endif

#define MG_TCPIP_DRIVER_INIT(mgr)                                 \
  do {                                                            \
    static struct mg_tcpip_driver_xmc_data driver_data_;       \
    static struct mg_tcpip_if mif_;                               \
    driver_data_.mdc_cr = MG_DRIVER_MDC_CR;                       \
    driver_data_.phy_addr = MG_TCPIP_PHY_ADDR;                    \
    mif_.ip = MG_TCPIP_IP;                                        \
    mif_.mask = MG_TCPIP_MASK;                                    \
    mif_.gw = MG_TCPIP_GW;                                        \
    mif_.driver = &mg_tcpip_driver_xmc;                        \
    mif_.driver_data = &driver_data_;                             \
    MG_SET_MAC_ADDRESS(mif_.mac);                                 \
    mg_tcpip_init(mgr, &mif_);                                    \
    MG_INFO(("Driver: xmc, MAC: %M", mg_print_mac, mif_.mac)); \
  } while (0)

#endif

#ifdef __cplusplus
}
#endif /* __cplusplus */
#endif /* CS_MONGOOSE_SRC_DNS_H_ */
#ifdef MG_MODULE_LINES
#line 1 "mongoose/src/mg_dns_server.h"
#endif

/*
 * === DNS server API reference
 *
 * Disabled by default; enable with `-DMG_ENABLE_DNS_SERVER`.
 */

#ifndef CS_MONGOOSE_SRC_DNS_SERVER_H_
#define CS_MONGOOSE_SRC_DNS_SERVER_H_

#if MG_ENABLE_DNS_SERVER

/* Amalgamated: #include "mg_dns.h" */

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

#define MG_DNS_SERVER_DEFAULT_TTL 3600

struct mg_dns_reply {
  struct mg_dns_message *msg;
  struct mbuf *io;
  size_t start;
};

/*
 * Creates a DNS reply.
 *
 * The reply will be based on an existing query message `msg`.
 * The query body will be appended to the output buffer.
 * "reply + recursion allowed" will be added to the message flags and the
 * message's num_answers will be set to 0.
 *
 * Answer records can be appended with `mg_dns_send_reply` or by lower
 * level function defined in the DNS API.
 *
 * In order to send a reply use `mg_dns_send_reply`.
 * It's possible to use a connection's send buffer as reply buffer,
 * and it will work for both UDP and TCP connections.
 *
 * Example:
 *
 * ```c
 * reply = mg_dns_create_reply(&nc->send_mbuf, msg);
 * for (i = 0; i < msg->num_questions; i++) {
 *   rr = &msg->questions[i];
 *   if (rr->rtype == MG_DNS_A_RECORD) {
 *     mg_dns_reply_record(&reply, rr, 3600, &dummy_ip_addr, 4);
 *   }
 * }
 * mg_dns_send_reply(nc, &reply);
 * ```
 */
struct mg_dns_reply mg_dns_create_reply(struct mbuf *io,
                                        struct mg_dns_message *msg);

/*
 * Appends a DNS reply record to the IO buffer and to the DNS message.
 *
 * The message's num_answers field will be incremented. It's the caller's duty
 * to ensure num_answers is properly initialised.
 *
 * Returns -1 on error.
 */
int mg_dns_reply_record(struct mg_dns_reply *reply,
                        struct mg_dns_resource_record *question,
                        const char *name, int rtype, int ttl, const void *rdata,
                        size_t rdata_len);

/*
 * Sends a DNS reply through a connection.
 *
 * The DNS data is stored in an IO buffer pointed by reply structure in `r`.
 * This function mutates the content of that buffer in order to ensure that
 * the DNS header reflects the size and flags of the message, that might have
 * been updated either with `mg_dns_reply_record` or by direct manipulation of
 * `r->message`.
 *
 * Once sent, the IO buffer will be trimmed unless the reply IO buffer
 * is the connection's send buffer and the connection is not in UDP mode.
 */
void mg_dns_send_reply(struct mg_connection *nc, struct mg_dns_reply *r);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* MG_ENABLE_DNS_SERVER */
#endif /* CS_MONGOOSE_SRC_DNS_SERVER_H_ */
#ifdef MG_MODULE_LINES
#line 1 "mongoose/src/mg_resolv.h"
#endif

/*
 * === API reference
 */

#ifndef CS_MONGOOSE_SRC_RESOLV_H_
#define CS_MONGOOSE_SRC_RESOLV_H_

/* Amalgamated: #include "mg_dns.h" */

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

enum mg_resolve_err {
  MG_RESOLVE_OK = 0,
  MG_RESOLVE_NO_ANSWERS = 1,
  MG_RESOLVE_EXCEEDED_RETRY_COUNT = 2,
  MG_RESOLVE_TIMEOUT = 3
};

typedef void (*mg_resolve_callback_t)(struct mg_dns_message *dns_message,
                                      void *user_data, enum mg_resolve_err);

/* Options for `mg_resolve_async_opt`. */
struct mg_resolve_async_opts {
  const char *nameserver;
  int max_retries;    /* defaults to 2 if zero */
  int timeout;        /* in seconds; defaults to 5 if zero */
  int accept_literal; /* pseudo-resolve literal ipv4 and ipv6 addrs */
  int only_literal;   /* only resolves literal addrs; sync cb invocation */
  struct mg_connection **dns_conn; /* return DNS connection */
};

/* See `mg_resolve_async_opt()` */
int mg_resolve_async(struct mg_mgr *mgr, const char *name, int query,
                     mg_resolve_callback_t cb, void *data);

/* Set default DNS server */
void mg_set_nameserver(struct mg_mgr *mgr, const char *nameserver);

/*
 * Resolved a DNS name asynchronously.
 *
 * Upon successful resolution, the user callback will be invoked
 * with the full DNS response message and a pointer to the user's
 * context `data`.
 *
 * In case of timeout while performing the resolution the callback
 * will receive a NULL `msg`.
 *
 * The DNS answers can be extracted with `mg_next_record` and
 * `mg_dns_parse_record_data`:
 *
 * [source,c]
 * ----
 * struct in_addr ina;
 * struct mg_dns_resource_record *rr = mg_next_record(msg, MG_DNS_A_RECORD,
 *   NULL);
 * mg_dns_parse_record_data(msg, rr, &ina, sizeof(ina));
 * ----
 */
int mg_resolve_async_opt(struct mg_mgr *mgr, const char *name, int query,
                         mg_resolve_callback_t cb, void *data,
                         struct mg_resolve_async_opts opts);

/*
 * Resolve a name from `/etc/hosts`.
 *
 * Returns 0 on success, -1 on failure.
 */
int mg_resolve_from_hosts_file(const char *host, union socket_address *usa);

#ifdef __cplusplus
}
#endif /* __cplusplus */
#endif /* CS_MONGOOSE_SRC_RESOLV_H_ */
#ifdef MG_MODULE_LINES
#line 1 "mongoose/src/mg_coap.h"
#endif

/*
 * === CoAP API reference
 *
 * CoAP message format:
 *
 * ```
 * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
 * |Ver| T | TKL | Code | Message ID | Token (if any, TKL bytes) ...
 * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
 * | Options (if any) ...            |1 1 1 1 1 1 1 1| Payload (if any) ...
 * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
 * ```
 */

#ifndef CS_MONGOOSE_SRC_COAP_H_
#define CS_MONGOOSE_SRC_COAP_H_

#if MG_ENABLE_COAP

#define MG_COAP_MSG_TYPE_FIELD 0x2
#define MG_COAP_CODE_CLASS_FIELD 0x4
#define MG_COAP_CODE_DETAIL_FIELD 0x8
#define MG_COAP_MSG_ID_FIELD 0x10
#define MG_COAP_TOKEN_FIELD 0x20
#define MG_COAP_OPTIOMG_FIELD 0x40
#define MG_COAP_PAYLOAD_FIELD 0x80

#define MG_COAP_ERROR 0x10000
#define MG_COAP_FORMAT_ERROR (MG_COAP_ERROR | 0x20000)
#define MG_COAP_IGNORE (MG_COAP_ERROR | 0x40000)
#define MG_COAP_NOT_ENOUGH_DATA (MG_COAP_ERROR | 0x80000)
#define MG_COAP_NETWORK_ERROR (MG_COAP_ERROR | 0x100000)

#define MG_COAP_MSG_CON 0
#define MG_COAP_MSG_NOC 1
#define MG_COAP_MSG_ACK 2
#define MG_COAP_MSG_RST 3
#define MG_COAP_MSG_MAX 3

#define MG_COAP_CODECLASS_REQUEST 0
#define MG_COAP_CODECLASS_RESP_OK 2
#define MG_COAP_CODECLASS_CLIENT_ERR 4
#define MG_COAP_CODECLASS_SRV_ERR 5

#define MG_COAP_EVENT_BASE 300
#define MG_EV_COAP_CON (MG_COAP_EVENT_BASE + MG_COAP_MSG_CON)
#define MG_EV_COAP_NOC (MG_COAP_EVENT_BASE + MG_COAP_MSG_NOC)
#define MG_EV_COAP_ACK (MG_COAP_EVENT_BASE + MG_COAP_MSG_ACK)
#define MG_EV_COAP_RST (MG_COAP_EVENT_BASE + MG_COAP_MSG_RST)

/*
 * CoAP options.
 * Use mg_coap_add_option and mg_coap_free_options
 * for creation and destruction.
 */
struct mg_coap_option {
  struct mg_coap_option *next;
  uint32_t number;
  struct mg_str value;
};

/* CoAP message. See RFC 7252 for details. */
struct mg_coap_message {
  uint32_t flags;
  uint8_t msg_type;
  uint8_t code_class;
  uint8_t code_detail;
  uint16_t msg_id;
  struct mg_str token;
  struct mg_coap_option *options;
  struct mg_str payload;
  struct mg_coap_option *optiomg_tail;
};

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

/* Sets CoAP protocol handler - triggers CoAP specific events. */
int mg_set_protocol_coap(struct mg_connection *nc);

/*
 * Adds a new option to mg_coap_message structure.
 * Returns pointer to the newly created option.
 * Note: options must be freed by using mg_coap_free_options
 */
struct mg_coap_option *mg_coap_add_option(struct mg_coap_message *cm,
                                          uint32_t number, char *value,
                                          size_t len);

/*
 * Frees the memory allocated for options.
 * If the cm parameter doesn't contain any option it does nothing.
 */
void mg_coap_free_options(struct mg_coap_message *cm);

/*
 * Composes a CoAP message from `mg_coap_message`
 * and sends it into `nc` connection.
 * Returns 0 on success. On error, it is a bitmask:
 *
 * - `#define MG_COAP_ERROR 0x10000`
 * - `#define MG_COAP_FORMAT_ERROR (MG_COAP_ERROR | 0x20000)`
 * - `#define MG_COAP_IGNORE (MG_COAP_ERROR | 0x40000)`
 * - `#define MG_COAP_NOT_ENOUGH_DATA (MG_COAP_ERROR | 0x80000)`
 * - `#define MG_COAP_NETWORK_ERROR (MG_COAP_ERROR | 0x100000)`
 */
uint32_t mg_coap_send_message(struct mg_connection *nc,
                              struct mg_coap_message *cm);

/*
 * Composes CoAP acknowledgement from `mg_coap_message`
 * and sends it into `nc` connection.
 * Return value: see `mg_coap_send_message()`
 */
uint32_t mg_coap_send_ack(struct mg_connection *nc, uint16_t msg_id);

/*
 * Parses CoAP message and fills mg_coap_message and returns cm->flags.
 * This is a helper function.
 *
 * NOTE: usually CoAP works over UDP, so lack of data means format error.
 * But, in theory, it is possible to use CoAP over TCP (according to RFC)
 *
 * The caller has to check results and treat COAP_NOT_ENOUGH_DATA according to
 * underlying protocol:
 *
 * - in case of UDP COAP_NOT_ENOUGH_DATA means COAP_FORMAT_ERROR,
 * - in case of TCP client can try to receive more data
 *
 * Return value: see `mg_coap_send_message()`
 */
uint32_t mg_coap_parse(struct mbuf *io, struct mg_coap_message *cm);

/*
 * Composes CoAP message from mg_coap_message structure.
 * This is a helper function.
 * Return value: see `mg_coap_send_message()`
 */
uint32_t mg_coap_compose(struct mg_coap_message *cm, struct mbuf *io);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* MG_ENABLE_COAP */

#endif /* CS_MONGOOSE_SRC_COAP_H_ */
#ifdef MG_MODULE_LINES
#line 1 "mongoose/src/mg_sntp.h"
#endif

#ifndef CS_MONGOOSE_SRC_SNTP_H_
#define CS_MONGOOSE_SRC_SNTP_H_

#if MG_ENABLE_SNTP

#define MG_SNTP_EVENT_BASE 500

/*
 * Received reply from time server. Event handler parameter contains
 * pointer to mg_sntp_message structure
 */
#define MG_SNTP_REPLY (MG_SNTP_EVENT_BASE + 1)

/* Received malformed SNTP packet */
#define MG_SNTP_MALFORMED_REPLY (MG_SNTP_EVENT_BASE + 2)

/* Failed to get time from server (timeout etc) */
#define MG_SNTP_FAILED (MG_SNTP_EVENT_BASE + 3)

struct mg_sntp_message {
  /* if server sends this flags, user should not send requests to it */
  int kiss_of_death;
  /* usual mg_time */
  double time;
};

/* Establishes connection to given sntp server */
struct mg_connection *mg_sntp_connect(struct mg_mgr *mgr,
                                      MG_CB(mg_event_handler_t event_handler,
                                            void *user_data),
                                      const char *sntp_server_name);

/* Sends time request to given connection */
void mg_sntp_send_request(struct mg_connection *c);

/*
 * Helper function
 * Establishes connection to time server, tries to send request
 * repeats sending SNTP_ATTEMPTS times every SNTP_TIMEOUT sec
 * (if needed)
 * See sntp_client example
 */
struct mg_connection *mg_sntp_get_time(struct mg_mgr *mgr,
                                       mg_event_handler_t event_handler,
                                       const char *sntp_server_name);

#endif

#endif /* CS_MONGOOSE_SRC_SNTP_H_ */
#ifdef MG_MODULE_LINES
#line 1 "mongoose/src/mg_socks.h"
#endif

#ifndef CS_MONGOOSE_SRC_SOCKS_H_
#define CS_MONGOOSE_SRC_SOCKS_H_

#if MG_ENABLE_SOCKS

#define MG_SOCKS_VERSION 5

#define MG_SOCKS_HANDSHAKE_DONE MG_F_USER_1
#define MG_SOCKS_CONNECT_DONE MG_F_USER_2

/* SOCKS5 handshake methods */
enum mg_socks_handshake_method {
  MG_SOCKS_HANDSHAKE_NOAUTH = 0,     /* Handshake method - no authentication */
  MG_SOCKS_HANDSHAKE_GSSAPI = 1,     /* Handshake method - GSSAPI auth */
  MG_SOCKS_HANDSHAKE_USERPASS = 2,   /* Handshake method - user/password auth */
  MG_SOCKS_HANDSHAKE_FAILURE = 0xff, /* Handshake method - failure */
};

/* SOCKS5 commands */
enum mg_socks_command {
  MG_SOCKS_CMD_CONNECT = 1,       /* Command: CONNECT */
  MG_SOCKS_CMD_BIND = 2,          /* Command: BIND */
  MG_SOCKS_CMD_UDP_ASSOCIATE = 3, /* Command: UDP ASSOCIATE */
};

/* SOCKS5 address types */
enum mg_socks_address_type {
  MG_SOCKS_ADDR_IPV4 = 1,   /* Address type: IPv4 */
  MG_SOCKS_ADDR_DOMAIN = 3, /* Address type: Domain name */
  MG_SOCKS_ADDR_IPV6 = 4,   /* Address type: IPv6 */
};

/* SOCKS5 response codes */
enum mg_socks_response {
  MG_SOCKS_SUCCESS = 0,            /* Response: success */
  MG_SOCKS_FAILURE = 1,            /* Response: failure */
  MG_SOCKS_NOT_ALLOWED = 2,        /* Response: connection not allowed */
  MG_SOCKS_NET_UNREACHABLE = 3,    /* Response: network unreachable */
  MG_SOCKS_HOST_UNREACHABLE = 4,   /* Response: network unreachable */
  MG_SOCKS_CONN_REFUSED = 5,       /* Response: network unreachable */
  MG_SOCKS_TTL_EXPIRED = 6,        /* Response: network unreachable */
  MG_SOCKS_CMD_NOT_SUPPORTED = 7,  /* Response: network unreachable */
  MG_SOCKS_ADDR_NOT_SUPPORTED = 8, /* Response: network unreachable */
};

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

/* Turn the connection into the SOCKS server */
void mg_set_protocol_socks(struct mg_connection *c);

/* Create socks tunnel for the client connection */
struct mg_iface *mg_socks_mk_iface(struct mg_mgr *, const char *proxy_addr);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif
#endif
#endif  // MONGOOSE_H
