#include "motor.h"
#include <math.h>

static motor_controller_t *mtrctrl;

static uint32 average_num=0;


/*
static void motor_controller__toggle_encoder(void){
    LPTMR0->CSR &= ~(LPTMR_CSR_TEN_MASK); // disable lptmr
    LPTMR0->CSR ^= LPTMR_CSR_TPS(3); // toggle between 0b01 and 0b10
    LPTMR0->CSR |= LPTMR_CSR_TEN_MASK; // enable lptmr
}
*/

static void pit_motor_controller(void){
    static uint32 pit_enter_counter;/* �����PIT�жϴ��������� */
    static uint16 placc_temp_value[2];
    static uint32 srv_duty;

    // �ݴ� LPTMR �ۼ�����ֵ���л������� LPTMR �������ź�
    do{// ��Ҫ����������ͬ�Ķ������ܱ�֤������ȷ���μ� K60 �ֲ� 41.4.5 ��
        placc_temp_value[0] = LPLD_LPTMR_GetPulseAcc();
        placc_temp_value[1] = LPLD_LPTMR_GetPulseAcc();
    }while(abs_diff(placc_temp_value[0], placc_temp_value[1])>1);
    
    //motor_controller__toggle_encoder();
    
    // ���¹��Ĳ���ֵ
    switch(0){
    case 0:
        mtrctrl->ecdlft.placc_value = placc_temp_value[1];// ��ȡ�ݴ���ۼ�ֵ������������һ��PIT������ת����������
        mtrctrl->ecdlft.signed_value =mtrctrl->ecdlft.placc_value;
        break;
    case 1:
        mtrctrl->ecdrgt.placc_value = placc_temp_value[1];// ��ȡ�ݴ���ۼ�ֵ������������һ��PIT������ת����������
        mtrctrl->ecdrgt.signed_value = mtrctrl->ecdlft.placc_value;
        break;
    }
    
    
    mtrctrl->ecdlft.mileage += mtrctrl->ecdlft.signed_value;
    mtrctrl->ecdrgt.mileage += mtrctrl->ecdrgt.signed_value;


    average_num= mtrctrl->ecdlft.mileage;
    pit_enter_counter++;
    
    
    /////////////////////////////////////////////////////////////////////�����counter����
     LPTMR0->CSR&=(~LPTMR_CSR_TEN_MASK); 
     LPTMR0->CSR |= LPTMR_CSR_TEN_MASK;
    //if(pit_enter_counter>=300){
    //    average_num=mtrctrl->ecdlft.mileage/pit_enter_counter;
        //motor_controller__set_duty(LEFT_MOTOR, (int32)(0));
        //motor_controller__set_duty(RIGHT_MOTOR, (int32)(0));
    //    motor_controller__disable();
    //}
}

void motor_controller__config(motor_controller_t * mtrctrl_usr){
    int8 i;
    mtrctrl = mtrctrl_usr;
    // PIT �����жϳ�ʼ��
    memset(&(mtrctrl->_pit_init), 0, sizeof(PIT_InitTypeDef));
    mtrctrl->_pit_init.PIT_Pitx = mtrctrl->pit;
    mtrctrl->_pit_init.PIT_PeriodMs = mtrctrl->period_ms;
    mtrctrl->_pit_init.PIT_Isr = pit_motor_controller;
    LPLD_PIT_Init(mtrctrl->_pit_init);
    // LPTMR ��ʼ�����������ȿ�ʼ
    memset(&(mtrctrl->_lptmr_init), 0, sizeof(LPTMR_InitTypeDef));
    mtrctrl->_lptmr_init.LPTMR_Mode = LPTMR_MODE_PLACC;
    mtrctrl->_lptmr_init.LPTMR_PluseAccInput = mtrctrl->ecdcfg_rgt.LPTMR_ALTn;
    LPLD_LPTMR_Init(mtrctrl->_lptmr_init);
    mtrctrl->_lptmr_init.LPTMR_PluseAccInput = mtrctrl->ecdcfg_lft.LPTMR_ALTn;
    LPLD_LPTMR_Init(mtrctrl->_lptmr_init);
    // ��������̼�����
    mtrctrl->ecdlft.mileage = 0;
    mtrctrl->ecdrgt.mileage = 0;
    // ������� FTM ��ʼ��
    memset(&(mtrctrl->_mtr_init), 0, sizeof(FTM_InitTypeDef));
    for(i=0; i<MTR_LEN; i++){
        mtrctrl->_mtr_init.FTM_Ftmx = mtrctrl->mtrcfg[i].FTMn;
        mtrctrl->_mtr_init.FTM_Mode = FTM_MODE_PWM; //ʹ��PWMģʽ
        mtrctrl->_mtr_init.FTM_PwmFreq = mtrctrl->mtrcfg[i].freq;
        LPLD_FTM_Init(mtrctrl->_mtr_init);
        LPLD_FTM_PWM_Enable(mtrctrl->mtrcfg[i].FTMn,
                            mtrctrl->mtrcfg[i].FTM_Chn,
                            0, //��ʼ��������ռ�ձ�Ϊ��
                            mtrctrl->mtrcfg[i].PTXn,
                            ALIGN_LEFT //���������
                            );
    }
}

void motor_controller__set_duty(motor_select_t sel, int32 duty){
    mtr_ch_t chp, ch0;

    switch(sel){
    case LEFT_MOTOR:
        if(duty>=0){
            chp = MTR_LF;
            ch0 = MTR_LR;
        }else{
            chp = MTR_LR;
            ch0 = MTR_LF;
        }
        break;
    case RIGHT_MOTOR:
        if(duty>=0){
            chp = MTR_RF;
            ch0 = MTR_RR;
        }else{
            chp = MTR_RR;
            ch0 = MTR_RF;
        }
        break;
    default:
        ASSERT(0);
    }

    if(duty<0) duty = -duty;

    LPLD_FTM_PWM_ChangeDuty(mtrctrl->mtrcfg[chp].FTMn, mtrctrl->mtrcfg[chp].FTM_Chn, duty);
    LPLD_FTM_PWM_ChangeDuty(mtrctrl->mtrcfg[ch0].FTMn, mtrctrl->mtrcfg[ch0].FTM_Chn, 0);
}

void motor_controller__enable(){
    LPLD_PIT_EnableIrq(mtrctrl->_pit_init);
}

void motor_controller__disable(){
    LPLD_PIT_DisableIrq(mtrctrl->_pit_init);
}