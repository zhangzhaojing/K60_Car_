///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.10.1.12857/W32 for ARM      30/Dec/2017  19:25:56
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\ov7620.c
//    Command line =  
//        -f C:\Users\19071_~1\AppData\Local\Temp\EWEBC7.tmp
//        (C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\ov7620.c -D
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
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List\ov7620.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_DMA_EnableIrq
        EXTERN LPLD_DMA_Init
        EXTERN LPLD_GPIO_Init
        EXTERN LPLD_SCCB_Init
        EXTERN __aeabi_memclr4
        EXTERN __aeabi_memcpy4

        PUBLIC camera__take_a_photo_please
        PUBLIC ov7620__config

// C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\ov7620.c
//    1 #include "ov7620.h"

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void __NVIC_DisableIRQ(IRQn_Type)
__NVIC_DisableIRQ:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BMI.N    ??__NVIC_DisableIRQ_0
        MOVS     R2,#+1
        ANDS     R1,R0,#0x1F
        LSLS     R2,R2,R1
        LDR.N    R1,??DataTable5  ;; 0xe000e180
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        STR      R2,[R1, R0, LSL #+2]
??__NVIC_DisableIRQ_0:
        BX       LR               ;; return
//    2 #include "DEV_SCCB.h"
//    3 
//    4 #define H_MAX 240//hangshu
//    5 #define L_MAX 320//lieshu
//    6 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
//    7 static boolean acq_flag;
acq_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    8 static uint32 vsync_cnt, href_cnt, rowacq_cnt;
vsync_cnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
href_cnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
rowacq_cnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    9 static uint8 Pix_Data[H_MAX*L_MAX];
Pix_Data:
        DS8 76800
//   10 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   11 static void vsync_isr(){
//   12     if(LPLD_GPIO_IsPinxExt(PORTD, GPIO_Pin14))
vsync_isr:
        LDR.N    R0,??DataTable5_1  ;; 0x4004c0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+17
        BPL.N    ??vsync_isr_0
//   13   {
//   14     LPLD_DMA_LoadDstAddr(DMA_CH0, Pix_Data);
        LDR.N    R0,??DataTable5_2
        LDR.N    R1,??DataTable5_3  ;; 0x40009010
        STR      R0,[R1, #+0]
//   15     LPLD_DMA_LoadSrcAddr(DMA_CH0, &PTE->PDIR);
        LDR.N    R0,??DataTable5_4  ;; 0x400ff110
        LDR.N    R1,??DataTable5_5  ;; 0x40009000
        STR      R0,[R1, #+0]
//   16     vsync_cnt++;//当前场数
        LDR.N    R0,??DataTable5_6
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable5_6
        STR      R0,[R1, #+0]
//   17     href_cnt=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_7
        STR      R0,[R1, #+0]
//   18     rowacq_cnt=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_8
        STR      R0,[R1, #+0]
//   19     acq_flag=TRUE;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_9
        STRB     R0,[R1, #+0]
//   20   }
//   21 }
??vsync_isr_0:
        BX       LR               ;; return
//   22 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   23 static void href_isr(){
//   24     if(LPLD_GPIO_IsPinxExt(PORTD, GPIO_Pin13))
href_isr:
        LDR.N    R0,??DataTable5_1  ;; 0x4004c0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+18
        BPL.N    ??href_isr_0
//   25   {
//   26     if(acq_flag){
        LDR.N    R0,??DataTable5_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??href_isr_0
//   27     LPLD_DMA_EnableReq(DMA_CH0);
        LDR.N    R0,??DataTable5_10  ;; 0x4000800c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable5_10  ;; 0x4000800c
        STR      R0,[R1, #+0]
//   28     href_cnt++;
        LDR.N    R0,??DataTable5_7
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable5_7
        STR      R0,[R1, #+0]
//   29     }
//   30   }
//   31 }
??href_isr_0:
        BX       LR               ;; return
//   32 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   33 static void row_finish(){
row_finish:
        PUSH     {R7,LR}
//   34   rowacq_cnt++;
        LDR.N    R0,??DataTable5_8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable5_8
        STR      R0,[R1, #+0]
//   35   if(rowacq_cnt==H_MAX){
        LDR.N    R0,??DataTable5_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+240
        BNE.N    ??row_finish_0
//   36      acq_flag = FALSE;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_9
        STRB     R0,[R1, #+0]
//   37      disable_irq(PORTD_IRQn);
        MOVS     R0,#+90
        BL       __NVIC_DisableIRQ
//   38   }
//   39 }
??row_finish_0:
        POP      {R0,PC}          ;; return
//   40 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   41 void camera__take_a_photo_please(){
//   42     if(acq_flag == TRUE) return;
camera__take_a_photo_please:
        LDR.N    R0,??DataTable5_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??camera__take_a_photo_please_0
//   43     LPLD_GPIO_ClearIntFlag(PORTD);
??camera__take_a_photo_please_1:
        MOVS     R0,#-1
        LDR.N    R1,??DataTable5_1  ;; 0x4004c0a0
        STR      R0,[R1, #+0]
//   44    // enable_irq(PORTD_IRQn);
//   45 }
??camera__take_a_photo_please_0:
        BX       LR               ;; return
//   46 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   47 void ov7620__config(){
ov7620__config:
        PUSH     {LR}
        SUB      SP,SP,#+76
//   48     GPIO_InitTypeDef gpio_init={0};
        ADD      R0,SP,#+4
        MOVS     R1,#+20
        BL       __aeabi_memclr4
//   49     DMA_InitTypeDef  dma_init={0};
        ADD      R0,SP,#+28
        MOVS     R1,#+44
        BL       __aeabi_memclr4
//   50     
//   51     LPLD_SCCB_Init();
        BL       LPLD_SCCB_Init
//   52     
//   53     // init vsync 
//   54     gpio_init.GPIO_PTx = PTD;
        LDR.N    R0,??DataTable5_11  ;; 0x400ff0c0
        STR      R0,[SP, #+4]
//   55     gpio_init.GPIO_Pins = GPIO_Pin14;
        MOV      R0,#+16384
        STR      R0,[SP, #+8]
//   56     gpio_init.GPIO_Dir = DIR_INPUT; 
        MOVS     R0,#+0
        STRB     R0,[SP, #+16]
//   57     gpio_init.GPIO_Isr = vsync_isr;
        LDR.N    R0,??DataTable5_12
        STR      R0,[SP, #+20]
//   58     gpio_init.GPIO_PinControl = INPUT_PULL_DOWN|IRQC_FA;
        LDR.N    R0,??DataTable5_13  ;; 0xa0002
        STR      R0,[SP, #+12]
//   59     LPLD_GPIO_Init(gpio_init);
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   60     
//   61     // init href
//   62     gpio_init.GPIO_PTx = PTD;
        LDR.N    R0,??DataTable5_11  ;; 0x400ff0c0
        STR      R0,[SP, #+4]
//   63     gpio_init.GPIO_Pins = GPIO_Pin13;
        MOV      R0,#+8192
        STR      R0,[SP, #+8]
//   64     gpio_init.GPIO_Dir = DIR_INPUT; 
        MOVS     R0,#+0
        STRB     R0,[SP, #+16]
//   65     gpio_init.GPIO_Isr = href_isr;
        LDR.N    R0,??DataTable5_14
        STR      R0,[SP, #+20]
//   66     gpio_init.GPIO_PinControl = INPUT_PULL_UP|IRQC_RI;
        LDR.N    R0,??DataTable5_15  ;; 0x90003
        STR      R0,[SP, #+12]
//   67     LPLD_GPIO_Init(gpio_init);    
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   68    ///////////////////////////////////// disable_irq()
//   69     
//   70     // init pclk
//   71     gpio_init.GPIO_PTx = PTD;
        LDR.N    R0,??DataTable5_11  ;; 0x400ff0c0
        STR      R0,[SP, #+4]
//   72     gpio_init.GPIO_Pins = GPIO_Pin12;
        MOV      R0,#+4096
        STR      R0,[SP, #+8]
//   73     gpio_init.GPIO_Dir = DIR_INPUT; 
        MOVS     R0,#+0
        STRB     R0,[SP, #+16]
//   74     gpio_init.GPIO_Isr = NULL;
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
//   75     gpio_init.GPIO_PinControl = INPUT_PULL_UP|IRQC_DMARI;
        LDR.N    R0,??DataTable5_16  ;; 0x10003
        STR      R0,[SP, #+12]
//   76     LPLD_GPIO_Init(gpio_init);  
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   77     
//   78     // init d0-d7
//   79     gpio_init.GPIO_PTx = PTE;      
        LDR.N    R0,??DataTable5_17  ;; 0x400ff100
        STR      R0,[SP, #+4]
//   80     gpio_init.GPIO_Pins = GPIO_Pin0_7;     
        MOVS     R0,#+255
        STR      R0,[SP, #+8]
//   81     gpio_init.GPIO_Dir = DIR_INPUT;        
        MOVS     R0,#+0
        STRB     R0,[SP, #+16]
//   82     gpio_init.GPIO_Isr = NULL;
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
//   83     gpio_init.GPIO_PinControl = INPUT_PULL_DOWN|IRQC_DIS;   
        MOVS     R0,#+2
        STR      R0,[SP, #+12]
//   84     LPLD_GPIO_Init(gpio_init);
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   85        
//   86     //配置接收DMA
//   87     dma_init.DMA_CHx = DMA_CH0; 
        MOVS     R0,#+0
        STRB     R0,[SP, #+28]
//   88     dma_init.DMA_MajorLoopCnt   = L_MAX; 
        MOV      R0,#+320
        STRH     R0,[SP, #+32]
//   89     dma_init.DMA_MinorByteCnt   = 1; 
        MOVS     R0,#+1
        STR      R0,[SP, #+36]
//   90     dma_init.DMA_MajorCompleteIntEnable = TRUE; 
        MOVS     R0,#+1
        STRB     R0,[SP, #+65]
//   91     dma_init.DMA_Req            = PORTE_DMAREQ; 
        MOVS     R0,#+53
        STRB     R0,[SP, #+29]
//   92     
//   93     dma_init.DMA_DestAddr       = (uint32)Pix_Data; 
        LDR.N    R0,??DataTable5_2
        STR      R0,[SP, #+52]
//   94     dma_init.DMA_DestAddrOffset = 1;                
        MOVS     R0,#+1
        STRH     R0,[SP, #+58]
//   95     dma_init.DMA_DestDataSize   = DMA_DST_8BIT;     
        MOVS     R0,#+0
        STRB     R0,[SP, #+56]
//   96     
//   97     dma_init.DMA_SourceAddr     = (uint32)&PTE->PDIR;
        LDR.N    R0,??DataTable5_4  ;; 0x400ff110
        STR      R0,[SP, #+40]
//   98     dma_init.DMA_SourceDataSize = DMA_SRC_8BIT;   
        MOVS     R0,#+0
        STRB     R0,[SP, #+44]
//   99     
//  100     dma_init.DMA_AutoDisableReq = TRUE;            
        MOVS     R0,#+1
        STRB     R0,[SP, #+64]
//  101     dma_init.DMA_Isr = row_finish; /////
        LDR.N    R0,??DataTable5_18
        STR      R0,[SP, #+68]
//  102     
//  103     LPLD_DMA_Init(dma_init); 
        ADD      R1,SP,#+28
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_Init
//  104     //LPLD_DMA_DisableReq(DMA_CH0);
//  105     //LPLD_DMA_EnableReq(DMA_CH0);
//  106     LPLD_DMA_EnableIrq(dma_init);
        ADD      R1,SP,#+28
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_EnableIrq
//  107     
//  108     ///////////////
//  109     vsync_cnt=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_6
        STR      R0,[R1, #+0]
//  110     acq_flag=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_9
        STRB     R0,[R1, #+0]
//  111 }
        ADD      SP,SP,#+76
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x4004c0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     Pix_Data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x40009010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x400ff110

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x40009000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     vsync_cnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     href_cnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     rowacq_cnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     acq_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     0x4000800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     0x400ff0c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     vsync_isr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     0xa0002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     href_isr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_15:
        DC32     0x90003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_16:
        DC32     0x10003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_17:
        DC32     0x400ff100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_18:
        DC32     row_finish

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//  112 
//  113 
//  114 
//  115 
//  116 
//  117 
//  118 
//  119 
//  120 
//  121 
//  122 
//  123 
//  124 
//  125 
//  126 
//  127 
//  128 
//  129 
//  130 
//  131 
// 
// 76 813 bytes in section .bss
//     64 bytes in section .rodata
//    552 bytes in section .text
// 
//    552 bytes of CODE  memory
//     64 bytes of CONST memory
// 76 813 bytes of DATA  memory
//
//Errors: none
//Warnings: none
