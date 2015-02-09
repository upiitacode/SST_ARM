#include "externalio.h"
void ledsB_init(void){
	SYSCTL->RCGCGPIO|=(0x1<<1);//Habilitar periferico GPIOB
	GPIOB->DEN|=0xFF;//Configurar pines PB[0..7] con funciones digitales
	GPIOB->DIR|=0xFF;//Configurar pines PB[0..7] como salidas
	GPIOB->DATA=0;//sacar 0 por pines PB[0..7]	
}

void ledsB_lowNibbleOuput(unsigned char ledValL){
	((int *)GPIOB)[0x0F]=ledValL;
}

void ledsB_HighNibbleOuput(unsigned char ledValH){
	((int *)GPIOB)[0xF0]=((ledValH&0xF)<<4);
}

void ledsB_Ouput(unsigned char ledVal){
	((int *)GPIOB)[0xFF]=ledVal;
}
