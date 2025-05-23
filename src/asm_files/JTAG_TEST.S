.globl _start
.section .text
_start:
li x31,0x20000C00  # mtimecmp address
li x20, 0xfff # mie value all enable
la x25, TRAP_HANDLER  # mtvec value
li x11, 12  # mtimecmp value

csrrw x0, mtvec, x25 # mtvec = TRAP_HANDLER
csrrci x0, mstatus, 0x1f # mstatus = 0x8
csrrs x0, mie, x20 # mie = 0xff
c.nop
sw x11, 0(x31) # load 0x100 to mtimecmp_lower
sw x0, 4(x31) # load zero to mtimecmp_upper

li x10, 0
li x11, 0
li x21, 0
li x20, 0
li x25, 0


loop:
c.jal adr1 #first half case
#jump to below

adr1: add x15, x1, x0

c.jal adr2 #second half case
#jump to below
adr2: add x16, x1, x0

c.nop
jal x17, adr3 #second half case for full inst
c.nop

#-------------------------------------------------
#jump to below (here multiple of 4)
adr3: c.nop
c.nop

c.nop
c.nop

c.jal adr4 #first half case
#jump to below
adr4: add x18, x1, x0
c.nop

c.nop
c.nop

c.nop
c.jal adr5#second half case
#jump (here multiple of 4)
adr5: add x19, x1, x0
c.nop
c.nop
c.nop
c.nop
c.nop
jal x20, loop #second half case for full inst







c.addi x2, 1
c.addi x3, 1
c.addi x4, 1

c.addi x6, 1
addi x7, x7, 0x100
c.addi x8, 1

c.addi x9, 1
addi x10, x10, 0x100
addi x11, x11, 0x100
c.addi x12, 1

addi x13, x13, 0x100
addi x14, x14, 0x100
j loop # executed


.section .trapvector
.option norvc
.balign 4
TRAP_HANDLER: 
nop
nop
sw x0, 8(x31)
nop
nop
nop
mret
