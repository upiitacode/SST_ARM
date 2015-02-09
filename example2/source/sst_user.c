/*file:SST_user.c*/

#include <stdlib.h> //needed  for exit(0);
#include <sst.h>
#include "TM4C123.h"                    // Device header
#include "boardio.h"
int idle_counter;
/*The use of this function is optional*/
/*It's implementation is required     */
void SST_init(void) {
	//before doing any OS realted stuff
	//you may need to cofigure you system
	//that kind of general configuration 
	//goes here
	//I.E.  processor clock setup
	board_init();  
}

/*The implempletation of the following functions is required*/
void SST_start(void) {
	//enable some sepecific interrupts
	//start some periperial ,timers ..
	//your tasks are about to start
	//do they need somthing 
	//that haven't been done before?
	NVIC_SetPriority(PendSV_IRQn,8);//low priority
	NVIC_SetPriority(SysTick_IRQn,4);//medium priority
	NVIC_SetPriority(GPIOF_IRQn,0);//High priority
	NVIC_EnableIRQ(PendSV_IRQn);//
	NVIC_EnableIRQ(GPIOF_IRQn);
	SysTick_Config(16000000);//Tick every second CLK=16Mhz/COUNT=16_000_000 

}
/*....................................*/
void SST_onIdle(void) {	
	//spare time
	//do anithing you want 
	//but do not loop 
	//you may want to post some events anyway
	//no time critical operations
	idle_counter++;
}
/*....................................*/
void SST_exit(void) {
	//shutdown some peripherials and stuff
 	exit(0);
}
