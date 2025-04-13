# .option norvc
# .text

nop 
nop

la x25, trap_handler  # mtvec value
nop
nop
nop
nop
csrrw x0,mtvec,x25 # mtvec = TRAP_HANDLER
nop
nop
# sw x2, 3(x0)
ecall
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
j infinite


trap_handler:
nop
nop
nop
csrrs x10, mcause, x0
mret
nop 
nop
nop
nop
infinite:
j infinite