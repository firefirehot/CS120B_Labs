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
	DDRC = 0xFF; PORTC = 0x00;
	unsigned char cntavail = 0;
	unsigned char forcount;
    /* Insert your solution below */
    while (1) {
    	for(forcount = 0; forcount < 4; ++forcount){
		if(((PINA >> forcount) & 0x01) == 0x00){
			cntavail = cntavail + 1;
		}
	} 
	if(cntavail == 0){
	cntavail = cntavail | 0x80;
	}	
	PORTC = cntavail;
	
	cntavail = 0;		
    }
    return 1;
}
