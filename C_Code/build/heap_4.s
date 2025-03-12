	.file	"heap_4.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.file 0 "/home/rur1k/FinalTapeout/FinalTapeout/C_Code" "FreeRTOS-Kernel/portable/MemMang/heap_4.c"
	.local	ucHeap
	.comm	ucHeap,1024,4
	.section	.srodata,"a"
	.align	2
	.type	xHeapStructSize, @object
	.size	xHeapStructSize, 4
xHeapStructSize:
	.word	16
	.local	xStart
	.comm	xStart,8,4
	.local	pxEnd
	.comm	pxEnd,4,4
	.local	xFreeBytesRemaining
	.comm	xFreeBytesRemaining,4,4
	.local	xMinimumEverFreeBytesRemaining
	.comm	xMinimumEverFreeBytesRemaining,4,4
	.local	xNumberOfSuccessfulAllocations
	.comm	xNumberOfSuccessfulAllocations,4,4
	.local	xNumberOfSuccessfulFrees
	.comm	xNumberOfSuccessfulFrees,4,4
	.text
	.align	2
	.globl	pvPortMalloc
	.type	pvPortMalloc, @function
pvPortMalloc:
.LFB6:
	.file 1 "FreeRTOS-Kernel/portable/MemMang/heap_4.c"
	.loc 1 174 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	ra,60(sp)
	sw	s0,56(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sw	a0,-52(s0)
	.loc 1 178 12
	sw	zero,-28(s0)
	.loc 1 181 7
	lw	a5,-52(s0)
	beq	a5,zero,.L2
	.loc 1 185 13
	li	a5,16
	not	a5,a5
	.loc 1 185 11
	lw	a4,-52(s0)
	bgtu	a4,a5,.L3
	.loc 1 187 25
	li	a5,16
	lw	a4,-52(s0)
	add	a5,a4,a5
	sw	a5,-52(s0)
	.loc 1 191 31
	lw	a5,-52(s0)
	andi	a5,a5,15
	.loc 1 191 15
	beq	a5,zero,.L2
	.loc 1 194 78
	lw	a5,-52(s0)
	andi	a5,a5,15
	.loc 1 194 41
	li	a4,16
	sub	a5,a4,a5
	sw	a5,-32(s0)
	.loc 1 196 21
	lw	a5,-32(s0)
	not	a5,a5
	.loc 1 196 19
	lw	a4,-52(s0)
	bgtu	a4,a5,.L4
	.loc 1 198 33
	lw	a4,-52(s0)
	lw	a5,-32(s0)
	add	a5,a4,a5
	sw	a5,-52(s0)
	j	.L2
.L4:
	.loc 1 202 33
	sw	zero,-52(s0)
	j	.L2
.L3:
	.loc 1 212 25
	sw	zero,-52(s0)
.L2:
	.loc 1 220 5
	call	vTaskSuspendAll
	.loc 1 224 19
	lui	a5,%hi(pxEnd)
	lw	a5,%lo(pxEnd)(a5)
	.loc 1 224 11
	bne	a5,zero,.L5
	.loc 1 226 13
	call	prvHeapInit
.L5:
	.loc 1 237 13
	lw	a5,-52(s0)
	.loc 1 237 11
	blt	a5,zero,.L6
	.loc 1 239 15
	lw	a5,-52(s0)
	beq	a5,zero,.L6
	.loc 1 239 54 discriminator 1
	lui	a5,%hi(xFreeBytesRemaining)
	lw	a5,%lo(xFreeBytesRemaining)(a5)
	.loc 1 239 37 discriminator 1
	lw	a4,-52(s0)
	bgtu	a4,a5,.L6
	.loc 1 243 33
	lui	a5,%hi(xStart)
	addi	a5,a5,%lo(xStart)
	sw	a5,-24(s0)
	.loc 1 244 25
	lui	a5,%hi(xStart)
	addi	a5,a5,%lo(xStart)
	lw	a5,0(a5)
	sw	a5,-20(s0)
	.loc 1 247 22
	j	.L7
.L9:
	.loc 1 249 37
	lw	a5,-20(s0)
	sw	a5,-24(s0)
	.loc 1 250 29
	lw	a5,-20(s0)
	lw	a5,0(a5)
	sw	a5,-20(s0)
.L7:
	.loc 1 247 33
	lw	a5,-20(s0)
	lw	a5,4(a5)
	.loc 1 247 62
	lw	a4,-52(s0)
	bleu	a4,a5,.L8
	.loc 1 247 74 discriminator 1
	lw	a5,-20(s0)
	lw	a5,0(a5)
	.loc 1 247 62 discriminator 1
	bne	a5,zero,.L9
.L8:
	.loc 1 256 29
	lui	a5,%hi(pxEnd)
	lw	a5,%lo(pxEnd)(a5)
	.loc 1 256 19
	lw	a4,-20(s0)
	beq	a4,a5,.L6
	.loc 1 260 61
	lw	a5,-24(s0)
	lw	a4,0(a5)
	.loc 1 260 32
	li	a5,16
	.loc 1 260 30
	add	a5,a4,a5
	sw	a5,-28(s0)
	.loc 1 265 63
	lw	a5,-20(s0)
	lw	a4,0(a5)
	.loc 1 265 54
	lw	a5,-24(s0)
	sw	a4,0(a5)
	.loc 1 271 34
	lw	a5,-20(s0)
	lw	a4,4(a5)
	.loc 1 271 47
	lw	a5,-52(s0)
	sub	a4,a4,a5
	.loc 1 271 65
	li	a5,16
	slli	a5,a5,1
	.loc 1 271 23
	bleu	a4,a5,.L10
	.loc 1 277 40
	lw	a4,-20(s0)
	lw	a5,-52(s0)
	add	a5,a4,a5
	sw	a5,-36(s0)
	.loc 1 282 61
	lw	a5,-20(s0)
	lw	a4,4(a5)
	.loc 1 282 74
	lw	a5,-52(s0)
	sub	a4,a4,a5
	.loc 1 282 52
	lw	a5,-36(s0)
	sw	a4,4(a5)
	.loc 1 283 45
	lw	a5,-20(s0)
	lw	a4,-52(s0)
	sw	a4,4(a5)
	.loc 1 286 74
	lw	a5,-24(s0)
	lw	a4,0(a5)
	.loc 1 286 57
	lw	a5,-36(s0)
	sw	a4,0(a5)
	.loc 1 287 58
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	sw	a4,0(a5)
.L10:
	.loc 1 294 41
	lui	a5,%hi(xFreeBytesRemaining)
	lw	a4,%lo(xFreeBytesRemaining)(a5)
	.loc 1 294 51
	lw	a5,-20(s0)
	lw	a5,4(a5)
	.loc 1 294 41
	sub	a4,a4,a5
	lui	a5,%hi(xFreeBytesRemaining)
	sw	a4,%lo(xFreeBytesRemaining)(a5)
	.loc 1 296 45
	lui	a5,%hi(xFreeBytesRemaining)
	lw	a4,%lo(xFreeBytesRemaining)(a5)
	lui	a5,%hi(xMinimumEverFreeBytesRemaining)
	lw	a5,%lo(xMinimumEverFreeBytesRemaining)(a5)
	.loc 1 296 23
	bgeu	a4,a5,.L11
	.loc 1 298 56
	lui	a5,%hi(xFreeBytesRemaining)
	lw	a4,%lo(xFreeBytesRemaining)(a5)
	lui	a5,%hi(xMinimumEverFreeBytesRemaining)
	sw	a4,%lo(xMinimumEverFreeBytesRemaining)(a5)
.L11:
	.loc 1 307 21
	lw	a5,-20(s0)
	lw	a4,4(a5)
	li	a5,-2147483648
	or	a4,a4,a5
	lw	a5,-20(s0)
	sw	a4,4(a5)
	.loc 1 308 46
	lw	a5,-20(s0)
	sw	zero,0(a5)
	.loc 1 309 51
	lui	a5,%hi(xNumberOfSuccessfulAllocations)
	lw	a5,%lo(xNumberOfSuccessfulAllocations)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xNumberOfSuccessfulAllocations)
	sw	a4,%lo(xNumberOfSuccessfulAllocations)(a5)
.L6:
	.loc 1 328 14
	call	xTaskResumeAll
	.loc 1 344 12
	lw	a5,-28(s0)
	.loc 1 345 1
	mv	a0,a5
	lw	ra,60(sp)
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	pvPortMalloc, .-pvPortMalloc
	.align	2
	.globl	vPortFree
	.type	vPortFree, @function
vPortFree:
.LFB7:
	.loc 1 349 1
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
	.loc 1 350 15
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	.loc 1 353 7
	lw	a5,-36(s0)
	beq	a5,zero,.L15
	.loc 1 357 13
	li	a5,16
	neg	a5,a5
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	.loc 1 360 16
	lw	a5,-20(s0)
	sw	a5,-24(s0)
	.loc 1 366 13
	lw	a5,-24(s0)
	lw	a5,4(a5)
	.loc 1 366 11
	bge	a5,zero,.L15
	.loc 1 368 23
	lw	a5,-24(s0)
	lw	a5,0(a5)
	.loc 1 368 15
	bne	a5,zero,.L15
	.loc 1 372 17
	lw	a5,-24(s0)
	lw	a4,4(a5)
	li	a5,-2147483648
	addi	a5,a5,-1
	and	a4,a4,a5
	lw	a5,-24(s0)
	sw	a4,4(a5)
	.loc 1 384 17
	call	vTaskSuspendAll
	.loc 1 387 50
	lw	a5,-24(s0)
	lw	a4,4(a5)
	.loc 1 387 41
	lui	a5,%hi(xFreeBytesRemaining)
	lw	a5,%lo(xFreeBytesRemaining)(a5)
	add	a4,a4,a5
	lui	a5,%hi(xFreeBytesRemaining)
	sw	a4,%lo(xFreeBytesRemaining)(a5)
	.loc 1 389 21
	lw	a0,-24(s0)
	call	prvInsertBlockIntoFreeList
	.loc 1 390 45
	lui	a5,%hi(xNumberOfSuccessfulFrees)
	lw	a5,%lo(xNumberOfSuccessfulFrees)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xNumberOfSuccessfulFrees)
	sw	a4,%lo(xNumberOfSuccessfulFrees)(a5)
	.loc 1 392 26
	call	xTaskResumeAll
.L15:
	.loc 1 404 1
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
.LFE7:
	.size	vPortFree, .-vPortFree
	.align	2
	.globl	xPortGetFreeHeapSize
	.type	xPortGetFreeHeapSize, @function
xPortGetFreeHeapSize:
.LFB8:
	.loc 1 408 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 409 12
	lui	a5,%hi(xFreeBytesRemaining)
	lw	a5,%lo(xFreeBytesRemaining)(a5)
	.loc 1 410 1
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
.LFE8:
	.size	xPortGetFreeHeapSize, .-xPortGetFreeHeapSize
	.align	2
	.globl	xPortGetMinimumEverFreeHeapSize
	.type	xPortGetMinimumEverFreeHeapSize, @function
xPortGetMinimumEverFreeHeapSize:
.LFB9:
	.loc 1 414 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 415 12
	lui	a5,%hi(xMinimumEverFreeBytesRemaining)
	lw	a5,%lo(xMinimumEverFreeBytesRemaining)(a5)
	.loc 1 416 1
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
.LFE9:
	.size	xPortGetMinimumEverFreeHeapSize, .-xPortGetMinimumEverFreeHeapSize
	.align	2
	.globl	vPortInitialiseBlocks
	.type	vPortInitialiseBlocks, @function
vPortInitialiseBlocks:
.LFB10:
	.loc 1 420 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 422 1
	nop
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	vPortInitialiseBlocks, .-vPortInitialiseBlocks
	.align	2
	.globl	pvPortCalloc
	.type	pvPortCalloc, @function
pvPortCalloc:
.LFB11:
	.loc 1 427 1
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
	.loc 1 428 12
	sw	zero,-20(s0)
	.loc 1 430 9
	lw	a5,-36(s0)
	beq	a5,zero,.L22
	.loc 1 430 9 is_stmt 0 discriminator 1
	lw	a1,-36(s0)
	li	a0,-1
	call	__udivsi3
	mv	a5,a0
	mv	a4,a5
	lw	a5,-40(s0)
	bleu	a5,a4,.L22
	.loc 1 430 9 discriminator 3
	li	a5,1
	.loc 1 430 9
	j	.L23
.L22:
	.loc 1 430 9 discriminator 4
	li	a5,0
.L23:
	.loc 1 430 7 is_stmt 1 discriminator 6
	bne	a5,zero,.L24
	.loc 1 432 14
	lw	a1,-40(s0)
	lw	a0,-36(s0)
	call	__mulsi3
	mv	a5,a0
	mv	a0,a5
	call	pvPortMalloc
	sw	a0,-20(s0)
	.loc 1 434 11
	lw	a5,-20(s0)
	beq	a5,zero,.L24
	.loc 1 436 22
	lw	a1,-40(s0)
	lw	a0,-36(s0)
	call	__mulsi3
	mv	a5,a0
	mv	a2,a5
	li	a1,0
	lw	a0,-20(s0)
	call	memset
.L24:
	.loc 1 440 12
	lw	a5,-20(s0)
	.loc 1 441 1
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
.LFE11:
	.size	pvPortCalloc, .-pvPortCalloc
	.align	2
	.type	prvHeapInit, @function
prvHeapInit:
.LFB12:
	.loc 1 445 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 448 12
	li	a5,1024
	sw	a5,-24(s0)
	.loc 1 451 20
	lui	a5,%hi(ucHeap)
	addi	a5,a5,%lo(ucHeap)
	sw	a5,-20(s0)
	.loc 1 453 26
	lw	a5,-20(s0)
	andi	a5,a5,15
	.loc 1 453 7
	beq	a5,zero,.L27
	.loc 1 455 24
	lw	a5,-20(s0)
	addi	a5,a5,15
	sw	a5,-20(s0)
	.loc 1 456 24
	lw	a5,-20(s0)
	andi	a5,a5,-16
	sw	a5,-20(s0)
	.loc 1 457 24
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	sub	a4,a4,a5
	lui	a5,%hi(ucHeap)
	addi	a5,a5,%lo(ucHeap)
	add	a5,a4,a5
	sw	a5,-24(s0)
.L27:
	.loc 1 468 30
	lw	a4,-20(s0)
	.loc 1 468 28
	lui	a5,%hi(xStart)
	addi	a5,a5,%lo(xStart)
	sw	a4,0(a5)
	.loc 1 469 23
	lui	a5,%hi(xStart)
	addi	a5,a5,%lo(xStart)
	sw	zero,4(a5)
	.loc 1 473 18
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	add	a5,a4,a5
	sw	a5,-28(s0)
	.loc 1 474 21
	li	a5,16
	.loc 1 474 18
	lw	a4,-28(s0)
	sub	a5,a4,a5
	sw	a5,-28(s0)
	.loc 1 475 18
	lw	a5,-28(s0)
	andi	a5,a5,-16
	sw	a5,-28(s0)
	.loc 1 476 13
	lw	a4,-28(s0)
	.loc 1 476 11
	lui	a5,%hi(pxEnd)
	sw	a4,%lo(pxEnd)(a5)
	.loc 1 477 10
	lui	a5,%hi(pxEnd)
	lw	a5,%lo(pxEnd)(a5)
	.loc 1 477 23
	sw	zero,4(a5)
	.loc 1 478 10
	lui	a5,%hi(pxEnd)
	lw	a5,%lo(pxEnd)(a5)
	.loc 1 478 28
	sw	zero,0(a5)
	.loc 1 482 22
	lw	a5,-20(s0)
	sw	a5,-32(s0)
	.loc 1 483 64
	lw	a5,-32(s0)
	.loc 1 483 62
	lw	a4,-28(s0)
	sub	a4,a4,a5
	.loc 1 483 34
	lw	a5,-32(s0)
	sw	a4,4(a5)
	.loc 1 484 39
	lui	a5,%hi(pxEnd)
	lw	a4,%lo(pxEnd)(a5)
	lw	a5,-32(s0)
	sw	a4,0(a5)
	.loc 1 487 54
	lw	a5,-32(s0)
	lw	a4,4(a5)
	.loc 1 487 36
	lui	a5,%hi(xMinimumEverFreeBytesRemaining)
	sw	a4,%lo(xMinimumEverFreeBytesRemaining)(a5)
	.loc 1 488 43
	lw	a5,-32(s0)
	lw	a4,4(a5)
	.loc 1 488 25
	lui	a5,%hi(xFreeBytesRemaining)
	sw	a4,%lo(xFreeBytesRemaining)(a5)
	.loc 1 489 1
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
.LFE12:
	.size	prvHeapInit, .-prvHeapInit
	.align	2
	.type	prvInsertBlockIntoFreeList, @function
prvInsertBlockIntoFreeList:
.LFB13:
	.loc 1 493 1
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
	.loc 1 499 21
	lui	a5,%hi(xStart)
	addi	a5,a5,%lo(xStart)
	sw	a5,-20(s0)
	.loc 1 499 5
	j	.L29
.L30:
	.loc 1 499 119 discriminator 3
	lw	a5,-20(s0)
	lw	a5,0(a5)
	sw	a5,-20(s0)
.L29:
	.loc 1 499 32 discriminator 1
	lw	a5,-20(s0)
	lw	a5,0(a5)
	.loc 1 499 89 discriminator 1
	lw	a4,-36(s0)
	bgtu	a4,a5,.L30
	.loc 1 511 9
	lw	a5,-20(s0)
	sw	a5,-24(s0)
	.loc 1 513 27
	lw	a5,-20(s0)
	lw	a5,4(a5)
	.loc 1 513 15
	lw	a4,-24(s0)
	add	a5,a4,a5
	.loc 1 513 7
	lw	a4,-36(s0)
	bne	a4,a5,.L31
	.loc 1 515 19
	lw	a5,-20(s0)
	lw	a4,4(a5)
	.loc 1 515 50
	lw	a5,-36(s0)
	lw	a5,4(a5)
	.loc 1 515 32
	add	a4,a4,a5
	lw	a5,-20(s0)
	sw	a4,4(a5)
	.loc 1 516 25
	lw	a5,-20(s0)
	sw	a5,-36(s0)
.L31:
	.loc 1 525 9
	lw	a5,-36(s0)
	sw	a5,-24(s0)
	.loc 1 527 32
	lw	a5,-36(s0)
	lw	a5,4(a5)
	.loc 1 527 15
	lw	a4,-24(s0)
	add	a4,a4,a5
	.loc 1 527 64
	lw	a5,-20(s0)
	lw	a5,0(a5)
	.loc 1 527 7
	bne	a4,a5,.L32
	.loc 1 529 13
	lw	a5,-20(s0)
	lw	a4,0(a5)
	.loc 1 529 70
	lui	a5,%hi(pxEnd)
	lw	a5,%lo(pxEnd)(a5)
	.loc 1 529 11
	beq	a4,a5,.L33
	.loc 1 532 28
	lw	a5,-36(s0)
	lw	a4,4(a5)
	.loc 1 532 44
	lw	a5,-20(s0)
	lw	a5,0(a5)
	.loc 1 532 100
	lw	a5,4(a5)
	.loc 1 532 41
	add	a4,a4,a5
	lw	a5,-36(s0)
	sw	a4,4(a5)
	.loc 1 533 48
	lw	a5,-20(s0)
	lw	a5,0(a5)
	.loc 1 533 104
	lw	a4,0(a5)
	.loc 1 533 46
	lw	a5,-36(s0)
	sw	a4,0(a5)
	j	.L34
.L33:
	.loc 1 537 46
	lui	a5,%hi(pxEnd)
	lw	a4,%lo(pxEnd)(a5)
	lw	a5,-36(s0)
	sw	a4,0(a5)
	j	.L34
.L32:
	.loc 1 542 54
	lw	a5,-20(s0)
	lw	a4,0(a5)
	.loc 1 542 42
	lw	a5,-36(s0)
	sw	a4,0(a5)
.L34:
	.loc 1 549 7
	lw	a4,-20(s0)
	lw	a5,-36(s0)
	beq	a4,a5,.L36
	.loc 1 551 37
	lw	a5,-20(s0)
	lw	a4,-36(s0)
	sw	a4,0(a5)
.L36:
	.loc 1 557 1
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
.LFE13:
	.size	prvInsertBlockIntoFreeList, .-prvInsertBlockIntoFreeList
	.align	2
	.globl	vPortGetHeapStats
	.type	vPortGetHeapStats, @function
vPortGetHeapStats:
.LFB14:
	.loc 1 561 1
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
	.loc 1 563 12
	sw	zero,-24(s0)
	.loc 1 563 25
	sw	zero,-28(s0)
	.loc 1 563 39
	li	a5,-1
	sw	a5,-32(s0)
	.loc 1 565 5
	call	vTaskSuspendAll
	.loc 1 567 17
	lui	a5,%hi(xStart)
	addi	a5,a5,%lo(xStart)
	lw	a5,0(a5)
	sw	a5,-20(s0)
	.loc 1 571 11
	lw	a5,-20(s0)
	beq	a5,zero,.L38
	.loc 1 573 18
	j	.L39
.L42:
	.loc 1 577 24
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
	.loc 1 579 28
	lw	a5,-20(s0)
	lw	a5,4(a5)
	.loc 1 579 19
	lw	a4,-28(s0)
	bgeu	a4,a5,.L40
	.loc 1 581 30
	lw	a5,-20(s0)
	lw	a5,4(a5)
	sw	a5,-28(s0)
.L40:
	.loc 1 584 28
	lw	a5,-20(s0)
	lw	a5,4(a5)
	.loc 1 584 19
	lw	a4,-32(s0)
	bleu	a4,a5,.L41
	.loc 1 586 30
	lw	a5,-20(s0)
	lw	a5,4(a5)
	sw	a5,-32(s0)
.L41:
	.loc 1 591 25
	lw	a5,-20(s0)
	lw	a5,0(a5)
	sw	a5,-20(s0)
.L39:
	.loc 1 573 28
	lui	a5,%hi(pxEnd)
	lw	a5,%lo(pxEnd)(a5)
	lw	a4,-20(s0)
	bne	a4,a5,.L42
.L38:
	.loc 1 595 14
	call	xTaskResumeAll
	.loc 1 597 49
	lw	a5,-36(s0)
	lw	a4,-28(s0)
	sw	a4,4(a5)
	.loc 1 598 50
	lw	a5,-36(s0)
	lw	a4,-32(s0)
	sw	a4,8(a5)
	.loc 1 599 38
	lw	a5,-36(s0)
	lw	a4,-24(s0)
	sw	a4,12(a5)
	.loc 1 601 5
#APP
# 601 "FreeRTOS-Kernel/portable/MemMang/heap_4.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 603 49
	lui	a5,%hi(xFreeBytesRemaining)
	lw	a4,%lo(xFreeBytesRemaining)(a5)
	lw	a5,-36(s0)
	sw	a4,0(a5)
	.loc 1 604 53
	lui	a5,%hi(xNumberOfSuccessfulAllocations)
	lw	a4,%lo(xNumberOfSuccessfulAllocations)(a5)
	lw	a5,-36(s0)
	sw	a4,20(a5)
	.loc 1 605 47
	lui	a5,%hi(xNumberOfSuccessfulFrees)
	lw	a4,%lo(xNumberOfSuccessfulFrees)(a5)
	lw	a5,-36(s0)
	sw	a4,24(a5)
	.loc 1 606 53
	lui	a5,%hi(xMinimumEverFreeBytesRemaining)
	lw	a4,%lo(xMinimumEverFreeBytesRemaining)(a5)
	lw	a5,-36(s0)
	sw	a4,16(a5)
	.loc 1 608 5
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L44
	.loc 1 608 5 is_stmt 0 discriminator 1
#APP
# 608 "FreeRTOS-Kernel/portable/MemMang/heap_4.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L44:
	.loc 1 609 1 is_stmt 1
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
.LFE14:
	.size	vPortGetHeapStats, .-vPortGetHeapStats
	.align	2
	.globl	vPortHeapResetState
	.type	vPortHeapResetState, @function
vPortHeapResetState:
.LFB15:
	.loc 1 618 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 619 11
	lui	a5,%hi(pxEnd)
	sw	zero,%lo(pxEnd)(a5)
	.loc 1 621 25
	lui	a5,%hi(xFreeBytesRemaining)
	sw	zero,%lo(xFreeBytesRemaining)(a5)
	.loc 1 622 36
	lui	a5,%hi(xMinimumEverFreeBytesRemaining)
	sw	zero,%lo(xMinimumEverFreeBytesRemaining)(a5)
	.loc 1 623 36
	lui	a5,%hi(xNumberOfSuccessfulAllocations)
	sw	zero,%lo(xNumberOfSuccessfulAllocations)(a5)
	.loc 1 624 30
	lui	a5,%hi(xNumberOfSuccessfulFrees)
	sw	zero,%lo(xNumberOfSuccessfulFrees)(a5)
	.loc 1 625 1
	nop
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	vPortHeapResetState, .-vPortHeapResetState
.Letext0:
	.file 2 "/opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/14.2.0/include/stddef.h"
	.file 3 "/opt/riscv/sysroot/usr/include/bits/types.h"
	.file 4 "/opt/riscv/sysroot/usr/include/bits/stdint-intn.h"
	.file 5 "/opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/14.2.0/include/stdint-gcc.h"
	.file 6 "FreeRTOS-Kernel/portable/GCC/RISC-V/portmacro.h"
	.file 7 "FreeRTOS-Kernel/include/portable.h"
	.file 8 "/opt/riscv/sysroot/usr/include/string.h"
	.file 9 "FreeRTOS-Kernel/include/task.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x4a1
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0xf
	.4byte	.LASF66
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.4byte	0x37
	.uleb128 0x10
	.4byte	0x26
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x11
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF3
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
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0x29
	.byte	0x14
	.4byte	0x3e
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x12
	.byte	0x4
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x4
	.byte	0x1a
	.byte	0x13
	.4byte	0x76
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.4byte	.LASF15
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x5
	.byte	0x2e
	.byte	0x18
	.4byte	0x53
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x5
	.byte	0x34
	.byte	0x19
	.4byte	0x37
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x6
	.byte	0x42
	.byte	0x1a
	.4byte	0x92
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x6
	.byte	0x44
	.byte	0x1a
	.4byte	0xb1
	.uleb128 0x13
	.4byte	.LASF67
	.byte	0x6
	.byte	0x75
	.byte	0xf
	.4byte	0x26
	.uleb128 0x6
	.4byte	0xa5
	.uleb128 0xa
	.4byte	.LASF28
	.byte	0x1c
	.byte	0x7
	.byte	0x94
	.4byte	0x14e
	.uleb128 0x5
	.4byte	.LASF20
	.byte	0x7
	.byte	0x96
	.byte	0xc
	.4byte	0x26
	.byte	0
	.uleb128 0x5
	.4byte	.LASF21
	.byte	0x7
	.byte	0x97
	.byte	0xc
	.4byte	0x26
	.byte	0x4
	.uleb128 0x5
	.4byte	.LASF22
	.byte	0x7
	.byte	0x98
	.byte	0xc
	.4byte	0x26
	.byte	0x8
	.uleb128 0x5
	.4byte	.LASF23
	.byte	0x7
	.byte	0x99
	.byte	0xc
	.4byte	0x26
	.byte	0xc
	.uleb128 0x5
	.4byte	.LASF24
	.byte	0x7
	.byte	0x9a
	.byte	0xc
	.4byte	0x26
	.byte	0x10
	.uleb128 0x5
	.4byte	.LASF25
	.byte	0x7
	.byte	0x9b
	.byte	0xc
	.4byte	0x26
	.byte	0x14
	.uleb128 0x5
	.4byte	.LASF26
	.byte	0x7
	.byte	0x9c
	.byte	0xc
	.4byte	0x26
	.byte	0x18
	.byte	0
	.uleb128 0x4
	.4byte	.LASF27
	.byte	0x7
	.byte	0x9d
	.byte	0x3
	.4byte	0xe6
	.uleb128 0x14
	.4byte	0xa5
	.4byte	0x16b
	.uleb128 0x15
	.4byte	0x37
	.2byte	0x3ff
	.byte	0
	.uleb128 0x1
	.4byte	.LASF33
	.byte	0x5f
	.byte	0x24
	.4byte	0x15a
	.uleb128 0x5
	.byte	0x3
	.4byte	ucHeap
	.uleb128 0xa
	.4byte	.LASF29
	.byte	0x8
	.byte	0x1
	.byte	0x64
	.4byte	0x1a3
	.uleb128 0x5
	.4byte	.LASF30
	.byte	0x1
	.byte	0x66
	.byte	0x1b
	.4byte	0x1a3
	.byte	0
	.uleb128 0x5
	.4byte	.LASF31
	.byte	0x1
	.byte	0x67
	.byte	0xc
	.4byte	0x26
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.4byte	0x17c
	.uleb128 0x4
	.4byte	.LASF32
	.byte	0x1
	.byte	0x68
	.byte	0x3
	.4byte	0x17c
	.uleb128 0x1
	.4byte	.LASF34
	.byte	0x9e
	.byte	0x15
	.4byte	0x32
	.uleb128 0x5
	.byte	0x3
	.4byte	xHeapStructSize
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0xa1
	.byte	0x24
	.4byte	0x1a8
	.uleb128 0x5
	.byte	0x3
	.4byte	xStart
	.uleb128 0x1
	.4byte	.LASF36
	.byte	0xa2
	.byte	0x26
	.4byte	0x1e7
	.uleb128 0x5
	.byte	0x3
	.4byte	pxEnd
	.uleb128 0x6
	.4byte	0x1a8
	.uleb128 0x1
	.4byte	.LASF37
	.byte	0xa6
	.byte	0x1f
	.4byte	0x26
	.uleb128 0x5
	.byte	0x3
	.4byte	xFreeBytesRemaining
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0xa7
	.byte	0x1f
	.4byte	0x26
	.uleb128 0x5
	.byte	0x3
	.4byte	xMinimumEverFreeBytesRemaining
	.uleb128 0x1
	.4byte	.LASF25
	.byte	0xa8
	.byte	0x1f
	.4byte	0x26
	.uleb128 0x5
	.byte	0x3
	.4byte	xNumberOfSuccessfulAllocations
	.uleb128 0x1
	.4byte	.LASF26
	.byte	0xa9
	.byte	0x1f
	.4byte	0x26
	.uleb128 0x5
	.byte	0x3
	.4byte	xNumberOfSuccessfulFrees
	.uleb128 0x16
	.4byte	.LASF68
	.byte	0x8
	.byte	0x3d
	.byte	0xe
	.4byte	0x89
	.4byte	0x250
	.uleb128 0x8
	.4byte	0x89
	.uleb128 0x8
	.4byte	0x3e
	.uleb128 0x8
	.4byte	0x26
	.byte	0
	.uleb128 0x17
	.4byte	.LASF69
	.byte	0x9
	.2byte	0x693
	.byte	0xc
	.4byte	0xbd
	.uleb128 0x18
	.4byte	.LASF70
	.byte	0x9
	.2byte	0x65b
	.byte	0x6
	.uleb128 0xb
	.4byte	.LASF53
	.2byte	0x269
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF57
	.2byte	0x230
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2d8
	.uleb128 0x7
	.4byte	.LASF42
	.2byte	0x230
	.byte	0x27
	.4byte	0x2d8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x3
	.4byte	.LASF38
	.2byte	0x232
	.byte	0x13
	.4byte	0x1e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x3
	.4byte	.LASF39
	.2byte	0x233
	.byte	0xc
	.4byte	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x3
	.4byte	.LASF40
	.2byte	0x233
	.byte	0x19
	.4byte	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x3
	.4byte	.LASF41
	.2byte	0x233
	.byte	0x27
	.4byte	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x6
	.4byte	0x14e
	.uleb128 0xd
	.4byte	.LASF45
	.2byte	0x1ec
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x320
	.uleb128 0x7
	.4byte	.LASF43
	.2byte	0x1ec
	.byte	0x37
	.4byte	0x1e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x3
	.4byte	.LASF44
	.2byte	0x1ee
	.byte	0x13
	.4byte	0x1e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.string	"puc"
	.2byte	0x1ef
	.byte	0xf
	.4byte	0xe1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xd
	.4byte	.LASF46
	.2byte	0x1bc
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x372
	.uleb128 0x3
	.4byte	.LASF47
	.2byte	0x1be
	.byte	0x13
	.4byte	0x1e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.4byte	.LASF48
	.2byte	0x1bf
	.byte	0x1b
	.4byte	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x3
	.4byte	.LASF49
	.2byte	0x1bf
	.byte	0x2b
	.4byte	0xb1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x3
	.4byte	.LASF50
	.2byte	0x1c0
	.byte	0xc
	.4byte	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x19
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x1a9
	.byte	0x8
	.4byte	0x89
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3ba
	.uleb128 0x7
	.4byte	.LASF51
	.2byte	0x1a9
	.byte	0x1d
	.4byte	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x7
	.4byte	.LASF52
	.2byte	0x1aa
	.byte	0x1d
	.4byte	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x9
	.string	"pv"
	.2byte	0x1ac
	.byte	0xc
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xb
	.4byte	.LASF54
	.2byte	0x1a3
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF55
	.2byte	0x19d
	.4byte	0x26
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF56
	.2byte	0x197
	.4byte	0x26
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF58
	.2byte	0x15c
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x438
	.uleb128 0x1a
	.string	"pv"
	.byte	0x1
	.2byte	0x15c
	.byte	0x18
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x9
	.string	"puc"
	.2byte	0x15e
	.byte	0xf
	.4byte	0xe1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x3
	.4byte	.LASF59
	.2byte	0x15f
	.byte	0x13
	.4byte	0x1e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF60
	.byte	0x1
	.byte	0xad
	.byte	0x8
	.4byte	0x89
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1c
	.4byte	.LASF61
	.byte	0x1
	.byte	0xad
	.byte	0x1d
	.4byte	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1
	.4byte	.LASF38
	.byte	0xaf
	.byte	0x13
	.4byte	0x1e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF62
	.byte	0xb0
	.byte	0x13
	.4byte	0x1e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.4byte	.LASF63
	.byte	0xb1
	.byte	0x13
	.4byte	0x1e7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF64
	.byte	0xb2
	.byte	0xc
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1
	.4byte	.LASF65
	.byte	0xb3
	.byte	0xc
	.4byte	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x5
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
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0x5
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
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 13
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
	.uleb128 0xe
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 8
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.byte	0
	.byte	0
	.uleb128 0x1c
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
.LASF62:
	.string	"pxPreviousBlock"
.LASF42:
	.string	"pxHeapStats"
.LASF24:
	.string	"xMinimumEverFreeBytesRemaining"
.LASF27:
	.string	"HeapStats_t"
.LASF30:
	.string	"pxNextFreeBlock"
.LASF38:
	.string	"pxBlock"
.LASF10:
	.string	"size_t"
.LASF41:
	.string	"xMinSize"
.LASF23:
	.string	"xNumberOfFreeBlocks"
.LASF36:
	.string	"pxEnd"
.LASF9:
	.string	"short int"
.LASF45:
	.string	"prvInsertBlockIntoFreeList"
.LASF16:
	.string	"uint8_t"
.LASF29:
	.string	"A_BLOCK_LINK"
.LASF48:
	.string	"uxStartAddress"
.LASF22:
	.string	"xSizeOfSmallestFreeBlockInBytes"
.LASF4:
	.string	"long long int"
.LASF19:
	.string	"TickType_t"
.LASF68:
	.string	"memset"
.LASF3:
	.string	"long int"
.LASF49:
	.string	"uxEndAddress"
.LASF63:
	.string	"pxNewBlockLink"
.LASF56:
	.string	"xPortGetFreeHeapSize"
.LASF65:
	.string	"xAdditionalRequiredSize"
.LASF64:
	.string	"pvReturn"
.LASF53:
	.string	"vPortHeapResetState"
.LASF40:
	.string	"xMaxSize"
.LASF55:
	.string	"xPortGetMinimumEverFreeHeapSize"
.LASF32:
	.string	"BlockLink_t"
.LASF15:
	.string	"long double"
.LASF25:
	.string	"xNumberOfSuccessfulAllocations"
.LASF5:
	.string	"unsigned char"
.LASF20:
	.string	"xAvailableHeapSpaceInBytes"
.LASF34:
	.string	"xHeapStructSize"
.LASF8:
	.string	"signed char"
.LASF71:
	.string	"pvPortCalloc"
.LASF12:
	.string	"long long unsigned int"
.LASF17:
	.string	"uint32_t"
.LASF2:
	.string	"unsigned int"
.LASF18:
	.string	"BaseType_t"
.LASF37:
	.string	"xFreeBytesRemaining"
.LASF21:
	.string	"xSizeOfLargestFreeBlockInBytes"
.LASF69:
	.string	"xTaskResumeAll"
.LASF6:
	.string	"short unsigned int"
.LASF58:
	.string	"vPortFree"
.LASF44:
	.string	"pxIterator"
.LASF13:
	.string	"char"
.LASF14:
	.string	"int32_t"
.LASF46:
	.string	"prvHeapInit"
.LASF67:
	.string	"xCriticalNesting"
.LASF43:
	.string	"pxBlockToInsert"
.LASF66:
	.string	"GNU C17 14.2.0 -mabi=ilp32 -mtune=rocket -misa-spec=20191213 -mtls-dialect=trad -march=rv32i_zicsr -g -ffreestanding"
.LASF7:
	.string	"long unsigned int"
.LASF50:
	.string	"xTotalHeapSize"
.LASF26:
	.string	"xNumberOfSuccessfulFrees"
.LASF31:
	.string	"xBlockSize"
.LASF11:
	.string	"__int32_t"
.LASF35:
	.string	"xStart"
.LASF39:
	.string	"xBlocks"
.LASF51:
	.string	"xNum"
.LASF47:
	.string	"pxFirstFreeBlock"
.LASF61:
	.string	"xWantedSize"
.LASF54:
	.string	"vPortInitialiseBlocks"
.LASF28:
	.string	"xHeapStats"
.LASF60:
	.string	"pvPortMalloc"
.LASF70:
	.string	"vTaskSuspendAll"
.LASF57:
	.string	"vPortGetHeapStats"
.LASF59:
	.string	"pxLink"
.LASF52:
	.string	"xSize"
.LASF33:
	.string	"ucHeap"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/rur1k/FinalTapeout/FinalTapeout/C_Code"
.LASF0:
	.string	"FreeRTOS-Kernel/portable/MemMang/heap_4.c"
	.globl	__mulsi3
	.globl	__udivsi3
	.ident	"GCC: () 14.2.0"
	.section	.note.GNU-stack,"",@progbits
