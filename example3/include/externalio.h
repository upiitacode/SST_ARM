#ifndef _EXTERNALIO_H_
#define _EXTERNALIO_H_
#include "TM4C123.h"                    // Device header
void ledsB_init(void);
void ledsB_lowNibbleOuput(unsigned char ledValL);
void ledsB_HighNibbleOuput(unsigned char ledValH);
void ledsB_Ouput(unsigned char ledVal);
#endif
