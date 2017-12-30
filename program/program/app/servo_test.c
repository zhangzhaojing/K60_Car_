//±ê¶¨¶æ»ú

#include "program.h"

static servo_t steer={
  FTM1,FTM_Ch1,PTA9,50,  625, 80, 21, 637,166,625,-178//,median,amplitude, paramL, paramK
};

extern void app__steer_dev(void)
{
    servo__config(&steer);
    servo__set_duty(625);
    while(1)
    {    
    }
}