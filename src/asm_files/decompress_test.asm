.text

c.addi4spn x8, x2 , 16
c.sw x8, 16(x8)
c.lw x8, 16(x8)
c.nop
c.addi x8, -1
c.addi x8, 8
c.li x1, 12
c.addi16sp x2, 16
c.lui x8,12
c.srli x8,1
c.srai x8,1
c.andi x8,1
c.sub x8,x9
c.xor x8,x9
c.or x8,x9
c.and x8,x9
c.slli x1,2
c.lwsp x1, 12(x2)
c.mv x8,x9
c.add x8,x9
c.swsp x9, 16(x2)
c.bnez x8,12
c.beqz x8,12
c.j 4
c.jr x1
c.jal 64
c.jalr x8


