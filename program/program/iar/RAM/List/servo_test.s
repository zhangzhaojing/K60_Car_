///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.10.1.12857/W32 for ARM      30/Dec/2017  19:25:57
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\19071_000\Desktop\K60_Car\program\program\app\servo_test.c
//    Command line =  
//        -f C:\Users\19071_~1\AppData\Local\Temp\EWEEBB.tmp
//        (C:\Users\19071_000\Desktop\K60_Car\program\program\app\servo_test.c
//        -D LPLD_K60 -D USE_K60DZ10 -lCN
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
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List\servo_test.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN servo__config
        EXTERN servo__set_duty

        PUBLIC app__steer_dev

// C:\Users\19071_000\Desktop\K60_Car\program\program\app\servo_test.c
//    1 //±ê¶¨¶æ»ú
//    2 
//    3 #include "program.h"
//    4 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//    5 static servo_t steer={
steer:
        DC32 40039000H
        DC8 1, 9, 0, 0
        DC32 50, 625, 80, 41A80000H, 441F4000H, 43260000H, 441C4000H
        DC32 0C3320000H
        DC8 0, 0, 0, 0, 0, 0, 0, 0
//    6   FTM1,FTM_Ch1,PTA9,50,  625, 80, 21, 637,166,625,-178//,median,amplitude, paramL, paramK
//    7 };
//    8 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//    9 extern void app__steer_dev(void)
//   10 {
app__steer_dev:
        PUSH     {R7,LR}
//   11     servo__config(&steer);
        LDR.N    R0,??app__steer_dev_0
        BL       servo__config
//   12     servo__set_duty(625);
        MOVW     R0,#+625
        BL       servo__set_duty
//   13     while(1)
??app__steer_dev_1:
        B.N      ??app__steer_dev_1
        Nop      
        DATA
??app__steer_dev_0:
        DC32     steer
//   14     {    
//   15     }
//   16 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 48 bytes in section .data
// 24 bytes in section .text
// 
// 24 bytes of CODE memory
// 48 bytes of DATA memory
//
//Errors: none
//Warnings: none
