.option norvc
.text
addi x2, x0, 12 # x2= 12
# csrrw x0, mstatus, x2 # mstatus = 10
# nop
# nop
csrrw x0, mstatus, x2
nop
nop
nop
nop
nop
nop
nop
csrrw x1, mstatus, x0 # mstatus = 10
csrrw x1, mstatus, x1 # mstatus = 10
csrrw x1, mstatus, x1 # mstatus = 10
csrrw x1, mstatus, x1 # mstatus = 10
csrrw x1, mstatus, x1 # mstatus = 10
csrrw x1, mstatus, x1 # mstatus = 10
csrrw x1, mstatus, x1 # mstatus = 10
csrrw x1, mstatus, x1 # mstatus = 10
csrrw x1, mstatus, x1 # mstatus = 10


