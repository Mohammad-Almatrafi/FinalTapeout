	.file	"list.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.file 0 "/home/rur1k/FinalTapeout/FinalTapeout/C_Code" "FreeRTOS-Kernel/list.c"
	.align	2
	.globl	vListInitialise
	.type	vListInitialise, @function
vListInitialise:
.LFB6:
	.file 1 "FreeRTOS-Kernel/list.c"
	.loc 1 50 1
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
	.loc 1 56 40
	lw	a5,-20(s0)
	addi	a4,a5,8
	.loc 1 56 21
	lw	a5,-20(s0)
	sw	a4,4(a5)
	.loc 1 62 33
	lw	a5,-20(s0)
	li	a4,-1
	sw	a4,8(a5)
	.loc 1 66 48
	lw	a5,-20(s0)
	addi	a4,a5,8
	.loc 1 66 29
	lw	a5,-20(s0)
	sw	a4,12(a5)
	.loc 1 67 52
	lw	a5,-20(s0)
	addi	a4,a5,8
	.loc 1 67 33
	lw	a5,-20(s0)
	sw	a4,16(a5)
	.loc 1 78 29
	lw	a5,-20(s0)
	sw	zero,0(a5)
	.loc 1 86 1
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
.LFE6:
	.size	vListInitialise, .-vListInitialise
	.align	2
	.globl	vListInitialiseItem
	.type	vListInitialiseItem, @function
vListInitialiseItem:
.LFB7:
	.loc 1 90 1
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
	.loc 1 94 25
	lw	a5,-20(s0)
	sw	zero,16(a5)
	.loc 1 102 1
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
.LFE7:
	.size	vListInitialiseItem, .-vListInitialiseItem
	.align	2
	.globl	vListInsertEnd
	.type	vListInsertEnd, @function
vListInsertEnd:
.LFB8:
	.loc 1 107 1
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
	.loc 1 108 24
	lw	a5,-36(s0)
	lw	a5,4(a5)
	sw	a5,-20(s0)
	.loc 1 121 27
	lw	a5,-40(s0)
	lw	a4,-20(s0)
	sw	a4,4(a5)
	.loc 1 122 40
	lw	a5,-20(s0)
	lw	a4,8(a5)
	.loc 1 122 31
	lw	a5,-40(s0)
	sw	a4,8(a5)
	.loc 1 127 12
	lw	a5,-20(s0)
	lw	a5,8(a5)
	.loc 1 127 33
	lw	a4,-40(s0)
	sw	a4,4(a5)
	.loc 1 128 25
	lw	a5,-20(s0)
	lw	a4,-40(s0)
	sw	a4,8(a5)
	.loc 1 131 32
	lw	a5,-40(s0)
	lw	a4,-36(s0)
	sw	a4,16(a5)
	.loc 1 133 59
	lw	a5,-36(s0)
	lw	a5,0(a5)
	.loc 1 133 77
	addi	a4,a5,1
	.loc 1 133 33
	lw	a5,-36(s0)
	sw	a4,0(a5)
	.loc 1 136 1
	nop
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	vListInsertEnd, .-vListInsertEnd
	.align	2
	.globl	vListInsert
	.type	vListInsert, @function
vListInsert:
.LFB9:
	.loc 1 141 1
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
	.loc 1 143 22
	lw	a5,-40(s0)
	lw	a5,0(a5)
	sw	a5,-24(s0)
	.loc 1 161 7
	lw	a4,-24(s0)
	li	a5,-1
	bne	a4,a5,.L5
	.loc 1 163 20
	lw	a5,-36(s0)
	lw	a5,16(a5)
	sw	a5,-20(s0)
	j	.L6
.L5:
	.loc 1 192 25
	lw	a5,-36(s0)
	addi	a5,a5,8
	sw	a5,-20(s0)
	.loc 1 192 9
	j	.L7
.L8:
	.loc 1 192 131 discriminator 3
	lw	a5,-20(s0)
	lw	a5,4(a5)
	sw	a5,-20(s0)
.L7:
	.loc 1 192 77 discriminator 1
	lw	a5,-20(s0)
	lw	a5,4(a5)
	.loc 1 192 85 discriminator 1
	lw	a5,0(a5)
	.loc 1 192 98 discriminator 1
	lw	a4,-24(s0)
	bgeu	a4,a5,.L8
.L6:
	.loc 1 199 39
	lw	a5,-20(s0)
	lw	a4,4(a5)
	.loc 1 199 27
	lw	a5,-40(s0)
	sw	a4,4(a5)
	.loc 1 200 18
	lw	a5,-40(s0)
	lw	a5,4(a5)
	.loc 1 200 39
	lw	a4,-40(s0)
	sw	a4,8(a5)
	.loc 1 201 31
	lw	a5,-40(s0)
	lw	a4,-20(s0)
	sw	a4,8(a5)
	.loc 1 202 24
	lw	a5,-20(s0)
	lw	a4,-40(s0)
	sw	a4,4(a5)
	.loc 1 206 32
	lw	a5,-40(s0)
	lw	a4,-36(s0)
	sw	a4,16(a5)
	.loc 1 208 59
	lw	a5,-36(s0)
	lw	a5,0(a5)
	.loc 1 208 77
	addi	a4,a5,1
	.loc 1 208 33
	lw	a5,-36(s0)
	sw	a4,0(a5)
	.loc 1 211 1
	nop
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE9:
	.size	vListInsert, .-vListInsert
	.align	2
	.globl	uxListRemove
	.type	uxListRemove, @function
uxListRemove:
.LFB10:
	.loc 1 216 1
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
	.loc 1 219 20
	lw	a5,-36(s0)
	lw	a5,16(a5)
	sw	a5,-20(s0)
	.loc 1 223 19
	lw	a5,-36(s0)
	lw	a5,4(a5)
	.loc 1 223 56
	lw	a4,-36(s0)
	lw	a4,8(a4)
	.loc 1 223 40
	sw	a4,8(a5)
	.loc 1 224 19
	lw	a5,-36(s0)
	lw	a5,8(a5)
	.loc 1 224 56
	lw	a4,-36(s0)
	lw	a4,4(a4)
	.loc 1 224 40
	sw	a4,4(a5)
	.loc 1 230 15
	lw	a5,-20(s0)
	lw	a5,4(a5)
	.loc 1 230 7
	lw	a4,-36(s0)
	bne	a4,a5,.L10
	.loc 1 232 41
	lw	a5,-36(s0)
	lw	a4,8(a5)
	.loc 1 232 25
	lw	a5,-20(s0)
	sw	a4,4(a5)
.L10:
	.loc 1 239 33
	lw	a5,-36(s0)
	sw	zero,16(a5)
	.loc 1 240 59
	lw	a5,-20(s0)
	lw	a5,0(a5)
	.loc 1 240 77
	addi	a4,a5,-1
	.loc 1 240 33
	lw	a5,-20(s0)
	sw	a4,0(a5)
	.loc 1 244 18
	lw	a5,-20(s0)
	lw	a5,0(a5)
	.loc 1 245 1
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
.LFE10:
	.size	uxListRemove, .-uxListRemove
.Letext0:
	.file 2 "/opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/14.2.0/include/stdint-gcc.h"
	.file 3 "FreeRTOS-Kernel/portable/GCC/RISC-V/portmacro.h"
	.file 4 "FreeRTOS-Kernel/include/list.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x296
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0xa
	.4byte	.LASF39
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF3
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF5
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF8
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0xc
	.byte	0x4
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.uleb128 0x1
	.byte	0x10
	.byte	0x4
	.4byte	.LASF12
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x2
	.byte	0x34
	.byte	0x19
	.4byte	0x26
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x3
	.byte	0x43
	.byte	0x1a
	.4byte	0x7c
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x3
	.byte	0x44
	.byte	0x1a
	.4byte	0x7c
	.uleb128 0x7
	.4byte	0x94
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x14
	.byte	0x90
	.byte	0x8
	.4byte	0xee
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x93
	.byte	0x24
	.4byte	0x94
	.byte	0
	.uleb128 0x2
	.4byte	.LASF17
	.byte	0x94
	.byte	0x2d
	.4byte	0xee
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF18
	.byte	0x95
	.byte	0x2d
	.4byte	0xee
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF19
	.byte	0x96
	.byte	0xc
	.4byte	0x6c
	.byte	0xc
	.uleb128 0x2
	.4byte	.LASF20
	.byte	0x97
	.byte	0x28
	.4byte	0x124
	.byte	0x10
	.byte	0
	.uleb128 0x5
	.4byte	0xa5
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x14
	.byte	0xac
	.byte	0x10
	.4byte	0x124
	.uleb128 0x2
	.4byte	.LASF23
	.byte	0xaf
	.byte	0x25
	.4byte	0x88
	.byte	0
	.uleb128 0x2
	.4byte	.LASF24
	.byte	0xb0
	.byte	0x26
	.4byte	0x172
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF25
	.byte	0xb1
	.byte	0x14
	.4byte	0x166
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.4byte	0xf3
	.uleb128 0x4
	.4byte	.LASF26
	.byte	0x4
	.byte	0x9a
	.byte	0x1b
	.4byte	0xa5
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0xc
	.byte	0x9d
	.byte	0xc
	.4byte	0x166
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0xa0
	.byte	0x28
	.4byte	0x94
	.byte	0
	.uleb128 0x2
	.4byte	.LASF17
	.byte	0xa1
	.byte	0x31
	.4byte	0xee
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF18
	.byte	0xa2
	.byte	0x31
	.4byte	0xee
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.4byte	.LASF28
	.byte	0x4
	.byte	0xa4
	.byte	0x24
	.4byte	0x135
	.uleb128 0x5
	.4byte	0x129
	.uleb128 0x7
	.4byte	0x172
	.uleb128 0x4
	.4byte	.LASF29
	.byte	0x4
	.byte	0xb3
	.byte	0x3
	.4byte	0xf3
	.uleb128 0xd
	.4byte	.LASF40
	.byte	0x1
	.byte	0xd7
	.byte	0xd
	.4byte	0x88
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1bf
	.uleb128 0x3
	.4byte	.LASF30
	.byte	0xd7
	.byte	0x2e
	.4byte	0x177
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x6
	.4byte	.LASF31
	.byte	0xdb
	.byte	0x14
	.4byte	0x1c4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x5
	.4byte	0x17c
	.uleb128 0x7
	.4byte	0x1bf
	.uleb128 0x9
	.4byte	.LASF35
	.byte	0x8b
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x216
	.uleb128 0x3
	.4byte	.LASF31
	.byte	0x8b
	.byte	0x22
	.4byte	0x1c4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x8c
	.byte	0x26
	.4byte	0x177
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x6
	.4byte	.LASF33
	.byte	0x8e
	.byte	0x12
	.4byte	0x172
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x6
	.4byte	.LASF34
	.byte	0x8f
	.byte	0x16
	.4byte	0xa0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x9
	.4byte	.LASF36
	.byte	0x69
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x255
	.uleb128 0x3
	.4byte	.LASF31
	.byte	0x69
	.byte	0x25
	.4byte	0x1c4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x6a
	.byte	0x29
	.4byte	0x177
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x6
	.4byte	.LASF24
	.byte	0x6c
	.byte	0x18
	.4byte	0x177
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x9
	.4byte	.LASF37
	.byte	0x59
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x278
	.uleb128 0x3
	.4byte	.LASF38
	.byte	0x59
	.byte	0x2e
	.4byte	0x177
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xe
	.4byte	.LASF41
	.byte	0x1
	.byte	0x31
	.byte	0x6
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF31
	.byte	0x31
	.byte	0x26
	.4byte	0x1c4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x2
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x5
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
.LASF20:
	.string	"pvContainer"
.LASF15:
	.string	"TickType_t"
.LASF28:
	.string	"MiniListItem_t"
.LASF16:
	.string	"xItemValue"
.LASF25:
	.string	"xListEnd"
.LASF19:
	.string	"pvOwner"
.LASF21:
	.string	"xLIST_ITEM"
.LASF5:
	.string	"unsigned char"
.LASF7:
	.string	"long unsigned int"
.LASF30:
	.string	"pxItemToRemove"
.LASF6:
	.string	"short unsigned int"
.LASF37:
	.string	"vListInitialiseItem"
.LASF29:
	.string	"List_t"
.LASF23:
	.string	"uxNumberOfItems"
.LASF36:
	.string	"vListInsertEnd"
.LASF17:
	.string	"pxNext"
.LASF2:
	.string	"unsigned int"
.LASF41:
	.string	"vListInitialise"
.LASF39:
	.string	"GNU C17 14.2.0 -mabi=ilp32 -mtune=rocket -misa-spec=20191213 -mtls-dialect=trad -march=rv32i_zicsr -g -ffreestanding"
.LASF34:
	.string	"xValueOfInsertion"
.LASF10:
	.string	"long long unsigned int"
.LASF38:
	.string	"pxItem"
.LASF14:
	.string	"UBaseType_t"
.LASF26:
	.string	"ListItem_t"
.LASF4:
	.string	"long long int"
.LASF11:
	.string	"char"
.LASF33:
	.string	"pxIterator"
.LASF9:
	.string	"short int"
.LASF24:
	.string	"pxIndex"
.LASF18:
	.string	"pxPrevious"
.LASF13:
	.string	"uint32_t"
.LASF3:
	.string	"long int"
.LASF12:
	.string	"long double"
.LASF27:
	.string	"xMINI_LIST_ITEM"
.LASF8:
	.string	"signed char"
.LASF31:
	.string	"pxList"
.LASF22:
	.string	"xLIST"
.LASF40:
	.string	"uxListRemove"
.LASF32:
	.string	"pxNewListItem"
.LASF35:
	.string	"vListInsert"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/rur1k/FinalTapeout/FinalTapeout/C_Code"
.LASF0:
	.string	"FreeRTOS-Kernel/list.c"
	.ident	"GCC: () 14.2.0"
	.section	.note.GNU-stack,"",@progbits
