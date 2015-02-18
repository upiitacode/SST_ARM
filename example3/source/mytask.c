#include "mytask.h"
#include "externalio.h"
SSTEvent myTask_EQ[myTask_EVQL];

int mytask_counter=0;
void myTask(SSTEvent event){
	if(event.sig==SST_SIGNAL_TASKINIT){
			//do stuff this task may need 
			//prior normal execution
		mytask_counter=0;
		ledsB_init();
	}
	else{
		mytask_counter++;
		ledsB_lowNibbleOuput((mytask_counter&0xF));
	}
}
