# C64_Orchestra
A schematic and a pcb layout for a serial interface for C64 master-slave communication.

### ICs required (until now) ###

---

---

# Usual logic gate types:
- [74LS04](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS04.pdf) (NOT gates)
- [74LS08](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS08.pdf) (2-input AND)
- [74LS21](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS21.pdf) (4-input AND)
- [74LS30](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS30.pdf) (8-input NAND)
- [74LS32](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS32.pdf) (2-input OR)

---

# Registers:
- [74HC165](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS165.pdf) (parallel in, serial out shift register; 8 bit)
- [74HC173](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS173.pdf) (4 bit register)
- [74HC374](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS374.pdf) (8 bit register)

---

# Misc:
- [74HC237](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74HC237.pdf) (3 bit multiplexer)
- [74HC245](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS245.pdf) (tri-state buffer)
- [74LS393](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/74LS393.PDF) (binary counter)

---

# Probably added in the future:
- Some oscillator (around 1 MHz)
- [6n137](https://github.com/keksklauer4/C64_Orchestra/blob/master/docs/6n137.pdf) (highspeed optocoupler)

---

# Probably solely for the receiver:
- [74LS595]() (parallel out, serial in shift register; 8 bit)
