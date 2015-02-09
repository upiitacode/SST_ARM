/*file: mytask.h **********************/
/**************************************/
#ifndef _MYOTHERTASK_H_
#define _MYOTHERTASK_H_
/*required includes*/
#include "sst.h"
#include "sst_stdsignal.h"
/*exported macros*/
#define myOtherTask_ID  3
#define myOtherTask_EVQL  10
/*exported Signals*/
#define MOT_SIGNAL_BUTTONCHANGE	3
/*exported variables*/
extern SSTEvent myOtherTask_EQ[myOtherTask_EVQL];
/*exported functions*/
void myOtherTask(SSTEvent event);
#endif
