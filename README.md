# C64_Orchestra
A schematic and a pcb layout for a serial interface for C64 master-slave communication.

# Documentation
The board should be hooked directly to exactly 28 pins of the expansion port of the C64:
- D0-D7 as the data bus
- A0-A15 as the address bus
- Phi 2 (system clock, in schematics referred to as CPU_CLK)
- IRQ
- GND
- 5V DC

The board allows interfacing using several registers and may trigger an interrupt on the end of a transmitted packet. In order to send a packet, a developer first has to decide on who to send the packets to, sets 16 bit into specific registers, specifies whether an interrupt should be triggered on transmission end and then starts the transmission process.

For specifying the destination of a packet (each containing exactly 2 bytes), the board has two registers that can be written to (reading is not allowed). In sum, 16 destinations can be chosen in different combinations. Thus, up to 2^16 configurations are possible. The registers currently start at address 0xFFF8, which will change in the future (due to the fact that these addresses are used already). The destination register 1 (DEST1) lies at 0xFFF8, DEST2 (destination register 2) is located at 0xFFF9. 

The packet to be send can then be written into two shift registers. Again, they are write-only due to the fact that there is now paralell-out on the chips used. The shift registers each contain 8 bit and are located at 0xFFFB (for SR1, holding the lower 8 bits) and 0xFFFC (for SR2, holding the upper 8 bits). 

After the packet has been written to the shift registers, the developer has to decide on whether an Interrupt should be triggered on transmission end. Starting transmission and configuring whether triggering an interrupt is done in the same register. The WCR can be found at 0xFFFA. The least significant bit (at position 0) is a flag to set whether the transmission should start, a 1 denoting to start. The bit at position 1 denotes whether an interrupt should be triggered - a "1" indicates that an interrupt will be requested on transmission end.

As an alternative to using interrupts, the developer can initiate a read on the status register which is the WCR but read-only. The status register is located at address 0xFFFD. If the least significant bit is cleared, the transmission is done.

Since this board provides a master-slave hierarchy, the communication is unidirectional. No response is possible.

### ICs required (until now) ###




# Usual logic gate types:
- [74LS04](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS04.pdf) (NOT gates)
- [74LS08](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS08.pdf) (2-input AND)
- [74LS21](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS21.pdf) (4-input AND)
- [74LS30](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS30.pdf) (8-input NAND)
- [74LS32](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS32.pdf) (2-input OR)



# Registers:
- [74HC165](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS165.pdf) (parallel in, serial out shift register; 8 bit)
- [74HC173](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS173.pdf) (4 bit register)
- [74HC374](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS374.pdf) (8 bit register)



# Misc:
- [74HC237](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74HC237.pdf) (3 bit multiplexer)
- [74HC245](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS245.pdf) (tri-state buffer)
- [74LS393](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS393.PDF) (binary counter)



# Probably added in the future:
- Some oscillator (around 1 MHz)
- [6n137](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/6n137.pdf) (highspeed optocoupler)



# Probably solely for the receiver:
- [74LS595]() (parallel out, serial in shift register; 8 bit)
