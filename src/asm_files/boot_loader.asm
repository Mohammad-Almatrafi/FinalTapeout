.text 

nop
nop
nop
lui x16, 0x10000#address of IM 
lui x10, 0x20000 #Address of UART
addi x11, x0, 0x80 #Load to enable DLAB
sw x11, 3(x10) #In address of Line Control Register enable the latch
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
addi x11, x0, 0x01 # Value to store in divisor latch MSB
sw x11, 1(x10)
addi x11,x0, 0x46 # value to store in divisor latch LSB
sw x11, 0(x10) 
nop
nop
nop
addi x11, x0, 0x03  
sw x11, 3(x10) #Store in LCR to make it 8bs

nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
addi x21, x0, 0x200#value to compare with to know that the program finished (fixed)
loop:

nop
nop
nop

lw  x12,5(x10) # This is to see the LSR to know when to take the byte
andi x12,x12,0x001
beq x0, x12, loop
nop
nop
nop
lw x11, 0(x10)#Take the value of UART RX (received byte)
nop
nop
nop
andi x11,x11,0xff
sb x11, 0(x16) #store to IMEM address
nop
nop
nop
addi x16,x16,1 #Increment the IMEM address
nop
nop
nop
nop
nop
nop
nop
nop
nop
andi x20,x16, 0x3ff

bne x20,x21,loop
nop
nop
nop
and x16, x0,x0
and x10 x0,x0
and x11, x0,x0
and x21, x0,x0
and x12, x0,x0
and x20, x0,x0

nop
nop
nop
li x24, 0x10000000
jr x24
nop
nop
nop
nop
nop
nop

