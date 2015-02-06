#include "sst_port.h"
#include "mytask.h"

#define ISR_TICK_ID	250
#define ISR_GPIOA_ID	251

int tick_counter;
int gpioa_counter;

void SysTick_Handler(void){
	int pin;
	SST_ISR_ENTRY(pin,ISR_TICK_ID);
	SST_post(myTask_ID,1,0);
	tick_counter++;
	SST_ISR_EXIT(pin,(SCB->ICSR = SCB_ICSR_PENDSVSET_Msk));
}

void GPIOA_Handler(void){
	int pin;
	SST_ISR_ENTRY(pin,ISR_GPIOA_ID);
	gpioa_counter++;
	SST_ISR_EXIT(pin,(SCB->ICSR = SCB_ICSR_PENDSVSET_Msk));
}
