lui x16, 0x10000#address of IM 

lui x2, 0x00408
addi x2, x2, 0x093

lui x3, 0x0010A
addi x3, x3, 0x023

lui x4, 0x0000A
addi x4, x4, 0x083

li x5,  0xFF5FF06F

sw x2, 0(x16)
sw x3, 4(x16)
sw x4, 8(x16)
sw x5, 12(x16)
jr x16
