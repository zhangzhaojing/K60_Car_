#ifndef _HYDRV_SYSTICK_H_
#define _HYDRV_SYSTICK_H_

#include "common.h"

/**
 * @brief      设置的系统时钟以 1 us为间隔累加
 */
void systick__config(void);
/**
 * @brief      获得当前的系统时钟
 *
 * @return     自模块初始化以来经过的微秒数
 */
long long systick__get(void);
/**
 * @brief      阻塞式精确延时
 */
void systick__delay_us(uint32 us);

#endif