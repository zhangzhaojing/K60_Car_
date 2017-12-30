#include "usrlib.h"

void dummy_delay_ms(uint16 ms){
    uint16 ii,jj;
    if (ms<1) ms=1;
    ms=ms*12;
    for(ii=0;ii<ms;ii++)
      for(jj=0;jj<4167;jj++);
}