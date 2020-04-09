/*	Author: rwyat002
 *  Partner(s) Name: 
 *	Lab Section:
 *	Assignment: Lab #  Exercise #
 *	Exercise Description: [optional - include for your own benefit]
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

int main(void) {
    /* Insert DDR and PORT initializations */
	DDRA = 0x00; PORTA = 0xFF;
	DDRB = 0x00; PORTB = 0xFF;
	DDRC = 0x00; PORTC = 0xFF;
	DDRD = 0xFF; PORTD = 0x00;
	unsigned char tempPort = 0;
	//unsigned char forcount;
    /* Insert your solution below */
    while (1) {
    	if(((PINA + PINB) + PINC) > 140){
		tempPort = 0x01;
	}
	if(PINA > PINC){
		if((PINA - PINC) > 80){
			tempPort = tempPort | 0x02;		
		}
	}
	else{
		if((PINC - PINA) > 80){
			tempPort = tempPort | 0x02;
		}
	}
	tempPort = (((PINA + PINB) + PINC) & 0xFC) | tempPort;
	PORTD = tempPort;
	tempPort = 0x00;
    }
    return 1;
}
