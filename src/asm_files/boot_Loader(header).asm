.text 

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
nop
nop
nop

addi x30,x0, 1

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
addi x11, x0, 0x01 # Value to store in divisor latch MSB
nop
nop
nop
sw x11, 1(x10)
nop
nop
nop
addi x11,x0, 0x46 # value to store in divisor latch LSB
nop
nop
nop
sw x11, 0(x10) 
nop
nop
nop
addi x11, x0, 0x03  
nop
nop
nop
sw x11, 3(x10) #Store in LCR to make it 8bs

nop
nop
nop
nop
addi x30,x0, 1
nop
nop
nop
loop1:
    lw  x12,5(x10) # This is to see the LSR to know when to take the byte
    nop
    nop
    nop
    andi x12,x12,0x001
    nop
    nop
    nop
    nop
 beq x0, x12, loop1
    
 nop
 nop
 nop
 nop
 nop
 lw x21, 0(x10)
 nop
 nop
 nop
 slli x21, x21,2

nop
nop
nop
addi x30, x0, 2
nop
nop
nop
loop:

nop
nop
nop

lw  x12,5(x10) # This is to see the LSR to know when to take the byte
nop
nop
nop
andi x12,x12,0x001
nop
nop
nop
beq x0, x12, loop
nop
nop
nop

addi x30, x0, 3
nop
nop
nop
nop
nop
nop
lw x11, 0(x10)#Take the value of UART RX (received byte)
nop
nop
nop
nop
addi x27,x0, 0


sw x27,0(x16)
nop
andi x11,x11,0xff
nop
nop
nop
sb x11, 0(x16) #store to IMEM address
nop
nop
nop
addi x30, x0, 5
nop
nop
nop
addi x16,x16,1 #Increment the IMEM address
nop
nop
addi x19,x19,1
nop
nop
# andi x20,x16, 0x3ff #I think we could remove this
nop
nop
nop
bne x19,x21,loop #Insert x16 directly
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
nop
nop
nop
jr x24
nop
nop
nop
nop
addi x30, x0, 8

nop
nop
nop

