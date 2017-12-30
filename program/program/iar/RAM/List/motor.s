///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.10.1.12857/W32 for ARM      30/Dec/2017  19:25:56
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\motor.c
//    Command line =  
//        -f C:\Users\19071_~1\AppData\Local\Temp\EWEB48.tmp
//        (C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\motor.c -D
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
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List\motor.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_FTM_Init
        EXTERN LPLD_FTM_PWM_ChangeDuty
        EXTERN LPLD_FTM_PWM_Enable
        EXTERN LPLD_LPTMR_GetPulseAcc
        EXTERN LPLD_LPTMR_Init
        EXTERN LPLD_PIT_DisableIrq
        EXTERN LPLD_PIT_EnableIrq
        EXTERN LPLD_PIT_Init
        EXTERN __aeabi_memcpy4
        EXTERN assert_failed
        EXTERN memset

        PUBLIC motor_controller__config
        PUBLIC motor_controller__disable
        PUBLIC motor_controller__enable
        PUBLIC motor_controller__set_duty

// C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\motor.c
//    1 #include "motor.h"
//    2 #include <math.h>
//    3 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    4 static motor_controller_t *mtrctrl;
mtrctrl:
        DS8 4
//    5 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    6 static uint32 average_num=0;
average_num:
        DS8 4
//    7 
//    8 
//    9 /*
//   10 static void motor_controller__toggle_encoder(void){
//   11     LPTMR0->CSR &= ~(LPTMR_CSR_TEN_MASK); // disable lptmr
//   12     LPTMR0->CSR ^= LPTMR_CSR_TPS(3); // toggle between 0b01 and 0b10
//   13     LPTMR0->CSR |= LPTMR_CSR_TEN_MASK; // enable lptmr
//   14 }
//   15 */
//   16 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   17 static void pit_motor_controller(void){
pit_motor_controller:
        PUSH     {R7,LR}
//   18     static uint32 pit_enter_counter;/* 进入此PIT中断次数计数器 */
//   19     static uint16 placc_temp_value[2];
//   20     static uint32 srv_duty;
//   21 
//   22     // 暂存 LPTMR 累加器的值并切换左右轮 LPTMR 的输入信号
//   23     do{// 需要连续两次相同的读数才能保证读出正确，参见 K60 手册 41.4.5 节
//   24         placc_temp_value[0] = LPLD_LPTMR_GetPulseAcc();
??pit_motor_controller_0:
        BL       LPLD_LPTMR_GetPulseAcc
        LDR.N    R1,??DataTable4
        STRH     R0,[R1, #+0]
//   25         placc_temp_value[1] = LPLD_LPTMR_GetPulseAcc();
        BL       LPLD_LPTMR_GetPulseAcc
        LDR.N    R1,??DataTable4
        STRH     R0,[R1, #+2]
//   26     }while(abs_diff(placc_temp_value[0], placc_temp_value[1])>1);
        LDR.N    R0,??DataTable4
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable4
        LDRH     R1,[R1, #+2]
        CMP      R0,R1
        BCC.N    ??pit_motor_controller_1
        LDR.N    R0,??DataTable4
        LDRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable4
        LDRH     R0,[R0, #+2]
        SUBS     R0,R1,R0
        B.N      ??pit_motor_controller_2
??pit_motor_controller_1:
        LDR.N    R0,??DataTable4
        LDRH     R1,[R0, #+2]
        LDR.N    R0,??DataTable4
        LDRH     R0,[R0, #+0]
        SUBS     R0,R1,R0
??pit_motor_controller_2:
        CMP      R0,#+2
        BGE.N    ??pit_motor_controller_0
//   27     
//   28     //motor_controller__toggle_encoder();
//   29     
//   30     // 更新光编的测量值
//   31     switch(0){
//   32     case 0:
//   33         mtrctrl->ecdlft.placc_value = placc_temp_value[1];// 读取暂存的累加值，代表左轮在一次PIT周期中转过的脉冲数
        LDR.N    R0,??DataTable4
        LDRH     R0,[R0, #+2]
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        STRH     R0,[R1, #+120]
//   34         mtrctrl->ecdlft.signed_value =mtrctrl->ecdlft.placc_value;
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        LDRSH    R0,[R0, #+120]
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        STRH     R0,[R1, #+122]
//   35         break;
//   36     case 1:
//   37         mtrctrl->ecdrgt.placc_value = placc_temp_value[1];// 读取暂存的累加值，代表右轮在一次PIT周期中转过的脉冲数
//   38         mtrctrl->ecdrgt.signed_value = mtrctrl->ecdlft.placc_value;
//   39         break;
//   40     }
//   41     
//   42     
//   43     mtrctrl->ecdlft.mileage += mtrctrl->ecdlft.signed_value;
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        LDRSH    R0,[R0, #+122]
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+124]
        SXTAH    R0,R1,R0
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+124]
//   44     mtrctrl->ecdrgt.mileage += mtrctrl->ecdrgt.signed_value;
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        LDRSH    R0,[R0, #+130]
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+132]
        SXTAH    R0,R1,R0
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+132]
//   45 
//   46 
//   47     average_num= mtrctrl->ecdlft.mileage;
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+124]
        LDR.N    R1,??DataTable4_2
        STR      R0,[R1, #+0]
//   48     pit_enter_counter++;
        LDR.N    R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable4_3
        STR      R0,[R1, #+0]
//   49     
//   50     
//   51     /////////////////////////////////////////////////////////////////////单光编counter清零
//   52      LPTMR0->CSR&=(~LPTMR_CSR_TEN_MASK); 
        LDR.N    R0,??DataTable4_4  ;; 0x40040000
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable4_4  ;; 0x40040000
        STR      R0,[R1, #+0]
//   53      LPTMR0->CSR |= LPTMR_CSR_TEN_MASK;
        LDR.N    R0,??DataTable4_4  ;; 0x40040000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable4_4  ;; 0x40040000
        STR      R0,[R1, #+0]
//   54     //if(pit_enter_counter>=300){
//   55     //    average_num=mtrctrl->ecdlft.mileage/pit_enter_counter;
//   56         //motor_controller__set_duty(LEFT_MOTOR, (int32)(0));
//   57         //motor_controller__set_duty(RIGHT_MOTOR, (int32)(0));
//   58     //    motor_controller__disable();
//   59     //}
//   60 }
        POP      {R0,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
`pit_motor_controller::pit_enter_counter`:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
`pit_motor_controller::placc_temp_value`:
        DS8 4
//   61 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   62 void motor_controller__config(motor_controller_t * mtrctrl_usr){
motor_controller__config:
        PUSH     {R1-R5,LR}
//   63     int8 i;
//   64     mtrctrl = mtrctrl_usr;
        LDR.N    R1,??DataTable4_1
        STR      R0,[R1, #+0]
//   65     // PIT 周期中断初始化
//   66     memset(&(mtrctrl->_pit_init), 0, sizeof(PIT_InitTypeDef));
        MOVS     R2,#+20
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+60
        BL       memset
//   67     mtrctrl->_pit_init.PIT_Pitx = mtrctrl->pit;
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+60]
//   68     mtrctrl->_pit_init.PIT_PeriodMs = mtrctrl->period_ms;
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+68]
//   69     mtrctrl->_pit_init.PIT_Isr = pit_motor_controller;
        LDR.N    R0,??DataTable4_5
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+76]
//   70     LPLD_PIT_Init(mtrctrl->_pit_init);
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+60
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_PIT_Init
//   71     // LPTMR 初始化，从左轮先开始
//   72     memset(&(mtrctrl->_lptmr_init), 0, sizeof(LPTMR_InitTypeDef));
        MOVS     R2,#+12
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+80
        BL       memset
//   73     mtrctrl->_lptmr_init.LPTMR_Mode = LPTMR_MODE_PLACC;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+80]
//   74     mtrctrl->_lptmr_init.LPTMR_PluseAccInput = mtrctrl->ecdcfg_rgt.LPTMR_ALTn;
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+84]
//   75     LPLD_LPTMR_Init(mtrctrl->_lptmr_init);
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+80
        LDM      R0,{R0-R2}
        BL       LPLD_LPTMR_Init
//   76     mtrctrl->_lptmr_init.LPTMR_PluseAccInput = mtrctrl->ecdcfg_lft.LPTMR_ALTn;
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+8]
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+84]
//   77     LPLD_LPTMR_Init(mtrctrl->_lptmr_init);
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+80
        LDM      R0,{R0-R2}
        BL       LPLD_LPTMR_Init
//   78     // 编码器里程计清零
//   79     mtrctrl->ecdlft.mileage = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+124]
//   80     mtrctrl->ecdrgt.mileage = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+132]
//   81     // 电机驱动 FTM 初始化
//   82     memset(&(mtrctrl->_mtr_init), 0, sizeof(FTM_InitTypeDef));
        MOVS     R2,#+28
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+92
        BL       memset
//   83     for(i=0; i<MTR_LEN; i++){
        MOVS     R4,#+0
        B.N      ??motor_controller__config_0
//   84         mtrctrl->_mtr_init.FTM_Ftmx = mtrctrl->mtrcfg[i].FTMn;
??motor_controller__config_1:
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        SMULBB   R1,R4,R1
        ADD      R0,R0,R1
        LDR      R0,[R0, #+12]
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+92]
//   85         mtrctrl->_mtr_init.FTM_Mode = FTM_MODE_PWM; //使能PWM模式
        MOVS     R0,#+1
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+96]
//   86         mtrctrl->_mtr_init.FTM_PwmFreq = mtrctrl->mtrcfg[i].freq;
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        SMULBB   R1,R4,R1
        ADD      R0,R0,R1
        LDR      R0,[R0, #+20]
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+100]
//   87         LPLD_FTM_Init(mtrctrl->_mtr_init);
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+92
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_FTM_Init
//   88         LPLD_FTM_PWM_Enable(mtrctrl->mtrcfg[i].FTMn,
//   89                             mtrctrl->mtrcfg[i].FTM_Chn,
//   90                             0, //初始化电机输出占空比为零
//   91                             mtrctrl->mtrcfg[i].PTXn,
//   92                             ALIGN_LEFT //脉宽左对齐
//   93                             );
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        SMULBB   R1,R4,R1
        ADD      R0,R0,R1
        LDRB     R3,[R0, #+17]
        MOVS     R2,#+0
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        SMULBB   R1,R4,R1
        ADD      R0,R0,R1
        LDRB     R1,[R0, #+16]
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        MOVS     R5,#+12
        SMULBB   R5,R4,R5
        ADD      R0,R0,R5
        LDR      R0,[R0, #+12]
        BL       LPLD_FTM_PWM_Enable
//   94     }
        ADDS     R4,R4,#+1
??motor_controller__config_0:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??motor_controller__config_1
//   95 }
        POP      {R0-R2,R4,R5,PC}  ;; return
//   96 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   97 void motor_controller__set_duty(motor_select_t sel, int32 duty){
motor_controller__set_duty:
        PUSH     {R4-R6,LR}
        MOVS     R6,R1
//   98     mtr_ch_t chp, ch0;
//   99 
//  100     switch(sel){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??motor_controller__set_duty_0
        CMP      R0,#+1
        BEQ.N    ??motor_controller__set_duty_1
        B.N      ??motor_controller__set_duty_2
//  101     case LEFT_MOTOR:
//  102         if(duty>=0){
??motor_controller__set_duty_0:
        CMP      R6,#+0
        BMI.N    ??motor_controller__set_duty_3
//  103             chp = MTR_LF;
        MOVS     R5,#+0
//  104             ch0 = MTR_LR;
        MOVS     R4,#+1
        B.N      ??motor_controller__set_duty_4
//  105         }else{
//  106             chp = MTR_LR;
??motor_controller__set_duty_3:
        MOVS     R5,#+1
//  107             ch0 = MTR_LF;
        MOVS     R4,#+0
//  108         }
//  109         break;
??motor_controller__set_duty_4:
        B.N      ??motor_controller__set_duty_5
//  110     case RIGHT_MOTOR:
//  111         if(duty>=0){
??motor_controller__set_duty_1:
        CMP      R6,#+0
        BMI.N    ??motor_controller__set_duty_6
//  112             chp = MTR_RF;
        MOVS     R5,#+2
//  113             ch0 = MTR_RR;
        MOVS     R4,#+3
        B.N      ??motor_controller__set_duty_7
//  114         }else{
//  115             chp = MTR_RR;
??motor_controller__set_duty_6:
        MOVS     R5,#+3
//  116             ch0 = MTR_RF;
        MOVS     R4,#+2
//  117         }
//  118         break;
??motor_controller__set_duty_7:
        B.N      ??motor_controller__set_duty_5
//  119     default:
//  120         ASSERT(0);
??motor_controller__set_duty_2:
        MOVS     R1,#+120
        LDR.N    R0,??DataTable4_6
        BL       assert_failed
//  121     }
//  122 
//  123     if(duty<0) duty = -duty;
??motor_controller__set_duty_5:
        CMP      R6,#+0
        BPL.N    ??motor_controller__set_duty_8
        RSBS     R6,R6,#+0
//  124 
//  125     LPLD_FTM_PWM_ChangeDuty(mtrctrl->mtrcfg[chp].FTMn, mtrctrl->mtrcfg[chp].FTM_Chn, duty);
??motor_controller__set_duty_8:
        MOVS     R2,R6
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+12
        MUL      R1,R1,R5
        ADD      R0,R0,R1
        LDRB     R1,[R0, #+16]
        LDR.N    R0,??DataTable4_1
        LDR      R3,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+12
        MULS     R5,R0,R5
        ADD      R0,R3,R5
        LDR      R0,[R0, #+12]
        BL       LPLD_FTM_PWM_ChangeDuty
//  126     LPLD_FTM_PWM_ChangeDuty(mtrctrl->mtrcfg[ch0].FTMn, mtrctrl->mtrcfg[ch0].FTM_Chn, 0);
        MOVS     R2,#+0
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        MUL      R1,R1,R4
        ADD      R0,R0,R1
        LDRB     R1,[R0, #+16]
        LDR.N    R0,??DataTable4_1
        LDR      R3,[R0, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+12
        MULS     R4,R0,R4
        ADD      R0,R3,R4
        LDR      R0,[R0, #+12]
        BL       LPLD_FTM_PWM_ChangeDuty
//  127 }
        POP      {R4-R6,PC}       ;; return
//  128 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  129 void motor_controller__enable(){
motor_controller__enable:
        PUSH     {R7,LR}
//  130     LPLD_PIT_EnableIrq(mtrctrl->_pit_init);
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+60
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_PIT_EnableIrq
//  131 }
        POP      {R0,PC}          ;; return
//  132 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  133 void motor_controller__disable(){
motor_controller__disable:
        PUSH     {R7,LR}
//  134     LPLD_PIT_DisableIrq(mtrctrl->_pit_init);
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+60
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_PIT_DisableIrq
//  135 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     `pit_motor_controller::placc_temp_value`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     mtrctrl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     average_num

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     `pit_motor_controller::pit_enter_counter`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x40040000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     pit_motor_controller

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     ?_0

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
        DC8 61H, 72H, 5CH, 6CH, 69H, 62H, 5CH, 70H
        DC8 65H, 72H, 69H, 70H, 68H, 65H, 72H, 61H
        DC8 6CH, 5CH, 6DH, 6FH, 74H, 6FH, 72H, 2EH
        DC8 63H, 0
        DC8 0, 0

        END
// 
//  16 bytes in section .bss
//  60 bytes in section .rodata
// 742 bytes in section .text
// 
// 742 bytes of CODE  memory
//  60 bytes of CONST memory
//  16 bytes of DATA  memory
//
//Errors: none
//Warnings: 4
