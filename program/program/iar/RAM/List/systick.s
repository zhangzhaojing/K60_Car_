///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.10.1.12857/W32 for ARM      30/Dec/2017  19:25:57
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\systick.c
//    Command line =  
//        -f C:\Users\19071_~1\AppData\Local\Temp\EWEFD7.tmp
//        (C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\systick.c -D
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
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List\systick.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_SYSTICK_Init

        PUBLIC systick__config
        PUBLIC systick__delay_us
        PUBLIC systick__get

// C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\systick.c
//    1 #include "systick.h"
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
        DATA
//    3 static long long _systick;
_systick:
        DS8 8
//    4 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    5 static void systick__acc(void){
//    6 	_systick ++;
systick__acc:
        LDR.N    R0,??DataTable3
        LDRD     R0,R1,[R0, #+0]
        ADDS     R0,R0,#+1
        SBCS     R1,R1,#-1
        LDR.N    R2,??DataTable3
        STRD     R0,R1,[R2, #+0]
//    7 }
        BX       LR               ;; return
//    8 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    9 void systick__config(void){
systick__config:
        PUSH     {R4,LR}
        SUB      SP,SP,#+16
//   10 	SYSTICK_InitType systick_init = {1, 0, systick__acc};
        MOV      R0,SP
        LDR.N    R1,??DataTable3_1
        LDM      R1,{R2-R4}
        STM      R0,{R2-R4}
//   11 	LPLD_SYSTICK_Init(systick_init);
        MOV      R0,SP
        LDM      R0,{R0-R2}
        BL       LPLD_SYSTICK_Init
//   12 }
        POP      {R0-R4,PC}       ;; return

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_0:
        DC32 1, 0, systick__acc
//   13 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   14 long long systick__get(void){
//   15 	return _systick;
systick__get:
        LDR.N    R0,??DataTable3
        LDRD     R0,R1,[R0, #+0]
        BX       LR               ;; return
//   16 }
//   17 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   18 void systick__delay_us(uint32 us){
//   19 	long long _systick_end = _systick + us;
systick__delay_us:
        LDR.N    R1,??DataTable3
        LDRD     R2,R3,[R1, #+0]
        MOVS     R1,#+0
        ADDS     R0,R2,R0
        ADCS     R1,R3,R1
//   20 	while(_systick < _systick_end);
??systick__delay_us_0:
        LDR.N    R2,??DataTable3
        LDRD     R2,R3,[R2, #+0]
        CMP      R3,R1
        BLT.N    ??systick__delay_us_0
        BGT.N    ??systick__delay_us_1
        CMP      R2,R0
        BCC.N    ??systick__delay_us_0
//   21 }
??systick__delay_us_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     _systick

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     ?_0

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
//  8 bytes in section .bss
// 12 bytes in section .rodata
// 92 bytes in section .text
// 
// 92 bytes of CODE  memory
// 12 bytes of CONST memory
//  8 bytes of DATA  memory
//
//Errors: none
//Warnings: none
