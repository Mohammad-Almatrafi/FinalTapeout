	.file	"port.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.file 0 "/home/rur1k/FinalTapeout/FinalTapeout/C_Code" "FreeRTOS-Kernel/portable/GCC/RISC-V/port.c"
	.local	xISRStack
	.comm	xISRStack,2000,16
	.globl	xISRStackTop
	.section	.srodata,"a"
	.align	2
	.type	xISRStackTop, @object
	.size	xISRStackTop, 4
xISRStackTop:
	.word	xISRStack+1984
	.globl	ullNextTime
	.section	.sbss,"aw",@nobits
	.align	3
	.type	ullNextTime, @object
	.size	ullNextTime, 8
ullNextTime:
	.zero	8
	.globl	pullNextTime
	.section	.sdata,"aw"
	.align	2
	.type	pullNextTime, @object
	.size	pullNextTime, 4
pullNextTime:
	.word	ullNextTime
	.globl	uxTimerIncrementsForOneTick
	.section	.srodata
	.align	2
	.type	uxTimerIncrementsForOneTick, @object
	.size	uxTimerIncrementsForOneTick, 4
uxTimerIncrementsForOneTick:
	.word	250000
	.globl	ullMachineTimerCompareRegisterBase
	.align	2
	.type	ullMachineTimerCompareRegisterBase, @object
	.size	ullMachineTimerCompareRegisterBase, 4
ullMachineTimerCompareRegisterBase:
	.word	536873984
	.globl	pullMachineTimerCompareRegister
	.section	.sbss
	.align	2
	.type	pullMachineTimerCompareRegister, @object
	.size	pullMachineTimerCompareRegister, 4
pullMachineTimerCompareRegister:
	.zero	4
	.globl	xCriticalNesting
	.section	.sdata
	.align	2
	.type	xCriticalNesting, @object
	.size	xCriticalNesting, 4
xCriticalNesting:
	.word	-1431655766
	.globl	pxCriticalNesting
	.align	2
	.type	pxCriticalNesting, @object
	.size	pxCriticalNesting, 4
pxCriticalNesting:
	.word	xCriticalNesting
	.globl	xTaskReturnAddress
	.section	.sbss
	.align	2
	.type	xTaskReturnAddress, @object
	.size	xTaskReturnAddress, 4
xTaskReturnAddress:
	.zero	4
	.text
	.align	2
	.weak	vPortSetupTimerInterrupt
	.type	vPortSetupTimerInterrupt, @function
vPortSetupTimerInterrupt:
.LFB0:
	.file 1 "FreeRTOS-Kernel/portable/GCC/RISC-V/port.c"
	.loc 1 131 5
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 1 133 35
	li	t5,536875008
	addi	t5,t5,-1012
	sw	t5,-20(s0)
	.loc 1 134 35
	li	t5,536875008
	addi	t5,t5,-1016
	sw	t5,-24(s0)
	.loc 1 137 9
#APP
# 137 "FreeRTOS-Kernel/portable/GCC/RISC-V/port.c" 1
	csrr t5, mhartid
# 0 "" 2
#NO_APP
	sw	t5,-36(s0)
	.loc 1 139 117
	lw	t5,-36(s0)
	slli	t6,t5,3
	.loc 1 139 104
	li	t5,536875008
	addi	t5,t5,-1024
	add	t5,t6,t5
	.loc 1 139 43
	mv	t6,t5
	.loc 1 139 41
	lui	t5,%hi(pullMachineTimerCompareRegister)
	sw	t6,%lo(pullMachineTimerCompareRegister)(t5)
.L2:
	.loc 1 143 31
	lw	t5,-20(s0)
	lw	t5,0(t5)
	sw	t5,-28(s0)
	.loc 1 144 30
	lw	t5,-24(s0)
	lw	t5,0(t5)
	sw	t5,-32(s0)
	.loc 1 145 39 discriminator 1
	lw	t5,-20(s0)
	lw	t5,0(t5)
	.loc 1 145 36 discriminator 1
	lw	t6,-28(s0)
	bne	t6,t5,.L2
	.loc 1 147 23
	lw	t5,-28(s0)
	mv	t3,t5
	li	t4,0
	.loc 1 147 21
	lui	t5,%hi(ullNextTime)
	sw	t3,%lo(ullNextTime)(t5)
	sw	t4,%lo(ullNextTime+4)(t5)
	.loc 1 148 21
	lui	t3,%hi(ullNextTime)
	lw	t4,%lo(ullNextTime+4)(t3)
	lw	t3,%lo(ullNextTime)(t3)
	slli	t2,t3,0
	li	t1,0
	lui	t3,%hi(ullNextTime)
	sw	t1,%lo(ullNextTime)(t3)
	sw	t2,%lo(ullNextTime+4)(t3)
	.loc 1 149 24
	lw	t1,-32(s0)
	mv	a4,t1
	li	a5,0
	.loc 1 149 21
	lui	t1,%hi(ullNextTime)
	lw	t2,%lo(ullNextTime+4)(t1)
	lw	t1,%lo(ullNextTime)(t1)
	or	a6,a4,t1
	or	a7,a5,t2
	lui	a5,%hi(ullNextTime)
	sw	a6,%lo(ullNextTime)(a5)
	sw	a7,%lo(ullNextTime+4)(a5)
	.loc 1 150 24
	li	a5,249856
	addi	a5,a5,144
	mv	a0,a5
	li	a1,0
	.loc 1 150 21
	lui	a5,%hi(ullNextTime)
	lw	a6,%lo(ullNextTime)(a5)
	lw	a7,%lo(ullNextTime+4)(a5)
	add	a4,a0,a6
	mv	t1,a4
	sltu	t1,t1,a0
	add	a5,a1,a7
	add	a1,t1,a5
	mv	a5,a1
	lui	a1,%hi(ullNextTime)
	sw	a4,%lo(ullNextTime)(a1)
	sw	a5,%lo(ullNextTime+4)(a1)
	.loc 1 151 9
	lui	a5,%hi(pullMachineTimerCompareRegister)
	lw	a1,%lo(pullMachineTimerCompareRegister)(a5)
	.loc 1 151 42
	lui	a5,%hi(ullNextTime)
	lw	a4,%lo(ullNextTime)(a5)
	lw	a5,%lo(ullNextTime+4)(a5)
	sw	a4,0(a1)
	sw	a5,4(a1)
	.loc 1 154 24
	li	a5,249856
	addi	a5,a5,144
	mv	a2,a5
	li	a3,0
	.loc 1 154 21
	lui	a5,%hi(ullNextTime)
	lw	a0,%lo(ullNextTime)(a5)
	lw	a1,%lo(ullNextTime+4)(a5)
	add	a4,a2,a0
	mv	a6,a4
	sltu	a6,a6,a2
	add	a5,a3,a1
	add	a3,a6,a5
	mv	a5,a3
	lui	a3,%hi(ullNextTime)
	sw	a4,%lo(ullNextTime)(a3)
	sw	a5,%lo(ullNextTime+4)(a3)
	.loc 1 155 5
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
.LFE0:
	.size	vPortSetupTimerInterrupt, .-vPortSetupTimerInterrupt
	.align	2
	.globl	xPortStartScheduler
	.type	xPortStartScheduler, @function
xPortStartScheduler:
.LFB1:
	.loc 1 161 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 182 5
	call	vPortSetupTimerInterrupt
	.loc 1 189 9
	li	a5,4096
	addi	a5,a5,-1920
#APP
# 189 "FreeRTOS-Kernel/portable/GCC/RISC-V/port.c" 1
	csrs mie, a5
# 0 "" 2
	.loc 1 193 5
#NO_APP
	call	xPortStartFirstTask
	.loc 1 197 12
	li	a5,0
	.loc 1 198 1
	mv	a0,a5
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	xPortStartScheduler, .-xPortStartScheduler
	.align	2
	.globl	vPortEndScheduler
	.type	vPortEndScheduler, @function
vPortEndScheduler:
.LFB2:
	.loc 1 202 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
.L6:
	.loc 1 204 5
	nop
	j	.L6
	.cfi_endproc
.LFE2:
	.size	vPortEndScheduler, .-vPortEndScheduler
.Letext0:
	.file 2 "/opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/14.2.0/include/stddef.h"
	.file 3 "/opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/14.2.0/include/stdint-gcc.h"
	.file 4 "FreeRTOS-Kernel/portable/GCC/RISC-V/portmacro.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x244
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.4byte	0x3e
	.uleb128 0x4
	.4byte	0x2d
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF3
	.uleb128 0x1
	.byte	0x10
	.byte	0x4
	.4byte	.LASF4
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF5
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x3
	.byte	0x28
	.byte	0x18
	.4byte	0x26
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x34
	.byte	0x19
	.4byte	0x3e
	.uleb128 0x4
	.4byte	0x7b
	.uleb128 0x7
	.4byte	0x7b
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x37
	.byte	0x19
	.4byte	0xa7
	.uleb128 0x4
	.4byte	0x91
	.uleb128 0x7
	.4byte	0x91
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x4
	.byte	0x41
	.byte	0x1a
	.4byte	0x7b
	.uleb128 0x4
	.4byte	0xae
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x4
	.byte	0x42
	.byte	0x1a
	.4byte	0x61
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x4
	.byte	0x75
	.byte	0xf
	.4byte	0x2d
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF16
	.uleb128 0xc
	.4byte	0xae
	.4byte	0xef
	.uleb128 0xd
	.4byte	0x3e
	.2byte	0x1f3
	.byte	0
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x1
	.byte	0x44
	.byte	0x37
	.4byte	0xde
	.byte	0x10
	.uleb128 0x5
	.byte	0x3
	.4byte	xISRStack
	.uleb128 0x2
	.4byte	.LASF19
	.byte	0x45
	.byte	0x13
	.4byte	0xba
	.uleb128 0x5
	.byte	0x3
	.4byte	xISRStackTop
	.uleb128 0x2
	.4byte	.LASF20
	.byte	0x5a
	.byte	0xa
	.4byte	0x91
	.uleb128 0x5
	.byte	0x3
	.4byte	ullNextTime
	.uleb128 0x2
	.4byte	.LASF21
	.byte	0x5b
	.byte	0x12
	.4byte	0x135
	.uleb128 0x5
	.byte	0x3
	.4byte	pullNextTime
	.uleb128 0x6
	.4byte	0x9d
	.uleb128 0x2
	.4byte	.LASF22
	.byte	0x5c
	.byte	0xe
	.4byte	0x39
	.uleb128 0x5
	.byte	0x3
	.4byte	uxTimerIncrementsForOneTick
	.uleb128 0x2
	.4byte	.LASF23
	.byte	0x5d
	.byte	0x10
	.4byte	0x87
	.uleb128 0x5
	.byte	0x3
	.4byte	ullMachineTimerCompareRegisterBase
	.uleb128 0x2
	.4byte	.LASF24
	.byte	0x5e
	.byte	0x15
	.4byte	0x16d
	.uleb128 0x5
	.byte	0x3
	.4byte	pullMachineTimerCompareRegister
	.uleb128 0x6
	.4byte	0xa2
	.uleb128 0xf
	.4byte	0xcb
	.byte	0x1
	.byte	0x62
	.byte	0x8
	.uleb128 0x5
	.byte	0x3
	.4byte	xCriticalNesting
	.uleb128 0x2
	.4byte	.LASF25
	.byte	0x63
	.byte	0xa
	.4byte	0x191
	.uleb128 0x5
	.byte	0x3
	.4byte	pxCriticalNesting
	.uleb128 0x6
	.4byte	0x2d
	.uleb128 0x2
	.4byte	.LASF26
	.byte	0x66
	.byte	0x8
	.4byte	0x2d
	.uleb128 0x5
	.byte	0x3
	.4byte	xTaskReturnAddress
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0xa2
	.uleb128 0x10
	.4byte	.LASF34
	.byte	0x1
	.byte	0xc9
	.byte	0x6
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF35
	.byte	0x1
	.byte	0xa0
	.byte	0xc
	.4byte	0xbf
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e0
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0xa2
	.byte	0
	.uleb128 0x12
	.4byte	.LASF36
	.byte	0x1
	.byte	0x82
	.byte	0xa
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x23d
	.uleb128 0x5
	.4byte	.LASF28
	.byte	0x84
	.byte	0x12
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x5
	.4byte	.LASF29
	.byte	0x84
	.byte	0x25
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x5
	.4byte	.LASF30
	.byte	0x85
	.byte	0x23
	.4byte	0x242
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x5
	.4byte	.LASF31
	.byte	0x86
	.byte	0x23
	.4byte	0x242
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x5
	.4byte	.LASF32
	.byte	0x87
	.byte	0x1b
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x6
	.4byte	0x8c
	.uleb128 0x4
	.4byte	0x23d
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0
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
	.sleb128 17
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x34
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
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
	.uleb128 0x88
	.uleb128 0xb
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x11
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
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x1
	.uleb128 0x13
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
	.string	"ullNextTime"
.LASF7:
	.string	"size_t"
.LASF17:
	.string	"xCriticalNesting"
.LASF32:
	.string	"ulHartId"
.LASF12:
	.string	"uint64_t"
.LASF33:
	.string	"GNU C17 14.2.0 -mabi=ilp32 -mtune=rocket -misa-spec=20191213 -mtls-dialect=trad -march=rv32i_zicsr -g -ffreestanding"
.LASF8:
	.string	"int32_t"
.LASF31:
	.string	"pulTimeLow"
.LASF26:
	.string	"xTaskReturnAddress"
.LASF18:
	.string	"xISRStack"
.LASF22:
	.string	"uxTimerIncrementsForOneTick"
.LASF25:
	.string	"pxCriticalNesting"
.LASF10:
	.string	"short unsigned int"
.LASF9:
	.string	"unsigned char"
.LASF21:
	.string	"pullNextTime"
.LASF28:
	.string	"ulCurrentTimeHigh"
.LASF36:
	.string	"vPortSetupTimerInterrupt"
.LASF34:
	.string	"vPortEndScheduler"
.LASF27:
	.string	"xPortStartFirstTask"
.LASF2:
	.string	"unsigned int"
.LASF30:
	.string	"pulTimeHigh"
.LASF13:
	.string	"long long unsigned int"
.LASF19:
	.string	"xISRStackTop"
.LASF23:
	.string	"ullMachineTimerCompareRegisterBase"
.LASF29:
	.string	"ulCurrentTimeLow"
.LASF3:
	.string	"long long int"
.LASF16:
	.string	"char"
.LASF14:
	.string	"StackType_t"
.LASF6:
	.string	"short int"
.LASF24:
	.string	"pullMachineTimerCompareRegister"
.LASF11:
	.string	"uint32_t"
.LASF4:
	.string	"long double"
.LASF5:
	.string	"signed char"
.LASF35:
	.string	"xPortStartScheduler"
.LASF15:
	.string	"BaseType_t"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/rur1k/FinalTapeout/FinalTapeout/C_Code"
.LASF0:
	.string	"FreeRTOS-Kernel/portable/GCC/RISC-V/port.c"
	.ident	"GCC: () 14.2.0"
	.section	.note.GNU-stack,"",@progbits
