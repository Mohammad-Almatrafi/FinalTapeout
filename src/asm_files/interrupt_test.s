# .option norvc
li x20, -1 # mie value all enable
nop
nop
nop
# lui x11, 0x10000 # mtime comp value
addi x11, x0, 0x100 # x11 = 256
nop
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
li x10,0x20000C00  # mtimecmp address
nop
nop
nop
nop
nop
nop
nop
csrrwi x0,mstatus, 0x1f # mstatus = 0x8
nop
nop
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
j loop # executed
nop
nop
nop
nop # mem
nop # exec
nop # id
nop # if
TRAP_HANDLER: 

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
