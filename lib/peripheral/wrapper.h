#ifndef _HYDRV_LPLD_WRAPPER_H_
#define _HYDRV_LPLD_WRAPPER_H_

typedef struct {
	GPIO_Type * PTx; /* PTA, PTB, PTC, PTD, PTE */
	uint32 GPIO_Pinn; /* GPIO_Pin0 - GPIO_Pin31 ; GPIO_Pin0_7¡¢GPIO_Pin8_15¡¢GPIO_Pin16_23¡¢GPIO_Pin24_31*/
	uint32 GPIO_Pinnum; /* 0-31 ; lsb pinnum in parallel 8 pin mode, for example 0 for GPIO_Pin0_7 */
}gpio_cfg_t;

#define _DI(iocfg) PTxn_I((iocfg).PTx, (iocfg).GPIO_Pinnum)
#define _DO(iocfg) PTxn_O((iocfg).PTx, (iocfg).GPIO_Pinnum)
#define _DDR(iocfg) DDR((iocfg).PTx, (iocfg).GPIO_Pinnum)

#endif