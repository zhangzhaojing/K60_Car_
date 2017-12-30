///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.10.1.12857/W32 for ARM      30/Dec/2017  19:25:56
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\19071_000\Desktop\K60_Car\program\program\app\motor_test.c
//    Command line =  
//        -f C:\Users\19071_~1\AppData\Local\Temp\EWEB87.tmp
//        (C:\Users\19071_000\Desktop\K60_Car\program\program\app\motor_test.c
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
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List\motor_test.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN motor_controller__config
        EXTERN motor_controller__enable
        EXTERN motor_controller__set_duty

        PUBLIC app__motor_dev

// C:\Users\19071_000\Desktop\K60_Car\program\program\app\motor_test.c
//    1 #include "program.h"
//    2 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//    3 static motor_controller_t mtrctrl = {
mtrctrl:
        DC8 0, 0, 0, 0
        DC32 10
        DC8 1, 2, 0, 0
        DC32 40038000H
        DC8 0, 61, 0, 0
        DC32 30000, 40038000H
        DC8 1, 62, 0, 0
        DC32 30000, 40038000H
        DC8 2, 63, 0, 0
        DC32 30000, 40038000H
        DC8 3, 64, 0, 0
        DC32 30000
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
//    4     PIT0, 10, 
//    5     {LPTMR_ALT1}, {LPTMR_ALT2}, 
//    6     {{FTM0, FTM_Ch0, PTC1, 30000},  {FTM0, FTM_Ch1, PTC2, 30000}, 
//    7  {FTM0, FTM_Ch2, PTC3, 30000},{FTM0, FTM_Ch3, PTC4, 30000} /*RR*/   }
//    8 };
//    9 
//   10 
//   11 static void print_encoder(void){
//   12 	printf("[INFO] ecd_placc_value= {left:%d, right:%d}\n", 
//   13         mtrctrl.ecdlft.signed_value, mtrctrl.ecdrgt.signed_value);
//   14     printf("[INFO] ecd_mileage= {left:%d, right: %d}\n", 
//   15         mtrctrl.ecdlft.mileage, mtrctrl.ecdrgt.mileage);
//   16 }
//   17 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   18 extern void app__motor_dev(void){
app__motor_dev:
        PUSH     {R7,LR}
//   19 
//   20 	motor_controller__config(&mtrctrl);
        LDR.N    R0,??app__motor_dev_0
        BL       motor_controller__config
//   21     motor_controller__enable();
        BL       motor_controller__enable
//   22    
//   23    
//   24         motor_controller__set_duty(LEFT_MOTOR, (int32)(2000.0f));
        MOV      R1,#+2000
        MOVS     R0,#+0
        BL       motor_controller__set_duty
//   25         motor_controller__set_duty(RIGHT_MOTOR, (int32)(-2000.0f));
        LDR.N    R1,??app__motor_dev_0+0x4  ;; 0xfffff830
        MOVS     R0,#+1
        BL       motor_controller__set_duty
//   26        // dummy_delay_ms(1000);
//   27        //  motor_controller__set_duty(LEFT_MOTOR, (int32)(0));
//   28         //motor_controller__set_duty(RIGHT_MOTOR, (int32)(0));   
//   29         
//   30     //while(1){    
//   31     	
//   32     //}
//   33 }
        POP      {R0,PC}          ;; return
        DATA
??app__motor_dev_0:
        DC32     mtrctrl
        DC32     0xfffff830

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 136 bytes in section .data
//  40 bytes in section .text
// 
//  40 bytes of CODE memory
// 136 bytes of DATA memory
//
//Errors: none
//Warnings: 1
