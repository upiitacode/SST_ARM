#include "sst_port.h"
int pendsv_counter;
void PendSV_Handler(void){
	pendsv_counter++;
	SST_INT_LOCK();
	SST_schedule_();
	SST_INT_UNLOCK();
}
