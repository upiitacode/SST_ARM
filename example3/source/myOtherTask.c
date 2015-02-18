#include "TM4C123.h"                    // Device header
#include "myOtherTask.h"
#include "externalio.h"

SSTEvent myOtherTask_EQ[myOtherTask_EVQL];

int myOtherTask_counter=0;
void myOtherTask(SSTEvent event){
	if(event.sig==SST_SIGNAL_TASKINIT){
			//do stuff this task may need 
			//prior normal execution
		myOtherTask_counter=0;
		ledsB_init();
	}
	else{
		if(event.sig==MOT_SIGNAL_BUTTONCHANGE){
			if(event.par){
				GPIOF->DATA=(0x1<<1)|(0x1<<2)|(0x1<<3);
			}else{
				GPIOF->DATA=0;
			}
		}
		myOtherTask_counter++;
	}
}
