.option norvc
.text
addi x2, x0, 10# x2= 10
sw x2, 0(x0)
nop
nop
nop
nop
nop
nop
nop
nop
nop
lw x1, 0(x0)# x1 = 10
csrrw x0, mstatus, x1 # mstatus = 10

