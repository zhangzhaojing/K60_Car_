#ifndef _P_MOTOR_H_
#define _P_MOTOR_H_

#include "common.h"
#include "wrapper.h"

#define DIR_PTx dir.PTx
#define DIR_GPIO_Pinn dir.GPIO_Pinn
#define DIR_GPIO_Pinnum dir.GPIO_Pinnum

typedef struct
{
  FTM_Type *FTMn;
  FtmChnEnum_Type FTM_Chn;
  PortPinsEnum_Type PTXn;
  uint32 freq;
}motor_cfg_t;

typedef struct
{
  uint8 LPTMR_ALTn;/* LPTMR_ALT1 for PTA19, LPTMR_ALT2 for PTC5 */
}encoder_cfg_t;

typedef struct
{
    vuint16 placc_value; /* Pulse Accumulator Value */
    vint16  signed_value; /* direction */
    vint32 mileage; /* ��̼� */
}encoder_t;

typedef enum {
    MTR_LF, MTR_LR, MTR_RF, MTR_RR, MTR_LEN
}mtr_ch_t;/* Motor Channel: L for left or forward, R for right or rear */

typedef enum {
    LEFT_MOTOR, RIGHT_MOTOR
}motor_select_t;

typedef struct
{
    /* ����ͨ��ѡ�� */
    PITx pit;// PIT �ж�ͨ��ѡ��
    uint32 period_ms;// PIT �ж����� [����]
    encoder_cfg_t ecdcfg_lft;// ���ֹ�� LPTMR �ź�
    encoder_cfg_t ecdcfg_rgt;// ���ֹ�� LPTMR �ź�
    motor_cfg_t mtrcfg[MTR_LEN];// �����ֵ�� FTM ͨ������

    /* ʵʱ�仯���ݣ����²���Ҫ��ʼ�� */
    PIT_InitTypeDef _pit_init; /* private */
    LPTMR_InitTypeDef _lptmr_init; /* private */
    FTM_InitTypeDef _mtr_init; /* private */
    encoder_t ecdlft, ecdrgt; /* public */
}motor_controller_t;

void motor_controller__config(motor_controller_t *mtrctrl);
void motor_controller__enable();
void motor_controller__disable();
void motor_controller__set_duty(motor_select_t sel, int32 duty);

#endif
