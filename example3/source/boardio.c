#include "boardio.h"

void board_init(void){
	SYSCTL->RCGCGPIO|=((0x1)<<5);//enable GPIOF peripherial
	GPIOF->DEN|=0x1F;//enable GPIOF[4:0] as digital IO
	GPIOF->DIR|=(0x1<<1)|(0x1<<2)|(0x1<<3);// GPIOF[3:1] as output
	GPIOF->PUR=(0x1<<4);//GPIOF[4] is using PullUp resitors
	
	GPIOF->IBE|=(0x1<<4);//both edeges interrupt sensing
	GPIOF->IM=(0x1<<4);//Disable the interrupt mask for GPIOF[4]
	GPIOF->ICR=(0x1<<4);//clear previous interrupts events for GPIOF[4]
}
	
