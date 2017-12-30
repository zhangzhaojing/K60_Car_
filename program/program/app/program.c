/**
 * --------------基于"拉普兰德K60底层库V3"的工程（LPLD_ServoControl）-----------------
 * @file LPLD_ServoControl.c
 * @version 0.2
 * @date 2013-10-30
 * @brief 利用FTM模块的PWM输出功能，实现舵机的控制。
 *
 * 版权所有:北京拉普兰德电子技术有限公司
 * http://www.lpld.cn
 * mail:support@lpld.cn
 * 硬件平台:  LPLD K60 Card / LPLD K60 Nano
 *
 * 本工程基于"拉普兰德K60底层库V3"开发，
 * 所有开源代码均在"lib"文件夹下，用户不必更改该目录下代码，
 * 所有用户工程需保存在"project"文件夹下，以工程名定义文件夹名，
 * 底层库使用方法见相关文档。 
 *
 */
#include "common.h"
#include "HW_LPTMR.h"
   
#define CPU_MK60F15

/****************************************
 说明：
   CPU_MK60DZ10 & CPU_MK60D10
   *将PTC1引脚连接至舵机的信号线
   CPU_MK60F12 & CPU_MK60F15
   *将PTD0引脚连接至舵机的信号线
    观察舵机的运动状态
   *舵机控制信号脉宽范围0.5ms~2.5ms
    即(-90°~+90°)
 ****************************************/

//函数声明
void pwm_init(void);
void delay(uint16);
uint32 angle_to_period(int8);
LPTMR_InitTypeDef lptmr_init_param;
//变量定义

void main (void)
{    

 // app__motor_dev();
 //app__steer_dev();
  app__blind();
  
  
  while(1){
  
  }
}