/*****************************************************************************
* Product: SST example, 80x86, Turbo C++ 1.01
*
* Copyright (C) 2006 Miro Samek and Robert Ward. All rights reserved.
*
* This software may be distributed and modified under the terms of the GNU
* General Public License version 2 (GPL) as published by the Free Software
* Foundation and appearing in the file GPL.TXT included in the packaging of
* this file. Please note that GPL Section 2[b] requires that all works based
* on this software must also be made publicly available under the terms of
* the GPL ("Copyleft").
*
* Contact information:
* Email:    miro@quantum-leaps.com
* Internet: www.quantum-leaps.com
*****************************************************************************/
#include "sst_port.h"
#include "sst_exa.h"

#include <stdlib.h>                                         /* for random() */

/*..........................................................................*/
void tickTaskA(SSTEvent e) {
    static uint32_t tickTaskACtr;

    switch (e.sig) {
        case INIT_SIG: {
            break;
        }
        case TICK_SIG: {
            uint8_t x, y;
            uint8_t mutex;

            mutex = SST_mutexLock(TICK_TASK_B_PRIO); /* the other tick task */
            SST_mutexUnlock(mutex);
            break;
        }
        case COLOR_SIG: {
            break;
        }
    }
}
/*..........................................................................*/
void tickTaskB(SSTEvent e) {
    static uint32_t tickTaskBCtr;

    busyDelay();                                    

    switch (e.sig) {
        case INIT_SIG: {
            break;
        }
        case TICK_SIG: {
            uint8_t x, y;
            uint8_t mutex;

            mutex = SST_mutexLock(TICK_TASK_A_PRIO); /* the other tick task */
            SST_mutexUnlock(mutex);
            break;
        }
        case COLOR_SIG: {
            break;
        }
    }
}

/*****************************************************************************
* NOTE01:
* The call to busyDelay() is added only to extend the execution time
* to increase the chance of an "asynchronous" preemption.
*/
