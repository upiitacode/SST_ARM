/*file: mytask.h **********************/
/**************************************/
#ifndef _MYTASK_H_
#define _MYTASK_H_
/*required includes*/
#include "sst.h"
#include "sst_stdsignal.h"
/*exported macros*/
#define myTask_ID  1
#define myTask_EVQL  4 
/*exported variables*/
extern SSTEvent myTask_EQ[myTask_EVQL];
/*exported functions*/
void myTask(SSTEvent event);
#endif