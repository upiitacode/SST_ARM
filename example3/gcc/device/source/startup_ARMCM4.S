/* File: startup_ARMCM4.S
 * Purpose: startup file for Cortex-M4 devices. Should use with
 *   GCC for ARM Embedded Processors
 * Version: V2.01
 * Date: 12 June 2014
 *
 */
/* Copyright (c) 2011 - 2014 ARM LIMITED

   All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:
   - Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   - Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.
   - Neither the name of ARM nor the names of its contributors may be used
     to endorse or promote products derived from this software without
     specific prior written permission.
   *
   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
   ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS AND CONTRIBUTORS BE
   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
   POSSIBILITY OF SUCH DAMAGE.
   ---------------------------------------------------------------------------*/


	.syntax	unified
	.arch	armv7-m

	.section .stack
	.align	3
#ifdef __STACK_SIZE
	.equ	Stack_Size, __STACK_SIZE
#else
	.equ	Stack_Size, 0x00000400
#endif
	.globl	__StackTop
	.globl	__StackLimit
__StackLimit:
	.space	Stack_Size
	.size	__StackLimit, . - __StackLimit
__StackTop:
	.size	__StackTop, . - __StackTop

	.section .heap
	.align	3
#ifdef __HEAP_SIZE
	.equ	Heap_Size, __HEAP_SIZE
#else
	.equ	Heap_Size, 0x00000C00
#endif
	.globl	__HeapBase
	.globl	__HeapLimit
__HeapBase:
	.if	Heap_Size
	.space	Heap_Size
	.endif
	.size	__HeapBase, . - __HeapBase
__HeapLimit:
	.size	__HeapLimit, . - __HeapLimit

	.section .vectors
	.align	2
	.globl	__Vectors
__Vectors:
	.long	__StackTop            /* Top of Stack */
	.long	Reset_Handler         /* Reset Handler */
	.long	NMI_Handler           /* NMI Handler */
	.long	HardFault_Handler     /* Hard Fault Handler */
	.long	MemManage_Handler     /* MPU Fault Handler */
	.long	BusFault_Handler      /* Bus Fault Handler */
	.long	UsageFault_Handler    /* Usage Fault Handler */
	.long	0                     /* Reserved */
	.long	0                     /* Reserved */
	.long	0                     /* Reserved */
	.long	0                     /* Reserved */
	.long	SVC_Handler           /* SVCall Handler */
	.long	DebugMon_Handler      /* Debug Monitor Handler */
	.long	0                     /* Reserved */
	.long	PendSV_Handler        /* PendSV Handler */
	.long	SysTick_Handler       /* SysTick Handler */

	/* External interrupts */
	.long   GPIOA_Handler        /*   0: GPIO Port A                   */
	.long   GPIOB_Handler        /*   1: GPIO Port B                   */
	.long   GPIOC_Handler        /*   2: GPIO Port C                   */
	.long   GPIOD_Handler        /*   3: GPIO Port D                   */
	.long   GPIOE_Handler        /*   4: GPIO Port E                   */
	.long   UART0_Handler        /*   5: UART0 Rx and Tx               */
	.long   UART1_Handler        /*   6: UART1 Rx and Tx               */
	.long   SSI0_Handler         /*   7: SSI0 Rx and Tx                */
	.long   I2C0_Handler         /*   8: I2C0 Master and Slave         */
	.long   PMW0_FAULT_Handler   /*   9: PWM Fault                     */
	.long   PWM0_0_Handler       /*  10: PWM Generator 0               */
	.long   PWM0_1_Handler       /*  11: PWM Generator 1               */
	.long   PWM0_2_Handler       /*  12: PWM Generator 2               */
	.long   QEI0_Handler         /*  13: Quadrature Encoder 0          */
	.long   ADC0SS0_Handler      /*  14: ADC Sequence 0                */
	.long   ADC0SS1_Handler      /*  15: ADC Sequence 1                */
	.long   ADC0SS2_Handler      /*  16: ADC Sequence 2                */
	.long   ADC0SS3_Handler      /*  17: ADC Sequence 3                */
	.long   WDT0_Handler         /*  18: Watchdog timer                */
	.long   TIMER0A_Handler      /*  19: Timer 0 subtimer A            */
	.long   TIMER0B_Handler      /*  20: Timer 0 subtimer B            */
	.long   TIMER1A_Handler      /*  21: Timer 1 subtimer A            */
	.long   TIMER1B_Handler      /*  22: Timer 1 subtimer B            */
	.long   TIMER2A_Handler      /*  23: Timer 2 subtimer A            */
	.long   TIMER2B_Handler      /*  24: Timer 2 subtimer B            */
	.long   COMP0_Handler        /*  25: Analog Comparator 0           */
	.long   COMP1_Handler        /*  26: Analog Comparator 1           */
	.long   COMP2_Handler        /*  27: Analog Comparator 2           */
	.long   SYSCTL_Handler       /*  28: System Control (PLL, OSC, BO) */
	.long   FLASH_Handler        /*  29: FLASH Control                 */
	.long   GPIOF_Handler        /*  30: GPIO Port F                   */
	.long   GPIOG_Handler        /*  31: GPIO Port G                   */
	.long   GPIOH_Handler        /*  32: GPIO Port H                   */
	.long   UART2_Handler        /*  33: UART2 Rx and Tx               */
	.long   SSI1_Handler         /*  34: SSI1 Rx and Tx                */
	.long   TIMER3A_Handler      /*  35: Timer 3 subtimer A            */
	.long   TIMER3B_Handler      /*  36: Timer 3 subtimer B            */
	.long   I2C1_Handler         /*  37: I2C1 Master and Slave         */
	.long   QEI1_Handler         /*  38: Quadrature Encoder 1          */
	.long   CAN0_Handler         /*  39: CAN0                          */
	.long   CAN1_Handler         /*  40: CAN1                          */
	.long   CAN2_Handler         /*  41: CAN2                          */
	.long   0                    /*  42: Reserved                      */
	.long   HIB_Handler          /*  43: Hibernate                     */
	.long   USB0_Handler         /*  44: USB0                          */
	.long   PWM0_3_Handler       /*  45: PWM Generator 3               */
	.long   UDMA_Handler         /*  46: uDMA Software Transfer        */
	.long   UDMAERR_Handler      /*  47: uDMA Error                    */
	.long   ADC1SS0_Handler      /*  48: ADC1 Sequence 0               */
	.long   ADC1SS1_Handler      /*  49: ADC1 Sequence 1               */
	.long   ADC1SS2_Handler      /*  50: ADC1 Sequence 2               */
	.long   ADC1SS3_Handler      /*  51: ADC1 Sequence 3               */
	.long   0                    /*  52: Reserved                      */
	.long   0                    /*  53: Reserved                      */
	.long   GPIOJ_Handler        /*  54: GPIO Port J                   */
	.long   GPIOK_Handler        /*  55: GPIO Port K                   */
	.long   GPIOL_Handler        /*  56: GPIO Port L                   */
	.long   SSI2_Handler         /*  57: SSI2 Rx and Tx                */
	.long   SSI3_Handler         /*  58: SSI3 Rx and Tx                */
	.long   UART3_Handler        /*  59: UART3 Rx and Tx               */
	.long   UART4_Handler        /*  60: UART4 Rx and Tx               */
	.long   UART5_Handler        /*  61: UART5 Rx and Tx               */
	.long   UART6_Handler        /*  62: UART6 Rx and Tx               */
	.long   UART7_Handler        /*  63: UART7 Rx and Tx               */
	.long   0                    /*  64: Reserved                      */
	.long   0                    /*  65: Reserved                      */
	.long   0                    /*  66: Reserved                      */
	.long   0                    /*  67: Reserved                      */
	.long   I2C2_Handler         /*  68: I2C2 Master and Slave         */
	.long   I2C3_Handler         /*  69: I2C3 Master and Slave         */
	.long   TIMER4A_Handler      /*  70: Timer 4 subtimer A            */
	.long   TIMER4B_Handler      /*  71: Timer 4 subtimer B            */
	.long   0                    /*  72: Reserved                      */
	.long   0                    /*  73: Reserved                      */
	.long   0                    /*  74: Reserved                      */
	.long   0                    /*  75: Reserved                      */
	.long   0                    /*  76: Reserved                      */
	.long   0                    /*  77: Reserved                      */
	.long   0                    /*  78: Reserved                      */
	.long   0                    /*  79: Reserved                      */
	.long   0                    /*  80: Reserved                      */
	.long   0                    /*  81: Reserved                      */
	.long   0                    /*  82: Reserved                      */
	.long   0                    /*  83: Reserved                      */
	.long   0                    /*  84: Reserved                      */
	.long   0                    /*  85: Reserved                      */
	.long   0                    /*  86: Reserved                      */
	.long   0                    /*  87: Reserved                      */
	.long   0                    /*  88: Reserved                      */
	.long   0                    /*  89: Reserved                      */
	.long   0                    /*  90: Reserved                      */
	.long   0                    /*  91: Reserved                      */
	.long   TIMER5A_Handler      /*  92: Timer 5 subtimer A            */
	.long   TIMER5B_Handler      /*  93: Timer 5 subtimer B            */
	.long   WTIMER0A_Handler     /*  94: Wide Timer 0 subtimer A       */
	.long   WTIMER0B_Handler     /*  95: Wide Timer 0 subtimer B       */
	.long   WTIMER1A_Handler     /*  96: Wide Timer 1 subtimer A       */
	.long   WTIMER1B_Handler     /*  97: Wide Timer 1 subtimer B       */
	.long   WTIMER2A_Handler     /*  98: Wide Timer 2 subtimer A       */
	.long   WTIMER2B_Handler     /*  99: Wide Timer 2 subtimer B       */
	.long   WTIMER3A_Handler     /* 100: Wide Timer 3 subtimer A       */
	.long   WTIMER3B_Handler     /* 101: Wide Timer 3 subtimer B       */
	.long   WTIMER4A_Handler     /* 102: Wide Timer 4 subtimer A       */
	.long   WTIMER4B_Handler     /* 103: Wide Timer 4 subtimer B       */
	.long   WTIMER5A_Handler     /* 104: Wide Timer 5 subtimer A       */
	.long   WTIMER5B_Handler     /* 105: Wide Timer 5 subtimer B       */
	.long   FPU_Handler          /* 106: FPU                           */
	.long   0                    /* 107: Reserved                      */
	.long   0                    /* 108: Reserved                      */
	.long   I2C4_Handler         /* 109: I2C4 Master and Slave         */
	.long   I2C5_Handler         /* 110: I2C5 Master and Slave         */
	.long   GPIOM_Handler        /* 111: GPIO Port M                   */
	.long   GPION_Handler        /* 112: GPIO Port N                   */
	.long   QEI2_Handler         /* 113: Quadrature Encoder 2          */
	.long   0                    /* 114: Reserved                      */
	.long   0                    /* 115: Reserved                      */
	.long   GPIOP0_Handler       /* 116: GPIO Port P (Summary or P0)   */
	.long   GPIOP1_Handler       /* 117: GPIO Port P1                  */
	.long   GPIOP2_Handler       /* 118: GPIO Port P2                  */
	.long   GPIOP3_Handler       /* 119: GPIO Port P3                  */
	.long   GPIOP4_Handler       /* 120: GPIO Port P4                  */
	.long   GPIOP5_Handler       /* 121: GPIO Port P5                  */
	.long   GPIOP6_Handler       /* 122: GPIO Port P6                  */
	.long   GPIOP7_Handler       /* 123: GPIO Port P7                  */
	.long   GPIOQ0_Handler       /* 124: GPIO Port Q (Summary or Q0)   */
	.long   GPIOQ1_Handler       /* 125: GPIO Port Q1                  */
	.long   GPIOQ2_Handler       /* 126: GPIO Port Q2                  */
	.long   GPIOQ3_Handler       /* 127: GPIO Port Q3                  */
	.long   GPIOQ4_Handler       /* 128: GPIO Port Q4                  */
	.long   GPIOQ5_Handler       /* 129: GPIO Port Q5                  */
	.long   GPIOQ6_Handler       /* 130: GPIO Port Q6                  */
	.long   GPIOQ7_Handler       /* 131: GPIO Port Q7                  */
	.long   GPIOR_Handler        /* 132: GPIO Port R                   */
	.long   GPIOS_Handler        /* 133: GPIO Port S                   */
	.long   PMW1_0_Handler       /* 134: PWM 1 Generator 0             */
	.long   PWM1_1_Handler       /* 135: PWM 1 Generator 1             */
	.long   PWM1_2_Handler       /* 136: PWM 1 Generator 2             */
	.long   PWM1_3_Handler       /* 137: PWM 1 Generator 3             */
	.long   PWM1_FAULT_Handler   /* 138: PWM 1 Fault                   */

	.size	__Vectors, . - __Vectors

	.text
	.thumb
	.thumb_func
	.align	2
	.globl	Reset_Handler
	.type	Reset_Handler, %function
Reset_Handler:
/*  Firstly it copies data from read only memory to RAM. There are two schemes
 *  to copy. One can copy more than one sections. Another can only copy
 *  one section.  The former scheme needs more instructions and read-only
 *  data to implement than the latter.
 *  Macro __STARTUP_COPY_MULTIPLE is used to choose between two schemes.  */

#ifdef __STARTUP_COPY_MULTIPLE
/*  Multiple sections scheme.
 *
 *  Between symbol address __copy_table_start__ and __copy_table_end__,
 *  there are array of triplets, each of which specify:
 *    offset 0: LMA of start of a section to copy from
 *    offset 4: VMA of start of a section to copy to
 *    offset 8: size of the section to copy. Must be multiply of 4
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
	ldr	r4, =__copy_table_start__
	ldr	r5, =__copy_table_end__

.L_loop0:
	cmp	r4, r5
	bge	.L_loop0_done
	ldr	r1, [r4]
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #8]

.L_loop0_0:
	subs	r3, #4
	ittt	ge
	ldrge	r0, [r1, r3]
	strge	r0, [r2, r3]
	bge	.L_loop0_0

	adds	r4, #12
	b	.L_loop0

.L_loop0_done:
#else
/*  Single section scheme.
 *
 *  The ranges of copy from/to are specified by following symbols
 *    __etext: LMA of start of the section to copy from. Usually end of text
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
	ldr	r1, =__etext
	ldr	r2, =__data_start__
	ldr	r3, =__data_end__

.L_loop1:
	cmp	r2, r3
	ittt	lt
	ldrlt	r0, [r1], #4
	strlt	r0, [r2], #4
	blt	.L_loop1
#endif /*__STARTUP_COPY_MULTIPLE */

/*  This part of work usually is done in C library startup code. Otherwise,
 *  define this macro to enable it in this startup.
 *
 *  There are two schemes too. One can clear multiple BSS sections. Another
 *  can only clear one section. The former is more size expensive than the
 *  latter.
 *
 *  Define macro __STARTUP_CLEAR_BSS_MULTIPLE to choose the former.
 *  Otherwise efine macro __STARTUP_CLEAR_BSS to choose the later.
 */
#ifdef __STARTUP_CLEAR_BSS_MULTIPLE
/*  Multiple sections scheme.
 *
 *  Between symbol address __copy_table_start__ and __copy_table_end__,
 *  there are array of tuples specifying:
 *    offset 0: Start of a BSS section
 *    offset 4: Size of this BSS section. Must be multiply of 4
 */
	ldr	r3, =__zero_table_start__
	ldr	r4, =__zero_table_end__

.L_loop2:
	cmp	r3, r4
	bge	.L_loop2_done
	ldr	r1, [r3]
	ldr	r2, [r3, #4]
	movs	r0, 0

.L_loop2_0:
	subs	r2, #4
	itt	ge
	strge	r0, [r1, r2]
	bge	.L_loop2_0

	adds	r3, #8
	b	.L_loop2
.L_loop2_done:
#elif defined (__STARTUP_CLEAR_BSS)
/*  Single BSS section scheme.
 *
 *  The BSS section is specified by following symbols
 *    __bss_start__: start of the BSS section.
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
	ldr	r1, =__bss_start__
	ldr	r2, =__bss_end__

	movs	r0, 0
.L_loop3:
	cmp	r1, r2
	itt	lt
	strlt	r0, [r1], #4
	blt	.L_loop3
#endif /* __STARTUP_CLEAR_BSS_MULTIPLE || __STARTUP_CLEAR_BSS */

#ifndef __NO_SYSTEM_INIT
	bl	SystemInit
#endif

#ifndef __START
#define __START _start
#endif
	bl	__START

	.pool
	.size	Reset_Handler, . - Reset_Handler

	.align	1
	.thumb_func
	.weak	Default_Handler
	.type	Default_Handler, %function
Default_Handler:
	b	.
	.size	Default_Handler, . - Default_Handler

/*    Macro to define default handlers. Default handler
 *    will be weak symbol and just dead loops. They can be
 *    overwritten by other handlers */
	.macro	def_irq_handler	handler_name
	.weak	\handler_name
	.set	\handler_name, Default_Handler
	.endm

	def_irq_handler	NMI_Handler
	def_irq_handler	HardFault_Handler
	def_irq_handler	MemManage_Handler
	def_irq_handler	BusFault_Handler
	def_irq_handler	UsageFault_Handler
	def_irq_handler	SVC_Handler
	def_irq_handler	DebugMon_Handler
	def_irq_handler	PendSV_Handler
	def_irq_handler	SysTick_Handler

	def_irq_handler GPIOA_Handler
	def_irq_handler GPIOB_Handler
	def_irq_handler GPIOC_Handler
	def_irq_handler GPIOD_Handler
	def_irq_handler GPIOE_Handler
	def_irq_handler UART0_Handler
	def_irq_handler UART1_Handler
	def_irq_handler SSI0_Handler
	def_irq_handler I2C0_Handler
	def_irq_handler PMW0_FAULT_Handler
	def_irq_handler PWM0_0_Handler
	def_irq_handler PWM0_1_Handler
	def_irq_handler PWM0_2_Handler
	def_irq_handler QEI0_Handler
	def_irq_handler ADC0SS0_Handler
	def_irq_handler ADC0SS1_Handler
	def_irq_handler ADC0SS2_Handler
	def_irq_handler ADC0SS3_Handler
	def_irq_handler WDT0_Handler
	def_irq_handler TIMER0A_Handler
	def_irq_handler TIMER0B_Handler
	def_irq_handler TIMER1A_Handler
	def_irq_handler TIMER1B_Handler
	def_irq_handler TIMER2A_Handler
	def_irq_handler TIMER2B_Handler
	def_irq_handler COMP0_Handler
	def_irq_handler COMP1_Handler
	def_irq_handler COMP2_Handler
	def_irq_handler SYSCTL_Handler
	def_irq_handler FLASH_Handler
	def_irq_handler GPIOF_Handler
	def_irq_handler GPIOG_Handler
	def_irq_handler GPIOH_Handler
	def_irq_handler UART2_Handler
	def_irq_handler SSI1_Handler
	def_irq_handler TIMER3A_Handler
	def_irq_handler TIMER3B_Handler
	def_irq_handler I2C1_Handler
	def_irq_handler QEI1_Handler
	def_irq_handler CAN0_Handler
	def_irq_handler CAN1_Handler
	def_irq_handler CAN2_Handler
	def_irq_handler HIB_Handler
	def_irq_handler USB0_Handler
	def_irq_handler PWM0_3_Handler
	def_irq_handler UDMA_Handler
	def_irq_handler UDMAERR_Handler
	def_irq_handler ADC1SS0_Handler
	def_irq_handler ADC1SS1_Handler
	def_irq_handler ADC1SS2_Handler
	def_irq_handler ADC1SS3_Handler
	def_irq_handler GPIOJ_Handler
	def_irq_handler GPIOK_Handler
	def_irq_handler GPIOL_Handler
	def_irq_handler SSI2_Handler
	def_irq_handler SSI3_Handler
	def_irq_handler UART3_Handler
	def_irq_handler UART4_Handler
	def_irq_handler UART5_Handler
	def_irq_handler UART6_Handler
	def_irq_handler UART7_Handler
	def_irq_handler I2C2_Handler
	def_irq_handler I2C3_Handler
	def_irq_handler TIMER4A_Handler
	def_irq_handler TIMER4B_Handler
	def_irq_handler TIMER5A_Handler
	def_irq_handler TIMER5B_Handler
	def_irq_handler WTIMER0A_Handler
	def_irq_handler WTIMER0B_Handler
	def_irq_handler WTIMER1A_Handler
	def_irq_handler WTIMER1B_Handler
	def_irq_handler WTIMER2A_Handler
	def_irq_handler WTIMER2B_Handler
	def_irq_handler WTIMER3A_Handler
	def_irq_handler WTIMER3B_Handler
	def_irq_handler WTIMER4A_Handler
	def_irq_handler WTIMER4B_Handler
	def_irq_handler WTIMER5A_Handler
	def_irq_handler WTIMER5B_Handler
	def_irq_handler FPU_Handler
	def_irq_handler I2C4_Handler
	def_irq_handler I2C5_Handler
	def_irq_handler GPIOM_Handler
	def_irq_handler GPION_Handler
	def_irq_handler QEI2_Handler
	def_irq_handler GPIOP0_Handler
	def_irq_handler GPIOP1_Handler
	def_irq_handler GPIOP2_Handler
	def_irq_handler GPIOP3_Handler
	def_irq_handler GPIOP4_Handler
	def_irq_handler GPIOP5_Handler
	def_irq_handler GPIOP6_Handler
	def_irq_handler GPIOP7_Handler
	def_irq_handler GPIOQ0_Handler
	def_irq_handler GPIOQ1_Handler
	def_irq_handler GPIOQ2_Handler
	def_irq_handler GPIOQ3_Handler
	def_irq_handler GPIOQ4_Handler
	def_irq_handler GPIOQ5_Handler
	def_irq_handler GPIOQ6_Handler
	def_irq_handler GPIOQ7_Handler
	def_irq_handler GPIOR_Handler
	def_irq_handler GPIOS_Handler
	def_irq_handler PMW1_0_Handler
	def_irq_handler PWM1_1_Handler
	def_irq_handler PWM1_2_Handler
	def_irq_handler PWM1_3_Handler
	def_irq_handler PWM1_FAULT_Handler

	.end
