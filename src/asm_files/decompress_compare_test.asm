.text

addi x8, x2 , 16
sw x8, 16(x8)
lw x8, 16(x8)
nop
addi x8,x8, -1
addi x8,x8,8
li x1, 12
addi x2,x2, 16
lui x8,12
srli x8,x8,1
srai x8,x8,1
andi x8,x8,1
sub x8,x8,x9
xor x8,x8,x9
or x8,x8,x9
and x8,x8,x9
slli x1,x1,2
lw x1, 12(x2)
mv x8,x9
add x8,x8,x9
sw x9, 16(x2)
bne x8,x0,12
beq x8,x0,12
j 12
jr x1
jal ra, 12
jalr x1,x8,0
