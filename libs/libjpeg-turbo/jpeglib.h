/*
 * Wrapper header to avoid duplicate/conflicting local copy.
 * Use the upstream libjpeg-turbo public header located in include/jpeglib.h.
 * This file intentionally contains no declarations to prevent type/macro
 * redefinition errors witnessed previously. All code should include this
 * path-neutral filename; the real definitions come from the include/ tree.
 */
#ifndef JPEGLIB_H_WRAPPER
#define JPEGLIB_H_WRAPPER

#include "include/jpeglib.h"

#endif /* JPEGLIB_H_WRAPPER */
