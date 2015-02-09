#include "sst_port.h"
#include "mytask.h"
#include "myOtherTask.h"

#define ISR_TICK_ID	250
#define ISR_GPIOF_ID	251

int tick_counter;
int gpiof_counter;

void SysTick_Handler(void){
	int pin;
	SST_ISR_ENTRY(pin,ISR_TICK_ID);
	if((tick_counter%10)==0){
		SST_post(myTask_ID,1,0);
	}
	tick_counter++;
	SST_ISR_EXIT(pin,(SCB->ICSR = SCB_ICSR_PENDSVSET_Msk));
}

void GPIOF_Handler(void){
	int pin;
	SST_ISR_ENTRY(pin,ISR_GPIOF_ID);
	GPIOF->ICR=(0x1<<4);//clear previous interrupts events for GPIOF[4]
	//User code
	if(((GPIOF->DATA)&(0x1<<4))==0){
		SST_post(myOtherTask_ID,MOT_SIGNAL_BUTTONCHANGE,1);
	}else{
		SST_post(myOtherTask_ID,MOT_SIGNAL_BUTTONCHANGE,0);
	}
	gpiof_counter++;
	SST_ISR_EXIT(pin,(SCB->ICSR = SCB_ICSR_PENDSVSET_Msk));
}
