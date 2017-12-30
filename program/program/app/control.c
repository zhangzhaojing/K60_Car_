#include "program.h"

/****电机与舵机***/
static motor_controller_t mtrctrl = {    //电机与舵机
    PIT0, 10,
    {LPTMR_ALT1, PTE, GPIO_Pin27, 27}, {LPTMR_ALT2, PTE, GPIO_Pin26, 26},
    {{FTM0, FTM_Ch1, PTC2, 30000}, {FTM0, FTM_Ch0, PTC1, 30000},
    {FTM0, FTM_Ch2, PTC3, 30000},  {FTM0, FTM_Ch3, PTC4, 30000}},
    {0.5f, 0.4f, 0.02f}, {0.8f, 0.2f, 0.0f},
    0, 0
};

static servo_t steer = {  //舵机
    FTM1, FTM_Ch0, PTA8, 50, 603, 80, 20, 1912//29.32, 1377
};


static void steer_controller(motor_controller_t *motor_set, float (*points)[2], int len){// 舵机控制
    uint32 steer_set;
    float turn_R,turn_delta;
    int pidx0, pidx1, y_set0, y_set1;
    char str[20];
    int ij = 0;

    //printf("len=%d\t", len);

//    /* 偏差法 */
//
//    while ( (ij < len) && (points [ij][0] < 470)) ij ++ ; //350--急转
//
//
//   // if(len > 7) pidx0 = 6; else pidx0 = len - 1; // 8
//    pidx0 = ij;
//
//    // points[pidx0][1] += 20.0f;
//
//    if(points[pidx0][1] > 10.0f){
//        y_set0=-98*((points[pidx0][1])*(points[pidx0][1])/10000) - 7.0f; // 120 / 80 --6
//    }else if(points[pidx0][1] <- 10.0f){
//        y_set0=96*((points[pidx0][1])*(points[pidx0][1])/10000) + 5.0f;  //120 / 80  --6
//    }else {
//        y_set0 = 0;
//    }
//    //printf("y0=%d\t",y_set0);
//
//
//
//    if(y_set0>85) y_set0 = 85;
//    else if(y_set0<-85) y_set0 = -85;
//
//   // sprintf(str, "%d",y_set0);
//   // OLED_status_bar(str);
//
//    y_set0 += steer.median;
//
//
//    //points[len-1][1] += 20.0f;

    
    /* 曲率法 */
    if(fabs(points[len-1][1])<10.0f ) y_set1 = steer.median;
    else{
        turn_R = ((points[len-1][1]*points[len-1][1]+points[len-1][0]*points[len-1][0])/2/-points[len-1][1]);
        if(points[len-1][1]<0) {
          y_set1 = servo__radius2duty_left((&steer), turn_R);
        }else{
          y_set1 = servo__radius2duty_right((&steer), turn_R);
        }
    }
    
    servo__set_duty(( y_set0 + y_set1)/2);

}


extern void control(){
    servo__config(&steer);
    motor_controller__config(&mtrctrl);
    motor_controller__enable();
  
  
  
}