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

#include <stdlib.h>                                           /* for atol() */

static SSTEvent tickTaskAQueue[2];
static SSTEvent tickTaskBQueue[2];
static SSTEvent kbdTaskQueue[2];

static uint32_t l_delayCtr = 0UL;

/*..........................................................................*/
int main() {


    SST_init();                                       /* initialize the SST */

    SST_task(&tickTaskA, TICK_TASK_A_PRIO,
            tickTaskAQueue, sizeof(tickTaskAQueue)/sizeof(tickTaskAQueue[0]),
            INIT_SIG, 0);

    SST_task(&tickTaskB, TICK_TASK_B_PRIO,
            tickTaskBQueue, sizeof(tickTaskBQueue)/sizeof(tickTaskBQueue[0]),
            INIT_SIG, 0);

    SST_task(&kbdTask, KBD_TASK_PRIO,
             kbdTaskQueue, sizeof(kbdTaskQueue)/sizeof(kbdTaskQueue[0]),
             INIT_SIG, 0);

    SST_run();                                   /* run the SST application */
    return 0;
}
/*..........................................................................*/
void busyDelay(void) {
    volatile uint32_t i = l_delayCtr;
    while (i-- > 0) {
    }
}
