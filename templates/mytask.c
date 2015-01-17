#include <mytask.h>

SSTEvent myTask_EQ[myTask_EVQL];

void myTask(SSTEvent event){
	if(event.sig==SST_SIGNAL_TASKINIT){
			//do stuff this task may need 
			//prior normal execution
	}
	else{

	}
}