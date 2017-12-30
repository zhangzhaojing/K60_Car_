#include "program.h"

static motor_controller_t mtrctrl = {
    PIT0, 10, 
    {LPTMR_ALT1}, {LPTMR_ALT2}, 
    {{FTM0, FTM_Ch0, PTC1, 30000},  {FTM0, FTM_Ch1, PTC2, 30000}, 
 {FTM0, FTM_Ch2, PTC3, 30000},{FTM0, FTM_Ch3, PTC4, 30000} /*RR*/   }
};


static void print_encoder(void){
	printf("[INFO] ecd_placc_value= {left:%d, right:%d}\n", 
        mtrctrl.ecdlft.signed_value, mtrctrl.ecdrgt.signed_value);
    printf("[INFO] ecd_mileage= {left:%d, right: %d}\n", 
        mtrctrl.ecdlft.mileage, mtrctrl.ecdrgt.mileage);
}

extern void app__motor_dev(void){

	motor_controller__config(&mtrctrl);
    motor_controller__enable();
   
   
        motor_controller__set_duty(LEFT_MOTOR, (int32)(2000.0f));
        motor_controller__set_duty(RIGHT_MOTOR, (int32)(-2000.0f));
       // dummy_delay_ms(1000);
       //  motor_controller__set_duty(LEFT_MOTOR, (int32)(0));
        //motor_controller__set_duty(RIGHT_MOTOR, (int32)(0));   
        
    //while(1){    
    	
    //}
}