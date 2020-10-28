
COUNTER = $0

; A contains the lower 8 bit and X the upper, remaining, 3 bit
f_encode_hamming



; A: lower 8 bit
; Stack: upper 8 bit
; deletes both and changes x and y
; returns the mask in X
f_calc_mask:
  LDY #1
  STY COUNTER
  LDX #0

  ; begin loop
l_calc_byte_loop
  LSR
  BCC l_inc_counter ; if shifted bit is not set no need to xor
  TAY ; move registers to allow for correct EOR on the mask (which is located in X)
  TXA
  EOR COUNTER
  TAX
  TYA
l_inc_counter
  INC COUNTER
  CMP #0
  BNE l_calc_byte_loop
  ; end loop

  LDY COUNTER
  TYA
  CMP #9
  RTS ; if the upper byte has already been processed (counter >= 9) get out
  LDY #0x09
  STY COUNTER ; set the counter to 9 for the upper byte
  PLA ; pull the upper byte
  AND #$0x7F
  BNE l_calc_byte_loop ; only continue if upper byte is not zero

