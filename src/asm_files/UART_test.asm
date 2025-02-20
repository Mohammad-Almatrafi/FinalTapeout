.text 
nop
nop
nop



lui x10, 0x20000
nop
nop
addi x11, x0, 0x80
nop
sw x11, 3(x10)
addi x11, x0, 0x01
sw x11, 1(x10)
addi x11,x0, 0x46
sw x11, 0(x10)
addi x11, x0, 0x03
sw x11, 3(x10)
addi x11, x0, 0x41
sw x11, 0(x10)

Label: nop 
nop
nop
nop

lw x11, 0(x10)
sw x11,0(x10)
nop
nop
nop
nop
j Label
nop
nop
nop
nop
nop
nop
nop
nop

