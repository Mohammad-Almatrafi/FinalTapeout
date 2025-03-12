	.file	"functions.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.file 0 "/home/rur1k/FinalTapeout/FinalTapeout/C_Code" "includes/functions.c"
	.align	2
	.globl	__mulsi3
	.type	__mulsi3, @function
__mulsi3:
.LFB0:
	.file 1 "includes/functions.c"
	.loc 1 7 40
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	.loc 1 8 13
	sw	zero,-20(s0)
	.loc 1 9 28
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	xor	a5,a4,a5
	srli	a5,a5,31
	andi	a5,a5,0xff
	.loc 1 9 9
	sw	a5,-32(s0)
	.loc 1 12 31
	lw	a5,-36(s0)
	srai	a4,a5,31
	lw	a5,-36(s0)
	xor	a5,a4,a5
	sub	a5,a5,a4
	.loc 1 12 14
	sw	a5,-24(s0)
	.loc 1 13 31
	lw	a5,-40(s0)
	srai	a4,a5,31
	lw	a5,-40(s0)
	xor	a5,a4,a5
	sub	a5,a5,a4
	.loc 1 13 14
	sw	a5,-28(s0)
	.loc 1 15 11
	j	.L2
.L4:
	.loc 1 16 15
	lw	a5,-28(s0)
	andi	a5,a5,1
	.loc 1 16 12
	beq	a5,zero,.L3
	.loc 1 17 20
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
.L3:
	.loc 1 19 11
	lw	a5,-24(s0)
	slli	a5,a5,1
	sw	a5,-24(s0)
	.loc 1 20 11
	lw	a5,-28(s0)
	srli	a5,a5,1
	sw	a5,-28(s0)
.L2:
	.loc 1 15 12
	lw	a5,-28(s0)
	bne	a5,zero,.L4
	.loc 1 23 31
	lw	a5,-32(s0)
	beq	a5,zero,.L5
	.loc 1 23 31 is_stmt 0 discriminator 1
	lw	a5,-20(s0)
	neg	a5,a5
	.loc 1 23 31
	j	.L7
.L5:
	.loc 1 23 31 discriminator 2
	lw	a5,-20(s0)
.L7:
	.loc 1 24 1 is_stmt 1
	mv	a0,a5
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	__mulsi3, .-__mulsi3
	.align	2
	.globl	__clzsi2
	.type	__clzsi2, @function
__clzsi2:
.LFB1:
	.loc 1 27 30
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	.loc 1 28 8
	lw	a5,-36(s0)
	bne	a5,zero,.L9
	.loc 1 28 24 discriminator 1
	li	a5,32
	.loc 1 28 24 is_stmt 0
	j	.L10
.L9:
	.loc 1 29 9 is_stmt 1
	sw	zero,-20(s0)
.LBB2:
	.loc 1 30 18
	li	a5,-2147483648
	sw	a5,-24(s0)
	.loc 1 30 5
	j	.L11
.L12:
	.loc 1 31 14
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	.loc 1 30 59 discriminator 3
	lw	a5,-24(s0)
	srai	a5,a5,1
	sw	a5,-24(s0)
.L11:
	.loc 1 30 40 discriminator 1
	lw	a4,-24(s0)
	lw	a5,-36(s0)
	and	a5,a4,a5
	.loc 1 30 48 discriminator 1
	beq	a5,zero,.L12
.LBE2:
	.loc 1 33 12
	lw	a5,-20(s0)
.L10:
	.loc 1 34 1
	mv	a0,a5
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	__clzsi2, .-__clzsi2
	.align	2
	.globl	__udivsi3
	.type	__udivsi3, @function
__udivsi3:
.LFB2:
	.loc 1 36 56
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	.loc 1 37 18
	sw	zero,-20(s0)
	.loc 1 38 18
	sw	zero,-24(s0)
.LBB3:
	.loc 1 41 14
	li	a5,31
	sw	a5,-28(s0)
	.loc 1 41 5
	j	.L14
.L16:
	.loc 1 43 16
	lw	a5,-24(s0)
	slli	a4,a5,1
	.loc 1 43 28
	lw	a5,-28(s0)
	lw	a3,-36(s0)
	srl	a5,a3,a5
	.loc 1 43 34
	andi	a5,a5,1
	.loc 1 43 11
	or	a5,a4,a5
	sw	a5,-24(s0)
	.loc 1 46 12
	lw	a4,-24(s0)
	lw	a5,-40(s0)
	bltu	a4,a5,.L15
	.loc 1 47 15
	lw	a4,-24(s0)
	lw	a5,-40(s0)
	sub	a5,a4,a5
	sw	a5,-24(s0)
	.loc 1 48 22
	lw	a5,-28(s0)
	li	a4,1
	sll	a5,a4,a5
	.loc 1 48 15
	lw	a4,-20(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
.L15:
	.loc 1 41 30 discriminator 2
	lw	a5,-28(s0)
	addi	a5,a5,-1
	sw	a5,-28(s0)
.L14:
	.loc 1 41 24 discriminator 1
	lw	a5,-28(s0)
	bge	a5,zero,.L16
.LBE3:
	.loc 1 52 12
	lw	a5,-20(s0)
	.loc 1 53 1
	mv	a0,a5
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	__udivsi3, .-__udivsi3
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
.LFB3:
	.loc 1 56 53
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	.loc 1 57 11
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	.loc 1 58 17
	lw	a5,-40(s0)
	sw	a5,-24(s0)
	.loc 1 59 11
	j	.L19
.L20:
	.loc 1 59 26 discriminator 2
	lw	a4,-24(s0)
	addi	a5,a4,1
	sw	a5,-24(s0)
	.loc 1 59 19 discriminator 2
	lw	a5,-20(s0)
	addi	a3,a5,1
	sw	a3,-20(s0)
	.loc 1 59 24 discriminator 2
	lbu	a4,0(a4)
	.loc 1 59 22 discriminator 2
	sb	a4,0(a5)
.L19:
	.loc 1 59 13 discriminator 1
	lw	a5,-44(s0)
	addi	a4,a5,-1
	sw	a4,-44(s0)
	.loc 1 59 12 discriminator 1
	bne	a5,zero,.L20
	.loc 1 60 12
	lw	a5,-36(s0)
	.loc 1 61 1
	mv	a0,a5
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	memcpy, .-memcpy
	.align	2
	.globl	memset
	.type	memset, @function
memset:
.LFB4:
	.loc 1 63 40
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	.loc 1 64 11
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	.loc 1 65 11
	j	.L23
.L24:
	.loc 1 65 19 discriminator 2
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	.loc 1 65 22 discriminator 2
	lw	a4,-40(s0)
	andi	a4,a4,0xff
	sb	a4,0(a5)
.L23:
	.loc 1 65 13 discriminator 1
	lw	a5,-44(s0)
	addi	a4,a5,-1
	sw	a4,-44(s0)
	.loc 1 65 12 discriminator 1
	bne	a5,zero,.L24
	.loc 1 66 12
	lw	a5,-36(s0)
	.loc 1 67 1
	mv	a0,a5
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	memset, .-memset
.Letext0:
	.file 2 "/opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/14.2.0/include/stdint-gcc.h"
	.file 3 "/opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/14.2.0/include/stddef.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x258
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.uleb128 0x6
	.4byte	.LASF7
	.byte	0x2
	.byte	0x28
	.byte	0x18
	.4byte	0x40
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x6
	.4byte	.LASF8
	.byte	0x2
	.byte	0x34
	.byte	0x19
	.4byte	0x68
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x3
	.byte	0xd6
	.byte	0x17
	.4byte	0x68
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.4byte	.LASF12
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x3f
	.byte	0x7
	.4byte	0xd3
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd3
	.uleb128 0x1
	.string	"s"
	.byte	0x3f
	.byte	0x14
	.4byte	0xd3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.string	"c"
	.byte	0x3f
	.byte	0x1b
	.4byte	0x40
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.string	"n"
	.byte	0x3f
	.byte	0x25
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x3
	.string	"p"
	.byte	0x40
	.byte	0xb
	.4byte	0xd5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.uleb128 0x7
	.4byte	0xda
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.uleb128 0xc
	.4byte	0xda
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x38
	.byte	0x7
	.4byte	0xd3
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x141
	.uleb128 0xd
	.4byte	.LASF16
	.byte	0x1
	.byte	0x38
	.byte	0x14
	.4byte	0xd3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.string	"src"
	.byte	0x38
	.byte	0x26
	.4byte	0x141
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.string	"n"
	.byte	0x38
	.byte	0x32
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x3
	.string	"d"
	.byte	0x39
	.byte	0xb
	.4byte	0xd5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x3
	.string	"s"
	.byte	0x3a
	.byte	0x11
	.4byte	0x147
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x7
	.4byte	0x146
	.uleb128 0xe
	.uleb128 0x7
	.4byte	0xe1
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x24
	.byte	0xe
	.4byte	0x68
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ac
	.uleb128 0x1
	.string	"a"
	.byte	0x24
	.byte	0x25
	.4byte	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.string	"b"
	.byte	0x24
	.byte	0x35
	.4byte	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.string	"q"
	.byte	0x25
	.byte	0x12
	.4byte	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x3
	.string	"r"
	.byte	0x26
	.byte	0x12
	.4byte	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x8
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x3
	.string	"i"
	.byte	0x29
	.byte	0xe
	.4byte	0x40
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x1b
	.byte	0x9
	.4byte	0x34
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1f8
	.uleb128 0x1
	.string	"x"
	.byte	0x1b
	.byte	0x1b
	.4byte	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x5
	.4byte	.LASF19
	.byte	0x1d
	.byte	0x9
	.4byte	0x40
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x5
	.4byte	.LASF20
	.byte	0x1e
	.byte	0x12
	.4byte	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0xf
	.4byte	.LASF24
	.byte	0x1
	.byte	0x7
	.byte	0x9
	.4byte	0x34
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1
	.string	"a"
	.byte	0x7
	.byte	0x1a
	.4byte	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.string	"b"
	.byte	0x7
	.byte	0x25
	.4byte	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x5
	.4byte	.LASF21
	.byte	0x8
	.byte	0xd
	.4byte	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x5
	.4byte	.LASF22
	.byte	0x9
	.byte	0x9
	.4byte	0x40
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.string	"x"
	.byte	0xc
	.byte	0xe
	.4byte	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x3
	.string	"y"
	.byte	0xd
	.byte	0xe
	.4byte	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF11:
	.string	"size_t"
.LASF20:
	.string	"mask"
.LASF18:
	.string	"__clzsi2"
.LASF16:
	.string	"dest"
.LASF5:
	.string	"unsigned char"
.LASF6:
	.string	"short unsigned int"
.LASF14:
	.string	"memset"
.LASF24:
	.string	"__mulsi3"
.LASF9:
	.string	"unsigned int"
.LASF23:
	.string	"GNU C17 14.2.0 -mabi=ilp32 -mtune=rocket -misa-spec=20191213 -mtls-dialect=trad -march=rv32i_zicsr -g -ffreestanding"
.LASF10:
	.string	"long long unsigned int"
.LASF21:
	.string	"result"
.LASF7:
	.string	"int32_t"
.LASF4:
	.string	"long long int"
.LASF13:
	.string	"char"
.LASF19:
	.string	"count"
.LASF15:
	.string	"memcpy"
.LASF3:
	.string	"short int"
.LASF8:
	.string	"uint32_t"
.LASF12:
	.string	"long double"
.LASF2:
	.string	"signed char"
.LASF17:
	.string	"__udivsi3"
.LASF22:
	.string	"negative"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/rur1k/FinalTapeout/FinalTapeout/C_Code"
.LASF0:
	.string	"includes/functions.c"
	.ident	"GCC: () 14.2.0"
	.section	.note.GNU-stack,"",@progbits
