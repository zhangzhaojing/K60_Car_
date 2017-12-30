#ifndef _P_SERVO_H_
#define _P_SERVO_H_

#include <stdlib.h>
#include "common.h"

typedef struct 
{
  FTM_Type *FTMn;
  FtmChnEnum_Type FTM_Chn;
  PortPinsEnum_Type PTXn;
  uint32 freq;
  
  uint32 median;
  uint32 amplitude;
  float paramL;
  float paramB_left,paramK_left;
  float paramB_right,paramK_right;
  
  volatile uint32 duty;
  volatile int dir;//0=left,1=right,2=middle
}servo_t;

void servo__config(servo_t *srv);
void servo__set_duty(volatile uint32 duty);
void servo__set_radius_dir(float radius,int dir);//left or right :duty=atan(L/R)*K+B
uint32 servo__get_duty();
float servo__get_radius();


#define servo__duty2radius_left(srv, duty) ((srv)->paramL / tan(((float)(duty) - (float)((srv)->paramB_left))/(float)((srv)->paramK_left)))
#define servo__duty2radius_right(srv, duty) ((srv)->paramL / tan(((float)(duty) - (float)((srv)->paramB_right))/(float)((srv)->paramK_right)))

#define servo__radius2duty_left(srv, rad) ((srv)->paramB_left + atan((srv)->paramL / (float)(rad))*(srv)->paramK_left)
#define servo__radius2duty_right(srv, rad) ((srv)->paramB_right + atan((srv)->paramL / (float)(rad))*(srv)->paramK_right)

#endif