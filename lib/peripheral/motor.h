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
    vint32 mileage; /* 里程计 */
}encoder_t;

typedef enum {
    MTR_LF, MTR_LR, MTR_RF, MTR_RR, MTR_LEN
}mtr_ch_t;/* Motor Channel: L for left or forward, R for right or rear */

typedef enum {
    LEFT_MOTOR, RIGHT_MOTOR
}motor_select_t;

typedef struct
{
    /* 配置通道选择 */
    PITx pit;// PIT 中断通道选择
    uint32 period_ms;// PIT 中断周期 [毫秒]
    encoder_cfg_t ecdcfg_lft;// 左轮光编 LPTMR 信号
    encoder_cfg_t ecdcfg_rgt;// 右轮光编 LPTMR 信号
    motor_cfg_t mtrcfg[MTR_LEN];// 左右轮电机 FTM 通道配置

    /* 实时变化数据：以下不需要初始化 */
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
