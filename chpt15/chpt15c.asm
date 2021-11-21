.include "m32def.inc"


LDI R16,0xFF
OUT DDRB,R16
LDI R16,0x00
OUT DDRA,R16
LDI R16,0xFF
OUT PORTA,R16
IN R16,PINA
OUT PORTB,R16

CBI DDRC, 7
SBI PORTC, 7

CBI DDRC, 6
SBI PORTC, 6

SBI DDRC, 0


loop:
SBIS PINC, 7
RJMP auksise
SBIS PINC, 6
RJMP meiwse
RJMP loop

auksise:
INC R16
eksodos:
OUT PORTB, R16
perimene:
SBIS PINC, 7
RJMP perimene
SBIS PINC, 6
RJMP perimene
RJMP loop

meiwse:
DEC R16
RJMP eksodos


