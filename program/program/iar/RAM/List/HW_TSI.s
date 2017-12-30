///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.10.1.12857/W32 for ARM      30/Dec/2017  19:25:55
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\19071_000\Desktop\K60_Car\lib\LPLD\HW\HW_TSI.c
//    Command line =  
//        -f C:\Users\19071_~1\AppData\Local\Temp\EWE7B8.tmp
//        (C:\Users\19071_000\Desktop\K60_Car\lib\LPLD\HW\HW_TSI.c -D LPLD_K60
//        -D USE_K60DZ10 -lCN
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
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List\HW_TSI.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN assert_failed

        PUBLIC LPLD_TSI_Deinit
        PUBLIC LPLD_TSI_Init
        PUBLIC LPLD_TSI_IsChxTouched
        PUBLIC TSI_CNTR
        PUBLIC TSI_ChxBaseVal
        PUBLIC TSI_IRQHandler
        PUBLIC TSI_ISR
        PUBLIC TSI_PORT

// C:\Users\19071_000\Desktop\K60_Car\lib\LPLD\HW\HW_TSI.c
//    1 /**
//    2  * @file HW_TSI.c
//    3  * @version 3.0[By LPLD]
//    4  * @date 2013-06-18
//    5  * @brief TSI底层模块相关函数
//    6  *
//    7  * 更改建议:不建议修改
//    8  *
//    9  * 版权所有:北京拉普兰德电子技术有限公司
//   10  * http://www.lpld.cn
//   11  * mail:support@lpld.cn
//   12  *
//   13  * @par
//   14  * 本代码由拉普兰德[LPLD]开发并维护，并向所有使用者开放源代码。
//   15  * 开发者可以随意修使用或改源代码。但本段及以上注释应予以保留。
//   16  * 不得更改或删除原版权所有者姓名，二次开发者可以加注二次版权所有者。
//   17  * 但应在遵守此协议的基础上，开放源代码、不得出售代码本身。
//   18  * 拉普兰德不负责由于使用本代码所带来的任何事故、法律责任或相关不良影响。
//   19  * 拉普兰德无义务解释、说明本代码的具体原理、功能、实现方法。
//   20  * 除非拉普兰德[LPLD]授权，开发者不得将本代码用于商业产品。
//   21  */
//   22 
//   23 #include "common.h"

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
        LDR.N    R1,??DataTable4  ;; 0xe000e180
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        STR      R2,[R1, R0, LSL #+2]
??__NVIC_DisableIRQ_0:
        BX       LR               ;; return
//   24 #include "HW_TSI.h"
//   25 
//   26 
//   27 //用户自定义中断服务函数数组

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   28 TSI_ISR_CALLBACK TSI_ISR[2];
TSI_ISR:
        DS8 8
//   29 
//   30 //通道基准值

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   31 uint16 TSI_ChxBaseVal[16];
TSI_ChxBaseVal:
        DS8 32
//   32 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//   33 const uint16* TSI_CNTR[16]={(uint16*)&TSI0->CNTR1, (uint16*)(&TSI0->CNTR1)+1,
TSI_CNTR:
        DC32 40045100H, 40045102H, 40045104H, 40045106H, 40045108H, 4004510AH
        DC32 4004510CH, 4004510EH, 40045110H, 40045112H, 40045114H, 40045116H
        DC32 40045118H, 4004511AH, 4004511CH, 4004511EH
//   34                             (uint16*)&TSI0->CNTR3, (uint16*)(&TSI0->CNTR3)+1,
//   35                             (uint16*)&TSI0->CNTR5, (uint16*)(&TSI0->CNTR5)+1,
//   36                             (uint16*)&TSI0->CNTR7, (uint16*)(&TSI0->CNTR7)+1,
//   37                             (uint16*)&TSI0->CNTR9, (uint16*)(&TSI0->CNTR9)+1,
//   38                             (uint16*)&TSI0->CNTR11, (uint16*)(&TSI0->CNTR11)+1,
//   39                             (uint16*)&TSI0->CNTR13, (uint16*)(&TSI0->CNTR13)+1,
//   40                             (uint16*)&TSI0->CNTR15, (uint16*)(&TSI0->CNTR15)+1}; 
//   41  

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//   42 const uint32* TSI_PORT[32]={(uint32*)&PORTB->PCR[0], (uint32*)&PORTA->PCR[0], (uint32*)&PORTA->PCR[1], (uint32*)&PORTA->PCR[2],
TSI_PORT:
        DC32 4004A000H, 40049000H, 40049004H, 40049008H, 4004900CH, 40049010H
        DC32 4004A004H, 4004A008H, 4004A00CH, 4004A040H, 4004A044H, 4004A048H
        DC32 4004A04CH, 4004B000H, 4004B004H, 4004B008H
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
//   43                             (uint32*)&PORTA->PCR[3], (uint32*)&PORTA->PCR[4], (uint32*)&PORTB->PCR[1], (uint32*)&PORTB->PCR[2], 
//   44                             (uint32*)&PORTB->PCR[3], (uint32*)&PORTB->PCR[16], (uint32*)&PORTB->PCR[17], (uint32*)&PORTB->PCR[18], 
//   45                             (uint32*)&PORTB->PCR[19], (uint32*)&PORTC->PCR[0], (uint32*)&PORTC->PCR[1], (uint32*)&PORTC->PCR[2]};
//   46 
//   47 /*
//   48  * LPLD_TSI_Init
//   49  * TSI通用初始化函数
//   50  * 
//   51  * 参数:
//   52  *    tsi_init_struct--TSI初始化结构体，
//   53  *                        具体定义见TSI_InitTypeDef
//   54  *
//   55  * 输出:
//   56  *    0--配置错误
//   57  *    1--配置成功
//   58  */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   59 uint8 LPLD_TSI_Init(TSI_InitTypeDef tsi_init_struct)
//   60 {
LPLD_TSI_Init:
        PUSH     {R0-R3}
        PUSH     {R3-R7,LR}
//   61   uint16 chs = tsi_init_struct.TSI_Chs;
        LDRH     R4,[SP, #+24]
//   62   uint8 mode = tsi_init_struct.TSI_ScanTriggerMode;
        LDRB     R6,[SP, #+26]
//   63   uint8 esor = tsi_init_struct.TSI_EndScanOrOutRangeInt;
        LDRB     R5,[SP, #+27]
//   64   boolean err = tsi_init_struct.TIS_ErrIntEnable;
        LDRB     R7,[SP, #+28]
//   65    
//   66   //参数检查
//   67   ASSERT( chs != 0);                  //判断通道
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BNE.N    ??LPLD_TSI_Init_0
        MOVS     R1,#+67
        LDR.N    R0,??DataTable4_1
        BL       assert_failed
//   68   ASSERT( mode <= TSI_SCAN_PERIOD);   //判断中断模式
??LPLD_TSI_Init_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+2
        BLT.N    ??LPLD_TSI_Init_1
        MOVS     R1,#+68
        LDR.N    R0,??DataTable4_1
        BL       assert_failed
//   69   ASSERT( esor <= TSI_ENDOFDCAN_INT);//判断中断模式
??LPLD_TSI_Init_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+2
        BLT.N    ??LPLD_TSI_Init_2
        MOVS     R1,#+69
        LDR.N    R0,??DataTable4_1
        BL       assert_failed
//   70   
//   71   //开启TSI模块时钟
//   72   SIM->SCGC5 |= (SIM_SCGC5_TSI_MASK); 
??LPLD_TSI_Init_2:
        LDR.N    R0,??DataTable4_2  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable4_2  ;; 0x40048038
        STR      R0,[R1, #+0]
//   73   
//   74   //这里使能相关通道的引脚复用功能
//   75   for(uint8 i=0; i<16; i++)
        MOVS     R0,#+0
        B.N      ??LPLD_TSI_Init_3
//   76   {
//   77     if((chs>>i)&0x1L)
??LPLD_TSI_Init_4:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R1,R4
        ASRS     R1,R1,R0
        LSLS     R1,R1,#+31
        BPL.N    ??LPLD_TSI_Init_5
//   78     {
//   79       *((uint32 *)TSI_PORT) = PORT_PCR_MUX(0); 
        MOVS     R1,#+0
        LDR.N    R2,??DataTable4_3
        STR      R1,[R2, #+0]
//   80     }
//   81   }
??LPLD_TSI_Init_5:
        ADDS     R0,R0,#+1
??LPLD_TSI_Init_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BLT.N    ??LPLD_TSI_Init_4
//   82   
//   83   //配置通用控制寄存器
//   84   TSI0->GENCS = ((TSI_GENCS_NSCN(10))  //每个电极每次扫描(10)次、
//   85                   |(TSI_GENCS_PS(3)));  //电极晶振(2^3)分频
        MOVS     R0,#+5439488
        LDR.N    R1,??DataTable4_4  ;; 0x40045000
        STR      R0,[R1, #+0]
//   86   //配置扫描寄存器
//   87   TSI0->SCANC = ((TSI_SCANC_EXTCHRG(3))        //0.8pF内部参考电容
//   88                   |(TSI_SCANC_REFCHRG(31))      //32uA充电电流
//   89 #if defined(CPU_MK60DZ10)
//   90                   |(TSI_SCANC_DELVOL(7))        //600mV间隔电压
//   91 #endif
//   92                   |(TSI_SCANC_SMOD(0))          //扫描周期mod
//   93                   |(TSI_SCANC_AMPSC(0)));       //输入时钟(2^0)分频
        LDR.N    R0,??DataTable4_5  ;; 0xf81f0000
        LDR.N    R1,??DataTable4_6  ;; 0x40045004
        STR      R0,[R1, #+0]
//   94   //使能通道
//   95   TSI0->PEN = chs;
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LDR.N    R0,??DataTable4_7  ;; 0x40045008
        STR      R4,[R0, #+0]
//   96   
//   97   //使能相关中断
//   98   //TSI_ENDOFDCAN_INT和TSI_OUTOFRANGE_INT只能选择其一
//   99   if(tsi_init_struct.TSI_EndScanIsr!=NULL && esor==TSI_ENDOFDCAN_INT)
        LDR      R0,[SP, #+32]
        CMP      R0,#+0
        BEQ.N    ??LPLD_TSI_Init_6
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??LPLD_TSI_Init_6
//  100   {
//  101     TSI0->GENCS |= TSI_GENCS_ESOR_MASK;
        LDR.N    R0,??DataTable4_4  ;; 0x40045000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable4_4  ;; 0x40045000
        STR      R0,[R1, #+0]
//  102     TSI_ISR[0] = tsi_init_struct.TSI_EndScanIsr;
        LDR      R0,[SP, #+32]
        LDR.N    R1,??DataTable4_8
        STR      R0,[R1, #+0]
//  103     TSI0->GENCS |= TSI_GENCS_TSIIE_MASK;   
        LDR.N    R0,??DataTable4_4  ;; 0x40045000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable4_4  ;; 0x40045000
        STR      R0,[R1, #+0]
        B.N      ??LPLD_TSI_Init_7
//  104   }
//  105   else if(tsi_init_struct.TSI_OutRangeIsr!=NULL && esor==TSI_OUTOFRANGE_INT)
??LPLD_TSI_Init_6:
        LDR      R0,[SP, #+36]
        CMP      R0,#+0
        BEQ.N    ??LPLD_TSI_Init_7
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??LPLD_TSI_Init_7
//  106   {
//  107     TSI0->GENCS &= ~(TSI_GENCS_ESOR_MASK);
        LDR.N    R0,??DataTable4_4  ;; 0x40045000
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x10
        LDR.N    R1,??DataTable4_4  ;; 0x40045000
        STR      R0,[R1, #+0]
//  108     TSI_ISR[0] = tsi_init_struct.TSI_OutRangeIsr;
        LDR      R0,[SP, #+36]
        LDR.N    R1,??DataTable4_8
        STR      R0,[R1, #+0]
//  109     TSI0->GENCS |= TSI_GENCS_TSIIE_MASK;  
        LDR.N    R0,??DataTable4_4  ;; 0x40045000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable4_4  ;; 0x40045000
        STR      R0,[R1, #+0]
//  110   }
//  111   if(tsi_init_struct.TSI_ErrIsr!=NULL && err==TRUE)
??LPLD_TSI_Init_7:
        LDR      R0,[SP, #+40]
        CMP      R0,#+0
        BEQ.N    ??LPLD_TSI_Init_8
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??LPLD_TSI_Init_8
//  112   {
//  113     TSI0->GENCS |= TSI_GENCS_ERIE_MASK;
        LDR.N    R0,??DataTable4_4  ;; 0x40045000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable4_4  ;; 0x40045000
        STR      R0,[R1, #+0]
//  114     TSI_ISR[1] = tsi_init_struct.TSI_EndScanIsr;
        LDR      R0,[SP, #+32]
        LDR.N    R1,??DataTable4_8
        STR      R0,[R1, #+4]
//  115     TSI0->GENCS |= TSI_GENCS_TSIIE_MASK;  
        LDR.N    R0,??DataTable4_4  ;; 0x40045000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable4_4  ;; 0x40045000
        STR      R0,[R1, #+0]
//  116   }
//  117     
//  118   //使能TSI模块  
//  119   TSI0->GENCS |= (TSI_GENCS_TSIEN_MASK); 
??LPLD_TSI_Init_8:
        LDR.N    R0,??DataTable4_4  ;; 0x40045000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable4_4  ;; 0x40045000
        STR      R0,[R1, #+0]
//  120  
//  121   //是否进行基准值校验
//  122   if(tsi_init_struct.TSI_IsInitSelfCal == TRUE)
        LDRB     R0,[SP, #+44]
        CMP      R0,#+1
        BNE.N    ??LPLD_TSI_Init_9
//  123   {
//  124     //使能软件触发
//  125     TSI0->GENCS |= TSI_GENCS_SWTS_MASK;
        LDR.N    R0,??DataTable4_4  ;; 0x40045000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x100
        LDR.N    R1,??DataTable4_4  ;; 0x40045000
        STR      R0,[R1, #+0]
//  126     //等待扫描结束
//  127     while(!(TSI0->GENCS&TSI_GENCS_EOSF_MASK)){};
??LPLD_TSI_Init_10:
        LDR.N    R0,??DataTable4_4  ;; 0x40045000
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+16
        BPL.N    ??LPLD_TSI_Init_10
//  128     for(uint16 i=0; i<5000; i++)
        MOVS     R0,#+0
        B.N      ??LPLD_TSI_Init_11
//  129     {
//  130       for(uint8 j=0; j<200; j++)
//  131       {
//  132         asm("NOP");
??LPLD_TSI_Init_12:
        NOP
//  133       }
        ADDS     R1,R1,#+1
??LPLD_TSI_Init_13:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+200
        BLT.N    ??LPLD_TSI_Init_12
        ADDS     R0,R0,#+1
??LPLD_TSI_Init_11:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVW     R1,#+5000
        CMP      R0,R1
        BGE.N    ??LPLD_TSI_Init_14
        MOVS     R1,#+0
        B.N      ??LPLD_TSI_Init_13
//  134     }
//  135     //填充基准值数组、阈值寄存器
//  136     for(uint8 i=0; i<16; i++)
??LPLD_TSI_Init_14:
        MOVS     R0,#+0
??LPLD_TSI_Init_15:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BGE.N    ??LPLD_TSI_Init_16
//  137     {
//  138       if((chs>>i)&0x1L)
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R1,R4
        ASRS     R1,R1,R0
        LSLS     R1,R1,#+31
        BPL.N    ??LPLD_TSI_Init_17
//  139       {
//  140         TSI_ChxBaseVal[i] = *((uint16 *)TSI_CNTR[i]);
        LDR.N    R1,??DataTable4_9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R1,[R1, R0, LSL #+2]
        LDRH     R1,[R1, #+0]
        LDR.N    R2,??DataTable4_10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STRH     R1,[R2, R0, LSL #+1]
//  141 #if defined(CPU_MK60DZ10)
//  142         TSI0->THRESHLD[i] = TSI_ChxBaseVal[i] + TSI_OVERRUN_VAL;
        LDR.N    R1,??DataTable4_10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRH     R1,[R1, R0, LSL #+1]
        ADDS     R1,R1,#+196608
        LDR.N    R2,??DataTable4_11  ;; 0x40045120
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STR      R1,[R2, R0, LSL #+2]
//  143 #elif defined(CPU_MK60F12) || defined(CPU_MK60F15)
//  144         TSI0->THRESHOLD = TSI_ChxBaseVal[i] + TSI_OVERRUN_VAL;
//  145 #endif
//  146       }
//  147     }  
??LPLD_TSI_Init_17:
        ADDS     R0,R0,#+1
        B.N      ??LPLD_TSI_Init_15
//  148   }
//  149   else
//  150   {
//  151     for(uint8 i=0; i<16; i++)
??LPLD_TSI_Init_9:
        MOVS     R0,#+0
        B.N      ??LPLD_TSI_Init_18
//  152     {
//  153       TSI_ChxBaseVal[i] = TSI_BASE_VAL;
??LPLD_TSI_Init_19:
        MOV      R1,#+2048
        LDR.N    R2,??DataTable4_10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STRH     R1,[R2, R0, LSL #+1]
//  154     }
        ADDS     R0,R0,#+1
??LPLD_TSI_Init_18:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+16
        BLT.N    ??LPLD_TSI_Init_19
//  155   }
//  156   
//  157   //周期扫描模式or软件触发模式
//  158   if(mode == TSI_SCAN_PERIOD)
??LPLD_TSI_Init_16:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??LPLD_TSI_Init_20
//  159   {
//  160     TSI0->GENCS |= TSI_GENCS_STM_MASK;
        LDR.N    R0,??DataTable4_4  ;; 0x40045000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable4_4  ;; 0x40045000
        STR      R0,[R1, #+0]
        B.N      ??LPLD_TSI_Init_21
//  161   }
//  162   else
//  163   {
//  164     TSI0->GENCS &= ~(TSI_GENCS_STM_MASK);
??LPLD_TSI_Init_20:
        LDR.N    R0,??DataTable4_4  ;; 0x40045000
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x2
        LDR.N    R1,??DataTable4_4  ;; 0x40045000
        STR      R0,[R1, #+0]
//  165   }
//  166   
//  167   return 1;
??LPLD_TSI_Init_21:
        MOVS     R0,#+1
        POP      {R1,R4-R7}
        LDR      PC,[SP], #+20    ;; return
//  168 }
//  169 
//  170 /*
//  171  * LPLD_TSI_Deinit
//  172  * TSI反初始化函数
//  173  * 
//  174  * 参数:
//  175  *    无
//  176  *
//  177  * 输出:
//  178  *    无
//  179  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  180 void LPLD_TSI_Deinit(void)
//  181 {
LPLD_TSI_Deinit:
        PUSH     {R7,LR}
//  182   LPLD_TSI_DisableIrq();
        MOVS     R0,#+83
        BL       __NVIC_DisableIRQ
//  183 #if defined(CPU_MK60DZ10)
//  184   TSI0->STATUS = 0xFFFFFFFF;
        MOVS     R0,#-1
        LDR.N    R1,??DataTable4_12  ;; 0x4004500c
        STR      R0,[R1, #+0]
//  185 #endif
//  186   TSI0->PEN = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_7  ;; 0x40045008
        STR      R0,[R1, #+0]
//  187   TSI0->SCANC = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_6  ;; 0x40045004
        STR      R0,[R1, #+0]
//  188   TSI0->GENCS = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_4  ;; 0x40045000
        STR      R0,[R1, #+0]
//  189   //关闭TSI模块时钟
//  190   SIM->SCGC5 &= ~(SIM_SCGC5_TSI_MASK); 
        LDR.N    R0,??DataTable4_2  ;; 0x40048038
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x20
        LDR.N    R1,??DataTable4_2  ;; 0x40048038
        STR      R0,[R1, #+0]
//  191 }
        POP      {R0,PC}          ;; return
//  192 
//  193 /*
//  194  * LPLD_TSI_IsChxTouched
//  195  * 通道x的电极是否被触摸
//  196  * 
//  197  * 参数:
//  198  *    ch_num--通道x的数字
//  199  *      |_0~15
//  200  *
//  201  * 输出:
//  202  *    TRUE-有触摸
//  203  *    FALSE-未触摸
//  204  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  205 boolean LPLD_TSI_IsChxTouched(uint8 ch_num)
//  206 { 
//  207   if(TSI_ChxBaseVal[ch_num]<*((uint16 *)TSI_CNTR[ch_num]))
LPLD_TSI_IsChxTouched:
        LDR.N    R1,??DataTable4_10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRH     R1,[R1, R0, LSL #+1]
        LDR.N    R2,??DataTable4_9
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R0,[R2, R0, LSL #+2]
        LDRH     R0,[R0, #+0]
        CMP      R1,R0
        BCS.N    ??LPLD_TSI_IsChxTouched_0
//  208     return TRUE;
        MOVS     R0,#+1
        B.N      ??LPLD_TSI_IsChxTouched_1
//  209   return FALSE;
??LPLD_TSI_IsChxTouched_0:
        MOVS     R0,#+0
??LPLD_TSI_IsChxTouched_1:
        BX       LR               ;; return
//  210 }
//  211 
//  212 /*
//  213  * TSI中断处理函数
//  214  * 与启动文件startup_K60.s中的中断向量表关联
//  215  * 用户无需修改，程序自动进入对应通道中断函数
//  216  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  217 void TSI_IRQHandler(void)
//  218 {
TSI_IRQHandler:
        PUSH     {R7,LR}
//  219 #if (UCOS_II > 0u)
//  220   OS_CPU_SR  cpu_sr = 0u;
//  221   OS_ENTER_CRITICAL(); //告知系统此时已经进入了中断服务子函数
//  222   OSIntEnter();
//  223   OS_EXIT_CRITICAL();
//  224 #endif
//  225   
//  226   if(TSI0->GENCS&(TSI_GENCS_ESOR_MASK|TSI_GENCS_EOSF_MASK) &&
//  227      TSI_ISR[0] != NULL)
        LDR.N    R0,??DataTable4_4  ;; 0x40045000
        LDR      R0,[R0, #+0]
        MOVW     R1,#+32784
        TST      R0,R1
        BEQ.N    ??TSI_IRQHandler_0
        LDR.N    R0,??DataTable4_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??TSI_IRQHandler_0
//  228   {
//  229     TSI_ISR[0]();
        LDR.N    R0,??DataTable4_8
        LDR      R0,[R0, #+0]
        BLX      R0
//  230     TSI0->GENCS |= TSI_GENCS_OUTRGF_MASK;
        LDR.N    R0,??DataTable4_4  ;; 0x40045000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4000
        LDR.N    R1,??DataTable4_4  ;; 0x40045000
        STR      R0,[R1, #+0]
//  231     TSI0->GENCS |= TSI_GENCS_EOSF_MASK;
        LDR.N    R0,??DataTable4_4  ;; 0x40045000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000
        LDR.N    R1,??DataTable4_4  ;; 0x40045000
        STR      R0,[R1, #+0]
//  232 #if defined(CPU_MK60DZ10)
//  233     TSI0->STATUS = 0x0000FFFF;
        MOVW     R0,#+65535
        LDR.N    R1,??DataTable4_12  ;; 0x4004500c
        STR      R0,[R1, #+0]
        B.N      ??TSI_IRQHandler_1
//  234 #endif
//  235   }
//  236 #if defined(CPU_MK60DZ10)
//  237   else if(TSI0->STATUS != 0 && TSI_ISR[1] != NULL)
??TSI_IRQHandler_0:
        LDR.N    R0,??DataTable4_12  ;; 0x4004500c
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??TSI_IRQHandler_1
        LDR.N    R0,??DataTable4_8
        LDR      R0,[R0, #+4]
        CMP      R0,#+0
        BEQ.N    ??TSI_IRQHandler_1
//  238   {
//  239     TSI_ISR[1]();
        LDR.N    R0,??DataTable4_8
        LDR      R0,[R0, #+4]
        BLX      R0
//  240     TSI0->STATUS = 0xFFFF0000;
        LDR.N    R0,??DataTable4_13  ;; 0xffff0000
        LDR.N    R1,??DataTable4_12  ;; 0x4004500c
        STR      R0,[R1, #+0]
//  241   }
//  242 #endif   
//  243 #if (UCOS_II > 0u)
//  244   OSIntExit();          //告知系统此时即将离开中断服务子函数
//  245 #endif
//  246 }
??TSI_IRQHandler_1:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     TSI_PORT

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x40045000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0xf81f0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x40045004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     0x40045008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     TSI_ISR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     TSI_CNTR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     TSI_ChxBaseVal

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     0x40045120

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     0x4004500c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_13:
        DC32     0xffff0000

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_0:
        DC8 43H, 3AH, 5CH, 55H, 73H, 65H, 72H, 73H
        DC8 5CH, 31H, 39H, 30H, 37H, 31H, 5FH, 30H
        DC8 30H, 30H, 5CH, 44H, 65H, 73H, 6BH, 74H
        DC8 6FH, 70H, 5CH, 4BH, 36H, 30H, 5FH, 43H
        DC8 61H, 72H, 5CH, 6CH, 69H, 62H, 5CH, 4CH
        DC8 50H, 4CH, 44H, 5CH, 48H, 57H, 5CH, 48H
        DC8 57H, 5FH, 54H, 53H, 49H, 2EH, 63H, 0

        END
// 
//  40 bytes in section .bss
// 192 bytes in section .data
//  56 bytes in section .rodata
// 696 bytes in section .text
// 
// 696 bytes of CODE  memory
//  56 bytes of CONST memory
// 232 bytes of DATA  memory
//
//Errors: none
//Warnings: none
