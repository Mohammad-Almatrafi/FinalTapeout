.section .init
# .option norvc
li x20, 0x800 # mie value all enable
addi x11, x0, 0x100 # x11 = 256
la x25, TRAP_HANDLER  # mtvec value
csrrw x0,mtvec,x25 # mtvec = TRAP_HANDLER
li x2, 0x21002000
li x1, -1
sw x1, 0(x2)

li x2, 0x21000000
li x1, 1
sw x1, 0(x2)

li x2, 0x21000004
li x1, 2
sw x1, 0(x2)

li x2, 0x21000008
li x1, 3
sw x1, 0(x2)

li x2, 0x2100000c
li x1, 4
sw x1, 0(x2)

li x2, 0x21000010
li x1, 5
sw x1, 0(x2)

li x2, 0x21000014
li x1, 6
sw x1, 0(x2)

li x2, 0x21000018
li x1, 7
sw x1, 0(x2)

li x2, 0x2100001c
li x1, 7
sw x1, 0(x2)

li x2, 0x21000020
li x1, 9
sw x1, 0(x2)

li x2, 0x21000024
li x1, 10
sw x1, 0(x2)

csrrw x0, mie,x20 # mie = 0xff
csrrw x0,mstatus, 0x1f # mstatus = 0x8
loop:
j loop # executed
nop
nop
nop
nop # mem
nop # exec
nop # id
nop # if
TRAP_HANDLER: 

sw x0, 8(x10)
mret
