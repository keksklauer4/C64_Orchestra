# C64_Orchestra
A schematic and a pcb layout for a serial interface for C64 master-slave communication.

## This is a work in progress. I do not take any responsibility for what you do with this. Neither can I assure the correctness of anything that is stated here.
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

# How does it work until now?
It does not work. It is just a design. Apart from that, only the master board has been designed (it is much more complex) and a decision on the actual transmission has not been made yet (probably NRZ due to its simplicity).

## Now, how is it supposed to work (under the hood)?
That's how I like questions to be asked! Well, the schematics is split up into 6 parts:
- An Address resolver
- The destination control
- The transmitter circuit
- The status registers
- The circuit-internal clock circuit
- The outgate

It must be said that the latter two are *very* sparse and should not really be counted (but who cares?).

I will shortly explain the 6 parts.

### The outgate
As mentioned above, it is very simple because that is just an abstraction layer for the outputs of the circuit. The outputs are:
- 16 pin for destination control (each channel can be selected using one bit)
- 1 pin for the transmission clock (not the CPU clock)
- 1 pin for the actual signal send (serial signal)

For every C64 acting as a slave in the hierarchy another two chips are needed:
1. A chip to convert the signal and the clock of the master to the slave's power levels
2. A chip to read incoming serial data (potentially with error detection in the future), a binary counter to get that the transmission ended and a way to interface with the slave's expansion port (Interrupt and read control).

### The circuit-internal clock circuit
This part has not been designed yet (because it does not make sense to design that without testing the capabilities of a transmission).
The board should, however, have its own clock to allow for transmission frequencies below 1 MHz (otherwise errors might be too frequent). Either a LM555 or a crystal oscillator will be used. The internal clock circuit is only used in the outgate and the transmitter circuit.

### The address resolver
That part is rather simple (but will be adjusted to relocate the address the registers can be found at). Basically, two big AND gates (74HC30) check whether the upper 13 bit of the address lines (thus, pins A3-A15) are set to high. If that is the case, the multiplexer (74HC238) is enabled and evaluates the lower three bit. Depending on the output of the multiplexer, one of the registers is selected. These select lines are the outputs of the address resolver part. Let's shortly enumerate the different possibilities and the mapping to the select lines (a clever reader can predict the mapping by looking at the addresses of each register mentioned above):
A2-A1-A0
- 0-0-0 -> Destination register 1 (DEST1_Select)
- 0-0-1 -> Destination register 2 (DEST2_Select)
- 0-1-0 -> WCR (used to configure behavior on transmission end and to start transmitting)
- 0-1-1 -> SR1 (select line for the shift register 1)
- 1-0-0 -> SR2 (select line for the shift register 2)
- 1-0-1 -> Status register (read-only register to manually check the transmission status)
- 1-1-0 -> not in use
- 1-1-1 -> not in use

The beauty of the address resolver lies in the fact that no other part interfaces with the address bus (which reduces complexity).

The schematics for the address resolver is shown in the image below.

![Schematics of the address resolver.](https://github.com/keksklauer4/C64_Orchestra/blob/master/images/address_resolver.png)

### The destination control
The destination control consists of two 8 bit registers (74HC374) to hold the destination configuration. Depending on the select lines of the address resolver, namely DEST1_Select and DEST2_Select, either destination register 1 or destination register 2 is written to, respectively. The ouputs of the destination registers are always fed directly to the outgate and are used to configure whether a slave should receive the packet or not.

The schematics (see the image below) are pretty straightforward:

![Schematics of the destination registers.](https://github.com/keksklauer4/C64_Orchestra/blob/master/images/destination_registers.png)

### The status register
Internally, the status register consists of some combinational logic (that will be explained indirectly without going into too much depth), one 8-bit register (74HC374) that holds the data and two buffers to control the flow to the data bus of the C64. Apart from that, this part depends on the C64's clock (CPU Clock), two select lines of the address resolver, more precisely, for selecting WCR and selecting the status register, and a flag by the transmission circuit that tells whether a transmission has just ended.

Three different modes must be distinguished:
- Write to WCR: The data bus of the C64 contains the data to set the register to. Thus, the write buffer (bascially a tri-state gate) lets the data bus to the registers inputs and simulateously the load flag of the register is enabled.
- Read from status register: The output buffer (again a tri-state gate - a 74HC245) is set to let the data from the output of the register to the data bus and the output of the register is enabled while the input is disabled.
- Reset start flag: If a transmission has ended, the done flag will be HIGH. Then, the least significant bit of the status register should be cleared (set to LOW). To achieve that both buffers (the write and output buffer) are disabled, and the outputs of the status registers are tied to the input of the registers while the lowest bit is cleared. The load flag is set.

The status register is partially redundant and might be changed.

However, the schematics can be found in the image below. Do not try to understand it.

![Schematics of the status register (and its I/O logic).](https://github.com/keksklauer4/C64_Orchestra/blob/master/images/status_register.png)

### The transmitter circuit
This is the heart of the whole board and therefore most of the complexity lies here. The transmitter circuit depends on the flags set in the status register, the C64's clock, the board's internal clock, the C64's data bus and the select lines for the registers SR1 and SR2 (the shift registers holding the packet data) by the address resolver. The outputs are the signal that will be fed to the outgate and the interrupt line.

The transmitter circuit consists of two shift registers (74LS165), a binary counter (74LS393) and quite some combinational logic. Depending on the current mode (transmission started or not) either the C64's clock (CPU_CLK) is fed to the shift registers or the board-internal clock (Own_CLK). If either of the select lines for the shift registers by the address resolver is HIGH, the respective shift register loads parallel from the data bus. Thus, if the transmission has started which is indicated through the status register's least significant bit, the board's internal clock will be fed to the currently needed shift register.

Determining which shift register is needed is achieved by checking the binary counter's most significant bit. If the most signficant bit is not set, SR1 (shift register 1) is shifted and the output is fed out to the outgate as SIGNAL. Otherwise, SR2 is shifted an its output is taken. The binary counter starts counting when transmission starts and indirectly counts the bits transmitted. Thus, if the most significant bit is set that is equivalent to "at least 8 bits have been transmitted" which in turn means SR1 is empty (which is why SR2 is taken).

The binary counter is reset (set to 0) when transmission ends. Whenever the binary counter reaches 15, the transmission has ended (16 bit have been transmitted), the output flag that indicates the end of a transmission is set to HIGH (which triggers a clear in the status register part). If the status register is set to trigger an interrupt on transmission end, an interrupt is requested on transmission end.

In the future, depending on the quality of this work, maybe a waitstate is inserted every 8 bit to add a parity bit (to allow for error detection at the slave).


![Schematics of the transmitter circuit.](https://github.com/keksklauer4/C64_Orchestra/blob/master/images/transmitter.png)

# ICs required (until now)


## Usual logic gate types:
- [74HC04](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS04.pdf) (NOT gates)
- [74HC08](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS08.pdf) (2-input AND)
- [74LS21](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS21.pdf) (4-input AND)
- [74HC30](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS30.pdf) (8-input NAND)
- [74HC32](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS32.pdf) (2-input OR)



## Registers:
- [74LS165](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS165.pdf) (parallel in, serial out shift register; 8 bit)
- [74HC173](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS173.pdf) (4 bit register)
- [74HC374](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS374.pdf) (8 bit register)



## Misc:
- [74HC237](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74HC237.pdf) (3 bit multiplexer)
- [74HC245](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS245.pdf) (tri-state buffer)
- [74HC393](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS393.PDF) (binary counter)



## Probably added in the future:
- Some oscillator (around 1 MHz)
- [6n137](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/6n137.pdf) (highspeed optocoupler)



## Probably solely for the receiver:
- [74HC595]() (parallel out, serial in shift register; 8 bit)

Note that the ICs of the 74LS and 74HC series cannot be randomly interchanged. The output of a 74LS cannot drive an input of a 74HC due to a difference in the voltage level for a logic HIGH. In order to drive an input of a 74HC using a 74LS's output, one should (or must) use pull-up resistor of at least 600 ohm. The ohmage could be different depending on one's power supply.
