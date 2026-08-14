#include <stdbool.h>

#ifndef _LIBHSL_H_
#define _LIBHSL_H_

#ifdef __cplusplus
extern "C" {
#endif

bool LIBHSL_isfunctional();

/* Version number of LIBHSL */
#define LIBHSL_VER_MAJOR 4
#define LIBHSL_VER_MINOR 0
#define LIBHSL_VER_PATCH 8
void LIBHSL_version(int *major, int *minor, int *patch);

#ifdef __cplusplus
}
#endif

#endif  /* _LIBHSL_H_ */
