#ifndef _USRLIB_H_
#define _USRLIB_H_

#include <math.h>
#include "common.h"

#define M_PI (3.141592653589793f)

#define min(a,b) ((a)<(b)?(a):(b))
#define max(a,b) ((a)>(b)?(a):(b))
#define abs_diff(a,b) ((a)>=(b)?((a)-(b)):((b)-(a)))

void dummy_delay_ms(uint16);

#endif