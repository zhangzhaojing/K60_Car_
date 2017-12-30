///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.10.1.12857/W32 for ARM      30/Dec/2017  19:25:56
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\19071_000\Desktop\K60_Car\program\program\app\program.c
//    Command line =  
//        -f C:\Users\19071_~1\AppData\Local\Temp\EWED20.tmp
//        (C:\Users\19071_000\Desktop\K60_Car\program\program\app\program.c -D
//        LPLD_K60 -D USE_K60DZ10 -lCN
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List -lB
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List -o
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\Obj
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config "C:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        8.0\arm\INC\c\DLib_Config_Normal.h" -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\app\ -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\CPU\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\common\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\LPLD\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\LPLD\HW\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\LPLD\FUNC\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\FatFs\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\FatFs\option\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\USB\common\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\USB\driver\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\USB\descriptor\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\USB\class\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\peripheral\
//        -Ol -I "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.0\arm\CMSIS\Include\" -D ARM_MATH_CM4)
//    Locale       =  C
//    List file    =  
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List\program.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN app__blind

        PUBLIC lptmr_init_param
        PUBLIC main

// C:\Users\19071_000\Desktop\K60_Car\program\program\app\program.c
//    1 /**
//    2  * --------------基于"拉普兰德K60底层库V3"的工程（LPLD_ServoControl）-----------------
//    3  * @file LPLD_ServoControl.c
//    4  * @version 0.2
//    5  * @date 2013-10-30
//    6  * @brief 利用FTM模块的PWM输出功能，实现舵机的控制。
//    7  *
//    8  * 版权所有:北京拉普兰德电子技术有限公司
//    9  * http://www.lpld.cn
//   10  * mail:support@lpld.cn
//   11  * 硬件平台:  LPLD K60 Card / LPLD K60 Nano
//   12  *
//   13  * 本工程基于"拉普兰德K60底层库V3"开发，
//   14  * 所有开源代码均在"lib"文件夹下，用户不必更改该目录下代码，
//   15  * 所有用户工程需保存在"project"文件夹下，以工程名定义文件夹名，
//   16  * 底层库使用方法见相关文档。 
//   17  *
//   18  */
//   19 #include "common.h"
//   20 #include "HW_LPTMR.h"
//   21    
//   22 #define CPU_MK60F15
//   23 
//   24 /****************************************
//   25  说明：
//   26    CPU_MK60DZ10 & CPU_MK60D10
//   27    *将PTC1引脚连接至舵机的信号线
//   28    CPU_MK60F12 & CPU_MK60F15
//   29    *将PTD0引脚连接至舵机的信号线
//   30     观察舵机的运动状态
//   31    *舵机控制信号脉宽范围0.5ms~2.5ms
//   32     即(-90°~+90°)
//   33  ****************************************/
//   34 
//   35 //函数声明
//   36 void pwm_init(void);
//   37 void delay(uint16);
//   38 uint32 angle_to_period(int8);

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   39 LPTMR_InitTypeDef lptmr_init_param;
lptmr_init_param:
        DS8 12
//   40 //变量定义
//   41 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   42 void main (void)
//   43 {    
main:
        PUSH     {R7,LR}
//   44 
//   45  // app__motor_dev();
//   46  //app__steer_dev();
//   47   app__blind();
        BL       app__blind
//   48   
//   49   
//   50   while(1){
??main_0:
        B.N      ??main_0
//   51   
//   52   }
//   53 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 12 bytes in section .bss
//  8 bytes in section .text
// 
//  8 bytes of CODE memory
// 12 bytes of DATA memory
//
//Errors: none
//Warnings: 1
