# C64_Orchestra
A schematic and a pcb layout for a serial interface for C64 master-slave communication.

### ICs required (until now) ###

Usual logic gate types:
- 74LS04 (NOT gates)
- 74LS08 (2-input AND)
- 74LS21 (4-input AND)
- 74LS30 (8-input NAND)
- 74LS32 (2-input OR)

Registers:
- 74HC165 (parallel in, serial out shift register; 8 bit)
- 74HC173 (4 bit register)
- 74HC374 (8 bit register)

Misc:
- 74HC237 (3 bit multiplexer)
- 74HC245 (tri-state buffer)
- 74LS393 (binary counter)

Probably added in the future:
- Some oscillator (around 1 MHz)
- 6n137 (highspeed optocoupler)


Probably solely for the receiver:
- 74LS595 (parallel out, serial in shift register; 8 bit)
