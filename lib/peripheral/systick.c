#include "systick.h"

static long long _systick;

static void systick__acc(void){
	_systick ++;
}

void systick__config(void){
	SYSTICK_InitType systick_init = {1, 0, systick__acc};
	LPLD_SYSTICK_Init(systick_init);
}

long long systick__get(void){
	return _systick;
}

void systick__delay_us(uint32 us){
	long long _systick_end = _systick + us;
	while(_systick < _systick_end);
}