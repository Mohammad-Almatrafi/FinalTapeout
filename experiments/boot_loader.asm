	.file	"boot_loader.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	write_csr, @function
write_csr:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a5,-20(s0)
	lw	a4,-24(s0)
#APP
# 11 "boot_loader.c" 1
	csrrw a5, a4
# 0 "" 2
#NO_APP
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	write_csr, .-write_csr
	.align	2
	.type	set_csr, @function
set_csr:
.LFB1:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a5,-20(s0)
	lw	a4,-24(s0)
#APP
# 16 "boot_loader.c" 1
	csrrs zero, a5, a4
# 0 "" 2
#NO_APP
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	set_csr, .-set_csr
	.align	2
	.globl	trap_handler
	.type	trap_handler, @function
trap_handler:
.LFB2:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	a5,4(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 15, -12
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	li	a5,536875008
	addi	a5,a5,-1016
	sw	zero,0(a5)
#APP
# 22 "boot_loader.c" 1
	mret
# 0 "" 2
#NO_APP
	nop
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	lw	a5,4(sp)
	.cfi_restore 15
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	mret
	.cfi_endproc
.LFE2:
	.size	trap_handler, .-trap_handler
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	li	a5,255
	sw	a5,-20(s0)
	li	a5,268435456
	sw	a5,-24(s0)
	li	a5,8
	sw	a5,-28(s0)
	lui	a5,%hi(trap_handler)
	addi	a5,a5,%lo(trap_handler)
	mv	a1,a5
	li	a0,773
	call	write_csr
	lw	a1,-20(s0)
	li	a0,772
	call	write_csr
	lw	a1,-28(s0)
	li	a0,768
	call	set_csr
	li	a5,536875008
	addi	a5,a5,-1020
	sw	zero,0(a5)
	li	a5,536875008
	addi	a5,a5,-1024
	lw	a4,-24(s0)
	sw	a4,0(a5)
.L5:
	j	.L5
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: () 14.2.0"
	.section	.note.GNU-stack,"",@progbits
