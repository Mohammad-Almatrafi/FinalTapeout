
addi x20, x0, 0xff # mie value all enable
nop
nop
nop
lui x11, 0x10000 # mtime comp value
# addi x11, x0, 200
nop
nop
nop
addi x28,x0,8 # mstatus value make the MIE bit equal to 1
nop
nop
nop
nop
nop
nop
la x25, TRAP_HANDLER  # mtvec value
nop
nop
nop
nop
csrrw x0,mtvec,x25 # mtvec = TRAP_HANDLER
nop
nop
nop

csrrw x0, mie,x20 # mie = 0xff
nop
nop
nop
lui x10, 0x20000
addi x10, x10 0x400
addi x10, x10 0x400
addi x10, x10 0x400 #finding mtime comp address
nop
nop
nop
nop
nop
nop
nop
csrrsi x0,mstatus, 0x1f # mstatus = 0x8
nop
nop
add x28,x0,x0
nop
nop
nop
sw x0, 4(x10)
nop
nop
nop
sw x11, 0(x10)
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
nop
nop
nop
