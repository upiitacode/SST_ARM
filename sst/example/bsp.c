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

#include <stdlib.h>                                          /* for _exit() */

/* Local-scope objects -----------------------------------------------------*/

#define TICKS_PER_SEC   200

#define TICK_VECTOR     0x08
#define KBD_VECTOR      0x09

static void displayPreemptions(uint8_t pprev, uint8_t pnext);

/*..........................................................................*/
static void tickISR(void) {
    uint8_t pin;
    displayPreemptions(SST_currPrio_, TICK_ISR_PRIO);/* for testing, NOTE01 */
    SST_ISR_ENTRY(pin, TICK_ISR_PRIO);

    SST_post(TICK_TASK_A_PRIO, TICK_SIG, 0);     /* post the Tick to Task A */
    SST_post(TICK_TASK_B_PRIO, TICK_SIG, 0);     /* post the Tick to Task B */

    busyDelay();                                 /* for testing, see NOTE02 */
    SST_ISR_EXIT(pin, outportb(0x20, 0x20));
}
/*..........................................................................*/
static void kbdISR(void) {
    uint8_t pin;
    uint8_t key = 'a';//inport(0x60)/*get scan code from the 8042 kbd controller */

    displayPreemptions(SST_currPrio_, KBD_ISR_PRIO); /* for testing, NOTE01 */
    SST_ISR_ENTRY(pin, KBD_ISR_PRIO);

    SST_post(KBD_TASK_PRIO, KBD_SIG, key);   /* post the Key to the KbdTask */

    busyDelay();                                 /* for testing, see NOTE02 */
    SST_ISR_EXIT(pin, outportb(0x20, 0x20));
}
/*..........................................................................*/
void SST_init(void) {
}
/*..........................................................................*/
void SST_start(void) {
                                      /* divisor for the 8254 timer/counter */
    uint16_t count = (uint16_t)(((1193180 * 2) / TICKS_PER_SEC + 1) >> 1);

                                       /* save the original DOS vectors ... */

    SST_INT_LOCK();                                  /* lock the interrupts */
    SST_INT_UNLOCK();                              /* unlock the interrupts */
}
/*..........................................................................*/
void SST_onIdle(void) {
    static uint32_t onIdleCtr;
}
/*..........................................................................*/
void SST_exit(void) {
    SST_INT_LOCK();                                  /* lock the interrupts */
    SST_INT_UNLOCK();                              /* unlock the interrupts */
    exit(0);                                        /* exit to infinte loop */
}

/*--------------------------------------------------------------------------*/
void displayPreemptions(uint8_t pprev, uint8_t pnext) {
}
/*****************************************************************************
* NOTE01:
* The function call to displayPreemptions() is added only to monitor the
* "asynchronous" preemptions within the SST.
*
* NOTE02:
* The call to busyDelay() is added only to extend the execution time
* to increase the chance of an "asynchronous" preemption.
*/
