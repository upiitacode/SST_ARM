"sst_port.h"

void PendSV_Handler(void){
	SST_schedule_();
}