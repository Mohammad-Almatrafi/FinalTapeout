.section .init
_start:
li x21,0x20000C00  # mtimecmp address
li x20, 0xfff # mie value all enable
la x25, TRAP_HANDLER  # mtvec value
addi x11, x0, 0x100 # mtimecmp value

csrrw x0, mtvec, x25 # mtvec = TRAP_HANDLER
csrrsi x0, mstatus, 0x1f # mstatus = 0x8
csrrs x0, mie, x20 # mie = 0xff
c.nop
sw x11, 0(x21) # load 0x100 to mtimecmp_lower
sw x0, 4(x21) # load zero to mtimecmp_upper

li x10, 0
li x11, 0


loop:
c.addi x1, 1
c.addi x2, 1
c.addi x3, 1
c.addi x4, 1

c.addi x5, 1
addi x6, x6, 0x100
c.addi x7, 1

c.addi x8, 1
addi x9, x9, 0x100
addi x10, x10, 0x100
c.addi x11, 1

addi x12, x12, 0x100
addi x13, x13, 0x100
j loop # executed


.section .trapvector
.option norvc
.balign 4
TRAP_HANDLER: 
nop
nop
sw x0, 8(x21)
nop
nop
nop
mret


