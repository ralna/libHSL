#include "libhsl.h"

bool LIBHSL_isfunctional(){
  return false;
}

void LIBHSL_version(int *major, int *minor, int *patch){
    *major = LIBHSL_VER_MAJOR;
    *minor = LIBHSL_VER_MINOR;
    *patch = LIBHSL_VER_PATCH;
}
