#include "ov7620.h"
#include "DEV_SCCB.h"

#define H_MAX 240//hangshu
#define L_MAX 320//lieshu

static boolean acq_flag;
static uint32 vsync_cnt, href_cnt, rowacq_cnt;
static uint8 Pix_Data[H_MAX*L_MAX];

static void vsync_isr(){
    if(LPLD_GPIO_IsPinxExt(PORTD, GPIO_Pin14))
  {
    LPLD_DMA_LoadDstAddr(DMA_CH0, Pix_Data);
    LPLD_DMA_LoadSrcAddr(DMA_CH0, &PTE->PDIR);
    vsync_cnt++;//当前场数
    href_cnt=0;
    rowacq_cnt=0;
    acq_flag=TRUE;
  }
}

static void href_isr(){
    if(LPLD_GPIO_IsPinxExt(PORTD, GPIO_Pin13))
  {
    if(acq_flag){
    LPLD_DMA_EnableReq(DMA_CH0);
    href_cnt++;
    }
  }
}

static void row_finish(){
  rowacq_cnt++;
  if(rowacq_cnt==H_MAX){
     acq_flag = FALSE;
     disable_irq(PORTD_IRQn);
  }
}

void camera__take_a_photo_please(){
    if(acq_flag == TRUE) return;
    LPLD_GPIO_ClearIntFlag(PORTD);
   // enable_irq(PORTD_IRQn);
}

void ov7620__config(){
    GPIO_InitTypeDef gpio_init={0};
    DMA_InitTypeDef  dma_init={0};
    
    LPLD_SCCB_Init();
    
    // init vsync 
    gpio_init.GPIO_PTx = PTD;
    gpio_init.GPIO_Pins = GPIO_Pin14;
    gpio_init.GPIO_Dir = DIR_INPUT; 
    gpio_init.GPIO_Isr = vsync_isr;
    gpio_init.GPIO_PinControl = INPUT_PULL_DOWN|IRQC_FA;
    LPLD_GPIO_Init(gpio_init);
    
    // init href
    gpio_init.GPIO_PTx = PTD;
    gpio_init.GPIO_Pins = GPIO_Pin13;
    gpio_init.GPIO_Dir = DIR_INPUT; 
    gpio_init.GPIO_Isr = href_isr;
    gpio_init.GPIO_PinControl = INPUT_PULL_UP|IRQC_RI;
    LPLD_GPIO_Init(gpio_init);    
   ///////////////////////////////////// disable_irq()
    
    // init pclk
    gpio_init.GPIO_PTx = PTD;
    gpio_init.GPIO_Pins = GPIO_Pin12;
    gpio_init.GPIO_Dir = DIR_INPUT; 
    gpio_init.GPIO_Isr = NULL;
    gpio_init.GPIO_PinControl = INPUT_PULL_UP|IRQC_DMARI;
    LPLD_GPIO_Init(gpio_init);  
    
    // init d0-d7
    gpio_init.GPIO_PTx = PTE;      
    gpio_init.GPIO_Pins = GPIO_Pin0_7;     
    gpio_init.GPIO_Dir = DIR_INPUT;        
    gpio_init.GPIO_Isr = NULL;
    gpio_init.GPIO_PinControl = INPUT_PULL_DOWN|IRQC_DIS;   
    LPLD_GPIO_Init(gpio_init);
       
    //配置接收DMA
    dma_init.DMA_CHx = DMA_CH0; 
    dma_init.DMA_MajorLoopCnt   = L_MAX; 
    dma_init.DMA_MinorByteCnt   = 1; 
    dma_init.DMA_MajorCompleteIntEnable = TRUE; 
    dma_init.DMA_Req            = PORTE_DMAREQ; 
    
    dma_init.DMA_DestAddr       = (uint32)Pix_Data; 
    dma_init.DMA_DestAddrOffset = 1;                
    dma_init.DMA_DestDataSize   = DMA_DST_8BIT;     
    
    dma_init.DMA_SourceAddr     = (uint32)&PTE->PDIR;
    dma_init.DMA_SourceDataSize = DMA_SRC_8BIT;   
    
    dma_init.DMA_AutoDisableReq = TRUE;            
    dma_init.DMA_Isr = row_finish; /////
    
    LPLD_DMA_Init(dma_init); 
    //LPLD_DMA_DisableReq(DMA_CH0);
    //LPLD_DMA_EnableReq(DMA_CH0);
    LPLD_DMA_EnableIrq(dma_init);
    
    ///////////////
    vsync_cnt=0;
    acq_flag=0;
}




















