	.file	"queue.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.file 0 "/home/rur1k/FinalTapeout/FinalTapeout/C_Code" "FreeRTOS-Kernel/queue.c"
	.align	2
	.globl	xQueueGenericReset
	.type	xQueueGenericReset, @function
xQueueGenericReset:
.LFB6:
	.file 1 "FreeRTOS-Kernel/queue.c"
	.loc 1 305 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	.loc 1 306 16
	li	a5,1
	sw	a5,-36(s0)
	.loc 1 307 21
	lw	a5,-52(s0)
	sw	a5,-40(s0)
	.loc 1 313 7
	lw	a5,-40(s0)
	beq	a5,zero,.L2
	.loc 1 314 18
	lw	a5,-40(s0)
	lw	a5,60(a5)
	.loc 1 313 29 discriminator 1
	beq	a5,zero,.L2
	.loc 1 316 54
	lw	a5,-40(s0)
	lw	s1,64(a5)
	.loc 1 316 31
	lw	a5,-40(s0)
	lw	s2,60(a5)
	.loc 1 316 44
	li	s4,0
	srli	a3,s1,16
	srli	a5,s2,16
	slli	a4,a3,16
	srli	a4,a4,16
	bne	a4,zero,.L5
	slli	a4,a5,16
	srli	a4,a4,16
	bne	a4,zero,.L6
	slli	a5,s1,16
	srli	a5,a5,16
	slli	a4,s2,16
	srli	a4,a4,16
	mv	a1,a4
	mv	a0,a5
	call	__mulsi3
	j	.L3
.L6:
	mv	s5,a5
	mv	s6,s1
	j	.L7
.L5:
	slli	a5,a5,16
	srli	a5,a5,16
	bne	a5,zero,.L8
	mv	s5,a3
	mv	s6,s2
.L7:
	slli	a5,s1,16
	srli	a5,a5,16
	slli	a4,s2,16
	srli	a4,a4,16
	mv	a1,a4
	mv	a0,a5
	call	__mulsi3
	mv	s3,a0
	slli	a5,s6,16
	srli	a5,a5,16
	slli	a4,s5,16
	srli	a4,a4,16
	mv	a1,a4
	mv	a0,a5
	call	__mulsi3
	mv	a5,a0
	srli	a4,s3,16
	add	a5,a5,a4
	srai	a5,a5,16
	slli	a5,a5,16
	srli	a5,a5,16
	bne	a5,zero,.L9
	j	.L3
.L8:
	mv	a1,s2
	mv	a0,s1
	call	__mulsi3
.L9:
	mv	a1,s2
	mv	a0,s1
	call	__mulsi3
	li	s4,1
.L3:
	.loc 1 316 44 is_stmt 0 discriminator 1
	mv	a5,s4
	.loc 1 314 37 is_stmt 1
	bne	a5,zero,.L2
	.loc 1 318 9
#APP
# 318 "FreeRTOS-Kernel/queue.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 320 47
	lw	a5,-40(s0)
	lw	s1,0(a5)
	.loc 1 320 67
	lw	a5,-40(s0)
	lw	a4,60(a5)
	.loc 1 320 87
	lw	a5,-40(s0)
	lw	a5,64(a5)
	.loc 1 320 78
	mv	a1,a5
	mv	a0,a4
	call	__mulsi3
	mv	a5,a0
	.loc 1 320 56
	add	a4,s1,a5
	.loc 1 320 38
	lw	a5,-40(s0)
	sw	a4,8(a5)
	.loc 1 321 40
	lw	a5,-40(s0)
	sw	zero,56(a5)
	.loc 1 322 41
	lw	a5,-40(s0)
	lw	a4,0(a5)
	.loc 1 322 32
	lw	a5,-40(s0)
	sw	a4,4(a5)
	.loc 1 323 51
	lw	a5,-40(s0)
	lw	s1,0(a5)
	.loc 1 323 73
	lw	a5,-40(s0)
	lw	a5,60(a5)
	.loc 1 323 84
	addi	a4,a5,-1
	.loc 1 323 100
	lw	a5,-40(s0)
	lw	a5,64(a5)
	.loc 1 323 91
	mv	a1,a5
	mv	a0,a4
	call	__mulsi3
	mv	a5,a0
	.loc 1 323 60
	add	a4,s1,a5
	.loc 1 323 42
	lw	a5,-40(s0)
	sw	a4,12(a5)
	.loc 1 324 30
	lw	a5,-40(s0)
	li	a4,-1
	sb	a4,68(a5)
	.loc 1 325 30
	lw	a5,-40(s0)
	li	a4,-1
	sb	a4,69(a5)
	.loc 1 327 15
	lw	a5,-56(s0)
	bne	a5,zero,.L10
	.loc 1 334 21
	lw	a5,-40(s0)
	lw	a5,16(a5)
	.loc 1 334 19
	beq	a5,zero,.L11
	.loc 1 336 51
	lw	a5,-40(s0)
	addi	a5,a5,16
	.loc 1 336 25
	mv	a0,a5
	call	xTaskRemoveFromEventList
	j	.L11
.L10:
	.loc 1 353 17
	lw	a5,-40(s0)
	addi	a5,a5,16
	mv	a0,a5
	call	vListInitialise
	.loc 1 354 17
	lw	a5,-40(s0)
	addi	a5,a5,36
	mv	a0,a5
	call	vListInitialise
.L11:
	.loc 1 357 9
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L13
	.loc 1 357 9 is_stmt 0 discriminator 1
#APP
# 357 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
	.loc 1 357 9
#NO_APP
	j	.L13
.L2:
	.loc 1 361 17 is_stmt 1
	sw	zero,-36(s0)
.L13:
	.loc 1 370 12
	lw	a5,-36(s0)
	.loc 1 371 1
	mv	a0,a5
	lw	ra,60(sp)
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	lw	s1,52(sp)
	.cfi_restore 9
	lw	s2,48(sp)
	.cfi_restore 18
	lw	s3,44(sp)
	.cfi_restore 19
	lw	s4,40(sp)
	.cfi_restore 20
	lw	s5,36(sp)
	.cfi_restore 21
	lw	s6,32(sp)
	.cfi_restore 22
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	xQueueGenericReset, .-xQueueGenericReset
	.align	2
	.globl	xQueueGenericCreate
	.type	xQueueGenericCreate, @function
xQueueGenericCreate:
.LFB7:
	.loc 1 505 5
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	mv	a5,a2
	sb	a5,-57(s0)
	.loc 1 506 19
	sw	zero,-36(s0)
	.loc 1 512 11
	lw	a5,-52(s0)
	beq	a5,zero,.L16
	.loc 1 514 44
	li	s2,0
	lw	a5,-56(s0)
	srli	a1,a5,16
	lw	a4,-56(s0)
	lw	a5,-52(s0)
	srli	a3,a5,16
	lw	a5,-52(s0)
	slli	a2,a1,16
	srli	a2,a2,16
	bne	a2,zero,.L19
	slli	a2,a3,16
	srli	a2,a2,16
	bne	a2,zero,.L20
	slli	a4,a4,16
	srli	a4,a4,16
	slli	a5,a5,16
	srli	a5,a5,16
	mv	a1,a5
	mv	a0,a4
	call	__mulsi3
	j	.L17
.L20:
	mv	s3,a3
	mv	s4,a4
	j	.L21
.L19:
	slli	a3,a3,16
	srli	a3,a3,16
	bne	a3,zero,.L22
	mv	s3,a1
	mv	s4,a5
.L21:
	slli	a4,a4,16
	srli	a4,a4,16
	slli	a5,a5,16
	srli	a5,a5,16
	mv	a1,a5
	mv	a0,a4
	call	__mulsi3
	mv	s1,a0
	slli	a5,s4,16
	srli	a5,a5,16
	slli	a4,s3,16
	srli	a4,a4,16
	mv	a1,a4
	mv	a0,a5
	call	__mulsi3
	mv	a5,a0
	srli	a4,s1,16
	add	a5,a5,a4
	srai	a5,a5,16
	slli	a5,a5,16
	srli	a5,a5,16
	bne	a5,zero,.L23
	j	.L17
.L22:
	lw	a1,-52(s0)
	lw	a0,-56(s0)
	call	__mulsi3
.L23:
	lw	a1,-52(s0)
	lw	a0,-56(s0)
	call	__mulsi3
	li	s2,1
.L17:
	.loc 1 514 44 is_stmt 0 discriminator 1
	mv	a5,s2
	.loc 1 512 51 is_stmt 1 discriminator 1
	bne	a5,zero,.L16
	.loc 1 516 83
	lw	a1,-56(s0)
	lw	a0,-52(s0)
	call	__mulsi3
	mv	a5,a0
	mv	a4,a5
	.loc 1 514 60
	li	a5,-73
	bgtu	a4,a5,.L16
	.loc 1 521 31
	lw	a1,-56(s0)
	lw	a0,-52(s0)
	call	__mulsi3
	mv	a5,a0
	sw	a5,-40(s0)
	.loc 1 526 40
	lw	a5,-40(s0)
	addi	a5,a5,72
	mv	a0,a5
	call	pvPortMalloc
	sw	a0,-36(s0)
	.loc 1 528 15
	lw	a5,-36(s0)
	beq	a5,zero,.L16
	.loc 1 532 33
	lw	a5,-36(s0)
	sw	a5,-44(s0)
	.loc 1 533 33
	lw	a5,-44(s0)
	addi	a5,a5,72
	sw	a5,-44(s0)
	.loc 1 544 17
	lbu	a5,-57(s0)
	lw	a4,-36(s0)
	mv	a3,a5
	lw	a2,-44(s0)
	lw	a1,-56(s0)
	lw	a0,-52(s0)
	call	prvInitialiseNewQueue
.L16:
	.loc 1 560 16
	lw	a5,-36(s0)
	.loc 1 561 5
	mv	a0,a5
	lw	ra,60(sp)
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	lw	s1,52(sp)
	.cfi_restore 9
	lw	s2,48(sp)
	.cfi_restore 18
	lw	s3,44(sp)
	.cfi_restore 19
	lw	s4,40(sp)
	.cfi_restore 20
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	xQueueGenericCreate, .-xQueueGenericCreate
	.align	2
	.type	prvInitialiseNewQueue, @function
prvInitialiseNewQueue:
.LFB8:
	.loc 1 571 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	sw	a2,-28(s0)
	mv	a5,a3
	sw	a4,-36(s0)
	sb	a5,-29(s0)
	.loc 1 576 7
	lw	a5,-24(s0)
	bne	a5,zero,.L26
	.loc 1 582 28
	lw	a5,-36(s0)
	lw	a4,-36(s0)
	sw	a4,0(a5)
	j	.L27
.L26:
	.loc 1 587 28
	lw	a5,-36(s0)
	lw	a4,-28(s0)
	sw	a4,0(a5)
.L27:
	.loc 1 592 26
	lw	a5,-36(s0)
	lw	a4,-20(s0)
	sw	a4,60(a5)
	.loc 1 593 28
	lw	a5,-36(s0)
	lw	a4,-24(s0)
	sw	a4,64(a5)
	.loc 1 594 14
	li	a1,1
	lw	a0,-36(s0)
	call	xQueueGenericReset
	.loc 1 609 1
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
	.size	prvInitialiseNewQueue, .-prvInitialiseNewQueue
	.align	2
	.globl	xQueueGenericSend
	.type	xQueueGenericSend, @function
xQueueGenericSend:
.LFB9:
	.loc 1 943 1
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
	sw	a1,-56(s0)
	sw	a2,-60(s0)
	sw	a3,-64(s0)
	.loc 1 944 16
	sw	zero,-20(s0)
	.loc 1 946 21
	lw	a5,-52(s0)
	sw	a5,-24(s0)
.L44:
	.loc 1 961 9
#APP
# 961 "FreeRTOS-Kernel/queue.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 967 26
	lw	a5,-24(s0)
	lw	a4,56(a5)
	.loc 1 967 55
	lw	a5,-24(s0)
	lw	a5,60(a5)
	.loc 1 967 15
	bltu	a4,a5,.L29
	.loc 1 967 68 discriminator 1
	lw	a4,-64(s0)
	li	a5,2
	bne	a4,a5,.L30
.L29:
	.loc 1 1033 38
	lw	a2,-64(s0)
	lw	a1,-56(s0)
	lw	a0,-24(s0)
	call	prvCopyDataToQueue
	sw	a0,-28(s0)
	.loc 1 1037 25
	lw	a5,-24(s0)
	lw	a5,36(a5)
	.loc 1 1037 23
	beq	a5,zero,.L31
	.loc 1 1039 55
	lw	a5,-24(s0)
	addi	a5,a5,36
	.loc 1 1039 29
	mv	a0,a5
	call	xTaskRemoveFromEventList
.L31:
	.loc 1 1067 17
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L32
	.loc 1 1067 17 is_stmt 0 discriminator 1
#APP
# 1067 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L32:
	.loc 1 1071 24 is_stmt 1
	li	a5,1
	j	.L45
.L30:
	.loc 1 1075 34
	lw	a5,-60(s0)
	.loc 1 1075 19
	bne	a5,zero,.L34
	.loc 1 1079 21
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L35
	.loc 1 1079 21 is_stmt 0 discriminator 1
#APP
# 1079 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L35:
	.loc 1 1086 28 is_stmt 1
	li	a5,0
	j	.L45
.L34:
	.loc 1 1088 24
	lw	a5,-20(s0)
	bne	a5,zero,.L36
	.loc 1 1092 21
	addi	a5,s0,-36
	mv	a0,a5
	call	vTaskInternalSetTimeOutState
	.loc 1 1093 35
	li	a5,1
	sw	a5,-20(s0)
.L36:
	.loc 1 1102 9
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L37
	.loc 1 1102 9 is_stmt 0 discriminator 1
#APP
# 1102 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L37:
	.loc 1 1107 9 is_stmt 1
	call	vTaskSuspendAll
	.loc 1 1108 9
#APP
# 1108 "FreeRTOS-Kernel/queue.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lw	a5,-24(s0)
	lbu	a5,68(a5)
	slli	a4,a5,24
	srai	a4,a4,24
	li	a5,-1
	bne	a4,a5,.L38
	.loc 1 1108 9 is_stmt 0 discriminator 1
	lw	a5,-24(s0)
	sb	zero,68(a5)
.L38:
	.loc 1 1108 9 discriminator 3
	lw	a5,-24(s0)
	lbu	a5,69(a5)
	slli	a4,a5,24
	srai	a4,a4,24
	li	a5,-1
	bne	a4,a5,.L39
	.loc 1 1108 9 discriminator 4
	lw	a5,-24(s0)
	sb	zero,69(a5)
.L39:
	.loc 1 1108 9 discriminator 6
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L40
	.loc 1 1108 9 discriminator 7
#APP
# 1108 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L40:
	.loc 1 1111 13 is_stmt 1
	addi	a4,s0,-60
	addi	a5,s0,-36
	mv	a1,a4
	mv	a0,a5
	call	xTaskCheckForTimeOut
	mv	a5,a0
	.loc 1 1111 11 discriminator 1
	bne	a5,zero,.L41
	.loc 1 1113 17
	lw	a0,-24(s0)
	call	prvIsQueueFull
	mv	a5,a0
	.loc 1 1113 15 discriminator 1
	beq	a5,zero,.L42
	.loc 1 1116 17
	lw	a5,-24(s0)
	addi	a5,a5,16
	lw	a4,-60(s0)
	mv	a1,a4
	mv	a0,a5
	call	vTaskPlaceOnEventList
	.loc 1 1123 17
	lw	a0,-24(s0)
	call	prvUnlockQueue
	.loc 1 1130 21
	call	xTaskResumeAll
	mv	a5,a0
	.loc 1 1130 19 discriminator 1
	bne	a5,zero,.L44
	.loc 1 1132 21
#APP
# 1132 "FreeRTOS-Kernel/queue.c" 1
	ecall
# 0 "" 2
#NO_APP
	j	.L44
.L42:
	.loc 1 1138 17
	lw	a0,-24(s0)
	call	prvUnlockQueue
	.loc 1 1139 26
	call	xTaskResumeAll
	j	.L44
.L41:
	.loc 1 1145 13
	lw	a0,-24(s0)
	call	prvUnlockQueue
	.loc 1 1146 22
	call	xTaskResumeAll
	.loc 1 1151 20
	li	a5,0
.L45:
	.loc 1 1154 1
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
.LFE9:
	.size	xQueueGenericSend, .-xQueueGenericSend
	.align	2
	.globl	xQueueGenericSendFromISR
	.type	xQueueGenericSendFromISR, @function
xQueueGenericSendFromISR:
.LFB10:
	.loc 1 1161 1
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
	sw	a1,-56(s0)
	sw	a2,-60(s0)
	sw	a3,-64(s0)
	.loc 1 1164 21
	lw	a5,-52(s0)
	sw	a5,-24(s0)
	.loc 1 1196 28
	sw	zero,-28(s0)
	.loc 1 1198 22
	lw	a5,-24(s0)
	lw	a4,56(a5)
	.loc 1 1198 51
	lw	a5,-24(s0)
	lw	a5,60(a5)
	.loc 1 1198 11
	bltu	a4,a5,.L47
	.loc 1 1198 64 discriminator 1
	lw	a4,-64(s0)
	li	a5,2
	bne	a4,a5,.L48
.L47:
.LBB2:
	.loc 1 1200 26
	lw	a5,-24(s0)
	lbu	a5,69(a5)
	sb	a5,-29(s0)
	.loc 1 1201 31
	lw	a5,-24(s0)
	lw	a5,56(a5)
	sw	a5,-36(s0)
	.loc 1 1210 22
	lw	a2,-64(s0)
	lw	a1,-56(s0)
	lw	a0,-24(s0)
	call	prvCopyDataToQueue
	.loc 1 1214 15
	lb	a4,-29(s0)
	li	a5,-1
	bne	a4,a5,.L49
	.loc 1 1276 25
	lw	a5,-24(s0)
	lw	a5,36(a5)
	.loc 1 1276 23
	beq	a5,zero,.L50
	.loc 1 1278 55
	lw	a5,-24(s0)
	addi	a5,a5,36
	.loc 1 1278 29
	mv	a0,a5
	call	xTaskRemoveFromEventList
	mv	a5,a0
	.loc 1 1278 27 discriminator 1
	beq	a5,zero,.L50
	.loc 1 1282 31
	lw	a5,-60(s0)
	beq	a5,zero,.L50
	.loc 1 1284 60
	lw	a5,-60(s0)
	li	a4,1
	sw	a4,0(a5)
	j	.L50
.L49:
.LBB3:
	.loc 1 1310 17
	call	uxTaskGetNumberOfTasks
	sw	a0,-40(s0)
	.loc 1 1310 17 is_stmt 0 discriminator 1
	lb	a5,-29(s0)
	lw	a4,-40(s0)
	bleu	a4,a5,.L50
	lbu	a5,-29(s0)
	addi	a5,a5,1
	andi	a5,a5,0xff
	slli	a4,a5,24
	srai	a4,a4,24
	lw	a5,-24(s0)
	sb	a4,69(a5)
.L50:
.LBE3:
	.loc 1 1313 21 is_stmt 1
	li	a5,1
	sw	a5,-20(s0)
.LBE2:
	.loc 1 1199 9
	j	.L51
.L48:
	.loc 1 1318 21
	sw	zero,-20(s0)
.L51:
	.loc 1 1325 12
	lw	a5,-20(s0)
	.loc 1 1326 1
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
.LFE10:
	.size	xQueueGenericSendFromISR, .-xQueueGenericSendFromISR
	.align	2
	.globl	xQueueGiveFromISR
	.type	xQueueGiveFromISR, @function
xQueueGiveFromISR:
.LFB11:
	.loc 1 1331 1
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
	sw	a1,-56(s0)
	.loc 1 1334 21
	lw	a5,-52(s0)
	sw	a5,-24(s0)
	.loc 1 1374 28
	sw	zero,-28(s0)
.LBB4:
	.loc 1 1376 27
	lw	a5,-24(s0)
	lw	a5,56(a5)
	sw	a5,-32(s0)
	.loc 1 1381 40
	lw	a5,-24(s0)
	lw	a5,60(a5)
	.loc 1 1381 11
	lw	a4,-32(s0)
	bgeu	a4,a5,.L54
.LBB5:
	.loc 1 1383 26
	lw	a5,-24(s0)
	lbu	a5,69(a5)
	sb	a5,-33(s0)
	.loc 1 1393 78
	lw	a5,-32(s0)
	addi	a4,a5,1
	.loc 1 1393 40
	lw	a5,-24(s0)
	sw	a4,56(a5)
	.loc 1 1397 15
	lb	a4,-33(s0)
	li	a5,-1
	bne	a4,a5,.L55
	.loc 1 1452 25
	lw	a5,-24(s0)
	lw	a5,36(a5)
	.loc 1 1452 23
	beq	a5,zero,.L56
	.loc 1 1454 55
	lw	a5,-24(s0)
	addi	a5,a5,36
	.loc 1 1454 29
	mv	a0,a5
	call	xTaskRemoveFromEventList
	mv	a5,a0
	.loc 1 1454 27 discriminator 1
	beq	a5,zero,.L56
	.loc 1 1458 31
	lw	a5,-56(s0)
	beq	a5,zero,.L56
	.loc 1 1460 60
	lw	a5,-56(s0)
	li	a4,1
	sw	a4,0(a5)
	j	.L56
.L55:
.LBB6:
	.loc 1 1483 17
	call	uxTaskGetNumberOfTasks
	sw	a0,-40(s0)
	.loc 1 1483 17 is_stmt 0 discriminator 1
	lb	a5,-33(s0)
	lw	a4,-40(s0)
	bleu	a4,a5,.L56
	lbu	a5,-33(s0)
	addi	a5,a5,1
	andi	a5,a5,0xff
	slli	a4,a5,24
	srai	a4,a4,24
	lw	a5,-24(s0)
	sb	a4,69(a5)
.L56:
.LBE6:
	.loc 1 1486 21 is_stmt 1
	li	a5,1
	sw	a5,-20(s0)
.LBE5:
	j	.L57
.L54:
	.loc 1 1491 21
	sw	zero,-20(s0)
.L57:
.LBE4:
	.loc 1 1498 12
	lw	a5,-20(s0)
	.loc 1 1499 1
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
.LFE11:
	.size	xQueueGiveFromISR, .-xQueueGiveFromISR
	.align	2
	.globl	xQueueReceive
	.type	xQueueReceive, @function
xQueueReceive:
.LFB12:
	.loc 1 1505 1
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
	sw	a1,-56(s0)
	sw	a2,-60(s0)
	.loc 1 1506 16
	sw	zero,-20(s0)
	.loc 1 1508 21
	lw	a5,-52(s0)
	sw	a5,-24(s0)
.L74:
	.loc 1 1528 9
#APP
# 1528 "FreeRTOS-Kernel/queue.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
.LBB7:
	.loc 1 1530 31
	lw	a5,-24(s0)
	lw	a5,56(a5)
	sw	a5,-28(s0)
	.loc 1 1534 15
	lw	a5,-28(s0)
	beq	a5,zero,.L60
	.loc 1 1537 17
	lw	a1,-56(s0)
	lw	a0,-24(s0)
	call	prvCopyDataFromQueue
	.loc 1 1539 82
	lw	a5,-28(s0)
	addi	a4,a5,-1
	.loc 1 1539 44
	lw	a5,-24(s0)
	sw	a4,56(a5)
	.loc 1 1544 21
	lw	a5,-24(s0)
	lw	a5,16(a5)
	.loc 1 1544 19
	beq	a5,zero,.L61
	.loc 1 1546 51
	lw	a5,-24(s0)
	addi	a5,a5,16
	.loc 1 1546 25
	mv	a0,a5
	call	xTaskRemoveFromEventList
.L61:
	.loc 1 1560 17
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L62
	.loc 1 1560 17 is_stmt 0 discriminator 1
#APP
# 1560 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L62:
	.loc 1 1564 24 is_stmt 1
	li	a5,1
	j	.L75
.L60:
	.loc 1 1568 34
	lw	a5,-60(s0)
	.loc 1 1568 19
	bne	a5,zero,.L64
	.loc 1 1572 21
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L65
	.loc 1 1572 21 is_stmt 0 discriminator 1
#APP
# 1572 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L65:
	.loc 1 1577 28 is_stmt 1
	li	a5,0
	j	.L75
.L64:
	.loc 1 1579 24
	lw	a5,-20(s0)
	bne	a5,zero,.L66
	.loc 1 1583 21
	addi	a5,s0,-36
	mv	a0,a5
	call	vTaskInternalSetTimeOutState
	.loc 1 1584 35
	li	a5,1
	sw	a5,-20(s0)
.L66:
.LBE7:
	.loc 1 1593 9
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L67
	.loc 1 1593 9 is_stmt 0 discriminator 1
#APP
# 1593 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L67:
	.loc 1 1598 9 is_stmt 1
	call	vTaskSuspendAll
	.loc 1 1599 9
#APP
# 1599 "FreeRTOS-Kernel/queue.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lw	a5,-24(s0)
	lbu	a5,68(a5)
	slli	a4,a5,24
	srai	a4,a4,24
	li	a5,-1
	bne	a4,a5,.L68
	.loc 1 1599 9 is_stmt 0 discriminator 1
	lw	a5,-24(s0)
	sb	zero,68(a5)
.L68:
	.loc 1 1599 9 discriminator 3
	lw	a5,-24(s0)
	lbu	a5,69(a5)
	slli	a4,a5,24
	srai	a4,a4,24
	li	a5,-1
	bne	a4,a5,.L69
	.loc 1 1599 9 discriminator 4
	lw	a5,-24(s0)
	sb	zero,69(a5)
.L69:
	.loc 1 1599 9 discriminator 6
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L70
	.loc 1 1599 9 discriminator 7
#APP
# 1599 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L70:
	.loc 1 1602 13 is_stmt 1
	addi	a4,s0,-60
	addi	a5,s0,-36
	mv	a1,a4
	mv	a0,a5
	call	xTaskCheckForTimeOut
	mv	a5,a0
	.loc 1 1602 11 discriminator 1
	bne	a5,zero,.L71
	.loc 1 1606 17
	lw	a0,-24(s0)
	call	prvIsQueueEmpty
	mv	a5,a0
	.loc 1 1606 15 discriminator 1
	beq	a5,zero,.L72
	.loc 1 1609 17
	lw	a5,-24(s0)
	addi	a5,a5,36
	lw	a4,-60(s0)
	mv	a1,a4
	mv	a0,a5
	call	vTaskPlaceOnEventList
	.loc 1 1610 17
	lw	a0,-24(s0)
	call	prvUnlockQueue
	.loc 1 1612 21
	call	xTaskResumeAll
	mv	a5,a0
	.loc 1 1612 19 discriminator 1
	bne	a5,zero,.L74
	.loc 1 1614 21
#APP
# 1614 "FreeRTOS-Kernel/queue.c" 1
	ecall
# 0 "" 2
#NO_APP
	j	.L74
.L72:
	.loc 1 1625 17
	lw	a0,-24(s0)
	call	prvUnlockQueue
	.loc 1 1626 26
	call	xTaskResumeAll
	j	.L74
.L71:
	.loc 1 1633 13
	lw	a0,-24(s0)
	call	prvUnlockQueue
	.loc 1 1634 22
	call	xTaskResumeAll
	.loc 1 1636 17
	lw	a0,-24(s0)
	call	prvIsQueueEmpty
	mv	a5,a0
	.loc 1 1636 15 discriminator 1
	beq	a5,zero,.L74
	.loc 1 1641 24
	li	a5,0
.L75:
	.loc 1 1649 1
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
.LFE12:
	.size	xQueueReceive, .-xQueueReceive
	.align	2
	.globl	xQueueSemaphoreTake
	.type	xQueueSemaphoreTake, @function
xQueueSemaphoreTake:
.LFB13:
	.loc 1 1654 1
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
	sw	a1,-56(s0)
	.loc 1 1655 16
	sw	zero,-20(s0)
	.loc 1 1657 21
	lw	a5,-52(s0)
	sw	a5,-24(s0)
.L91:
	.loc 1 1681 9
#APP
# 1681 "FreeRTOS-Kernel/queue.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
.LBB8:
	.loc 1 1685 31
	lw	a5,-24(s0)
	lw	a5,56(a5)
	sw	a5,-28(s0)
	.loc 1 1689 15
	lw	a5,-28(s0)
	beq	a5,zero,.L77
	.loc 1 1695 81
	lw	a5,-28(s0)
	addi	a4,a5,-1
	.loc 1 1695 44
	lw	a5,-24(s0)
	sw	a4,56(a5)
	.loc 1 1714 21
	lw	a5,-24(s0)
	lw	a5,16(a5)
	.loc 1 1714 19
	beq	a5,zero,.L78
	.loc 1 1716 51
	lw	a5,-24(s0)
	addi	a5,a5,16
	.loc 1 1716 25
	mv	a0,a5
	call	xTaskRemoveFromEventList
.L78:
	.loc 1 1730 17
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L79
	.loc 1 1730 17 is_stmt 0 discriminator 1
#APP
# 1730 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L79:
	.loc 1 1734 24 is_stmt 1
	li	a5,1
	j	.L92
.L77:
	.loc 1 1738 34
	lw	a5,-56(s0)
	.loc 1 1738 19
	bne	a5,zero,.L81
	.loc 1 1742 21
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L82
	.loc 1 1742 21 is_stmt 0 discriminator 1
#APP
# 1742 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L82:
	.loc 1 1747 28 is_stmt 1
	li	a5,0
	j	.L92
.L81:
	.loc 1 1749 24
	lw	a5,-20(s0)
	bne	a5,zero,.L83
	.loc 1 1753 21
	addi	a5,s0,-36
	mv	a0,a5
	call	vTaskInternalSetTimeOutState
	.loc 1 1754 35
	li	a5,1
	sw	a5,-20(s0)
.L83:
.LBE8:
	.loc 1 1763 9
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L84
	.loc 1 1763 9 is_stmt 0 discriminator 1
#APP
# 1763 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L84:
	.loc 1 1768 9 is_stmt 1
	call	vTaskSuspendAll
	.loc 1 1769 9
#APP
# 1769 "FreeRTOS-Kernel/queue.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lw	a5,-24(s0)
	lbu	a5,68(a5)
	slli	a4,a5,24
	srai	a4,a4,24
	li	a5,-1
	bne	a4,a5,.L85
	.loc 1 1769 9 is_stmt 0 discriminator 1
	lw	a5,-24(s0)
	sb	zero,68(a5)
.L85:
	.loc 1 1769 9 discriminator 3
	lw	a5,-24(s0)
	lbu	a5,69(a5)
	slli	a4,a5,24
	srai	a4,a4,24
	li	a5,-1
	bne	a4,a5,.L86
	.loc 1 1769 9 discriminator 4
	lw	a5,-24(s0)
	sb	zero,69(a5)
.L86:
	.loc 1 1769 9 discriminator 6
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L87
	.loc 1 1769 9 discriminator 7
#APP
# 1769 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L87:
	.loc 1 1772 13 is_stmt 1
	addi	a4,s0,-56
	addi	a5,s0,-36
	mv	a1,a4
	mv	a0,a5
	call	xTaskCheckForTimeOut
	mv	a5,a0
	.loc 1 1772 11 discriminator 1
	bne	a5,zero,.L88
	.loc 1 1778 17
	lw	a0,-24(s0)
	call	prvIsQueueEmpty
	mv	a5,a0
	.loc 1 1778 15 discriminator 1
	beq	a5,zero,.L89
	.loc 1 1799 17
	lw	a5,-24(s0)
	addi	a5,a5,36
	lw	a4,-56(s0)
	mv	a1,a4
	mv	a0,a5
	call	vTaskPlaceOnEventList
	.loc 1 1800 17
	lw	a0,-24(s0)
	call	prvUnlockQueue
	.loc 1 1802 21
	call	xTaskResumeAll
	mv	a5,a0
	.loc 1 1802 19 discriminator 1
	bne	a5,zero,.L91
	.loc 1 1804 21
#APP
# 1804 "FreeRTOS-Kernel/queue.c" 1
	ecall
# 0 "" 2
#NO_APP
	j	.L91
.L89:
	.loc 1 1815 17
	lw	a0,-24(s0)
	call	prvUnlockQueue
	.loc 1 1816 26
	call	xTaskResumeAll
	j	.L91
.L88:
	.loc 1 1822 13
	lw	a0,-24(s0)
	call	prvUnlockQueue
	.loc 1 1823 22
	call	xTaskResumeAll
	.loc 1 1829 17
	lw	a0,-24(s0)
	call	prvIsQueueEmpty
	mv	a5,a0
	.loc 1 1829 15 discriminator 1
	beq	a5,zero,.L91
	.loc 1 1866 24
	li	a5,0
.L92:
	.loc 1 1874 1
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
.LFE13:
	.size	xQueueSemaphoreTake, .-xQueueSemaphoreTake
	.align	2
	.globl	xQueuePeek
	.type	xQueuePeek, @function
xQueuePeek:
.LFB14:
	.loc 1 1880 1
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
	sw	a1,-56(s0)
	sw	a2,-60(s0)
	.loc 1 1881 16
	sw	zero,-20(s0)
	.loc 1 1884 21
	lw	a5,-52(s0)
	sw	a5,-24(s0)
.L108:
	.loc 1 1904 9
#APP
# 1904 "FreeRTOS-Kernel/queue.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
.LBB9:
	.loc 1 1906 31
	lw	a5,-24(s0)
	lw	a5,56(a5)
	sw	a5,-28(s0)
	.loc 1 1910 15
	lw	a5,-28(s0)
	beq	a5,zero,.L94
	.loc 1 1915 40
	lw	a5,-24(s0)
	lw	a5,12(a5)
	sw	a5,-32(s0)
	.loc 1 1917 17
	lw	a1,-56(s0)
	lw	a0,-24(s0)
	call	prvCopyDataFromQueue
	.loc 1 1921 46
	lw	a5,-24(s0)
	lw	a4,-32(s0)
	sw	a4,12(a5)
	.loc 1 1925 21
	lw	a5,-24(s0)
	lw	a5,36(a5)
	.loc 1 1925 19
	beq	a5,zero,.L95
	.loc 1 1927 51
	lw	a5,-24(s0)
	addi	a5,a5,36
	.loc 1 1927 25
	mv	a0,a5
	call	xTaskRemoveFromEventList
.L95:
	.loc 1 1942 17
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L96
	.loc 1 1942 17 is_stmt 0 discriminator 1
#APP
# 1942 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L96:
	.loc 1 1946 24 is_stmt 1
	li	a5,1
	j	.L109
.L94:
	.loc 1 1950 34
	lw	a5,-60(s0)
	.loc 1 1950 19
	bne	a5,zero,.L98
	.loc 1 1954 21
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L99
	.loc 1 1954 21 is_stmt 0 discriminator 1
#APP
# 1954 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L99:
	.loc 1 1959 28 is_stmt 1
	li	a5,0
	j	.L109
.L98:
	.loc 1 1961 24
	lw	a5,-20(s0)
	bne	a5,zero,.L100
	.loc 1 1966 21
	addi	a5,s0,-40
	mv	a0,a5
	call	vTaskInternalSetTimeOutState
	.loc 1 1967 35
	li	a5,1
	sw	a5,-20(s0)
.L100:
.LBE9:
	.loc 1 1976 9
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L101
	.loc 1 1976 9 is_stmt 0 discriminator 1
#APP
# 1976 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L101:
	.loc 1 1981 9 is_stmt 1
	call	vTaskSuspendAll
	.loc 1 1982 9
#APP
# 1982 "FreeRTOS-Kernel/queue.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lw	a5,-24(s0)
	lbu	a5,68(a5)
	slli	a4,a5,24
	srai	a4,a4,24
	li	a5,-1
	bne	a4,a5,.L102
	.loc 1 1982 9 is_stmt 0 discriminator 1
	lw	a5,-24(s0)
	sb	zero,68(a5)
.L102:
	.loc 1 1982 9 discriminator 3
	lw	a5,-24(s0)
	lbu	a5,69(a5)
	slli	a4,a5,24
	srai	a4,a4,24
	li	a5,-1
	bne	a4,a5,.L103
	.loc 1 1982 9 discriminator 4
	lw	a5,-24(s0)
	sb	zero,69(a5)
.L103:
	.loc 1 1982 9 discriminator 6
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L104
	.loc 1 1982 9 discriminator 7
#APP
# 1982 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L104:
	.loc 1 1985 13 is_stmt 1
	addi	a4,s0,-60
	addi	a5,s0,-40
	mv	a1,a4
	mv	a0,a5
	call	xTaskCheckForTimeOut
	mv	a5,a0
	.loc 1 1985 11 discriminator 1
	bne	a5,zero,.L105
	.loc 1 1989 17
	lw	a0,-24(s0)
	call	prvIsQueueEmpty
	mv	a5,a0
	.loc 1 1989 15 discriminator 1
	beq	a5,zero,.L106
	.loc 1 1992 17
	lw	a5,-24(s0)
	addi	a5,a5,36
	lw	a4,-60(s0)
	mv	a1,a4
	mv	a0,a5
	call	vTaskPlaceOnEventList
	.loc 1 1993 17
	lw	a0,-24(s0)
	call	prvUnlockQueue
	.loc 1 1995 21
	call	xTaskResumeAll
	mv	a5,a0
	.loc 1 1995 19 discriminator 1
	bne	a5,zero,.L108
	.loc 1 1997 21
#APP
# 1997 "FreeRTOS-Kernel/queue.c" 1
	ecall
# 0 "" 2
#NO_APP
	j	.L108
.L106:
	.loc 1 2008 17
	lw	a0,-24(s0)
	call	prvUnlockQueue
	.loc 1 2009 26
	call	xTaskResumeAll
	j	.L108
.L105:
	.loc 1 2016 13
	lw	a0,-24(s0)
	call	prvUnlockQueue
	.loc 1 2017 22
	call	xTaskResumeAll
	.loc 1 2019 17
	lw	a0,-24(s0)
	call	prvIsQueueEmpty
	mv	a5,a0
	.loc 1 2019 15 discriminator 1
	beq	a5,zero,.L108
	.loc 1 2024 24
	li	a5,0
.L109:
	.loc 1 2032 1
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
.LFE14:
	.size	xQueuePeek, .-xQueuePeek
	.align	2
	.globl	xQueueReceiveFromISR
	.type	xQueueReceiveFromISR, @function
xQueueReceiveFromISR:
.LFB15:
	.loc 1 2038 1
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
	sw	a1,-56(s0)
	sw	a2,-60(s0)
	.loc 1 2041 21
	lw	a5,-52(s0)
	sw	a5,-24(s0)
	.loc 1 2067 28
	sw	zero,-28(s0)
.LBB10:
	.loc 1 2069 27
	lw	a5,-24(s0)
	lw	a5,56(a5)
	sw	a5,-32(s0)
	.loc 1 2072 11
	lw	a5,-32(s0)
	beq	a5,zero,.L111
.LBB11:
	.loc 1 2074 26
	lw	a5,-24(s0)
	lbu	a5,68(a5)
	sb	a5,-33(s0)
	.loc 1 2078 13
	lw	a1,-56(s0)
	lw	a0,-24(s0)
	call	prvCopyDataFromQueue
	.loc 1 2079 78
	lw	a5,-32(s0)
	addi	a4,a5,-1
	.loc 1 2079 40
	lw	a5,-24(s0)
	sw	a4,56(a5)
	.loc 1 2085 15
	lb	a4,-33(s0)
	li	a5,-1
	bne	a4,a5,.L112
	.loc 1 2087 21
	lw	a5,-24(s0)
	lw	a5,16(a5)
	.loc 1 2087 19
	beq	a5,zero,.L113
	.loc 1 2089 51
	lw	a5,-24(s0)
	addi	a5,a5,16
	.loc 1 2089 25
	mv	a0,a5
	call	xTaskRemoveFromEventList
	mv	a5,a0
	.loc 1 2089 23 discriminator 1
	beq	a5,zero,.L113
	.loc 1 2093 27
	lw	a5,-60(s0)
	beq	a5,zero,.L113
	.loc 1 2095 56
	lw	a5,-60(s0)
	li	a4,1
	sw	a4,0(a5)
	j	.L113
.L112:
.LBB12:
	.loc 1 2116 17
	call	uxTaskGetNumberOfTasks
	sw	a0,-40(s0)
	.loc 1 2116 17 is_stmt 0 discriminator 1
	lb	a5,-33(s0)
	lw	a4,-40(s0)
	bleu	a4,a5,.L113
	lbu	a5,-33(s0)
	addi	a5,a5,1
	andi	a5,a5,0xff
	slli	a4,a5,24
	srai	a4,a4,24
	lw	a5,-24(s0)
	sb	a4,68(a5)
.L113:
.LBE12:
	.loc 1 2119 21 is_stmt 1
	li	a5,1
	sw	a5,-20(s0)
.LBE11:
	j	.L114
.L111:
	.loc 1 2123 21
	sw	zero,-20(s0)
.L114:
.LBE10:
	.loc 1 2131 12
	lw	a5,-20(s0)
	.loc 1 2132 1
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
.LFE15:
	.size	xQueueReceiveFromISR, .-xQueueReceiveFromISR
	.align	2
	.globl	xQueuePeekFromISR
	.type	xQueuePeekFromISR, @function
xQueuePeekFromISR:
.LFB16:
	.loc 1 2137 1
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
	.loc 1 2141 21
	lw	a5,-36(s0)
	sw	a5,-24(s0)
	.loc 1 2168 28
	sw	zero,-28(s0)
	.loc 1 2171 20
	lw	a5,-24(s0)
	lw	a5,56(a5)
	.loc 1 2171 11
	beq	a5,zero,.L117
	.loc 1 2177 36
	lw	a5,-24(s0)
	lw	a5,12(a5)
	sw	a5,-32(s0)
	.loc 1 2178 13
	lw	a1,-40(s0)
	lw	a0,-24(s0)
	call	prvCopyDataFromQueue
	.loc 1 2179 42
	lw	a5,-24(s0)
	lw	a4,-32(s0)
	sw	a4,12(a5)
	.loc 1 2181 21
	li	a5,1
	sw	a5,-20(s0)
	j	.L118
.L117:
	.loc 1 2185 21
	sw	zero,-20(s0)
.L118:
	.loc 1 2193 12
	lw	a5,-20(s0)
	.loc 1 2194 1
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
.LFE16:
	.size	xQueuePeekFromISR, .-xQueuePeekFromISR
	.align	2
	.globl	uxQueueMessagesWaiting
	.type	uxQueueMessagesWaiting, @function
uxQueueMessagesWaiting:
.LFB17:
	.loc 1 2198 1
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
	.loc 1 2205 5
#APP
# 2205 "FreeRTOS-Kernel/queue.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 2207 18
	lw	a5,-36(s0)
	lw	a5,56(a5)
	sw	a5,-20(s0)
	.loc 1 2209 5
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L121
	.loc 1 2209 5 is_stmt 0 discriminator 1
#APP
# 2209 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L121:
	.loc 1 2213 12 is_stmt 1
	lw	a5,-20(s0)
	.loc 1 2214 1
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
.LFE17:
	.size	uxQueueMessagesWaiting, .-uxQueueMessagesWaiting
	.align	2
	.globl	uxQueueSpacesAvailable
	.type	uxQueueSpacesAvailable, @function
uxQueueSpacesAvailable:
.LFB18:
	.loc 1 2218 1
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
	.loc 1 2220 21
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	.loc 1 2226 5
#APP
# 2226 "FreeRTOS-Kernel/queue.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 2228 45
	lw	a5,-20(s0)
	lw	a4,60(a5)
	.loc 1 2228 65
	lw	a5,-20(s0)
	lw	a5,56(a5)
	.loc 1 2228 18
	sub	a5,a4,a5
	sw	a5,-24(s0)
	.loc 1 2230 5
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L124
	.loc 1 2230 5 is_stmt 0 discriminator 1
#APP
# 2230 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L124:
	.loc 1 2234 12 is_stmt 1
	lw	a5,-24(s0)
	.loc 1 2235 1
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
.LFE18:
	.size	uxQueueSpacesAvailable, .-uxQueueSpacesAvailable
	.align	2
	.globl	uxQueueMessagesWaitingFromISR
	.type	uxQueueMessagesWaitingFromISR, @function
uxQueueMessagesWaitingFromISR:
.LFB19:
	.loc 1 2239 1
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
	.loc 1 2241 21
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	.loc 1 2246 14
	lw	a5,-20(s0)
	lw	a5,56(a5)
	sw	a5,-24(s0)
	.loc 1 2250 12
	lw	a5,-24(s0)
	.loc 1 2251 1
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
.LFE19:
	.size	uxQueueMessagesWaitingFromISR, .-uxQueueMessagesWaitingFromISR
	.align	2
	.globl	vQueueDelete
	.type	vQueueDelete, @function
vQueueDelete:
.LFB20:
	.loc 1 2255 1
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
	.loc 1 2256 21
	lw	a5,-36(s0)
	sw	a5,-20(s0)
	.loc 1 2273 9
	lw	a0,-20(s0)
	call	vPortFree
	.loc 1 2297 1
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
.LFE20:
	.size	vQueueDelete, .-vQueueDelete
	.align	2
	.globl	uxQueueGetQueueItemSize
	.type	uxQueueGetQueueItemSize, @function
uxQueueGetQueueItemSize:
.LFB21:
	.loc 1 2344 1
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
	.loc 1 2349 36
	lw	a5,-20(s0)
	lw	a5,64(a5)
	.loc 1 2350 1
	mv	a0,a5
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	uxQueueGetQueueItemSize, .-uxQueueGetQueueItemSize
	.align	2
	.globl	uxQueueGetQueueLength
	.type	uxQueueGetQueueLength, @function
uxQueueGetQueueLength:
.LFB22:
	.loc 1 2354 1
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
	.loc 1 2359 36
	lw	a5,-20(s0)
	lw	a5,60(a5)
	.loc 1 2360 1
	mv	a0,a5
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	uxQueueGetQueueLength, .-uxQueueGetQueueLength
	.align	2
	.type	prvCopyDataToQueue, @function
prvCopyDataToQueue:
.LFB23:
	.loc 1 2393 1
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
	.loc 1 2394 16
	sw	zero,-24(s0)
	.loc 1 2399 23
	lw	a5,-36(s0)
	lw	a5,56(a5)
	sw	a5,-20(s0)
	.loc 1 2401 16
	lw	a5,-36(s0)
	lw	a5,64(a5)
	.loc 1 2401 7
	beq	a5,zero,.L134
	.loc 1 2418 12
	lw	a5,-44(s0)
	bne	a5,zero,.L135
	.loc 1 2420 44
	lw	a5,-36(s0)
	lw	a4,4(a5)
	.loc 1 2420 90
	lw	a5,-36(s0)
	lw	a5,64(a5)
	.loc 1 2420 18
	mv	a2,a5
	lw	a1,-40(s0)
	mv	a0,a4
	call	memcpy
	.loc 1 2421 16
	lw	a5,-36(s0)
	lw	a4,4(a5)
	.loc 1 2421 38
	lw	a5,-36(s0)
	lw	a5,64(a5)
	.loc 1 2421 28
	add	a4,a4,a5
	lw	a5,-36(s0)
	sw	a4,4(a5)
	.loc 1 2423 20
	lw	a5,-36(s0)
	lw	a4,4(a5)
	.loc 1 2423 52
	lw	a5,-36(s0)
	lw	a5,8(a5)
	.loc 1 2423 11
	bltu	a4,a5,.L134
	.loc 1 2425 41
	lw	a5,-36(s0)
	lw	a4,0(a5)
	.loc 1 2425 32
	lw	a5,-36(s0)
	sw	a4,4(a5)
	j	.L134
.L135:
	.loc 1 2434 54
	lw	a5,-36(s0)
	lw	a4,12(a5)
	.loc 1 2434 100
	lw	a5,-36(s0)
	lw	a5,64(a5)
	.loc 1 2434 18
	mv	a2,a5
	lw	a1,-40(s0)
	mv	a0,a4
	call	memcpy
	.loc 1 2435 26
	lw	a5,-36(s0)
	lw	a4,12(a5)
	.loc 1 2435 48
	lw	a5,-36(s0)
	lw	a5,64(a5)
	.loc 1 2435 38
	neg	a5,a5
	add	a4,a4,a5
	lw	a5,-36(s0)
	sw	a4,12(a5)
	.loc 1 2437 30
	lw	a5,-36(s0)
	lw	a4,12(a5)
	.loc 1 2437 51
	lw	a5,-36(s0)
	lw	a5,0(a5)
	.loc 1 2437 11
	bgeu	a4,a5,.L136
	.loc 1 2439 63
	lw	a5,-36(s0)
	lw	a4,8(a5)
	.loc 1 2439 80
	lw	a5,-36(s0)
	lw	a5,64(a5)
	.loc 1 2439 71
	neg	a5,a5
	add	a4,a4,a5
	.loc 1 2439 42
	lw	a5,-36(s0)
	sw	a4,12(a5)
.L136:
	.loc 1 2446 11
	lw	a4,-44(s0)
	li	a5,2
	bne	a4,a5,.L134
	.loc 1 2448 15
	lw	a5,-20(s0)
	beq	a5,zero,.L134
	.loc 1 2454 17
	lw	a5,-20(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
.L134:
	.loc 1 2467 70
	lw	a5,-20(s0)
	addi	a4,a5,1
	.loc 1 2467 32
	lw	a5,-36(s0)
	sw	a4,56(a5)
	.loc 1 2469 12
	lw	a5,-24(s0)
	.loc 1 2470 1
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
.LFE23:
	.size	prvCopyDataToQueue, .-prvCopyDataToQueue
	.align	2
	.type	prvCopyDataFromQueue, @function
prvCopyDataFromQueue:
.LFB24:
	.loc 1 2475 1
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
	.loc 1 2476 16
	lw	a5,-20(s0)
	lw	a5,64(a5)
	.loc 1 2476 7
	beq	a5,zero,.L141
	.loc 1 2478 26
	lw	a5,-20(s0)
	lw	a4,12(a5)
	.loc 1 2478 48
	lw	a5,-20(s0)
	lw	a5,64(a5)
	.loc 1 2478 38
	add	a4,a4,a5
	lw	a5,-20(s0)
	sw	a4,12(a5)
	.loc 1 2480 30
	lw	a5,-20(s0)
	lw	a4,12(a5)
	.loc 1 2480 62
	lw	a5,-20(s0)
	lw	a5,8(a5)
	.loc 1 2480 11
	bltu	a4,a5,.L140
	.loc 1 2482 51
	lw	a5,-20(s0)
	lw	a4,0(a5)
	.loc 1 2482 42
	lw	a5,-20(s0)
	sw	a4,12(a5)
.L140:
	.loc 1 2489 75
	lw	a5,-20(s0)
	lw	a4,12(a5)
	.loc 1 2489 106
	lw	a5,-20(s0)
	lw	a5,64(a5)
	.loc 1 2489 18
	mv	a2,a5
	mv	a1,a4
	lw	a0,-24(s0)
	call	memcpy
.L141:
	.loc 1 2491 1
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
.LFE24:
	.size	prvCopyDataFromQueue, .-prvCopyDataFromQueue
	.align	2
	.type	prvUnlockQueue, @function
prvUnlockQueue:
.LFB25:
	.loc 1 2495 1
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
	.loc 1 2502 5
#APP
# 2502 "FreeRTOS-Kernel/queue.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
.LBB13:
	.loc 1 2504 16
	lw	a5,-36(s0)
	lbu	a5,69(a5)
	sb	a5,-17(s0)
	.loc 1 2507 14
	j	.L143
.L147:
	.loc 1 2555 21
	lw	a5,-36(s0)
	lw	a5,36(a5)
	.loc 1 2555 19
	beq	a5,zero,.L155
	.loc 1 2557 51
	lw	a5,-36(s0)
	addi	a5,a5,36
	.loc 1 2557 25
	mv	a0,a5
	call	xTaskRemoveFromEventList
	mv	a5,a0
	.loc 1 2557 23 discriminator 1
	beq	a5,zero,.L145
	.loc 1 2561 25
	call	vTaskMissedYield
.L145:
	.loc 1 2575 13
	lbu	a5,-17(s0)
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,-17(s0)
.L143:
	.loc 1 2507 24
	lb	a5,-17(s0)
	bgt	a5,zero,.L147
	j	.L146
.L155:
	.loc 1 2570 21
	nop
.L146:
	.loc 1 2578 26
	lw	a5,-36(s0)
	li	a4,-1
	sb	a4,69(a5)
.LBE13:
	.loc 1 2580 5
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L148
	.loc 1 2580 5 is_stmt 0 discriminator 1
#APP
# 2580 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L148:
	.loc 1 2583 5 is_stmt 1
#APP
# 2583 "FreeRTOS-Kernel/queue.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
.LBB14:
	.loc 1 2585 16
	lw	a5,-36(s0)
	lbu	a5,68(a5)
	sb	a5,-18(s0)
	.loc 1 2587 14
	j	.L149
.L153:
	.loc 1 2589 17
	lw	a5,-36(s0)
	lw	a5,16(a5)
	.loc 1 2589 15
	beq	a5,zero,.L156
	.loc 1 2591 47
	lw	a5,-36(s0)
	addi	a5,a5,16
	.loc 1 2591 21
	mv	a0,a5
	call	xTaskRemoveFromEventList
	mv	a5,a0
	.loc 1 2591 19 discriminator 1
	beq	a5,zero,.L151
	.loc 1 2593 21
	call	vTaskMissedYield
.L151:
	.loc 1 2600 17
	lbu	a5,-18(s0)
	addi	a5,a5,-1
	andi	a5,a5,0xff
	sb	a5,-18(s0)
.L149:
	.loc 1 2587 24
	lb	a5,-18(s0)
	bgt	a5,zero,.L153
	j	.L152
.L156:
	.loc 1 2604 17
	nop
.L152:
	.loc 1 2608 26
	lw	a5,-36(s0)
	li	a4,-1
	sb	a4,68(a5)
.LBE14:
	.loc 1 2610 5
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L157
	.loc 1 2610 5 is_stmt 0 discriminator 1
#APP
# 2610 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L157:
	.loc 1 2611 1 is_stmt 1
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
.LFE25:
	.size	prvUnlockQueue, .-prvUnlockQueue
	.align	2
	.type	prvIsQueueEmpty, @function
prvIsQueueEmpty:
.LFB26:
	.loc 1 2615 1
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
	.loc 1 2618 5
#APP
# 2618 "FreeRTOS-Kernel/queue.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 2620 20
	lw	a5,-36(s0)
	lw	a5,56(a5)
	.loc 1 2620 11
	bne	a5,zero,.L159
	.loc 1 2622 21
	li	a5,1
	sw	a5,-20(s0)
	j	.L160
.L159:
	.loc 1 2626 21
	sw	zero,-20(s0)
.L160:
	.loc 1 2629 5
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L161
	.loc 1 2629 5 is_stmt 0 discriminator 1
#APP
# 2629 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L161:
	.loc 1 2631 12 is_stmt 1
	lw	a5,-20(s0)
	.loc 1 2632 1
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
.LFE26:
	.size	prvIsQueueEmpty, .-prvIsQueueEmpty
	.align	2
	.globl	xQueueIsQueueEmptyFromISR
	.type	xQueueIsQueueEmptyFromISR, @function
xQueueIsQueueEmptyFromISR:
.LFB27:
	.loc 1 2636 1
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
	.loc 1 2638 21
	lw	a5,-36(s0)
	sw	a5,-24(s0)
	.loc 1 2644 16
	lw	a5,-24(s0)
	lw	a5,56(a5)
	.loc 1 2644 7
	bne	a5,zero,.L164
	.loc 1 2646 17
	li	a5,1
	sw	a5,-20(s0)
	j	.L165
.L164:
	.loc 1 2650 17
	sw	zero,-20(s0)
.L165:
	.loc 1 2655 12
	lw	a5,-20(s0)
	.loc 1 2656 1
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
.LFE27:
	.size	xQueueIsQueueEmptyFromISR, .-xQueueIsQueueEmptyFromISR
	.align	2
	.type	prvIsQueueFull, @function
prvIsQueueFull:
.LFB28:
	.loc 1 2660 1
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
	.loc 1 2663 5
#APP
# 2663 "FreeRTOS-Kernel/queue.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 2665 20
	lw	a5,-36(s0)
	lw	a4,56(a5)
	.loc 1 2665 50
	lw	a5,-36(s0)
	lw	a5,60(a5)
	.loc 1 2665 11
	bne	a4,a5,.L168
	.loc 1 2667 21
	li	a5,1
	sw	a5,-20(s0)
	j	.L169
.L168:
	.loc 1 2671 21
	sw	zero,-20(s0)
.L169:
	.loc 1 2674 5
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L170
	.loc 1 2674 5 is_stmt 0 discriminator 1
#APP
# 2674 "FreeRTOS-Kernel/queue.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L170:
	.loc 1 2676 12 is_stmt 1
	lw	a5,-20(s0)
	.loc 1 2677 1
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
.LFE28:
	.size	prvIsQueueFull, .-prvIsQueueFull
	.align	2
	.globl	xQueueIsQueueFullFromISR
	.type	xQueueIsQueueFullFromISR, @function
xQueueIsQueueFullFromISR:
.LFB29:
	.loc 1 2681 1
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
	.loc 1 2683 21
	lw	a5,-36(s0)
	sw	a5,-24(s0)
	.loc 1 2689 16
	lw	a5,-24(s0)
	lw	a4,56(a5)
	.loc 1 2689 46
	lw	a5,-24(s0)
	lw	a5,60(a5)
	.loc 1 2689 7
	bne	a4,a5,.L173
	.loc 1 2691 17
	li	a5,1
	sw	a5,-20(s0)
	j	.L174
.L173:
	.loc 1 2695 17
	sw	zero,-20(s0)
.L174:
	.loc 1 2700 12
	lw	a5,-20(s0)
	.loc 1 2701 1
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
.LFE29:
	.size	xQueueIsQueueFullFromISR, .-xQueueIsQueueFullFromISR
.Letext0:
	.file 2 "/opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/14.2.0/include/stddef.h"
	.file 3 "/opt/riscv/sysroot/usr/include/bits/types.h"
	.file 4 "/opt/riscv/sysroot/usr/include/bits/stdint-intn.h"
	.file 5 "/opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/14.2.0/include/stdint-gcc.h"
	.file 6 "FreeRTOS-Kernel/portable/GCC/RISC-V/portmacro.h"
	.file 7 "FreeRTOS-Kernel/include/list.h"
	.file 8 "FreeRTOS-Kernel/include/task.h"
	.file 9 "FreeRTOS-Kernel/include/queue.h"
	.file 10 "FreeRTOS-Kernel/include/portable.h"
	.file 11 "/opt/riscv/sysroot/usr/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xe3a
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x17
	.4byte	.LASF124
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x2
	.byte	0xd6
	.byte	0x17
	.4byte	0x32
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x18
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.4byte	.LASF3
	.uleb128 0x9
	.byte	0x8
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x9
	.byte	0x1
	.byte	0x8
	.4byte	.LASF5
	.uleb128 0x9
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x9
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x3
	.byte	0x25
	.byte	0x15
	.4byte	0x6f
	.uleb128 0x9
	.byte	0x1
	.byte	0x6
	.4byte	.LASF10
	.uleb128 0x9
	.byte	0x2
	.byte	0x5
	.4byte	.LASF11
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x29
	.byte	0x14
	.4byte	0x39
	.uleb128 0x9
	.byte	0x8
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x19
	.byte	0x4
	.uleb128 0xf
	.4byte	0x90
	.uleb128 0x5
	.4byte	0x90
	.uleb128 0x9
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x4
	.byte	0x18
	.byte	0x12
	.4byte	0x63
	.uleb128 0x10
	.4byte	0xa3
	.uleb128 0x5
	.4byte	0xa3
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x4
	.byte	0x1a
	.byte	0x13
	.4byte	0x7d
	.uleb128 0x6
	.4byte	0xd4
	.uleb128 0xf
	.4byte	0xc5
	.uleb128 0x5
	.4byte	0xc5
	.uleb128 0x1a
	.uleb128 0x9
	.byte	0x10
	.byte	0x4
	.4byte	.LASF17
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x5
	.byte	0x2e
	.byte	0x18
	.4byte	0x4e
	.uleb128 0x5
	.4byte	0xdc
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x5
	.byte	0x34
	.byte	0x19
	.4byte	0x32
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x6
	.byte	0x42
	.byte	0x1a
	.4byte	0xb9
	.uleb128 0x5
	.4byte	0xf9
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x6
	.byte	0x43
	.byte	0x1a
	.4byte	0xed
	.uleb128 0x10
	.4byte	0x10a
	.uleb128 0x5
	.4byte	0x10a
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x6
	.byte	0x44
	.byte	0x1a
	.4byte	0xed
	.uleb128 0x5
	.4byte	0x120
	.uleb128 0x1b
	.4byte	.LASF125
	.byte	0x6
	.byte	0x75
	.byte	0xf
	.4byte	0x26
	.uleb128 0x6
	.4byte	0xdc
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x14
	.byte	0x7
	.byte	0x90
	.byte	0x8
	.4byte	0x191
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x7
	.byte	0x93
	.byte	0x24
	.4byte	0x120
	.byte	0
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x7
	.byte	0x94
	.byte	0x2d
	.4byte	0x191
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF25
	.byte	0x7
	.byte	0x95
	.byte	0x2d
	.4byte	0x191
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x7
	.byte	0x96
	.byte	0xc
	.4byte	0x90
	.byte	0xc
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x7
	.byte	0x97
	.byte	0x28
	.4byte	0x1cb
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.4byte	0x142
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x14
	.byte	0x7
	.byte	0xac
	.byte	0x10
	.4byte	0x1cb
	.uleb128 0x3
	.4byte	.LASF30
	.byte	0x7
	.byte	0xaf
	.byte	0x25
	.4byte	0x10a
	.byte	0
	.uleb128 0x3
	.4byte	.LASF31
	.byte	0x7
	.byte	0xb0
	.byte	0x26
	.4byte	0x21d
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x7
	.byte	0xb1
	.byte	0x14
	.4byte	0x211
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.4byte	0x196
	.uleb128 0x4
	.4byte	.LASF33
	.byte	0x7
	.byte	0x9a
	.byte	0x1b
	.4byte	0x142
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0xc
	.byte	0x7
	.byte	0x9d
	.byte	0xc
	.4byte	0x211
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x7
	.byte	0xa0
	.byte	0x28
	.4byte	0x120
	.byte	0
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x7
	.byte	0xa1
	.byte	0x31
	.4byte	0x191
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF25
	.byte	0x7
	.byte	0xa2
	.byte	0x31
	.4byte	0x191
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.4byte	.LASF35
	.byte	0x7
	.byte	0xa4
	.byte	0x24
	.4byte	0x1dc
	.uleb128 0x6
	.4byte	0x1d0
	.uleb128 0x4
	.4byte	.LASF36
	.byte	0x7
	.byte	0xb3
	.byte	0x3
	.4byte	0x196
	.uleb128 0x5
	.4byte	0x222
	.uleb128 0x4
	.4byte	.LASF37
	.byte	0x8
	.byte	0x5c
	.byte	0x2e
	.4byte	0x23f
	.uleb128 0x6
	.4byte	0x244
	.uleb128 0x1c
	.4byte	.LASF126
	.uleb128 0xb
	.4byte	.LASF38
	.byte	0x8
	.byte	0x8
	.byte	0x7d
	.byte	0x10
	.4byte	0x271
	.uleb128 0x3
	.4byte	.LASF39
	.byte	0x8
	.byte	0x7f
	.byte	0x10
	.4byte	0xf9
	.byte	0
	.uleb128 0x3
	.4byte	.LASF40
	.byte	0x8
	.byte	0x80
	.byte	0x10
	.4byte	0x120
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF41
	.byte	0x8
	.byte	0x81
	.byte	0x3
	.4byte	0x249
	.uleb128 0x4
	.4byte	.LASF42
	.byte	0x9
	.byte	0x33
	.byte	0x24
	.4byte	0x28e
	.uleb128 0x5
	.4byte	0x27d
	.uleb128 0x6
	.4byte	0x293
	.uleb128 0xb
	.4byte	.LASF43
	.byte	0x48
	.byte	0x1
	.byte	0x67
	.byte	0x10
	.4byte	0x321
	.uleb128 0x3
	.4byte	.LASF44
	.byte	0x1
	.byte	0x69
	.byte	0xe
	.4byte	0x349
	.byte	0
	.uleb128 0x3
	.4byte	.LASF45
	.byte	0x1
	.byte	0x6a
	.byte	0xe
	.4byte	0x349
	.byte	0x4
	.uleb128 0x1d
	.string	"u"
	.byte	0x1
	.byte	0x70
	.byte	0x7
	.4byte	0x38e
	.byte	0x8
	.uleb128 0x3
	.4byte	.LASF46
	.byte	0x1
	.byte	0x72
	.byte	0xc
	.4byte	0x222
	.byte	0x10
	.uleb128 0x3
	.4byte	.LASF47
	.byte	0x1
	.byte	0x73
	.byte	0xc
	.4byte	0x222
	.byte	0x24
	.uleb128 0x3
	.4byte	.LASF48
	.byte	0x1
	.byte	0x75
	.byte	0x1a
	.4byte	0x116
	.byte	0x38
	.uleb128 0x3
	.4byte	.LASF49
	.byte	0x1
	.byte	0x76
	.byte	0x11
	.4byte	0x10a
	.byte	0x3c
	.uleb128 0x3
	.4byte	.LASF50
	.byte	0x1
	.byte	0x77
	.byte	0x11
	.4byte	0x10a
	.byte	0x40
	.uleb128 0x3
	.4byte	.LASF51
	.byte	0x1
	.byte	0x79
	.byte	0x15
	.4byte	0xaf
	.byte	0x44
	.uleb128 0x3
	.4byte	.LASF52
	.byte	0x1
	.byte	0x7a
	.byte	0x15
	.4byte	0xaf
	.byte	0x45
	.byte	0
	.uleb128 0xb
	.4byte	.LASF53
	.byte	0x8
	.byte	0x1
	.byte	0x44
	.byte	0x10
	.4byte	0x349
	.uleb128 0x3
	.4byte	.LASF54
	.byte	0x1
	.byte	0x46
	.byte	0xe
	.4byte	0x349
	.byte	0
	.uleb128 0x3
	.4byte	.LASF55
	.byte	0x1
	.byte	0x47
	.byte	0xe
	.4byte	0x349
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.4byte	0xa3
	.uleb128 0x4
	.4byte	.LASF56
	.byte	0x1
	.byte	0x48
	.byte	0x3
	.4byte	0x321
	.uleb128 0xb
	.4byte	.LASF57
	.byte	0x8
	.byte	0x1
	.byte	0x4a
	.byte	0x10
	.4byte	0x382
	.uleb128 0x3
	.4byte	.LASF58
	.byte	0x1
	.byte	0x4c
	.byte	0x12
	.4byte	0x233
	.byte	0
	.uleb128 0x3
	.4byte	.LASF59
	.byte	0x1
	.byte	0x4d
	.byte	0x11
	.4byte	0x10a
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF60
	.byte	0x1
	.byte	0x4e
	.byte	0x3
	.4byte	0x35a
	.uleb128 0x1e
	.byte	0x8
	.byte	0x1
	.byte	0x6c
	.byte	0x5
	.4byte	0x3ac
	.uleb128 0x11
	.4byte	.LASF61
	.byte	0x6e
	.4byte	0x34e
	.uleb128 0x11
	.4byte	.LASF62
	.byte	0x6f
	.4byte	0x382
	.byte	0
	.uleb128 0x4
	.4byte	.LASF63
	.byte	0x1
	.byte	0x88
	.byte	0x3
	.4byte	0x293
	.uleb128 0x4
	.4byte	.LASF64
	.byte	0x1
	.byte	0x8c
	.byte	0x10
	.4byte	0x3ac
	.uleb128 0x5
	.4byte	0x3b8
	.uleb128 0x12
	.4byte	.LASF71
	.2byte	0xe0e
	.uleb128 0x13
	.4byte	.LASF69
	.byte	0xb
	.byte	0x2b
	.byte	0xe
	.4byte	0x90
	.4byte	0x3f0
	.uleb128 0x7
	.4byte	0x92
	.uleb128 0x7
	.4byte	0xca
	.uleb128 0x7
	.4byte	0x26
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF67
	.byte	0xa
	.byte	0xb8
	.byte	0x6
	.4byte	0x402
	.uleb128 0x7
	.4byte	0x90
	.byte	0
	.uleb128 0x14
	.4byte	.LASF65
	.2byte	0x6c6
	.byte	0xd
	.4byte	0x10a
	.uleb128 0x14
	.4byte	.LASF66
	.2byte	0x693
	.byte	0xc
	.4byte	0xf9
	.uleb128 0xd
	.4byte	.LASF68
	.byte	0x8
	.2byte	0xdbb
	.4byte	0x431
	.uleb128 0x7
	.4byte	0x436
	.uleb128 0x7
	.4byte	0x12c
	.byte	0
	.uleb128 0x6
	.4byte	0x222
	.uleb128 0x5
	.4byte	0x431
	.uleb128 0x15
	.4byte	.LASF70
	.2byte	0xd53
	.4byte	0xf9
	.4byte	0x455
	.uleb128 0x7
	.4byte	0x45a
	.uleb128 0x7
	.4byte	0x464
	.byte	0
	.uleb128 0x6
	.4byte	0x271
	.uleb128 0x5
	.4byte	0x455
	.uleb128 0x6
	.4byte	0x120
	.uleb128 0x5
	.4byte	0x45f
	.uleb128 0x12
	.4byte	.LASF72
	.2byte	0x65b
	.uleb128 0xd
	.4byte	.LASF73
	.byte	0x8
	.2byte	0xe65
	.4byte	0x482
	.uleb128 0x7
	.4byte	0x45a
	.byte	0
	.uleb128 0x13
	.4byte	.LASF74
	.byte	0xa
	.byte	0xb5
	.byte	0x8
	.4byte	0x90
	.4byte	0x498
	.uleb128 0x7
	.4byte	0x26
	.byte	0
	.uleb128 0xd
	.4byte	.LASF75
	.byte	0x7
	.2byte	0x1b9
	.4byte	0x4aa
	.uleb128 0x7
	.4byte	0x436
	.byte	0
	.uleb128 0x15
	.4byte	.LASF76
	.2byte	0xde8
	.4byte	0xf9
	.4byte	0x4bf
	.uleb128 0x7
	.4byte	0x4c4
	.byte	0
	.uleb128 0x6
	.4byte	0x22e
	.uleb128 0x5
	.4byte	0x4bf
	.uleb128 0xc
	.4byte	.LASF79
	.2byte	0xa78
	.byte	0xc
	.4byte	0xf9
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x511
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0xa78
	.byte	0x3a
	.4byte	0x289
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF77
	.2byte	0xa7a
	.byte	0x10
	.4byte	0xf9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0xa7b
	.byte	0x15
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.4byte	0x3b8
	.uleb128 0x5
	.4byte	0x511
	.uleb128 0x16
	.4byte	.LASF81
	.2byte	0xa63
	.4byte	0xf9
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x553
	.uleb128 0x2
	.4byte	.LASF78
	.2byte	0xa63
	.byte	0x33
	.4byte	0x553
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF77
	.2byte	0xa65
	.byte	0x10
	.4byte	0xf9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x6
	.4byte	0x3c4
	.uleb128 0xc
	.4byte	.LASF80
	.2byte	0xa4b
	.byte	0xc
	.4byte	0xf9
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5a0
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0xa4b
	.byte	0x3b
	.4byte	0x289
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF77
	.2byte	0xa4d
	.byte	0x10
	.4byte	0xf9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0xa4e
	.byte	0x15
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x16
	.4byte	.LASF82
	.2byte	0xa36
	.4byte	0xf9
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5d8
	.uleb128 0x2
	.4byte	.LASF78
	.2byte	0xa36
	.byte	0x34
	.4byte	0x553
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF77
	.2byte	0xa38
	.byte	0x10
	.4byte	0xf9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xe
	.4byte	.LASF83
	.2byte	0x9be
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x633
	.uleb128 0x2
	.4byte	.LASF78
	.2byte	0x9be
	.byte	0x2d
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.4byte	.LBB13
	.4byte	.LBE13-.LBB13
	.4byte	0x619
	.uleb128 0x1
	.4byte	.LASF52
	.2byte	0x9c8
	.byte	0x10
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x8
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.uleb128 0x1
	.4byte	.LASF51
	.2byte	0xa19
	.byte	0x10
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF84
	.2byte	0x9a9
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x667
	.uleb128 0x2
	.4byte	.LASF78
	.2byte	0x9a9
	.byte	0x33
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2
	.4byte	.LASF85
	.2byte	0x9aa
	.byte	0x30
	.4byte	0x97
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x21
	.4byte	.LASF86
	.byte	0x1
	.2byte	0x956
	.byte	0x13
	.4byte	0xf9
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6ce
	.uleb128 0x2
	.4byte	.LASF78
	.2byte	0x956
	.byte	0x37
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2
	.4byte	.LASF87
	.2byte	0x957
	.byte	0x34
	.4byte	0xc5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.4byte	.LASF88
	.2byte	0x958
	.byte	0x38
	.4byte	0x105
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1
	.4byte	.LASF77
	.2byte	0x95a
	.byte	0x10
	.4byte	0xf9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.4byte	.LASF48
	.2byte	0x95b
	.byte	0x11
	.4byte	0x10a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF89
	.2byte	0x931
	.byte	0xd
	.4byte	0x10a
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6f8
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0x931
	.byte	0x32
	.4byte	0x27d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF90
	.2byte	0x927
	.byte	0xd
	.4byte	0x10a
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x722
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0x927
	.byte	0x34
	.4byte	0x27d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x22
	.4byte	.LASF121
	.byte	0x1
	.2byte	0x8ce
	.byte	0x6
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x758
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0x8ce
	.byte	0x22
	.4byte	0x27d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0x8d0
	.byte	0x15
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF91
	.2byte	0x8be
	.byte	0xd
	.4byte	0x10a
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7a0
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0x8be
	.byte	0x40
	.4byte	0x289
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF92
	.2byte	0x8c0
	.byte	0x11
	.4byte	0x10a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0x8c1
	.byte	0x15
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF93
	.2byte	0x8a9
	.byte	0xd
	.4byte	0x10a
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7e8
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0x8a9
	.byte	0x39
	.4byte	0x289
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF92
	.2byte	0x8ab
	.byte	0x11
	.4byte	0x10a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0x8ac
	.byte	0x15
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF94
	.2byte	0x895
	.byte	0xd
	.4byte	0x10a
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x821
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0x895
	.byte	0x39
	.4byte	0x289
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF92
	.2byte	0x897
	.byte	0x11
	.4byte	0x10a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xa
	.4byte	.LASF95
	.2byte	0x857
	.byte	0xc
	.4byte	0xf9
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x896
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0x857
	.byte	0x2d
	.4byte	0x27d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2
	.4byte	.LASF85
	.2byte	0x858
	.byte	0x2c
	.4byte	0x97
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.4byte	.LASF77
	.2byte	0x85a
	.byte	0x10
	.4byte	0xf9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF96
	.2byte	0x85b
	.byte	0x11
	.4byte	0x10a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1
	.4byte	.LASF97
	.2byte	0x85c
	.byte	0xe
	.4byte	0x349
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0x85d
	.byte	0x15
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xa
	.4byte	.LASF98
	.2byte	0x7f3
	.byte	0xc
	.4byte	0xf9
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x956
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0x7f3
	.byte	0x30
	.4byte	0x27d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.4byte	.LASF85
	.2byte	0x7f4
	.byte	0x2f
	.4byte	0x97
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.4byte	.LASF99
	.2byte	0x7f5
	.byte	0x35
	.4byte	0x95b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1
	.4byte	.LASF77
	.2byte	0x7f7
	.byte	0x10
	.4byte	0xf9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF96
	.2byte	0x7f8
	.byte	0x11
	.4byte	0x10a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0x7f9
	.byte	0x15
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x8
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.uleb128 0x1
	.4byte	.LASF48
	.2byte	0x815
	.byte	0x1b
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.uleb128 0x1
	.4byte	.LASF51
	.2byte	0x81a
	.byte	0x1a
	.4byte	0xb4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x8
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.uleb128 0x1
	.4byte	.LASF100
	.2byte	0x844
	.byte	0x11
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	0xf9
	.uleb128 0x5
	.4byte	0x956
	.uleb128 0xa
	.4byte	.LASF101
	.2byte	0x755
	.byte	0xc
	.4byte	0xf9
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9fd
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0x755
	.byte	0x26
	.4byte	0x27d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.4byte	.LASF85
	.2byte	0x756
	.byte	0x25
	.4byte	0x97
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.4byte	.LASF102
	.2byte	0x757
	.byte	0x23
	.4byte	0x120
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1
	.4byte	.LASF103
	.2byte	0x759
	.byte	0x10
	.4byte	0xf9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF104
	.2byte	0x75a
	.byte	0xf
	.4byte	0x271
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.4byte	.LASF97
	.2byte	0x75b
	.byte	0xe
	.4byte	0x349
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0x75c
	.byte	0x15
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x8
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.uleb128 0x1
	.4byte	.LASF48
	.2byte	0x772
	.byte	0x1f
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF105
	.2byte	0x674
	.byte	0xc
	.4byte	0xf9
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa7c
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0x674
	.byte	0x2f
	.4byte	0x27d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.4byte	.LASF102
	.2byte	0x675
	.byte	0x2c
	.4byte	0x120
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.4byte	.LASF103
	.2byte	0x677
	.byte	0x10
	.4byte	0xf9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF104
	.2byte	0x678
	.byte	0xf
	.4byte	0x271
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0x679
	.byte	0x15
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x8
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.uleb128 0x1
	.4byte	.LASF106
	.2byte	0x695
	.byte	0x1f
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF107
	.2byte	0x5de
	.byte	0xc
	.4byte	0xf9
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb0a
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0x5de
	.byte	0x29
	.4byte	0x27d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.4byte	.LASF85
	.2byte	0x5df
	.byte	0x28
	.4byte	0x97
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.4byte	.LASF102
	.2byte	0x5e0
	.byte	0x26
	.4byte	0x120
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1
	.4byte	.LASF103
	.2byte	0x5e2
	.byte	0x10
	.4byte	0xf9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF104
	.2byte	0x5e3
	.byte	0xf
	.4byte	0x271
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0x5e4
	.byte	0x15
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x8
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.uleb128 0x1
	.4byte	.LASF48
	.2byte	0x5fa
	.byte	0x1f
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF108
	.2byte	0x531
	.byte	0xc
	.4byte	0xf9
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbbb
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0x531
	.byte	0x2d
	.4byte	0x27d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.4byte	.LASF99
	.2byte	0x532
	.byte	0x32
	.4byte	0x95b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.4byte	.LASF77
	.2byte	0x534
	.byte	0x10
	.4byte	0xf9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF96
	.2byte	0x535
	.byte	0x11
	.4byte	0x10a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0x536
	.byte	0x15
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x8
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x1
	.4byte	.LASF48
	.2byte	0x560
	.byte	0x1b
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x1
	.4byte	.LASF52
	.2byte	0x567
	.byte	0x1a
	.4byte	0xb4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -33
	.uleb128 0x8
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x1
	.4byte	.LASF100
	.2byte	0x5cb
	.byte	0x11
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF109
	.2byte	0x485
	.byte	0xc
	.4byte	0xf9
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc80
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0x485
	.byte	0x34
	.4byte	0x27d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.4byte	.LASF87
	.2byte	0x486
	.byte	0x39
	.4byte	0xcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.4byte	.LASF99
	.2byte	0x487
	.byte	0x39
	.4byte	0x95b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x2
	.4byte	.LASF110
	.2byte	0x488
	.byte	0x37
	.4byte	0x105
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.4byte	.LASF77
	.2byte	0x48a
	.byte	0x10
	.4byte	0xf9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF96
	.2byte	0x48b
	.byte	0x11
	.4byte	0x10a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0x48c
	.byte	0x15
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x8
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x1
	.4byte	.LASF52
	.2byte	0x4b0
	.byte	0x1a
	.4byte	0xb4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x1
	.4byte	.LASF111
	.2byte	0x4b1
	.byte	0x1f
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x8
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x1
	.4byte	.LASF100
	.2byte	0x51e
	.byte	0x11
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF112
	.2byte	0x3ab
	.byte	0xc
	.4byte	0xf9
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd13
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0x3ab
	.byte	0x2d
	.4byte	0x27d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.4byte	.LASF87
	.2byte	0x3ac
	.byte	0x32
	.4byte	0xcf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.4byte	.LASF102
	.2byte	0x3ad
	.byte	0x2a
	.4byte	0x120
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x2
	.4byte	.LASF110
	.2byte	0x3ae
	.byte	0x30
	.4byte	0x105
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.4byte	.LASF103
	.2byte	0x3b0
	.byte	0x10
	.4byte	0xf9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF113
	.2byte	0x3b0
	.byte	0x29
	.4byte	0xf9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1
	.4byte	.LASF104
	.2byte	0x3b1
	.byte	0xf
	.4byte	0x271
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0x3b2
	.byte	0x15
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.4byte	.LASF114
	.2byte	0x236
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd74
	.uleb128 0x2
	.4byte	.LASF115
	.2byte	0x236
	.byte	0x36
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2
	.4byte	.LASF50
	.2byte	0x237
	.byte	0x36
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.4byte	.LASF116
	.2byte	0x238
	.byte	0x2e
	.4byte	0x13d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x2
	.4byte	.LASF117
	.2byte	0x239
	.byte	0x32
	.4byte	0xe8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x2
	.4byte	.LASF118
	.2byte	0x23a
	.byte	0x2e
	.4byte	0x511
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0xa
	.4byte	.LASF119
	.2byte	0x1f6
	.byte	0x13
	.4byte	0x27d
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xde9
	.uleb128 0x2
	.4byte	.LASF115
	.2byte	0x1f6
	.byte	0x3a
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.4byte	.LASF50
	.2byte	0x1f7
	.byte	0x3a
	.4byte	0x11b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.4byte	.LASF117
	.2byte	0x1f8
	.byte	0x36
	.4byte	0xe8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -57
	.uleb128 0x1
	.4byte	.LASF118
	.2byte	0x1fa
	.byte	0x13
	.4byte	0x511
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF120
	.2byte	0x1fb
	.byte	0x10
	.4byte	0x26
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.4byte	.LASF116
	.2byte	0x1fc
	.byte	0x13
	.4byte	0x13d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x23
	.4byte	.LASF122
	.byte	0x1
	.2byte	0x12f
	.byte	0xc
	.4byte	0xf9
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF61
	.2byte	0x12f
	.byte	0x2e
	.4byte	0x27d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.4byte	.LASF123
	.2byte	0x130
	.byte	0x2b
	.4byte	0xf9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.4byte	.LASF77
	.2byte	0x132
	.byte	0x10
	.4byte	0xf9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0x133
	.byte	0x15
	.4byte	0x516
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0x3
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 25
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 8
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
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
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
	.uleb128 0x16
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
	.sleb128 19
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x1e
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x22
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
	.uleb128 0x23
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
.LASF111:
	.string	"uxPreviousMessagesWaiting"
.LASF117:
	.string	"ucQueueType"
.LASF109:
	.string	"xQueueGenericSendFromISR"
.LASF94:
	.string	"uxQueueMessagesWaiting"
.LASF8:
	.string	"size_t"
.LASF35:
	.string	"MiniListItem_t"
.LASF41:
	.string	"TimeOut_t"
.LASF99:
	.string	"pxHigherPriorityTaskWoken"
.LASF80:
	.string	"xQueueIsQueueEmptyFromISR"
.LASF82:
	.string	"prvIsQueueEmpty"
.LASF101:
	.string	"xQueuePeek"
.LASF95:
	.string	"xQueuePeekFromISR"
.LASF90:
	.string	"uxQueueGetQueueItemSize"
.LASF3:
	.string	"long int"
.LASF84:
	.string	"prvCopyDataFromQueue"
.LASF118:
	.string	"pxNewQueue"
.LASF13:
	.string	"long long unsigned int"
.LASF123:
	.string	"xNewQueue"
.LASF86:
	.string	"prvCopyDataToQueue"
.LASF32:
	.string	"xListEnd"
.LASF42:
	.string	"QueueHandle_t"
.LASF38:
	.string	"xTIME_OUT"
.LASF34:
	.string	"xMINI_LIST_ITEM"
.LASF4:
	.string	"long long int"
.LASF10:
	.string	"signed char"
.LASF102:
	.string	"xTicksToWait"
.LASF7:
	.string	"long unsigned int"
.LASF97:
	.string	"pcOriginalReadPosition"
.LASF108:
	.string	"xQueueGiveFromISR"
.LASF126:
	.string	"tskTaskControlBlock"
.LASF52:
	.string	"cTxLock"
.LASF37:
	.string	"TaskHandle_t"
.LASF69:
	.string	"memcpy"
.LASF22:
	.string	"TickType_t"
.LASF55:
	.string	"pcReadFrom"
.LASF20:
	.string	"BaseType_t"
.LASF104:
	.string	"xTimeOut"
.LASF106:
	.string	"uxSemaphoreCount"
.LASF114:
	.string	"prvInitialiseNewQueue"
.LASF39:
	.string	"xOverflowCount"
.LASF74:
	.string	"pvPortMalloc"
.LASF121:
	.string	"vQueueDelete"
.LASF49:
	.string	"uxLength"
.LASF68:
	.string	"vTaskPlaceOnEventList"
.LASF44:
	.string	"pcHead"
.LASF2:
	.string	"unsigned int"
.LASF77:
	.string	"xReturn"
.LASF40:
	.string	"xTimeOnEntering"
.LASF30:
	.string	"uxNumberOfItems"
.LASF110:
	.string	"xCopyPosition"
.LASF105:
	.string	"xQueueSemaphoreTake"
.LASF112:
	.string	"xQueueGenericSend"
.LASF6:
	.string	"short unsigned int"
.LASF113:
	.string	"xYieldRequired"
.LASF107:
	.string	"xQueueReceive"
.LASF92:
	.string	"uxReturn"
.LASF58:
	.string	"xMutexHolder"
.LASF67:
	.string	"vPortFree"
.LASF98:
	.string	"xQueueReceiveFromISR"
.LASF89:
	.string	"uxQueueGetQueueLength"
.LASF53:
	.string	"QueuePointers"
.LASF16:
	.string	"int32_t"
.LASF81:
	.string	"prvIsQueueFull"
.LASF60:
	.string	"SemaphoreData_t"
.LASF64:
	.string	"Queue_t"
.LASF115:
	.string	"uxQueueLength"
.LASF100:
	.string	"uxNumberOfTasks"
.LASF47:
	.string	"xTasksWaitingToReceive"
.LASF33:
	.string	"ListItem_t"
.LASF61:
	.string	"xQueue"
.LASF25:
	.string	"pxPrevious"
.LASF91:
	.string	"uxQueueMessagesWaitingFromISR"
.LASF62:
	.string	"xSemaphore"
.LASF87:
	.string	"pvItemToQueue"
.LASF26:
	.string	"pvOwner"
.LASF63:
	.string	"xQUEUE"
.LASF31:
	.string	"pxIndex"
.LASF27:
	.string	"pvContainer"
.LASF103:
	.string	"xEntryTimeSet"
.LASF43:
	.string	"QueueDefinition"
.LASF57:
	.string	"SemaphoreData"
.LASF9:
	.string	"__int8_t"
.LASF5:
	.string	"unsigned char"
.LASF59:
	.string	"uxRecursiveCallCount"
.LASF11:
	.string	"short int"
.LASF51:
	.string	"cRxLock"
.LASF56:
	.string	"QueuePointers_t"
.LASF66:
	.string	"xTaskResumeAll"
.LASF79:
	.string	"xQueueIsQueueFullFromISR"
.LASF119:
	.string	"xQueueGenericCreate"
.LASF29:
	.string	"xLIST"
.LASF71:
	.string	"vTaskMissedYield"
.LASF36:
	.string	"List_t"
.LASF96:
	.string	"uxSavedInterruptStatus"
.LASF19:
	.string	"uint32_t"
.LASF48:
	.string	"uxMessagesWaiting"
.LASF85:
	.string	"pvBuffer"
.LASF17:
	.string	"long double"
.LASF122:
	.string	"xQueueGenericReset"
.LASF14:
	.string	"char"
.LASF76:
	.string	"xTaskRemoveFromEventList"
.LASF23:
	.string	"xItemValue"
.LASF124:
	.string	"GNU C17 14.2.0 -mabi=ilp32 -mtune=rocket -misa-spec=20191213 -mtls-dialect=trad -march=rv32i_zicsr -g -ffreestanding"
.LASF83:
	.string	"prvUnlockQueue"
.LASF54:
	.string	"pcTail"
.LASF12:
	.string	"__int32_t"
.LASF70:
	.string	"xTaskCheckForTimeOut"
.LASF116:
	.string	"pucQueueStorage"
.LASF65:
	.string	"uxTaskGetNumberOfTasks"
.LASF15:
	.string	"int8_t"
.LASF88:
	.string	"xPosition"
.LASF72:
	.string	"vTaskSuspendAll"
.LASF73:
	.string	"vTaskInternalSetTimeOutState"
.LASF46:
	.string	"xTasksWaitingToSend"
.LASF120:
	.string	"xQueueSizeInBytes"
.LASF78:
	.string	"pxQueue"
.LASF125:
	.string	"xCriticalNesting"
.LASF18:
	.string	"uint8_t"
.LASF45:
	.string	"pcWriteTo"
.LASF50:
	.string	"uxItemSize"
.LASF24:
	.string	"pxNext"
.LASF75:
	.string	"vListInitialise"
.LASF28:
	.string	"xLIST_ITEM"
.LASF93:
	.string	"uxQueueSpacesAvailable"
.LASF21:
	.string	"UBaseType_t"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"FreeRTOS-Kernel/queue.c"
.LASF1:
	.string	"/home/rur1k/FinalTapeout/FinalTapeout/C_Code"
	.globl	__mulsi3
	.ident	"GCC: () 14.2.0"
	.section	.note.GNU-stack,"",@progbits
