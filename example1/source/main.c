#include "sst.h"
#include "mytask.h"
#include "sst_stdsignal.h"
int main(){
		
		//if needed do stuff before calling any OS related fucntions
		SST_init(); //optional
		SST_task(myTask,myTask_ID, &myTask_EQ, myTask_EVQL, SST_SIGNAL_TASKINIT, 0);
		//add more tasks if nedded
		SST_run();
		return 0;
}