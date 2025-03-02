addi x20, x0, 0x80
nop
lui x1,0xFFFFF
nop
nop
addi x2,x0,500
nop
nop
# lui x23, 0xFFFF0
nop
la x25, TRAP_HANDLER
nop
add x23,x23,x25
nop
nop
nop
csrrw x24,0x305,x23
nop
nop

csrrw x21, 0x304,x20
nop
nop
nop
lui x10, 0x20000
addi x10, x10 0x400
addi x10, x10 0x400
addi x10, x10 0x400

lui x11, 0x0F0000
nop
nop
nop

csrrwi x22,0x300, x8
nop
nop
nop

sw x0, 4(x10)
sw x11, 0(x10)

nop
nop
nop
nop

nop
nop
nop
nop
loop:
nop
nop
nop
nop

nop
nop
nop
nop
j loop
nop
nop
nop
nop
TRAP_HANDLER: 

int_loop:
nop
nop
sw x0, 8(x10)
nop
nop 
nop 
mret