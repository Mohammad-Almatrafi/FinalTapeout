	.file	"tasks.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.file 0 "/home/rur1k/FinalTapeout/FinalTapeout/C_Code" "FreeRTOS-Kernel/tasks.c"
	.globl	pxCurrentTCB
	.section	.sbss,"aw",@nobits
	.align	2
	.type	pxCurrentTCB, @object
	.size	pxCurrentTCB, 4
pxCurrentTCB:
	.zero	4
	.local	pxReadyTasksLists
	.comm	pxReadyTasksLists,20,4
	.local	xDelayedTaskList1
	.comm	xDelayedTaskList1,20,4
	.local	xDelayedTaskList2
	.comm	xDelayedTaskList2,20,4
	.local	pxDelayedTaskList
	.comm	pxDelayedTaskList,4,4
	.local	pxOverflowDelayedTaskList
	.comm	pxOverflowDelayedTaskList,4,4
	.local	xPendingReadyList
	.comm	xPendingReadyList,20,4
	.local	uxCurrentNumberOfTasks
	.comm	uxCurrentNumberOfTasks,4,4
	.local	xTickCount
	.comm	xTickCount,4,4
	.local	uxTopReadyPriority
	.comm	uxTopReadyPriority,4,4
	.local	xSchedulerRunning
	.comm	xSchedulerRunning,4,4
	.local	xPendedTicks
	.comm	xPendedTicks,4,4
	.local	xYieldPendings
	.comm	xYieldPendings,4,4
	.local	xNumOfOverflows
	.comm	xNumOfOverflows,4,4
	.local	uxTaskNumber
	.comm	uxTaskNumber,4,4
	.local	xNextTaskUnblockTime
	.comm	xNextTaskUnblockTime,4,4
	.local	xIdleTaskHandles
	.comm	xIdleTaskHandles,4,4
	.section	.srodata,"a"
	.align	2
	.type	uxTopUsedPriority, @object
	.size	uxTopUsedPriority, 4
uxTopUsedPriority:
	.zero	4
	.local	uxSchedulerSuspended
	.comm	uxSchedulerSuspended,4,4
	.text
	.align	2
	.type	prvCreateTask, @function
prvCreateTask:
.LFB6:
	.file 1 "FreeRTOS-Kernel/tasks.c"
	.loc 1 1626 5
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	ra,60(sp)
	sw	s0,56(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	a3,-48(s0)
	sw	a4,-52(s0)
	sw	a5,-56(s0)
.LBB2:
	.loc 1 1670 23
	lw	a5,-44(s0)
	slli	a5,a5,2
	mv	a0,a5
	call	pvPortMalloc
	sw	a0,-24(s0)
	.loc 1 1672 15
	lw	a5,-24(s0)
	beq	a5,zero,.L2
	.loc 1 1678 40
	li	a0,76
	call	pvPortMalloc
	sw	a0,-20(s0)
	.loc 1 1680 19
	lw	a5,-20(s0)
	beq	a5,zero,.L3
	.loc 1 1682 30
	li	a2,76
	li	a1,0
	lw	a0,-20(s0)
	call	memset
	.loc 1 1685 39
	lw	a5,-20(s0)
	lw	a4,-24(s0)
	sw	a4,48(a5)
	j	.L4
.L3:
	.loc 1 1691 21
	lw	a0,-24(s0)
	call	vPortFree
	j	.L4
.L2:
	.loc 1 1696 26
	sw	zero,-20(s0)
.L4:
.LBE2:
	.loc 1 1701 11
	lw	a5,-20(s0)
	beq	a5,zero,.L5
	.loc 1 1711 13
	li	a7,0
	lw	a6,-20(s0)
	lw	a5,-56(s0)
	lw	a4,-52(s0)
	lw	a3,-48(s0)
	lw	a2,-44(s0)
	lw	a1,-40(s0)
	lw	a0,-36(s0)
	call	prvInitialiseNewTask
.L5:
	.loc 1 1714 16
	lw	a5,-20(s0)
	.loc 1 1715 5
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
	.size	prvCreateTask, .-prvCreateTask
	.align	2
	.globl	xTaskCreate
	.type	xTaskCreate, @function
xTaskCreate:
.LFB7:
	.loc 1 1724 5
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	ra,60(sp)
	sw	s0,56(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	a3,-48(s0)
	sw	a4,-52(s0)
	sw	a5,-56(s0)
	.loc 1 1730 20
	lw	a5,-56(s0)
	lw	a4,-52(s0)
	lw	a3,-48(s0)
	lw	a2,-44(s0)
	lw	a1,-40(s0)
	lw	a0,-36(s0)
	call	prvCreateTask
	sw	a0,-24(s0)
	.loc 1 1732 11
	lw	a5,-24(s0)
	beq	a5,zero,.L8
	.loc 1 1741 13
	lw	a0,-24(s0)
	call	prvAddNewTaskToReadyList
	.loc 1 1742 21
	li	a5,1
	sw	a5,-20(s0)
	j	.L9
.L8:
	.loc 1 1746 21
	li	a5,-1
	sw	a5,-20(s0)
.L9:
	.loc 1 1751 16
	lw	a5,-20(s0)
	.loc 1 1752 5
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
.LFE7:
	.size	xTaskCreate, .-xTaskCreate
	.align	2
	.type	prvInitialiseNewTask, @function
prvInitialiseNewTask:
.LFB8:
	.loc 1 1801 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	ra,60(sp)
	sw	s0,56(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	a3,-48(s0)
	sw	a4,-52(s0)
	sw	a5,-56(s0)
	sw	a6,-60(s0)
	sw	a7,-64(s0)
	.loc 1 1834 35
	lw	a5,-60(s0)
	lw	a4,48(a5)
	.loc 1 1834 44
	lw	a3,-44(s0)
	li	a5,1073741824
	addi	a5,a5,-1
	add	a5,a3,a5
	slli	a5,a5,2
	.loc 1 1834 22
	add	a5,a4,a5
	sw	a5,-24(s0)
	.loc 1 1835 46
	lw	a5,-24(s0)
	.loc 1 1835 87
	andi	a5,a5,-16
	.loc 1 1835 22
	sw	a5,-24(s0)
	.loc 1 1863 7
	lw	a5,-40(s0)
	beq	a5,zero,.L12
	.loc 1 1865 16
	sw	zero,-20(s0)
	.loc 1 1865 9
	j	.L13
.L16:
	.loc 1 1867 47
	lw	a4,-40(s0)
	lw	a5,-20(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	.loc 1 1867 39
	lw	a3,-60(s0)
	lw	a5,-20(s0)
	add	a5,a3,a5
	sb	a4,52(a5)
	.loc 1 1872 23
	lw	a4,-40(s0)
	lw	a5,-20(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	.loc 1 1872 15
	beq	a5,zero,.L19
	.loc 1 1865 83 discriminator 2
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L13:
	.loc 1 1865 39 discriminator 1
	lw	a4,-20(s0)
	li	a5,15
	bleu	a4,a5,.L16
	j	.L15
.L19:
	.loc 1 1874 17
	nop
.L15:
	.loc 1 1884 62
	lw	a5,-60(s0)
	sb	zero,67(a5)
.L12:
	.loc 1 1894 7
	lw	a5,-52(s0)
	beq	a5,zero,.L17
	.loc 1 1896 20
	sw	zero,-52(s0)
.L17:
	.loc 1 1903 26
	lw	a5,-60(s0)
	lw	a4,-52(s0)
	sw	a4,44(a5)
	.loc 1 1910 5
	lw	a5,-60(s0)
	addi	a5,a5,4
	mv	a0,a5
	call	vListInitialiseItem
	.loc 1 1911 5
	lw	a5,-60(s0)
	addi	a5,a5,24
	mv	a0,a5
	call	vListInitialiseItem
	.loc 1 1915 5
	lw	a5,-60(s0)
	lw	a4,-60(s0)
	sw	a4,16(a5)
	.loc 1 1918 5
	li	a4,1
	lw	a5,-52(s0)
	sub	a4,a4,a5
	lw	a5,-60(s0)
	sw	a4,24(a5)
	.loc 1 1919 5
	lw	a5,-60(s0)
	lw	a4,-60(s0)
	sw	a4,36(a5)
	.loc 1 1985 38
	lw	a2,-48(s0)
	lw	a1,-36(s0)
	lw	a0,-24(s0)
	call	pxPortInitialiseStack
	mv	a4,a0
	.loc 1 1985 36 discriminator 1
	lw	a5,-60(s0)
	sw	a4,0(a5)
	.loc 1 2004 7
	lw	a5,-56(s0)
	beq	a5,zero,.L20
	.loc 1 2008 24
	lw	a5,-56(s0)
	lw	a4,-60(s0)
	sw	a4,0(a5)
.L20:
	.loc 1 2014 1
	nop
	lw	ra,60(sp)
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE8:
	.size	prvInitialiseNewTask, .-prvInitialiseNewTask
	.align	2
	.type	prvAddNewTaskToReadyList, @function
prvAddNewTaskToReadyList:
.LFB9:
	.loc 1 2020 5
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
	.loc 1 2023 9
#APP
# 2023 "FreeRTOS-Kernel/tasks.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 2025 38
	lui	a5,%hi(uxCurrentNumberOfTasks)
	lw	a5,%lo(uxCurrentNumberOfTasks)(a5)
	.loc 1 2025 79
	addi	a4,a5,1
	.loc 1 2025 36
	lui	a5,%hi(uxCurrentNumberOfTasks)
	sw	a4,%lo(uxCurrentNumberOfTasks)(a5)
	.loc 1 2027 30
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	.loc 1 2027 15
	bne	a5,zero,.L22
	.loc 1 2031 30
	lui	a5,%hi(pxCurrentTCB)
	lw	a4,-36(s0)
	sw	a4,%lo(pxCurrentTCB)(a5)
	.loc 1 2033 44
	lui	a5,%hi(uxCurrentNumberOfTasks)
	lw	a4,%lo(uxCurrentNumberOfTasks)(a5)
	.loc 1 2033 19
	li	a5,1
	bne	a4,a5,.L23
	.loc 1 2038 21
	call	prvInitialiseTaskLists
	j	.L23
.L22:
	.loc 1 2050 39
	lui	a5,%hi(xSchedulerRunning)
	lw	a5,%lo(xSchedulerRunning)(a5)
	.loc 1 2050 19
	bne	a5,zero,.L23
	.loc 1 2052 37
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	lw	a4,44(a5)
	.loc 1 2052 61
	lw	a5,-36(s0)
	lw	a5,44(a5)
	.loc 1 2052 23
	bgtu	a4,a5,.L23
	.loc 1 2054 38
	lui	a5,%hi(pxCurrentTCB)
	lw	a4,-36(s0)
	sw	a4,%lo(pxCurrentTCB)(a5)
.L23:
	.loc 1 2067 25
	lui	a5,%hi(uxTaskNumber)
	lw	a5,%lo(uxTaskNumber)(a5)
	addi	a4,a5,1
	lui	a5,%hi(uxTaskNumber)
	sw	a4,%lo(uxTaskNumber)(a5)
	.loc 1 2077 13
	lw	a5,-36(s0)
	lw	a5,44(a5)
	li	a4,1
	sll	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	lw	a5,%lo(uxTopReadyPriority)(a5)
	or	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	sw	a4,%lo(uxTopReadyPriority)(a5)
.LBB3:
	lw	a5,-36(s0)
	lw	a4,44(a5)
	lui	a5,%hi(pxReadyTasksLists)
	addi	a3,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,4(a5)
	sw	a5,-20(s0)
	lw	a5,-36(s0)
	lw	a4,-20(s0)
	sw	a4,8(a5)
	lw	a5,-20(s0)
	lw	a4,8(a5)
	lw	a5,-36(s0)
	sw	a4,12(a5)
	lw	a5,-20(s0)
	lw	a5,8(a5)
	lw	a4,-36(s0)
	addi	a4,a4,4
	sw	a4,4(a5)
	lw	a5,-36(s0)
	addi	a4,a5,4
	lw	a5,-20(s0)
	sw	a4,8(a5)
	lw	a5,-36(s0)
	lw	a4,44(a5)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	lui	a4,%hi(pxReadyTasksLists)
	addi	a4,a4,%lo(pxReadyTasksLists)
	add	a4,a5,a4
	lw	a5,-36(s0)
	sw	a4,20(a5)
	lw	a5,-36(s0)
	lw	a4,44(a5)
	lui	a5,%hi(pxReadyTasksLists)
	addi	a3,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,0(a5)
	lw	a4,-36(s0)
	lw	a4,44(a4)
	addi	a3,a5,1
	lui	a5,%hi(pxReadyTasksLists)
	addi	a2,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a2,a5
	sw	a3,0(a5)
.LBE3:
	.loc 1 2081 9
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L24
	.loc 1 2081 9 is_stmt 0 discriminator 1
#APP
# 2081 "FreeRTOS-Kernel/tasks.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L24:
	.loc 1 2083 31 is_stmt 1
	lui	a5,%hi(xSchedulerRunning)
	lw	a5,%lo(xSchedulerRunning)(a5)
	.loc 1 2093 5
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
	.size	prvAddNewTaskToReadyList, .-prvAddNewTaskToReadyList
	.section	.rodata
	.align	2
.LC0:
	.string	"IDLE"
	.text
	.align	2
	.type	prvCreateIdleTasks, @function
prvCreateIdleTasks:
.LFB10:
	.loc 1 3512 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 1 3513 16
	li	a5,1
	sw	a5,-20(s0)
	.loc 1 3516 20
	sw	zero,-32(s0)
	.loc 1 3519 29
	sw	zero,-28(s0)
	.loc 1 3519 5
	j	.L26
.L29:
	.loc 1 3521 63
	lui	a5,%hi(.LC0)
	addi	a4,a5,%lo(.LC0)
	lw	a5,-28(s0)
	add	a5,a4,a5
	lbu	a4,0(a5)
	.loc 1 3521 41
	lw	a5,-28(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	sb	a4,-32(a5)
	.loc 1 3526 22
	lw	a5,-28(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lbu	a5,-32(a5)
	.loc 1 3526 11
	beq	a5,zero,.L35
	.loc 1 3519 128 discriminator 2
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L26:
	.loc 1 3519 68 discriminator 1
	lw	a4,-28(s0)
	li	a5,15
	ble	a4,a5,.L29
	j	.L28
.L35:
	.loc 1 3528 13
	nop
.L28:
	.loc 1 3537 18
	sw	zero,-24(s0)
	.loc 1 3537 5
	j	.L30
.L33:
	.loc 1 3541 32
	lui	a5,%hi(prvIdleTask)
	addi	a5,a5,%lo(prvIdleTask)
	sw	a5,-32(s0)
	.loc 1 3630 23
	lw	a5,-24(s0)
	slli	a4,a5,2
	lui	a5,%hi(xIdleTaskHandles)
	addi	a5,a5,%lo(xIdleTaskHandles)
	add	a5,a4,a5
	addi	a1,s0,-48
	li	a4,0
	li	a3,0
	li	a2,32
	lw	a0,-32(s0)
	call	xTaskCreate
	sw	a0,-20(s0)
	.loc 1 3640 11
	lw	a5,-20(s0)
	beq	a5,zero,.L36
	.loc 1 3537 93 discriminator 2
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L30:
	.loc 1 3537 46 discriminator 1
	lw	a5,-24(s0)
	ble	a5,zero,.L33
	j	.L32
.L36:
	.loc 1 3642 13
	nop
.L32:
	.loc 1 3660 12
	lw	a5,-20(s0)
	.loc 1 3661 1
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
	.size	prvCreateIdleTasks, .-prvCreateIdleTasks
	.align	2
	.globl	vTaskStartScheduler
	.type	vTaskStartScheduler, @function
vTaskStartScheduler:
.LFB11:
	.loc 1 3666 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 3679 15
	call	prvCreateIdleTasks
	sw	a0,-20(s0)
	.loc 1 3694 7
	lw	a4,-20(s0)
	li	a5,1
	bne	a4,a5,.L38
	.loc 1 3710 9
#APP
# 3710 "FreeRTOS-Kernel/tasks.c" 1
	csrc mstatus, 8
# 0 "" 2
	.loc 1 3720 30
#NO_APP
	lui	a5,%hi(xNextTaskUnblockTime)
	li	a4,-1
	sw	a4,%lo(xNextTaskUnblockTime)(a5)
	.loc 1 3721 27
	lui	a5,%hi(xSchedulerRunning)
	li	a4,1
	sw	a4,%lo(xSchedulerRunning)(a5)
	.loc 1 3722 20
	lui	a5,%hi(xTickCount)
	sw	zero,%lo(xTickCount)(a5)
	.loc 1 3739 18
	call	xPortStartScheduler
.L38:
	.loc 1 3762 5
	lui	a5,%hi(uxTopUsedPriority)
	lw	a5,%lo(uxTopUsedPriority)(a5)
	.loc 1 3765 1
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
.LFE11:
	.size	vTaskStartScheduler, .-vTaskStartScheduler
	.align	2
	.globl	vTaskEndScheduler
	.type	vTaskEndScheduler, @function
vTaskEndScheduler:
.LFB12:
	.loc 1 3769 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 3800 5
#APP
# 3800 "FreeRTOS-Kernel/tasks.c" 1
	csrc mstatus, 8
# 0 "" 2
	.loc 1 3801 23
#NO_APP
	lui	a5,%hi(xSchedulerRunning)
	sw	zero,%lo(xSchedulerRunning)(a5)
	.loc 1 3805 5
	call	vPortEndScheduler
	.loc 1 3808 1
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
.LFE12:
	.size	vTaskEndScheduler, .-vTaskEndScheduler
	.align	2
	.globl	vTaskSuspendAll
	.type	vTaskSuspendAll, @function
vTaskSuspendAll:
.LFB13:
	.loc 1 3812 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 3828 32
	lui	a5,%hi(uxSchedulerSuspended)
	lw	a5,%lo(uxSchedulerSuspended)(a5)
	.loc 1 3828 71
	addi	a4,a5,1
	.loc 1 3828 30
	lui	a5,%hi(uxSchedulerSuspended)
	sw	a4,%lo(uxSchedulerSuspended)(a5)
	.loc 1 3832 9
	.loc 1 3888 1
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
.LFE13:
	.size	vTaskSuspendAll, .-vTaskSuspendAll
	.align	2
	.globl	xTaskResumeAll
	.type	xTaskResumeAll, @function
xTaskResumeAll:
.LFB14:
	.loc 1 3957 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 1 3958 13
	sw	zero,-20(s0)
	.loc 1 3959 16
	sw	zero,-28(s0)
	.loc 1 3972 9
#APP
# 3972 "FreeRTOS-Kernel/tasks.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
.LBB4:
	.loc 1 3975 21
	sw	zero,-32(s0)
	.loc 1 3981 36
	lui	a5,%hi(uxSchedulerSuspended)
	lw	a5,%lo(uxSchedulerSuspended)(a5)
	.loc 1 3981 75
	addi	a4,a5,-1
	.loc 1 3981 34
	lui	a5,%hi(uxSchedulerSuspended)
	sw	a4,%lo(uxSchedulerSuspended)(a5)
	.loc 1 3984 38
	lui	a5,%hi(uxSchedulerSuspended)
	lw	a5,%lo(uxSchedulerSuspended)(a5)
	.loc 1 3984 15
	bne	a5,zero,.L42
	.loc 1 3986 44
	lui	a5,%hi(uxCurrentNumberOfTasks)
	lw	a5,%lo(uxCurrentNumberOfTasks)(a5)
	.loc 1 3986 19
	beq	a5,zero,.L42
	.loc 1 3990 26
	j	.L43
.L47:
	.loc 1 3995 33
	lui	a5,%hi(xPendingReadyList)
	addi	a5,a5,%lo(xPendingReadyList)
	lw	a5,12(a5)
	.loc 1 3995 31
	lw	a5,12(a5)
	sw	a5,-20(s0)
.LBB5:
	.loc 1 3996 25
	lw	a5,-20(s0)
	lw	a5,40(a5)
	sw	a5,-36(s0)
	lw	a5,-20(s0)
	lw	a5,28(a5)
	lw	a4,-20(s0)
	lw	a4,32(a4)
	sw	a4,8(a5)
	lw	a5,-20(s0)
	lw	a5,32(a5)
	lw	a4,-20(s0)
	lw	a4,28(a4)
	sw	a4,4(a5)
	lw	a5,-36(s0)
	lw	a4,4(a5)
	lw	a5,-20(s0)
	addi	a5,a5,24
	bne	a4,a5,.L44
	.loc 1 3996 25 is_stmt 0 discriminator 1
	lw	a5,-20(s0)
	lw	a4,32(a5)
	lw	a5,-36(s0)
	sw	a4,4(a5)
.L44:
	.loc 1 3996 25 discriminator 3
	lw	a5,-20(s0)
	sw	zero,40(a5)
	lw	a5,-36(s0)
	lw	a5,0(a5)
	addi	a4,a5,-1
	lw	a5,-36(s0)
	sw	a4,0(a5)
.LBE5:
	.loc 1 3997 25 is_stmt 1
.LBB6:
	.loc 1 3998 25
	lw	a5,-20(s0)
	lw	a5,20(a5)
	sw	a5,-40(s0)
	lw	a5,-20(s0)
	lw	a5,8(a5)
	lw	a4,-20(s0)
	lw	a4,12(a4)
	sw	a4,8(a5)
	lw	a5,-20(s0)
	lw	a5,12(a5)
	lw	a4,-20(s0)
	lw	a4,8(a4)
	sw	a4,4(a5)
	lw	a5,-40(s0)
	lw	a4,4(a5)
	lw	a5,-20(s0)
	addi	a5,a5,4
	bne	a4,a5,.L45
	.loc 1 3998 25 is_stmt 0 discriminator 1
	lw	a5,-20(s0)
	lw	a4,12(a5)
	lw	a5,-40(s0)
	sw	a4,4(a5)
.L45:
	.loc 1 3998 25 discriminator 3
	lw	a5,-20(s0)
	sw	zero,20(a5)
	lw	a5,-40(s0)
	lw	a5,0(a5)
	addi	a4,a5,-1
	lw	a5,-40(s0)
	sw	a4,0(a5)
.LBE6:
	.loc 1 3999 25 is_stmt 1
	lw	a5,-20(s0)
	lw	a5,44(a5)
	li	a4,1
	sll	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	lw	a5,%lo(uxTopReadyPriority)(a5)
	or	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	sw	a4,%lo(uxTopReadyPriority)(a5)
.LBB7:
	lw	a5,-20(s0)
	lw	a4,44(a5)
	lui	a5,%hi(pxReadyTasksLists)
	addi	a3,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,4(a5)
	sw	a5,-44(s0)
	lw	a5,-20(s0)
	lw	a4,-44(s0)
	sw	a4,8(a5)
	lw	a5,-44(s0)
	lw	a4,8(a5)
	lw	a5,-20(s0)
	sw	a4,12(a5)
	lw	a5,-44(s0)
	lw	a5,8(a5)
	lw	a4,-20(s0)
	addi	a4,a4,4
	sw	a4,4(a5)
	lw	a5,-20(s0)
	addi	a4,a5,4
	lw	a5,-44(s0)
	sw	a4,8(a5)
	lw	a5,-20(s0)
	lw	a4,44(a5)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	lui	a4,%hi(pxReadyTasksLists)
	addi	a4,a4,%lo(pxReadyTasksLists)
	add	a4,a5,a4
	lw	a5,-20(s0)
	sw	a4,20(a5)
	lw	a5,-20(s0)
	lw	a4,44(a5)
	lui	a5,%hi(pxReadyTasksLists)
	addi	a3,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,0(a5)
	lw	a4,-20(s0)
	lw	a4,44(a4)
	addi	a3,a5,1
	lui	a5,%hi(pxReadyTasksLists)
	addi	a2,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a2,a5
	sw	a3,0(a5)
.LBE7:
	.loc 1 4005 38
	lw	a5,-20(s0)
	lw	a4,44(a5)
	.loc 1 4005 65
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	lw	a5,44(a5)
	.loc 1 4005 31
	bleu	a4,a5,.L43
	.loc 1 4007 59
	lui	a5,%hi(xYieldPendings)
	lw	a4,-32(s0)
	slli	a4,a4,2
	addi	a5,a5,%lo(xYieldPendings)
	add	a5,a4,a5
	li	a4,1
	sw	a4,0(a5)
.L43:
	.loc 1 3990 28
	lui	a5,%hi(xPendingReadyList)
	addi	a5,a5,%lo(xPendingReadyList)
	lw	a5,0(a5)
	.loc 1 3990 68
	bne	a5,zero,.L47
	.loc 1 4023 23
	lw	a5,-20(s0)
	beq	a5,zero,.L48
	.loc 1 4031 25
	call	prvResetNextTaskUnblockTime
.L48:
.LBB8:
	.loc 1 4044 36
	lui	a5,%hi(xPendedTicks)
	lw	a5,%lo(xPendedTicks)(a5)
	sw	a5,-24(s0)
	.loc 1 4046 27
	lw	a5,-24(s0)
	beq	a5,zero,.L49
.L51:
	.loc 1 4050 37
	call	xTaskIncrementTick
	mv	a5,a0
	.loc 1 4050 35 discriminator 1
	beq	a5,zero,.L50
	.loc 1 4054 63
	lui	a5,%hi(xYieldPendings)
	lw	a4,-32(s0)
	slli	a4,a4,2
	addi	a5,a5,%lo(xYieldPendings)
	add	a5,a4,a5
	li	a4,1
	sw	a4,0(a5)
.L50:
	.loc 1 4061 33
	lw	a5,-24(s0)
	addi	a5,a5,-1
	sw	a5,-24(s0)
	.loc 1 4062 52
	lw	a5,-24(s0)
	bne	a5,zero,.L51
	.loc 1 4064 42
	lui	a5,%hi(xPendedTicks)
	sw	zero,%lo(xPendedTicks)(a5)
.L49:
.LBE8:
	.loc 1 4072 39
	lui	a5,%hi(xYieldPendings)
	lw	a4,-32(s0)
	slli	a4,a4,2
	addi	a5,a5,%lo(xYieldPendings)
	add	a5,a4,a5
	lw	a5,0(a5)
.L42:
.LBE4:
	.loc 1 4097 9
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L52
	.loc 1 4097 9 is_stmt 0 discriminator 1
#APP
# 4097 "FreeRTOS-Kernel/tasks.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L52:
	.loc 1 4102 12 is_stmt 1
	lw	a5,-28(s0)
	.loc 1 4103 1
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
.LFE14:
	.size	xTaskResumeAll, .-xTaskResumeAll
	.align	2
	.globl	xTaskGetTickCount
	.type	xTaskGetTickCount, @function
xTaskGetTickCount:
.LFB15:
	.loc 1 4107 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 4115 16
	lui	a5,%hi(xTickCount)
	lw	a5,%lo(xTickCount)(a5)
	sw	a5,-20(s0)
	.loc 1 4121 12
	lw	a5,-20(s0)
	.loc 1 4122 1
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
.LFE15:
	.size	xTaskGetTickCount, .-xTaskGetTickCount
	.align	2
	.globl	xTaskGetTickCountFromISR
	.type	xTaskGetTickCountFromISR, @function
xTaskGetTickCountFromISR:
.LFB16:
	.loc 1 4126 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 4148 28
	sw	zero,-20(s0)
	.loc 1 4150 17
	lui	a5,%hi(xTickCount)
	lw	a5,%lo(xTickCount)(a5)
	sw	a5,-24(s0)
	.loc 1 4156 12
	lw	a5,-24(s0)
	.loc 1 4157 1
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
.LFE16:
	.size	xTaskGetTickCountFromISR, .-xTaskGetTickCountFromISR
	.align	2
	.globl	uxTaskGetNumberOfTasks
	.type	uxTaskGetNumberOfTasks, @function
uxTaskGetNumberOfTasks:
.LFB17:
	.loc 1 4161 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 4168 12
	lui	a5,%hi(uxCurrentNumberOfTasks)
	lw	a5,%lo(uxCurrentNumberOfTasks)(a5)
	.loc 1 4169 1
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
.LFE17:
	.size	uxTaskGetNumberOfTasks, .-uxTaskGetNumberOfTasks
	.align	2
	.globl	pcTaskGetName
	.type	pcTaskGetName, @function
pcTaskGetName:
.LFB18:
	.loc 1 4173 1
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
	.loc 1 4180 13
	lw	a5,-36(s0)
	bne	a5,zero,.L61
	.loc 1 4180 13 is_stmt 0 discriminator 1
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	j	.L62
.L61:
	.loc 1 4180 13 discriminator 2
	lw	a5,-36(s0)
.L62:
	.loc 1 4180 11 is_stmt 1 discriminator 4
	sw	a5,-20(s0)
	.loc 1 4185 12
	lw	a5,-20(s0)
	addi	a5,a5,52
	.loc 1 4186 1
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
	.size	pcTaskGetName, .-pcTaskGetName
	.align	2
	.globl	xTaskCatchUpTicks
	.type	xTaskCatchUpTicks, @function
xTaskCatchUpTicks:
.LFB19:
	.loc 1 4547 1
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
	.loc 1 4558 5
	call	vTaskSuspendAll
	.loc 1 4561 5
#APP
# 4561 "FreeRTOS-Kernel/tasks.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 4563 22
	lui	a5,%hi(xPendedTicks)
	lw	a4,%lo(xPendedTicks)(a5)
	lw	a5,-36(s0)
	add	a4,a4,a5
	lui	a5,%hi(xPendedTicks)
	sw	a4,%lo(xPendedTicks)(a5)
	.loc 1 4565 5
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L65
	.loc 1 4565 5 is_stmt 0 discriminator 1
#APP
# 4565 "FreeRTOS-Kernel/tasks.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L65:
	.loc 1 4566 22 is_stmt 1
	call	xTaskResumeAll
	sw	a0,-20(s0)
	.loc 1 4570 12
	lw	a5,-20(s0)
	.loc 1 4571 1
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
	.size	xTaskCatchUpTicks, .-xTaskCatchUpTicks
	.align	2
	.globl	xTaskIncrementTick
	.type	xTaskIncrementTick, @function
xTaskIncrementTick:
.LFB20:
	.loc 1 4671 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 1 4674 16
	sw	zero,-20(s0)
	.loc 1 4691 30
	lui	a5,%hi(uxSchedulerSuspended)
	lw	a5,%lo(uxSchedulerSuspended)(a5)
	.loc 1 4691 7
	bne	a5,zero,.L68
.LBB9:
	.loc 1 4695 55
	lui	a5,%hi(xTickCount)
	lw	a5,%lo(xTickCount)(a5)
	.loc 1 4695 26
	addi	a5,a5,1
	sw	a5,-24(s0)
	.loc 1 4699 20
	lui	a5,%hi(xTickCount)
	lw	a4,-24(s0)
	sw	a4,%lo(xTickCount)(a5)
	.loc 1 4701 11
	lw	a5,-24(s0)
	bne	a5,zero,.L69
.LBB10:
	.loc 1 4703 13
	lui	a5,%hi(pxDelayedTaskList)
	lw	a5,%lo(pxDelayedTaskList)(a5)
	sw	a5,-28(s0)
	lui	a5,%hi(pxOverflowDelayedTaskList)
	lw	a4,%lo(pxOverflowDelayedTaskList)(a5)
	lui	a5,%hi(pxDelayedTaskList)
	sw	a4,%lo(pxDelayedTaskList)(a5)
	lui	a5,%hi(pxOverflowDelayedTaskList)
	lw	a4,-28(s0)
	sw	a4,%lo(pxOverflowDelayedTaskList)(a5)
	lui	a5,%hi(xNumOfOverflows)
	lw	a5,%lo(xNumOfOverflows)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xNumOfOverflows)
	sw	a4,%lo(xNumOfOverflows)(a5)
	call	prvResetNextTaskUnblockTime
.L69:
.LBE10:
	.loc 1 4714 29
	lui	a5,%hi(xNextTaskUnblockTime)
	lw	a5,%lo(xNextTaskUnblockTime)(a5)
	.loc 1 4714 11
	lw	a4,-24(s0)
	bltu	a4,a5,.L77
.L76:
	.loc 1 4718 21
	lui	a5,%hi(pxDelayedTaskList)
	lw	a5,%lo(pxDelayedTaskList)(a5)
	lw	a5,0(a5)
	.loc 1 4718 19
	bne	a5,zero,.L71
	.loc 1 4725 42
	lui	a5,%hi(xNextTaskUnblockTime)
	li	a4,-1
	sw	a4,%lo(xNextTaskUnblockTime)(a5)
	.loc 1 4726 21
	j	.L77
.L71:
	.loc 1 4737 29
	lui	a5,%hi(pxDelayedTaskList)
	lw	a5,%lo(pxDelayedTaskList)(a5)
	lw	a5,12(a5)
	.loc 1 4737 27
	lw	a5,12(a5)
	sw	a5,-32(s0)
	.loc 1 4738 32
	lw	a5,-32(s0)
	lw	a5,4(a5)
	sw	a5,-36(s0)
	.loc 1 4740 23
	lw	a4,-24(s0)
	lw	a5,-36(s0)
	bgeu	a4,a5,.L72
	.loc 1 4747 46
	lui	a5,%hi(xNextTaskUnblockTime)
	lw	a4,-36(s0)
	sw	a4,%lo(xNextTaskUnblockTime)(a5)
	.loc 1 4748 25
	j	.L77
.L72:
.LBB11:
	.loc 1 4756 21
	lw	a5,-32(s0)
	lw	a5,20(a5)
	sw	a5,-40(s0)
	lw	a5,-32(s0)
	lw	a5,8(a5)
	lw	a4,-32(s0)
	lw	a4,12(a4)
	sw	a4,8(a5)
	lw	a5,-32(s0)
	lw	a5,12(a5)
	lw	a4,-32(s0)
	lw	a4,8(a4)
	sw	a4,4(a5)
	lw	a5,-40(s0)
	lw	a4,4(a5)
	lw	a5,-32(s0)
	addi	a5,a5,4
	bne	a4,a5,.L73
	.loc 1 4756 21 is_stmt 0 discriminator 1
	lw	a5,-32(s0)
	lw	a4,12(a5)
	lw	a5,-40(s0)
	sw	a4,4(a5)
.L73:
	.loc 1 4756 21 discriminator 3
	lw	a5,-32(s0)
	sw	zero,20(a5)
	lw	a5,-40(s0)
	lw	a5,0(a5)
	addi	a4,a5,-1
	lw	a5,-40(s0)
	sw	a4,0(a5)
.LBE11:
	.loc 1 4760 25 is_stmt 1
	lw	a5,-32(s0)
	lw	a5,40(a5)
	.loc 1 4760 23
	beq	a5,zero,.L74
.LBB12:
	.loc 1 4762 25
	lw	a5,-32(s0)
	lw	a5,40(a5)
	sw	a5,-44(s0)
	lw	a5,-32(s0)
	lw	a5,28(a5)
	lw	a4,-32(s0)
	lw	a4,32(a4)
	sw	a4,8(a5)
	lw	a5,-32(s0)
	lw	a5,32(a5)
	lw	a4,-32(s0)
	lw	a4,28(a4)
	sw	a4,4(a5)
	lw	a5,-44(s0)
	lw	a4,4(a5)
	lw	a5,-32(s0)
	addi	a5,a5,24
	bne	a4,a5,.L75
	.loc 1 4762 25 is_stmt 0 discriminator 1
	lw	a5,-32(s0)
	lw	a4,32(a5)
	lw	a5,-44(s0)
	sw	a4,4(a5)
.L75:
	.loc 1 4762 25 discriminator 3
	lw	a5,-32(s0)
	sw	zero,40(a5)
	lw	a5,-44(s0)
	lw	a5,0(a5)
	addi	a4,a5,-1
	lw	a5,-44(s0)
	sw	a4,0(a5)
.L74:
.LBE12:
	.loc 1 4771 21 is_stmt 1
	lw	a5,-32(s0)
	lw	a5,44(a5)
	li	a4,1
	sll	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	lw	a5,%lo(uxTopReadyPriority)(a5)
	or	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	sw	a4,%lo(uxTopReadyPriority)(a5)
.LBB13:
	lw	a5,-32(s0)
	lw	a4,44(a5)
	lui	a5,%hi(pxReadyTasksLists)
	addi	a3,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,4(a5)
	sw	a5,-48(s0)
	lw	a5,-32(s0)
	lw	a4,-48(s0)
	sw	a4,8(a5)
	lw	a5,-48(s0)
	lw	a4,8(a5)
	lw	a5,-32(s0)
	sw	a4,12(a5)
	lw	a5,-48(s0)
	lw	a5,8(a5)
	lw	a4,-32(s0)
	addi	a4,a4,4
	sw	a4,4(a5)
	lw	a5,-32(s0)
	addi	a4,a5,4
	lw	a5,-48(s0)
	sw	a4,8(a5)
	lw	a5,-32(s0)
	lw	a4,44(a5)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	lui	a4,%hi(pxReadyTasksLists)
	addi	a4,a4,%lo(pxReadyTasksLists)
	add	a4,a5,a4
	lw	a5,-32(s0)
	sw	a4,20(a5)
	lw	a5,-32(s0)
	lw	a4,44(a5)
	lui	a5,%hi(pxReadyTasksLists)
	addi	a3,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,0(a5)
	lw	a4,-32(s0)
	lw	a4,44(a4)
	addi	a3,a5,1
	lui	a5,%hi(pxReadyTasksLists)
	addi	a2,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a2,a5
	sw	a3,0(a5)
.LBE13:
	.loc 1 4718 19
	j	.L76
.L68:
.LBE9:
	.loc 1 4907 22
	lui	a5,%hi(xPendedTicks)
	lw	a5,%lo(xPendedTicks)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xPendedTicks)
	sw	a4,%lo(xPendedTicks)(a5)
.L77:
	.loc 1 4920 12
	lw	a5,-20(s0)
	.loc 1 4921 1
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
.LFE20:
	.size	xTaskIncrementTick, .-xTaskIncrementTick
	.align	2
	.globl	vTaskSwitchContext
	.type	vTaskSwitchContext, @function
vTaskSwitchContext:
.LFB21:
	.loc 1 5057 5
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 5060 34
	lui	a5,%hi(uxSchedulerSuspended)
	lw	a5,%lo(uxSchedulerSuspended)(a5)
	.loc 1 5060 11
	beq	a5,zero,.L80
	.loc 1 5064 33
	lui	a5,%hi(xYieldPendings)
	li	a4,1
	sw	a4,%lo(xYieldPendings)(a5)
	.loc 1 5139 5
	j	.L83
.L80:
	.loc 1 5068 33
	lui	a5,%hi(xYieldPendings)
	sw	zero,%lo(xYieldPendings)(a5)
.LBB14:
	.loc 1 5114 13
	lui	a5,%hi(uxTopReadyPriority)
	lw	a5,%lo(uxTopReadyPriority)(a5)
	mv	a0,a5
	call	__clzsi2
	mv	a5,a0
	.loc 1 5114 13 is_stmt 0 discriminator 1
	mv	a4,a5
	li	a5,31
	sub	a5,a5,a4
	sw	a5,-20(s0)
.LBB15:
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	lui	a4,%hi(pxReadyTasksLists)
	addi	a4,a4,%lo(pxReadyTasksLists)
	add	a5,a5,a4
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	lw	a5,4(a5)
	lw	a4,4(a5)
	lw	a5,-24(s0)
	sw	a4,4(a5)
	lw	a5,-24(s0)
	lw	a4,4(a5)
	lw	a5,-24(s0)
	addi	a5,a5,8
	bne	a4,a5,.L82
	lw	a5,-24(s0)
	lw	a4,12(a5)
	lw	a5,-24(s0)
	sw	a4,4(a5)
.L82:
	.loc 1 5114 13 discriminator 3
	lw	a5,-24(s0)
	lw	a5,4(a5)
	lw	a4,12(a5)
	lui	a5,%hi(pxCurrentTCB)
	sw	a4,%lo(pxCurrentTCB)(a5)
.LBE15:
.LBE14:
	.loc 1 5120 13 is_stmt 1
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
.L83:
	.loc 1 5139 5
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
.LFE21:
	.size	vTaskSwitchContext, .-vTaskSwitchContext
	.align	2
	.globl	vTaskPlaceOnEventList
	.type	vTaskPlaceOnEventList, @function
vTaskPlaceOnEventList:
.LFB22:
	.loc 1 5245 1
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
	.loc 1 5264 46
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	.loc 1 5264 5
	addi	a5,a5,24
	mv	a1,a5
	lw	a0,-20(s0)
	call	vListInsert
	.loc 1 5266 5
	li	a1,1
	lw	a0,-24(s0)
	call	prvAddCurrentTaskToDelayedList
	.loc 1 5269 1
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
.LFE22:
	.size	vTaskPlaceOnEventList, .-vTaskPlaceOnEventList
	.align	2
	.globl	vTaskPlaceOnUnorderedEventList
	.type	vTaskPlaceOnUnorderedEventList, @function
vTaskPlaceOnUnorderedEventList:
.LFB23:
	.loc 1 5275 1
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
	.loc 1 5287 5
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	lw	a3,-40(s0)
	li	a4,-2147483648
	or	a4,a3,a4
	sw	a4,24(a5)
.LBB16:
	.loc 1 5294 5
	lw	a5,-36(s0)
	lw	a5,4(a5)
	sw	a5,-20(s0)
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	lw	a4,-20(s0)
	sw	a4,28(a5)
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	lw	a4,-20(s0)
	lw	a4,8(a4)
	sw	a4,32(a5)
	lui	a5,%hi(pxCurrentTCB)
	lw	a4,%lo(pxCurrentTCB)(a5)
	lw	a5,-20(s0)
	lw	a5,8(a5)
	addi	a4,a4,24
	sw	a4,4(a5)
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	addi	a4,a5,24
	lw	a5,-20(s0)
	sw	a4,8(a5)
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	lw	a4,-36(s0)
	sw	a4,40(a5)
	lw	a5,-36(s0)
	lw	a5,0(a5)
	addi	a4,a5,1
	lw	a5,-36(s0)
	sw	a4,0(a5)
.LBE16:
	.loc 1 5296 5
	li	a1,1
	lw	a0,-44(s0)
	call	prvAddCurrentTaskToDelayedList
	.loc 1 5299 1
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
.LFE23:
	.size	vTaskPlaceOnUnorderedEventList, .-vTaskPlaceOnUnorderedEventList
	.align	2
	.globl	xTaskRemoveFromEventList
	.type	xTaskRemoveFromEventList, @function
xTaskRemoveFromEventList:
.LFB24:
	.loc 1 5342 1
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
	.loc 1 5364 22
	lw	a5,-52(s0)
	lw	a5,12(a5)
	.loc 1 5364 20
	lw	a5,12(a5)
	sw	a5,-24(s0)
.LBB17:
	.loc 1 5366 5
	lw	a5,-24(s0)
	lw	a5,40(a5)
	sw	a5,-28(s0)
	lw	a5,-24(s0)
	lw	a5,28(a5)
	lw	a4,-24(s0)
	lw	a4,32(a4)
	sw	a4,8(a5)
	lw	a5,-24(s0)
	lw	a5,32(a5)
	lw	a4,-24(s0)
	lw	a4,28(a4)
	sw	a4,4(a5)
	lw	a5,-28(s0)
	lw	a4,4(a5)
	lw	a5,-24(s0)
	addi	a5,a5,24
	bne	a4,a5,.L87
	.loc 1 5366 5 is_stmt 0 discriminator 1
	lw	a5,-24(s0)
	lw	a4,32(a5)
	lw	a5,-28(s0)
	sw	a4,4(a5)
.L87:
	.loc 1 5366 5 discriminator 3
	lw	a5,-24(s0)
	sw	zero,40(a5)
	lw	a5,-28(s0)
	lw	a5,0(a5)
	addi	a4,a5,-1
	lw	a5,-28(s0)
	sw	a4,0(a5)
.LBE17:
	.loc 1 5368 30 is_stmt 1
	lui	a5,%hi(uxSchedulerSuspended)
	lw	a5,%lo(uxSchedulerSuspended)(a5)
	.loc 1 5368 7
	bne	a5,zero,.L88
.LBB18:
	.loc 1 5370 9
	lw	a5,-24(s0)
	lw	a5,20(a5)
	sw	a5,-36(s0)
	lw	a5,-24(s0)
	lw	a5,8(a5)
	lw	a4,-24(s0)
	lw	a4,12(a4)
	sw	a4,8(a5)
	lw	a5,-24(s0)
	lw	a5,12(a5)
	lw	a4,-24(s0)
	lw	a4,8(a4)
	sw	a4,4(a5)
	lw	a5,-36(s0)
	lw	a4,4(a5)
	lw	a5,-24(s0)
	addi	a5,a5,4
	bne	a4,a5,.L89
	.loc 1 5370 9 is_stmt 0 discriminator 1
	lw	a5,-24(s0)
	lw	a4,12(a5)
	lw	a5,-36(s0)
	sw	a4,4(a5)
.L89:
	.loc 1 5370 9 discriminator 3
	lw	a5,-24(s0)
	sw	zero,20(a5)
	lw	a5,-36(s0)
	lw	a5,0(a5)
	addi	a4,a5,-1
	lw	a5,-36(s0)
	sw	a4,0(a5)
.LBE18:
	.loc 1 5371 9 is_stmt 1
	lw	a5,-24(s0)
	lw	a5,44(a5)
	li	a4,1
	sll	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	lw	a5,%lo(uxTopReadyPriority)(a5)
	or	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	sw	a4,%lo(uxTopReadyPriority)(a5)
.LBB19:
	lw	a5,-24(s0)
	lw	a4,44(a5)
	lui	a5,%hi(pxReadyTasksLists)
	addi	a3,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,4(a5)
	sw	a5,-40(s0)
	lw	a5,-24(s0)
	lw	a4,-40(s0)
	sw	a4,8(a5)
	lw	a5,-40(s0)
	lw	a4,8(a5)
	lw	a5,-24(s0)
	sw	a4,12(a5)
	lw	a5,-40(s0)
	lw	a5,8(a5)
	lw	a4,-24(s0)
	addi	a4,a4,4
	sw	a4,4(a5)
	lw	a5,-24(s0)
	addi	a4,a5,4
	lw	a5,-40(s0)
	sw	a4,8(a5)
	lw	a5,-24(s0)
	lw	a4,44(a5)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	lui	a4,%hi(pxReadyTasksLists)
	addi	a4,a4,%lo(pxReadyTasksLists)
	add	a4,a5,a4
	lw	a5,-24(s0)
	sw	a4,20(a5)
	lw	a5,-24(s0)
	lw	a4,44(a5)
	lui	a5,%hi(pxReadyTasksLists)
	addi	a3,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,0(a5)
	lw	a4,-24(s0)
	lw	a4,44(a4)
	addi	a3,a5,1
	lui	a5,%hi(pxReadyTasksLists)
	addi	a2,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a2,a5
	sw	a3,0(a5)
.LBE19:
	j	.L90
.L88:
.LBB20:
	.loc 1 5391 9
	lui	a5,%hi(xPendingReadyList)
	addi	a5,a5,%lo(xPendingReadyList)
	lw	a5,4(a5)
	sw	a5,-32(s0)
	lw	a5,-24(s0)
	lw	a4,-32(s0)
	sw	a4,28(a5)
	lw	a5,-32(s0)
	lw	a4,8(a5)
	lw	a5,-24(s0)
	sw	a4,32(a5)
	lw	a5,-32(s0)
	lw	a5,8(a5)
	lw	a4,-24(s0)
	addi	a4,a4,24
	sw	a4,4(a5)
	lw	a5,-24(s0)
	addi	a4,a5,24
	lw	a5,-32(s0)
	sw	a4,8(a5)
	lw	a5,-24(s0)
	lui	a4,%hi(xPendingReadyList)
	addi	a4,a4,%lo(xPendingReadyList)
	sw	a4,40(a5)
	lui	a5,%hi(xPendingReadyList)
	addi	a5,a5,%lo(xPendingReadyList)
	lw	a5,0(a5)
	addi	a4,a5,1
	lui	a5,%hi(xPendingReadyList)
	addi	a5,a5,%lo(xPendingReadyList)
	sw	a4,0(a5)
.L90:
.LBE20:
	.loc 1 5396 27
	lw	a5,-24(s0)
	lw	a4,44(a5)
	.loc 1 5396 54
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	lw	a5,44(a5)
	.loc 1 5396 11
	bleu	a4,a5,.L91
	.loc 1 5401 21
	li	a5,1
	sw	a5,-20(s0)
	.loc 1 5405 33
	lui	a5,%hi(xYieldPendings)
	li	a4,1
	sw	a4,%lo(xYieldPendings)(a5)
	j	.L92
.L91:
	.loc 1 5409 21
	sw	zero,-20(s0)
.L92:
	.loc 1 5430 12
	lw	a5,-20(s0)
	.loc 1 5431 1
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
.LFE24:
	.size	xTaskRemoveFromEventList, .-xTaskRemoveFromEventList
	.align	2
	.globl	vTaskRemoveFromUnorderedEventList
	.type	vTaskRemoveFromUnorderedEventList, @function
vTaskRemoveFromUnorderedEventList:
.LFB25:
	.loc 1 5436 1
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
	.loc 1 5446 5
	lw	a4,-40(s0)
	li	a5,-2147483648
	or	a4,a4,a5
	lw	a5,-36(s0)
	sw	a4,0(a5)
	.loc 1 5453 20
	lw	a5,-36(s0)
	lw	a5,12(a5)
	sw	a5,-20(s0)
.LBB21:
	.loc 1 5455 5
	lw	a5,-36(s0)
	lw	a5,16(a5)
	sw	a5,-24(s0)
	lw	a5,-36(s0)
	lw	a5,4(a5)
	lw	a4,-36(s0)
	lw	a4,8(a4)
	sw	a4,8(a5)
	lw	a5,-36(s0)
	lw	a5,8(a5)
	lw	a4,-36(s0)
	lw	a4,4(a4)
	sw	a4,4(a5)
	lw	a5,-24(s0)
	lw	a5,4(a5)
	lw	a4,-36(s0)
	bne	a4,a5,.L95
	.loc 1 5455 5 is_stmt 0 discriminator 1
	lw	a5,-36(s0)
	lw	a4,8(a5)
	lw	a5,-24(s0)
	sw	a4,4(a5)
.L95:
	.loc 1 5455 5 discriminator 3
	lw	a5,-36(s0)
	sw	zero,16(a5)
	lw	a5,-24(s0)
	lw	a5,0(a5)
	addi	a4,a5,-1
	lw	a5,-24(s0)
	sw	a4,0(a5)
.LBE21:
.LBB22:
	.loc 1 5474 5 is_stmt 1
	lw	a5,-20(s0)
	lw	a5,20(a5)
	sw	a5,-28(s0)
	lw	a5,-20(s0)
	lw	a5,8(a5)
	lw	a4,-20(s0)
	lw	a4,12(a4)
	sw	a4,8(a5)
	lw	a5,-20(s0)
	lw	a5,12(a5)
	lw	a4,-20(s0)
	lw	a4,8(a4)
	sw	a4,4(a5)
	lw	a5,-28(s0)
	lw	a4,4(a5)
	lw	a5,-20(s0)
	addi	a5,a5,4
	bne	a4,a5,.L96
	.loc 1 5474 5 is_stmt 0 discriminator 1
	lw	a5,-20(s0)
	lw	a4,12(a5)
	lw	a5,-28(s0)
	sw	a4,4(a5)
.L96:
	.loc 1 5474 5 discriminator 3
	lw	a5,-20(s0)
	sw	zero,20(a5)
	lw	a5,-28(s0)
	lw	a5,0(a5)
	addi	a4,a5,-1
	lw	a5,-28(s0)
	sw	a4,0(a5)
.LBE22:
	.loc 1 5475 5 is_stmt 1
	lw	a5,-20(s0)
	lw	a5,44(a5)
	li	a4,1
	sll	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	lw	a5,%lo(uxTopReadyPriority)(a5)
	or	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	sw	a4,%lo(uxTopReadyPriority)(a5)
.LBB23:
	lw	a5,-20(s0)
	lw	a4,44(a5)
	lui	a5,%hi(pxReadyTasksLists)
	addi	a3,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,4(a5)
	sw	a5,-32(s0)
	lw	a5,-20(s0)
	lw	a4,-32(s0)
	sw	a4,8(a5)
	lw	a5,-32(s0)
	lw	a4,8(a5)
	lw	a5,-20(s0)
	sw	a4,12(a5)
	lw	a5,-32(s0)
	lw	a5,8(a5)
	lw	a4,-20(s0)
	addi	a4,a4,4
	sw	a4,4(a5)
	lw	a5,-20(s0)
	addi	a4,a5,4
	lw	a5,-32(s0)
	sw	a4,8(a5)
	lw	a5,-20(s0)
	lw	a4,44(a5)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	lui	a4,%hi(pxReadyTasksLists)
	addi	a4,a4,%lo(pxReadyTasksLists)
	add	a4,a5,a4
	lw	a5,-20(s0)
	sw	a4,20(a5)
	lw	a5,-20(s0)
	lw	a4,44(a5)
	lui	a5,%hi(pxReadyTasksLists)
	addi	a3,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,0(a5)
	lw	a4,-20(s0)
	lw	a4,44(a4)
	addi	a3,a5,1
	lui	a5,%hi(pxReadyTasksLists)
	addi	a2,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a2,a5
	sw	a3,0(a5)
.LBE23:
	.loc 1 5479 27
	lw	a5,-20(s0)
	lw	a4,44(a5)
	.loc 1 5479 54
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	lw	a5,44(a5)
	.loc 1 5479 11
	bleu	a4,a5,.L98
	.loc 1 5485 33
	lui	a5,%hi(xYieldPendings)
	li	a4,1
	sw	a4,%lo(xYieldPendings)(a5)
.L98:
	.loc 1 5503 1
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
	.size	vTaskRemoveFromUnorderedEventList, .-vTaskRemoveFromUnorderedEventList
	.align	2
	.globl	vTaskSetTimeOutState
	.type	vTaskSetTimeOutState, @function
vTaskSetTimeOutState:
.LFB26:
	.loc 1 5507 1
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
	.loc 1 5511 5
#APP
# 5511 "FreeRTOS-Kernel/tasks.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 5513 35
	lui	a5,%hi(xNumOfOverflows)
	lw	a4,%lo(xNumOfOverflows)(a5)
	lw	a5,-20(s0)
	sw	a4,0(a5)
	.loc 1 5514 36
	lui	a5,%hi(xTickCount)
	lw	a4,%lo(xTickCount)(a5)
	lw	a5,-20(s0)
	sw	a4,4(a5)
	.loc 1 5516 5
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L101
	.loc 1 5516 5 is_stmt 0 discriminator 1
#APP
# 5516 "FreeRTOS-Kernel/tasks.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L101:
	.loc 1 5519 1 is_stmt 1
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
.LFE26:
	.size	vTaskSetTimeOutState, .-vTaskSetTimeOutState
	.align	2
	.globl	vTaskInternalSetTimeOutState
	.type	vTaskInternalSetTimeOutState, @function
vTaskInternalSetTimeOutState:
.LFB27:
	.loc 1 5523 1
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
	.loc 1 5527 31
	lui	a5,%hi(xNumOfOverflows)
	lw	a4,%lo(xNumOfOverflows)(a5)
	lw	a5,-20(s0)
	sw	a4,0(a5)
	.loc 1 5528 32
	lui	a5,%hi(xTickCount)
	lw	a4,%lo(xTickCount)(a5)
	lw	a5,-20(s0)
	sw	a4,4(a5)
	.loc 1 5531 1
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
.LFE27:
	.size	vTaskInternalSetTimeOutState, .-vTaskInternalSetTimeOutState
	.align	2
	.globl	xTaskCheckForTimeOut
	.type	xTaskCheckForTimeOut, @function
xTaskCheckForTimeOut:
.LFB28:
	.loc 1 5536 1
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
	.loc 1 5544 5
#APP
# 5544 "FreeRTOS-Kernel/tasks.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
.LBB24:
	.loc 1 5547 26
	lui	a5,%hi(xTickCount)
	lw	a5,%lo(xTickCount)(a5)
	sw	a5,-24(s0)
	.loc 1 5548 68
	lw	a5,-36(s0)
	lw	a5,4(a5)
	.loc 1 5548 26
	lw	a4,-24(s0)
	sub	a5,a4,a5
	sw	a5,-28(s0)
	.loc 1 5572 43
	lw	a5,-36(s0)
	lw	a4,0(a5)
	.loc 1 5572 31
	lui	a5,%hi(xNumOfOverflows)
	lw	a5,%lo(xNumOfOverflows)(a5)
	.loc 1 5572 11
	beq	a4,a5,.L104
	.loc 1 5572 95 discriminator 1
	lw	a5,-36(s0)
	lw	a5,4(a5)
	.loc 1 5572 62 discriminator 1
	lw	a4,-24(s0)
	bltu	a4,a5,.L104
	.loc 1 5579 21
	li	a5,1
	sw	a5,-20(s0)
	.loc 1 5580 28
	lw	a5,-40(s0)
	sw	zero,0(a5)
	j	.L105
.L104:
	.loc 1 5582 33
	lw	a5,-40(s0)
	lw	a5,0(a5)
	.loc 1 5582 16
	lw	a4,-28(s0)
	bgeu	a4,a5,.L106
	.loc 1 5585 13
	lw	a5,-40(s0)
	lw	a4,0(a5)
	.loc 1 5585 28
	lw	a5,-28(s0)
	sub	a4,a4,a5
	lw	a5,-40(s0)
	sw	a4,0(a5)
	.loc 1 5586 13
	lw	a0,-36(s0)
	call	vTaskInternalSetTimeOutState
	.loc 1 5587 21
	sw	zero,-20(s0)
	j	.L105
.L106:
	.loc 1 5591 28
	lw	a5,-40(s0)
	sw	zero,0(a5)
	.loc 1 5592 21
	li	a5,1
	sw	a5,-20(s0)
.L105:
.LBE24:
	.loc 1 5595 5
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L107
	.loc 1 5595 5 is_stmt 0 discriminator 1
#APP
# 5595 "FreeRTOS-Kernel/tasks.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L107:
	.loc 1 5599 12 is_stmt 1
	lw	a5,-20(s0)
	.loc 1 5600 1
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
	.size	xTaskCheckForTimeOut, .-xTaskCheckForTimeOut
	.align	2
	.globl	vTaskMissedYield
	.type	vTaskMissedYield, @function
vTaskMissedYield:
.LFB29:
	.loc 1 5604 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 5608 41
	lui	a5,%hi(xYieldPendings)
	li	a4,1
	sw	a4,%lo(xYieldPendings)(a5)
	.loc 1 5611 1
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
.LFE29:
	.size	vTaskMissedYield, .-vTaskMissedYield
	.align	2
	.type	prvIdleTask, @function
prvIdleTask:
.LFB30:
	.loc 1 5749 1
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
.L111:
	.loc 1 5773 9
	call	prvCheckTasksWaitingTermination
	.loc 1 5781 13 discriminator 1
#APP
# 5781 "FreeRTOS-Kernel/tasks.c" 1
	ecall
# 0 "" 2
	.loc 1 5773 9
#NO_APP
	nop
	j	.L111
	.cfi_endproc
.LFE30:
	.size	prvIdleTask, .-prvIdleTask
	.align	2
	.type	prvInitialiseTaskLists, @function
prvInitialiseTaskLists:
.LFB31:
	.loc 1 6012 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 6015 21
	sw	zero,-20(s0)
	.loc 1 6015 5
	j	.L113
.L114:
	.loc 1 6017 9
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	lui	a4,%hi(pxReadyTasksLists)
	addi	a4,a4,%lo(pxReadyTasksLists)
	add	a5,a5,a4
	mv	a0,a5
	call	vListInitialise
	.loc 1 6015 104 discriminator 3
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L113:
	.loc 1 6015 54 discriminator 1
	lw	a5,-20(s0)
	beq	a5,zero,.L114
	.loc 1 6020 5
	lui	a5,%hi(xDelayedTaskList1)
	addi	a0,a5,%lo(xDelayedTaskList1)
	call	vListInitialise
	.loc 1 6021 5
	lui	a5,%hi(xDelayedTaskList2)
	addi	a0,a5,%lo(xDelayedTaskList2)
	call	vListInitialise
	.loc 1 6022 5
	lui	a5,%hi(xPendingReadyList)
	addi	a0,a5,%lo(xPendingReadyList)
	call	vListInitialise
	.loc 1 6038 23
	lui	a5,%hi(pxDelayedTaskList)
	lui	a4,%hi(xDelayedTaskList1)
	addi	a4,a4,%lo(xDelayedTaskList1)
	sw	a4,%lo(pxDelayedTaskList)(a5)
	.loc 1 6039 31
	lui	a5,%hi(pxOverflowDelayedTaskList)
	lui	a4,%hi(xDelayedTaskList2)
	addi	a4,a4,%lo(xDelayedTaskList2)
	sw	a4,%lo(pxOverflowDelayedTaskList)(a5)
	.loc 1 6040 1
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
.LFE31:
	.size	prvInitialiseTaskLists, .-prvInitialiseTaskLists
	.align	2
	.type	prvCheckTasksWaitingTermination, @function
prvCheckTasksWaitingTermination:
.LFB32:
	.loc 1 6044 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 6116 1
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
.LFE32:
	.size	prvCheckTasksWaitingTermination, .-prvCheckTasksWaitingTermination
	.align	2
	.type	prvResetNextTaskUnblockTime, @function
prvResetNextTaskUnblockTime:
.LFB33:
	.loc 1 6457 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 6458 9
	lui	a5,%hi(pxDelayedTaskList)
	lw	a5,%lo(pxDelayedTaskList)(a5)
	lw	a5,0(a5)
	.loc 1 6458 7
	bne	a5,zero,.L117
	.loc 1 6464 30
	lui	a5,%hi(xNextTaskUnblockTime)
	li	a4,-1
	sw	a4,%lo(xNextTaskUnblockTime)(a5)
	.loc 1 6474 1
	j	.L119
.L117:
	.loc 1 6472 32
	lui	a5,%hi(pxDelayedTaskList)
	lw	a5,%lo(pxDelayedTaskList)(a5)
	lw	a5,12(a5)
	lw	a4,0(a5)
	.loc 1 6472 30
	lui	a5,%hi(xNextTaskUnblockTime)
	sw	a4,%lo(xNextTaskUnblockTime)(a5)
.L119:
	.loc 1 6474 1
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
.LFE33:
	.size	prvResetNextTaskUnblockTime, .-prvResetNextTaskUnblockTime
	.align	2
	.globl	xTaskGetCurrentTaskHandle
	.type	xTaskGetCurrentTaskHandle, @function
xTaskGetCurrentTaskHandle:
.LFB34:
	.loc 1 6481 9
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 6489 21
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	sw	a5,-20(s0)
	.loc 1 6493 20
	lw	a5,-20(s0)
	.loc 1 6494 9
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
.LFE34:
	.size	xTaskGetCurrentTaskHandle, .-xTaskGetCurrentTaskHandle
	.align	2
	.globl	xTaskGetCurrentTaskHandleForCore
	.type	xTaskGetCurrentTaskHandleForCore, @function
xTaskGetCurrentTaskHandleForCore:
.LFB35:
	.loc 1 6516 5
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
	.loc 1 6517 22
	sw	zero,-20(s0)
	.loc 1 6521 11
	lw	a5,-36(s0)
	bne	a5,zero,.L123
	.loc 1 6524 25
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	sw	a5,-20(s0)
.L123:
	.loc 1 6532 16
	lw	a5,-20(s0)
	.loc 1 6533 5
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
.LFE35:
	.size	xTaskGetCurrentTaskHandleForCore, .-xTaskGetCurrentTaskHandleForCore
	.align	2
	.globl	uxTaskResetEventItemValue
	.type	uxTaskResetEventItemValue, @function
uxTaskResetEventItemValue:
.LFB36:
	.loc 1 7570 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 7575 16
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	.loc 1 7575 14
	lw	a5,24(a5)
	sw	a5,-20(s0)
	.loc 1 7579 5
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	lw	a4,44(a5)
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	li	a3,1
	sub	a4,a3,a4
	sw	a4,24(a5)
	.loc 1 7583 12
	lw	a5,-20(s0)
	.loc 1 7584 1
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
.LFE36:
	.size	uxTaskResetEventItemValue, .-uxTaskResetEventItemValue
	.align	2
	.globl	ulTaskGenericNotifyTake
	.type	ulTaskGenericNotifyTake, @function
ulTaskGenericNotifyTake:
.LFB37:
	.loc 1 7617 5
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
	.loc 1 7619 37
	sw	zero,-20(s0)
	.loc 1 7627 9
	call	vTaskSuspendAll
	.loc 1 7633 13
#APP
# 7633 "FreeRTOS-Kernel/tasks.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 7636 33
	lui	a5,%hi(pxCurrentTCB)
	lw	a4,%lo(pxCurrentTCB)(a5)
	.loc 1 7636 50
	lw	a5,-36(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,4(a5)
	.loc 1 7636 19
	bne	a5,zero,.L128
	.loc 1 7639 33
	lui	a5,%hi(pxCurrentTCB)
	lw	a4,%lo(pxCurrentTCB)(a5)
	.loc 1 7639 68
	lw	a5,-36(s0)
	add	a5,a4,a5
	li	a4,1
	sb	a4,72(a5)
	.loc 1 7641 23
	lw	a5,-44(s0)
	beq	a5,zero,.L128
	.loc 1 7643 38
	li	a5,1
	sw	a5,-20(s0)
.L128:
	.loc 1 7655 13
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L129
	.loc 1 7655 13 is_stmt 0 discriminator 1
#APP
# 7655 "FreeRTOS-Kernel/tasks.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L129:
	.loc 1 7660 15 is_stmt 1
	lw	a4,-20(s0)
	li	a5,1
	bne	a4,a5,.L130
	.loc 1 7663 17
	li	a1,1
	lw	a0,-44(s0)
	call	prvAddCurrentTaskToDelayedList
.L130:
	.loc 1 7670 27
	call	xTaskResumeAll
	sw	a0,-24(s0)
	.loc 1 7673 11
	lw	a4,-20(s0)
	li	a5,1
	bne	a4,a5,.L131
	.loc 1 7673 40 discriminator 1
	lw	a5,-24(s0)
	bne	a5,zero,.L131
	.loc 1 7675 13
#APP
# 7675 "FreeRTOS-Kernel/tasks.c" 1
	ecall
# 0 "" 2
#NO_APP
.L131:
	.loc 1 7682 9
#APP
# 7682 "FreeRTOS-Kernel/tasks.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 7685 36
	lui	a5,%hi(pxCurrentTCB)
	lw	a4,%lo(pxCurrentTCB)(a5)
	.loc 1 7685 22
	lw	a5,-36(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,4(a5)
	sw	a5,-28(s0)
	.loc 1 7687 15
	lw	a5,-28(s0)
	beq	a5,zero,.L132
	.loc 1 7689 19
	lw	a5,-40(s0)
	beq	a5,zero,.L133
	.loc 1 7691 33
	lui	a5,%hi(pxCurrentTCB)
	lw	a4,%lo(pxCurrentTCB)(a5)
	.loc 1 7691 70
	lw	a5,-36(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	sw	zero,4(a5)
	j	.L132
.L133:
	.loc 1 7695 33
	lui	a5,%hi(pxCurrentTCB)
	lw	a3,%lo(pxCurrentTCB)(a5)
	.loc 1 7695 81
	lw	a5,-28(s0)
	addi	a4,a5,-1
	.loc 1 7695 70
	lw	a5,-36(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,4(a5)
.L132:
	.loc 1 7703 25
	lui	a5,%hi(pxCurrentTCB)
	lw	a4,%lo(pxCurrentTCB)(a5)
	.loc 1 7703 60
	lw	a5,-36(s0)
	add	a5,a4,a5
	sb	zero,72(a5)
	.loc 1 7705 9
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L134
	.loc 1 7705 9 is_stmt 0 discriminator 1
#APP
# 7705 "FreeRTOS-Kernel/tasks.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L134:
	.loc 1 7709 16 is_stmt 1
	lw	a5,-28(s0)
	.loc 1 7710 5
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
.LFE37:
	.size	ulTaskGenericNotifyTake, .-ulTaskGenericNotifyTake
	.align	2
	.globl	xTaskGenericNotifyWait
	.type	xTaskGenericNotifyWait, @function
xTaskGenericNotifyWait:
.LFB38:
	.loc 1 7722 5
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	ra,60(sp)
	sw	s0,56(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	a3,-48(s0)
	sw	a4,-52(s0)
	.loc 1 7723 46
	sw	zero,-24(s0)
	.loc 1 7731 9
	call	vTaskSuspendAll
	.loc 1 7736 13
#APP
# 7736 "FreeRTOS-Kernel/tasks.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 7739 33
	lui	a5,%hi(pxCurrentTCB)
	lw	a4,%lo(pxCurrentTCB)(a5)
	.loc 1 7739 48
	lw	a5,-36(s0)
	add	a5,a4,a5
	lbu	a5,72(a5)
	andi	a4,a5,0xff
	.loc 1 7739 19
	li	a5,2
	beq	a4,a5,.L137
	.loc 1 7744 33
	lui	a5,%hi(pxCurrentTCB)
	lw	a4,%lo(pxCurrentTCB)(a5)
	.loc 1 7744 50
	lw	a5,-36(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a3,4(a5)
	.loc 1 7744 73
	lw	a5,-40(s0)
	not	a5,a5
	.loc 1 7744 70
	and	a3,a3,a5
	lw	a5,-36(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	sw	a3,4(a5)
	.loc 1 7747 33
	lui	a5,%hi(pxCurrentTCB)
	lw	a4,%lo(pxCurrentTCB)(a5)
	.loc 1 7747 68
	lw	a5,-36(s0)
	add	a5,a4,a5
	li	a4,1
	sb	a4,72(a5)
	.loc 1 7749 23
	lw	a5,-52(s0)
	beq	a5,zero,.L137
	.loc 1 7751 38
	li	a5,1
	sw	a5,-24(s0)
.L137:
	.loc 1 7763 13
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L138
	.loc 1 7763 13 is_stmt 0 discriminator 1
#APP
# 7763 "FreeRTOS-Kernel/tasks.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L138:
	.loc 1 7768 15 is_stmt 1
	lw	a4,-24(s0)
	li	a5,1
	bne	a4,a5,.L139
	.loc 1 7771 17
	li	a1,1
	lw	a0,-52(s0)
	call	prvAddCurrentTaskToDelayedList
.L139:
	.loc 1 7778 27
	call	xTaskResumeAll
	sw	a0,-28(s0)
	.loc 1 7781 11
	lw	a4,-24(s0)
	li	a5,1
	bne	a4,a5,.L140
	.loc 1 7781 40 discriminator 1
	lw	a5,-28(s0)
	bne	a5,zero,.L140
	.loc 1 7783 13
#APP
# 7783 "FreeRTOS-Kernel/tasks.c" 1
	ecall
# 0 "" 2
#NO_APP
.L140:
	.loc 1 7790 9
#APP
# 7790 "FreeRTOS-Kernel/tasks.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 7794 15
	lw	a5,-48(s0)
	beq	a5,zero,.L141
	.loc 1 7798 53
	lui	a5,%hi(pxCurrentTCB)
	lw	a4,%lo(pxCurrentTCB)(a5)
	.loc 1 7798 70
	lw	a5,-36(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,4(a5)
	.loc 1 7798 39
	lw	a5,-48(s0)
	sw	a4,0(a5)
.L141:
	.loc 1 7805 29
	lui	a5,%hi(pxCurrentTCB)
	lw	a4,%lo(pxCurrentTCB)(a5)
	.loc 1 7805 44
	lw	a5,-36(s0)
	add	a5,a4,a5
	lbu	a5,72(a5)
	andi	a4,a5,0xff
	.loc 1 7805 15
	li	a5,2
	beq	a4,a5,.L142
	.loc 1 7808 25
	sw	zero,-20(s0)
	j	.L143
.L142:
	.loc 1 7814 29
	lui	a5,%hi(pxCurrentTCB)
	lw	a4,%lo(pxCurrentTCB)(a5)
	.loc 1 7814 46
	lw	a5,-36(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a3,4(a5)
	.loc 1 7814 69
	lw	a5,-44(s0)
	not	a5,a5
	.loc 1 7814 66
	and	a3,a3,a5
	lw	a5,-36(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	sw	a3,4(a5)
	.loc 1 7815 25
	li	a5,1
	sw	a5,-20(s0)
.L143:
	.loc 1 7818 25
	lui	a5,%hi(pxCurrentTCB)
	lw	a4,%lo(pxCurrentTCB)(a5)
	.loc 1 7818 60
	lw	a5,-36(s0)
	add	a5,a4,a5
	sb	zero,72(a5)
	.loc 1 7820 9
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L144
	.loc 1 7820 9 is_stmt 0 discriminator 1
#APP
# 7820 "FreeRTOS-Kernel/tasks.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L144:
	.loc 1 7824 16 is_stmt 1
	lw	a5,-20(s0)
	.loc 1 7825 5
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
.LFE38:
	.size	xTaskGenericNotifyWait, .-xTaskGenericNotifyWait
	.align	2
	.globl	xTaskGenericNotify
	.type	xTaskGenericNotify, @function
xTaskGenericNotify:
.LFB39:
	.loc 1 7837 5
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sw	ra,76(sp)
	sw	s0,72(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,80
	.cfi_def_cfa 8, 0
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	sw	a2,-60(s0)
	sw	a3,-64(s0)
	sw	a4,-68(s0)
	.loc 1 7839 20
	li	a5,1
	sw	a5,-20(s0)
	.loc 1 7846 15
	lw	a5,-52(s0)
	sw	a5,-24(s0)
	.loc 1 7848 9
#APP
# 7848 "FreeRTOS-Kernel/tasks.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 7850 15
	lw	a5,-68(s0)
	beq	a5,zero,.L147
	.loc 1 7852 71
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,4(a5)
	.loc 1 7852 47
	lw	a5,-68(s0)
	sw	a4,0(a5)
.L147:
	.loc 1 7855 35
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	lbu	a5,72(a5)
	sb	a5,-25(s0)
	.loc 1 7857 53
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	li	a4,2
	sb	a4,72(a5)
	.loc 1 7859 13
	lw	a4,-64(s0)
	li	a5,4
	bgtu	a4,a5,.L162
	lw	a5,-64(s0)
	slli	a4,a5,2
	lui	a5,%hi(.L150)
	addi	a5,a5,%lo(.L150)
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L150:
	.word	.L163
	.word	.L153
	.word	.L152
	.word	.L151
	.word	.L149
	.text
.L153:
	.loc 1 7862 43
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,4(a5)
	.loc 1 7862 63
	lw	a5,-60(s0)
	or	a4,a4,a5
	lw	a3,-24(s0)
	lw	a5,-56(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,4(a5)
	.loc 1 7863 21
	j	.L155
.L152:
	.loc 1 7866 45
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,4(a5)
	.loc 1 7866 66
	addi	a4,a5,1
	lw	a3,-24(s0)
	lw	a5,-56(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,4(a5)
	.loc 1 7867 21
	j	.L155
.L151:
	.loc 1 7870 63
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-60(s0)
	sw	a4,4(a5)
	.loc 1 7871 21
	j	.L155
.L149:
	.loc 1 7875 23
	lbu	a4,-25(s0)
	li	a5,2
	beq	a4,a5,.L156
	.loc 1 7877 67
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-60(s0)
	sw	a4,4(a5)
	.loc 1 7885 21
	j	.L155
.L156:
	.loc 1 7882 33
	sw	zero,-20(s0)
	.loc 1 7885 21
	j	.L155
.L162:
	.loc 1 7900 21
	nop
	j	.L155
.L163:
	.loc 1 7891 21
	nop
.L155:
	.loc 1 7907 15
	lbu	a4,-25(s0)
	li	a5,1
	bne	a4,a5,.L158
.LBB25:
	.loc 1 7909 17
	lw	a5,-24(s0)
	lw	a5,20(a5)
	sw	a5,-32(s0)
	lw	a5,-24(s0)
	lw	a5,8(a5)
	lw	a4,-24(s0)
	lw	a4,12(a4)
	sw	a4,8(a5)
	lw	a5,-24(s0)
	lw	a5,12(a5)
	lw	a4,-24(s0)
	lw	a4,8(a4)
	sw	a4,4(a5)
	lw	a5,-32(s0)
	lw	a4,4(a5)
	lw	a5,-24(s0)
	addi	a5,a5,4
	bne	a4,a5,.L159
	.loc 1 7909 17 is_stmt 0 discriminator 1
	lw	a5,-24(s0)
	lw	a4,12(a5)
	lw	a5,-32(s0)
	sw	a4,4(a5)
.L159:
	.loc 1 7909 17 discriminator 3
	lw	a5,-24(s0)
	sw	zero,20(a5)
	lw	a5,-32(s0)
	lw	a5,0(a5)
	addi	a4,a5,-1
	lw	a5,-32(s0)
	sw	a4,0(a5)
.LBE25:
	.loc 1 7910 17 is_stmt 1
	lw	a5,-24(s0)
	lw	a5,44(a5)
	li	a4,1
	sll	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	lw	a5,%lo(uxTopReadyPriority)(a5)
	or	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	sw	a4,%lo(uxTopReadyPriority)(a5)
.LBB26:
	lw	a5,-24(s0)
	lw	a4,44(a5)
	lui	a5,%hi(pxReadyTasksLists)
	addi	a3,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,4(a5)
	sw	a5,-36(s0)
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	sw	a4,8(a5)
	lw	a5,-36(s0)
	lw	a4,8(a5)
	lw	a5,-24(s0)
	sw	a4,12(a5)
	lw	a5,-36(s0)
	lw	a5,8(a5)
	lw	a4,-24(s0)
	addi	a4,a4,4
	sw	a4,4(a5)
	lw	a5,-24(s0)
	addi	a4,a5,4
	lw	a5,-36(s0)
	sw	a4,8(a5)
	lw	a5,-24(s0)
	lw	a4,44(a5)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	lui	a4,%hi(pxReadyTasksLists)
	addi	a4,a4,%lo(pxReadyTasksLists)
	add	a4,a5,a4
	lw	a5,-24(s0)
	sw	a4,20(a5)
	lw	a5,-24(s0)
	lw	a4,44(a5)
	lui	a5,%hi(pxReadyTasksLists)
	addi	a3,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,0(a5)
	lw	a4,-24(s0)
	lw	a4,44(a4)
	addi	a3,a5,1
	lui	a5,%hi(pxReadyTasksLists)
	addi	a2,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a2,a5
	sw	a3,0(a5)
.L158:
.LBE26:
	.loc 1 7940 9
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L160
	.loc 1 7940 9 is_stmt 0 discriminator 1
#APP
# 7940 "FreeRTOS-Kernel/tasks.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L160:
	.loc 1 7944 16 is_stmt 1
	lw	a5,-20(s0)
	.loc 1 7945 5
	mv	a0,a5
	lw	ra,76(sp)
	.cfi_restore 1
	lw	s0,72(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 80
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE39:
	.size	xTaskGenericNotify, .-xTaskGenericNotify
	.align	2
	.globl	xTaskGenericNotifyFromISR
	.type	xTaskGenericNotifyFromISR, @function
xTaskGenericNotifyFromISR:
.LFB40:
	.loc 1 7958 5
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sw	ra,76(sp)
	sw	s0,72(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,80
	.cfi_def_cfa 8, 0
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	sw	a2,-60(s0)
	sw	a3,-64(s0)
	sw	a4,-68(s0)
	sw	a5,-72(s0)
	.loc 1 7961 20
	li	a5,1
	sw	a5,-20(s0)
	.loc 1 7987 15
	lw	a5,-52(s0)
	sw	a5,-24(s0)
	.loc 1 7992 32
	sw	zero,-28(s0)
	.loc 1 7994 15
	lw	a5,-68(s0)
	beq	a5,zero,.L165
	.loc 1 7996 71
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,4(a5)
	.loc 1 7996 47
	lw	a5,-68(s0)
	sw	a4,0(a5)
.L165:
	.loc 1 7999 35
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	lbu	a5,72(a5)
	sb	a5,-29(s0)
	.loc 1 8000 53
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	li	a4,2
	sb	a4,72(a5)
	.loc 1 8002 13
	lw	a4,-64(s0)
	li	a5,4
	bgtu	a4,a5,.L182
	lw	a5,-64(s0)
	slli	a4,a5,2
	lui	a5,%hi(.L168)
	addi	a5,a5,%lo(.L168)
	add	a5,a4,a5
	lw	a5,0(a5)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L168:
	.word	.L183
	.word	.L171
	.word	.L170
	.word	.L169
	.word	.L167
	.text
.L171:
	.loc 1 8005 43
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,4(a5)
	.loc 1 8005 63
	lw	a5,-60(s0)
	or	a4,a4,a5
	lw	a3,-24(s0)
	lw	a5,-56(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,4(a5)
	.loc 1 8006 21
	j	.L173
.L170:
	.loc 1 8009 45
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,4(a5)
	.loc 1 8009 66
	addi	a4,a5,1
	lw	a3,-24(s0)
	lw	a5,-56(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,4(a5)
	.loc 1 8010 21
	j	.L173
.L169:
	.loc 1 8013 63
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-60(s0)
	sw	a4,4(a5)
	.loc 1 8014 21
	j	.L173
.L167:
	.loc 1 8018 23
	lbu	a4,-29(s0)
	li	a5,2
	beq	a4,a5,.L174
	.loc 1 8020 67
	lw	a4,-24(s0)
	lw	a5,-56(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-60(s0)
	sw	a4,4(a5)
	.loc 1 8028 21
	j	.L173
.L174:
	.loc 1 8025 33
	sw	zero,-20(s0)
	.loc 1 8028 21
	j	.L173
.L182:
	.loc 1 8042 21
	nop
	j	.L173
.L183:
	.loc 1 8034 21
	nop
.L173:
	.loc 1 8049 15
	lbu	a4,-29(s0)
	li	a5,1
	bne	a4,a5,.L176
	.loc 1 8054 42
	lui	a5,%hi(uxSchedulerSuspended)
	lw	a5,%lo(uxSchedulerSuspended)(a5)
	.loc 1 8054 19
	bne	a5,zero,.L177
.LBB27:
	.loc 1 8056 21
	lw	a5,-24(s0)
	lw	a5,20(a5)
	sw	a5,-40(s0)
	lw	a5,-24(s0)
	lw	a5,8(a5)
	lw	a4,-24(s0)
	lw	a4,12(a4)
	sw	a4,8(a5)
	lw	a5,-24(s0)
	lw	a5,12(a5)
	lw	a4,-24(s0)
	lw	a4,8(a4)
	sw	a4,4(a5)
	lw	a5,-40(s0)
	lw	a4,4(a5)
	lw	a5,-24(s0)
	addi	a5,a5,4
	bne	a4,a5,.L178
	.loc 1 8056 21 is_stmt 0 discriminator 1
	lw	a5,-24(s0)
	lw	a4,12(a5)
	lw	a5,-40(s0)
	sw	a4,4(a5)
.L178:
	.loc 1 8056 21 discriminator 3
	lw	a5,-24(s0)
	sw	zero,20(a5)
	lw	a5,-40(s0)
	lw	a5,0(a5)
	addi	a4,a5,-1
	lw	a5,-40(s0)
	sw	a4,0(a5)
.LBE27:
	.loc 1 8057 21 is_stmt 1
	lw	a5,-24(s0)
	lw	a5,44(a5)
	li	a4,1
	sll	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	lw	a5,%lo(uxTopReadyPriority)(a5)
	or	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	sw	a4,%lo(uxTopReadyPriority)(a5)
.LBB28:
	lw	a5,-24(s0)
	lw	a4,44(a5)
	lui	a5,%hi(pxReadyTasksLists)
	addi	a3,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,4(a5)
	sw	a5,-44(s0)
	lw	a5,-24(s0)
	lw	a4,-44(s0)
	sw	a4,8(a5)
	lw	a5,-44(s0)
	lw	a4,8(a5)
	lw	a5,-24(s0)
	sw	a4,12(a5)
	lw	a5,-44(s0)
	lw	a5,8(a5)
	lw	a4,-24(s0)
	addi	a4,a4,4
	sw	a4,4(a5)
	lw	a5,-24(s0)
	addi	a4,a5,4
	lw	a5,-44(s0)
	sw	a4,8(a5)
	lw	a5,-24(s0)
	lw	a4,44(a5)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	lui	a4,%hi(pxReadyTasksLists)
	addi	a4,a4,%lo(pxReadyTasksLists)
	add	a4,a5,a4
	lw	a5,-24(s0)
	sw	a4,20(a5)
	lw	a5,-24(s0)
	lw	a4,44(a5)
	lui	a5,%hi(pxReadyTasksLists)
	addi	a3,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,0(a5)
	lw	a4,-24(s0)
	lw	a4,44(a4)
	addi	a3,a5,1
	lui	a5,%hi(pxReadyTasksLists)
	addi	a2,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a2,a5
	sw	a3,0(a5)
.LBE28:
	j	.L179
.L177:
.LBB29:
	.loc 1 8063 21
	lui	a5,%hi(xPendingReadyList)
	addi	a5,a5,%lo(xPendingReadyList)
	lw	a5,4(a5)
	sw	a5,-36(s0)
	lw	a5,-24(s0)
	lw	a4,-36(s0)
	sw	a4,28(a5)
	lw	a5,-36(s0)
	lw	a4,8(a5)
	lw	a5,-24(s0)
	sw	a4,32(a5)
	lw	a5,-36(s0)
	lw	a5,8(a5)
	lw	a4,-24(s0)
	addi	a4,a4,24
	sw	a4,4(a5)
	lw	a5,-24(s0)
	addi	a4,a5,24
	lw	a5,-36(s0)
	sw	a4,8(a5)
	lw	a5,-24(s0)
	lui	a4,%hi(xPendingReadyList)
	addi	a4,a4,%lo(xPendingReadyList)
	sw	a4,40(a5)
	lui	a5,%hi(xPendingReadyList)
	addi	a5,a5,%lo(xPendingReadyList)
	lw	a5,0(a5)
	addi	a4,a5,1
	lui	a5,%hi(xPendingReadyList)
	addi	a5,a5,%lo(xPendingReadyList)
	sw	a4,0(a5)
.L179:
.LBE29:
	.loc 1 8068 30
	lw	a5,-24(s0)
	lw	a4,44(a5)
	.loc 1 8068 57
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	lw	a5,44(a5)
	.loc 1 8068 23
	bleu	a4,a5,.L176
	.loc 1 8072 27
	lw	a5,-72(s0)
	beq	a5,zero,.L180
	.loc 1 8074 56
	lw	a5,-72(s0)
	li	a4,1
	sw	a4,0(a5)
.L180:
	.loc 1 8080 45
	lui	a5,%hi(xYieldPendings)
	li	a4,1
	sw	a4,%lo(xYieldPendings)(a5)
.L176:
	.loc 1 8110 16
	lw	a5,-20(s0)
	.loc 1 8111 5
	mv	a0,a5
	lw	ra,76(sp)
	.cfi_restore 1
	lw	s0,72(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 80
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE40:
	.size	xTaskGenericNotifyFromISR, .-xTaskGenericNotifyFromISR
	.align	2
	.globl	vTaskGenericNotifyGiveFromISR
	.type	vTaskGenericNotifyGiveFromISR, @function
vTaskGenericNotifyGiveFromISR:
.LFB41:
	.loc 1 8121 5
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
	.loc 1 8149 15
	lw	a5,-52(s0)
	sw	a5,-20(s0)
	.loc 1 8154 32
	sw	zero,-24(s0)
	.loc 1 8156 35
	lw	a4,-20(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	lbu	a5,72(a5)
	sb	a5,-25(s0)
	.loc 1 8157 53
	lw	a4,-20(s0)
	lw	a5,-56(s0)
	add	a5,a4,a5
	li	a4,2
	sb	a4,72(a5)
	.loc 1 8161 37
	lw	a4,-20(s0)
	lw	a5,-56(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,4(a5)
	.loc 1 8161 58
	addi	a4,a5,1
	lw	a3,-20(s0)
	lw	a5,-56(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,4(a5)
	.loc 1 8167 15
	lbu	a4,-25(s0)
	li	a5,1
	bne	a4,a5,.L190
	.loc 1 8172 42
	lui	a5,%hi(uxSchedulerSuspended)
	lw	a5,%lo(uxSchedulerSuspended)(a5)
	.loc 1 8172 19
	bne	a5,zero,.L186
.LBB30:
	.loc 1 8174 21
	lw	a5,-20(s0)
	lw	a5,20(a5)
	sw	a5,-36(s0)
	lw	a5,-20(s0)
	lw	a5,8(a5)
	lw	a4,-20(s0)
	lw	a4,12(a4)
	sw	a4,8(a5)
	lw	a5,-20(s0)
	lw	a5,12(a5)
	lw	a4,-20(s0)
	lw	a4,8(a4)
	sw	a4,4(a5)
	lw	a5,-36(s0)
	lw	a4,4(a5)
	lw	a5,-20(s0)
	addi	a5,a5,4
	bne	a4,a5,.L187
	.loc 1 8174 21 is_stmt 0 discriminator 1
	lw	a5,-20(s0)
	lw	a4,12(a5)
	lw	a5,-36(s0)
	sw	a4,4(a5)
.L187:
	.loc 1 8174 21 discriminator 3
	lw	a5,-20(s0)
	sw	zero,20(a5)
	lw	a5,-36(s0)
	lw	a5,0(a5)
	addi	a4,a5,-1
	lw	a5,-36(s0)
	sw	a4,0(a5)
.LBE30:
	.loc 1 8175 21 is_stmt 1
	lw	a5,-20(s0)
	lw	a5,44(a5)
	li	a4,1
	sll	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	lw	a5,%lo(uxTopReadyPriority)(a5)
	or	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	sw	a4,%lo(uxTopReadyPriority)(a5)
.LBB31:
	lw	a5,-20(s0)
	lw	a4,44(a5)
	lui	a5,%hi(pxReadyTasksLists)
	addi	a3,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,4(a5)
	sw	a5,-40(s0)
	lw	a5,-20(s0)
	lw	a4,-40(s0)
	sw	a4,8(a5)
	lw	a5,-40(s0)
	lw	a4,8(a5)
	lw	a5,-20(s0)
	sw	a4,12(a5)
	lw	a5,-40(s0)
	lw	a5,8(a5)
	lw	a4,-20(s0)
	addi	a4,a4,4
	sw	a4,4(a5)
	lw	a5,-20(s0)
	addi	a4,a5,4
	lw	a5,-40(s0)
	sw	a4,8(a5)
	lw	a5,-20(s0)
	lw	a4,44(a5)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	lui	a4,%hi(pxReadyTasksLists)
	addi	a4,a4,%lo(pxReadyTasksLists)
	add	a4,a5,a4
	lw	a5,-20(s0)
	sw	a4,20(a5)
	lw	a5,-20(s0)
	lw	a4,44(a5)
	lui	a5,%hi(pxReadyTasksLists)
	addi	a3,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,0(a5)
	lw	a4,-20(s0)
	lw	a4,44(a4)
	addi	a3,a5,1
	lui	a5,%hi(pxReadyTasksLists)
	addi	a2,a5,%lo(pxReadyTasksLists)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,2
	add	a5,a2,a5
	sw	a3,0(a5)
.LBE31:
	j	.L188
.L186:
.LBB32:
	.loc 1 8181 21
	lui	a5,%hi(xPendingReadyList)
	addi	a5,a5,%lo(xPendingReadyList)
	lw	a5,4(a5)
	sw	a5,-32(s0)
	lw	a5,-20(s0)
	lw	a4,-32(s0)
	sw	a4,28(a5)
	lw	a5,-32(s0)
	lw	a4,8(a5)
	lw	a5,-20(s0)
	sw	a4,32(a5)
	lw	a5,-32(s0)
	lw	a5,8(a5)
	lw	a4,-20(s0)
	addi	a4,a4,24
	sw	a4,4(a5)
	lw	a5,-20(s0)
	addi	a4,a5,24
	lw	a5,-32(s0)
	sw	a4,8(a5)
	lw	a5,-20(s0)
	lui	a4,%hi(xPendingReadyList)
	addi	a4,a4,%lo(xPendingReadyList)
	sw	a4,40(a5)
	lui	a5,%hi(xPendingReadyList)
	addi	a5,a5,%lo(xPendingReadyList)
	lw	a5,0(a5)
	addi	a4,a5,1
	lui	a5,%hi(xPendingReadyList)
	addi	a5,a5,%lo(xPendingReadyList)
	sw	a4,0(a5)
.L188:
.LBE32:
	.loc 1 8186 30
	lw	a5,-20(s0)
	lw	a4,44(a5)
	.loc 1 8186 57
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	lw	a5,44(a5)
	.loc 1 8186 23
	bleu	a4,a5,.L190
	.loc 1 8190 27
	lw	a5,-60(s0)
	beq	a5,zero,.L189
	.loc 1 8192 56
	lw	a5,-60(s0)
	li	a4,1
	sw	a4,0(a5)
.L189:
	.loc 1 8198 45
	lui	a5,%hi(xYieldPendings)
	li	a4,1
	sw	a4,%lo(xYieldPendings)(a5)
.L190:
	.loc 1 8227 5
	nop
	lw	ra,60(sp)
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE41:
	.size	vTaskGenericNotifyGiveFromISR, .-vTaskGenericNotifyGiveFromISR
	.align	2
	.globl	xTaskGenericNotifyStateClear
	.type	xTaskGenericNotifyStateClear, @function
xTaskGenericNotifyStateClear:
.LFB42:
	.loc 1 8236 5
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
	.loc 1 8246 17
	lw	a5,-36(s0)
	bne	a5,zero,.L192
	.loc 1 8246 17 is_stmt 0 discriminator 1
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	j	.L193
.L192:
	.loc 1 8246 17 discriminator 2
	lw	a5,-36(s0)
.L193:
	.loc 1 8246 15 is_stmt 1 discriminator 4
	sw	a5,-24(s0)
	.loc 1 8248 9
#APP
# 8248 "FreeRTOS-Kernel/tasks.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 8250 37
	lw	a4,-24(s0)
	lw	a5,-40(s0)
	add	a5,a4,a5
	lbu	a5,72(a5)
	andi	a4,a5,0xff
	.loc 1 8250 15
	li	a5,2
	bne	a4,a5,.L194
	.loc 1 8252 56
	lw	a4,-24(s0)
	lw	a5,-40(s0)
	add	a5,a4,a5
	sb	zero,72(a5)
	.loc 1 8253 25
	li	a5,1
	sw	a5,-20(s0)
	j	.L195
.L194:
	.loc 1 8257 25
	sw	zero,-20(s0)
.L195:
	.loc 1 8260 9
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L196
	.loc 1 8260 9 is_stmt 0 discriminator 1
#APP
# 8260 "FreeRTOS-Kernel/tasks.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L196:
	.loc 1 8264 16 is_stmt 1
	lw	a5,-20(s0)
	.loc 1 8265 5
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
.LFE42:
	.size	xTaskGenericNotifyStateClear, .-xTaskGenericNotifyStateClear
	.align	2
	.globl	ulTaskGenericNotifyValueClear
	.type	ulTaskGenericNotifyValueClear, @function
ulTaskGenericNotifyValueClear:
.LFB43:
	.loc 1 8275 5
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
	.loc 1 8285 17
	lw	a5,-36(s0)
	bne	a5,zero,.L199
	.loc 1 8285 17 is_stmt 0 discriminator 1
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	j	.L200
.L199:
	.loc 1 8285 17 discriminator 2
	lw	a5,-36(s0)
.L200:
	.loc 1 8285 15 is_stmt 1 discriminator 4
	sw	a5,-20(s0)
	.loc 1 8287 9
#APP
# 8287 "FreeRTOS-Kernel/tasks.c" 1
	csrc mstatus, 8
# 0 "" 2
#NO_APP
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	.loc 1 8291 22
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,4(a5)
	sw	a5,-24(s0)
	.loc 1 8292 35
	lw	a4,-20(s0)
	lw	a5,-40(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,4(a5)
	.loc 1 8292 57
	lw	a5,-44(s0)
	not	a5,a5
	.loc 1 8292 54
	and	a4,a4,a5
	lw	a3,-20(s0)
	lw	a5,-40(s0)
	addi	a5,a5,16
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,4(a5)
	.loc 1 8294 9
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	addi	a4,a5,-1
	lui	a5,%hi(xCriticalNesting)
	sw	a4,%lo(xCriticalNesting)(a5)
	lui	a5,%hi(xCriticalNesting)
	lw	a5,%lo(xCriticalNesting)(a5)
	bne	a5,zero,.L201
	.loc 1 8294 9 is_stmt 0 discriminator 1
#APP
# 8294 "FreeRTOS-Kernel/tasks.c" 1
	csrs mstatus, 8
# 0 "" 2
#NO_APP
.L201:
	.loc 1 8298 16 is_stmt 1
	lw	a5,-24(s0)
	.loc 1 8299 5
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
.LFE43:
	.size	ulTaskGenericNotifyValueClear, .-ulTaskGenericNotifyValueClear
	.align	2
	.type	prvAddCurrentTaskToDelayedList, @function
prvAddCurrentTaskToDelayedList:
.LFB44:
	.loc 1 8417 1
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
	.loc 1 8419 22
	lui	a5,%hi(xTickCount)
	lw	a5,%lo(xTickCount)(a5)
	sw	a5,-20(s0)
	.loc 1 8420 20
	lui	a5,%hi(pxDelayedTaskList)
	lw	a5,%lo(pxDelayedTaskList)(a5)
	sw	a5,-24(s0)
	.loc 1 8421 20
	lui	a5,%hi(pxOverflowDelayedTaskList)
	lw	a5,%lo(pxOverflowDelayedTaskList)(a5)
	sw	a5,-28(s0)
	.loc 1 8434 38
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	.loc 1 8434 9
	addi	a5,a5,4
	mv	a0,a5
	call	uxListRemove
	mv	a5,a0
	.loc 1 8434 7 discriminator 1
	bne	a5,zero,.L204
	.loc 1 8438 9
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	lw	a5,44(a5)
	li	a4,1
	sll	a5,a4,a5
	not	a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	lw	a5,%lo(uxTopReadyPriority)(a5)
	and	a4,a4,a5
	lui	a5,%hi(uxTopReadyPriority)
	sw	a4,%lo(uxTopReadyPriority)(a5)
.L204:
	.loc 1 8497 21
	lw	a4,-20(s0)
	lw	a5,-36(s0)
	add	a5,a4,a5
	sw	a5,-32(s0)
	.loc 1 8500 9
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	lw	a4,-32(s0)
	sw	a4,4(a5)
	.loc 1 8502 11
	lw	a4,-32(s0)
	lw	a5,-20(s0)
	bgeu	a4,a5,.L205
	.loc 1 8506 64
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	.loc 1 8506 13
	addi	a5,a5,4
	mv	a1,a5
	lw	a0,-28(s0)
	call	vListInsert
	.loc 1 8531 1
	j	.L207
.L205:
	.loc 1 8512 56
	lui	a5,%hi(pxCurrentTCB)
	lw	a5,%lo(pxCurrentTCB)(a5)
	.loc 1 8512 13
	addi	a5,a5,4
	mv	a1,a5
	lw	a0,-24(s0)
	call	vListInsert
	.loc 1 8517 29
	lui	a5,%hi(xNextTaskUnblockTime)
	lw	a5,%lo(xNextTaskUnblockTime)(a5)
	.loc 1 8517 15
	lw	a4,-32(s0)
	bgeu	a4,a5,.L207
	.loc 1 8519 38
	lui	a5,%hi(xNextTaskUnblockTime)
	lw	a4,-32(s0)
	sw	a4,%lo(xNextTaskUnblockTime)(a5)
.L207:
	.loc 1 8531 1
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
.LFE44:
	.size	prvAddCurrentTaskToDelayedList, .-prvAddCurrentTaskToDelayedList
	.align	2
	.globl	vTaskResetState
	.type	vTaskResetState, @function
vTaskResetState:
.LFB45:
	.loc 1 8646 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 8652 22
	lui	a5,%hi(pxCurrentTCB)
	sw	zero,%lo(pxCurrentTCB)(a5)
	.loc 1 8669 28
	lui	a5,%hi(uxCurrentNumberOfTasks)
	sw	zero,%lo(uxCurrentNumberOfTasks)(a5)
	.loc 1 8670 16
	lui	a5,%hi(xTickCount)
	sw	zero,%lo(xTickCount)(a5)
	.loc 1 8671 24
	lui	a5,%hi(uxTopReadyPriority)
	sw	zero,%lo(uxTopReadyPriority)(a5)
	.loc 1 8672 23
	lui	a5,%hi(xSchedulerRunning)
	sw	zero,%lo(xSchedulerRunning)(a5)
	.loc 1 8673 18
	lui	a5,%hi(xPendedTicks)
	sw	zero,%lo(xPendedTicks)(a5)
	.loc 1 8675 18
	sw	zero,-20(s0)
	.loc 1 8675 5
	j	.L209
.L210:
	.loc 1 8677 35
	lui	a5,%hi(xYieldPendings)
	lw	a4,-20(s0)
	slli	a4,a4,2
	addi	a5,a5,%lo(xYieldPendings)
	add	a5,a4,a5
	sw	zero,0(a5)
	.loc 1 8675 63 discriminator 3
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L209:
	.loc 1 8675 31 discriminator 1
	lw	a5,-20(s0)
	ble	a5,zero,.L210
	.loc 1 8680 21
	lui	a5,%hi(xNumOfOverflows)
	sw	zero,%lo(xNumOfOverflows)(a5)
	.loc 1 8681 18
	lui	a5,%hi(uxTaskNumber)
	sw	zero,%lo(uxTaskNumber)(a5)
	.loc 1 8682 26
	lui	a5,%hi(xNextTaskUnblockTime)
	sw	zero,%lo(xNextTaskUnblockTime)(a5)
	.loc 1 8684 26
	lui	a5,%hi(uxSchedulerSuspended)
	sw	zero,%lo(uxSchedulerSuspended)(a5)
	.loc 1 8695 1
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
.LFE45:
	.size	vTaskResetState, .-vTaskResetState
.Letext0:
	.file 2 "/opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/14.2.0/include/stddef.h"
	.file 3 "/opt/riscv/sysroot/usr/include/bits/types.h"
	.file 4 "/opt/riscv/sysroot/usr/include/bits/stdint-intn.h"
	.file 5 "/opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/14.2.0/include/stdint-gcc.h"
	.file 6 "FreeRTOS-Kernel/include/projdefs.h"
	.file 7 "FreeRTOS-Kernel/portable/GCC/RISC-V/portmacro.h"
	.file 8 "FreeRTOS-Kernel/include/list.h"
	.file 9 "FreeRTOS-Kernel/include/task.h"
	.file 10 "FreeRTOS-Kernel/include/portable.h"
	.file 11 "/opt/riscv/sysroot/usr/include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x14bb
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x1b
	.4byte	.LASF185
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
	.4byte	0x32
	.uleb128 0xa
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x1c
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.4byte	.LASF3
	.uleb128 0xa
	.byte	0x8
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0xa
	.byte	0x1
	.byte	0x8
	.4byte	.LASF5
	.uleb128 0xa
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0xa
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0xa
	.byte	0x1
	.byte	0x6
	.4byte	.LASF8
	.uleb128 0xa
	.byte	0x2
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0x29
	.byte	0x14
	.4byte	0x39
	.uleb128 0xa
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x1d
	.byte	0x4
	.uleb128 0x5
	.4byte	0x84
	.uleb128 0x3
	.4byte	0x90
	.uleb128 0xa
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.uleb128 0x5
	.4byte	0x90
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x4
	.byte	0x1a
	.byte	0x13
	.4byte	0x71
	.uleb128 0x3
	.4byte	0x97
	.uleb128 0x5
	.4byte	0xa8
	.uleb128 0xa
	.byte	0x10
	.byte	0x4
	.4byte	.LASF15
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x5
	.byte	0x2e
	.byte	0x18
	.4byte	0x4e
	.uleb128 0xb
	.4byte	0xb9
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x5
	.byte	0x34
	.byte	0x19
	.4byte	0x32
	.uleb128 0xb
	.4byte	0xca
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x6
	.byte	0x24
	.byte	0x11
	.4byte	0xe7
	.uleb128 0x3
	.4byte	0xec
	.uleb128 0x1e
	.4byte	0xf7
	.uleb128 0x9
	.4byte	0x84
	.byte	0
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x7
	.byte	0x41
	.byte	0x1a
	.4byte	0xca
	.uleb128 0xb
	.4byte	0xf7
	.uleb128 0x5
	.4byte	0xf7
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x7
	.byte	0x42
	.byte	0x1a
	.4byte	0x9c
	.uleb128 0xb
	.4byte	0x10d
	.uleb128 0x5
	.4byte	0x10d
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x7
	.byte	0x43
	.byte	0x1a
	.4byte	0xca
	.uleb128 0xb
	.4byte	0x123
	.uleb128 0x5
	.4byte	0x12f
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x7
	.byte	0x44
	.byte	0x1a
	.4byte	0xca
	.uleb128 0xb
	.4byte	0x139
	.uleb128 0x5
	.4byte	0x139
	.uleb128 0x1f
	.4byte	.LASF64
	.byte	0x7
	.byte	0x75
	.byte	0xf
	.4byte	0x26
	.uleb128 0x11
	.4byte	.LASF28
	.byte	0x14
	.byte	0x8
	.byte	0x90
	.byte	0x8
	.4byte	0x1aa
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x8
	.byte	0x93
	.byte	0x24
	.4byte	0x139
	.byte	0
	.uleb128 0x6
	.4byte	.LASF24
	.byte	0x8
	.byte	0x94
	.byte	0x2d
	.4byte	0x1aa
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF25
	.byte	0x8
	.byte	0x95
	.byte	0x2d
	.4byte	0x1aa
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF26
	.byte	0x8
	.byte	0x96
	.byte	0xc
	.4byte	0x84
	.byte	0xc
	.uleb128 0x6
	.4byte	.LASF27
	.byte	0x8
	.byte	0x97
	.byte	0x28
	.4byte	0x1e4
	.byte	0x10
	.byte	0
	.uleb128 0x3
	.4byte	0x15b
	.uleb128 0x11
	.4byte	.LASF29
	.byte	0x14
	.byte	0x8
	.byte	0xac
	.byte	0x10
	.4byte	0x1e4
	.uleb128 0x6
	.4byte	.LASF30
	.byte	0x8
	.byte	0xaf
	.byte	0x25
	.4byte	0x123
	.byte	0
	.uleb128 0x6
	.4byte	.LASF31
	.byte	0x8
	.byte	0xb0
	.byte	0x26
	.4byte	0x236
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF32
	.byte	0x8
	.byte	0xb1
	.byte	0x14
	.4byte	0x22a
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.4byte	0x1af
	.uleb128 0x4
	.4byte	.LASF33
	.byte	0x8
	.byte	0x9a
	.byte	0x1b
	.4byte	0x15b
	.uleb128 0x11
	.4byte	.LASF34
	.byte	0xc
	.byte	0x8
	.byte	0x9d
	.byte	0xc
	.4byte	0x22a
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x8
	.byte	0xa0
	.byte	0x28
	.4byte	0x139
	.byte	0
	.uleb128 0x6
	.4byte	.LASF24
	.byte	0x8
	.byte	0xa1
	.byte	0x31
	.4byte	0x1aa
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF25
	.byte	0x8
	.byte	0xa2
	.byte	0x31
	.4byte	0x1aa
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.4byte	.LASF35
	.byte	0x8
	.byte	0xa4
	.byte	0x24
	.4byte	0x1f5
	.uleb128 0x3
	.4byte	0x1e9
	.uleb128 0x5
	.4byte	0x236
	.uleb128 0x4
	.4byte	.LASF36
	.byte	0x8
	.byte	0xb3
	.byte	0x3
	.4byte	0x1af
	.uleb128 0x5
	.4byte	0x240
	.uleb128 0x4
	.4byte	.LASF37
	.byte	0x9
	.byte	0x5c
	.byte	0x2e
	.4byte	0x25d
	.uleb128 0x3
	.4byte	0x262
	.uleb128 0x20
	.4byte	.LASF38
	.byte	0x4c
	.byte	0x1
	.2byte	0x166
	.byte	0x10
	.4byte	0x2d9
	.uleb128 0xd
	.4byte	.LASF39
	.2byte	0x168
	.byte	0x1c
	.4byte	0x391
	.byte	0
	.uleb128 0xd
	.4byte	.LASF40
	.2byte	0x172
	.byte	0x10
	.4byte	0x1e9
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF41
	.2byte	0x173
	.byte	0x10
	.4byte	0x1e9
	.byte	0x18
	.uleb128 0xd
	.4byte	.LASF42
	.2byte	0x174
	.byte	0x11
	.4byte	0x123
	.byte	0x2c
	.uleb128 0xd
	.4byte	.LASF43
	.2byte	0x175
	.byte	0x13
	.4byte	0x38c
	.byte	0x30
	.uleb128 0xd
	.4byte	.LASF44
	.2byte	0x17a
	.byte	0xa
	.4byte	0x396
	.byte	0x34
	.uleb128 0xd
	.4byte	.LASF45
	.2byte	0x1a3
	.byte	0x1b
	.4byte	0x3b6
	.byte	0x44
	.uleb128 0xd
	.4byte	.LASF46
	.2byte	0x1a4
	.byte	0x1a
	.4byte	0x3cb
	.byte	0x48
	.byte	0
	.uleb128 0x21
	.byte	0x7
	.byte	0x4
	.4byte	0x32
	.byte	0x9
	.byte	0x72
	.byte	0x1
	.4byte	0x306
	.uleb128 0x12
	.4byte	.LASF47
	.byte	0
	.uleb128 0x12
	.4byte	.LASF48
	.byte	0x1
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x2
	.uleb128 0x12
	.4byte	.LASF50
	.byte	0x3
	.uleb128 0x12
	.4byte	.LASF51
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF52
	.byte	0x9
	.byte	0x78
	.byte	0x3
	.4byte	0x2d9
	.uleb128 0x11
	.4byte	.LASF53
	.byte	0x8
	.byte	0x9
	.byte	0x7d
	.byte	0x10
	.4byte	0x33a
	.uleb128 0x6
	.4byte	.LASF54
	.byte	0x9
	.byte	0x7f
	.byte	0x10
	.4byte	0x10d
	.byte	0
	.uleb128 0x6
	.4byte	.LASF55
	.byte	0x9
	.byte	0x80
	.byte	0x10
	.4byte	0x139
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF56
	.byte	0x9
	.byte	0x81
	.byte	0x3
	.4byte	0x312
	.uleb128 0x11
	.4byte	.LASF57
	.byte	0xc
	.byte	0x9
	.byte	0x86
	.byte	0x10
	.4byte	0x37b
	.uleb128 0x6
	.4byte	.LASF58
	.byte	0x9
	.byte	0x88
	.byte	0xc
	.4byte	0x84
	.byte	0
	.uleb128 0x6
	.4byte	.LASF59
	.byte	0x9
	.byte	0x89
	.byte	0xe
	.4byte	0xca
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF60
	.byte	0x9
	.byte	0x8a
	.byte	0xe
	.4byte	0xca
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.4byte	.LASF61
	.byte	0x9
	.byte	0x8b
	.byte	0x3
	.4byte	0x346
	.uleb128 0x5
	.4byte	0x37b
	.uleb128 0x3
	.4byte	0xf7
	.uleb128 0x3
	.4byte	0x103
	.uleb128 0xf
	.4byte	0x90
	.4byte	0x3a6
	.uleb128 0x10
	.4byte	0x32
	.byte	0xf
	.byte	0
	.uleb128 0xf
	.4byte	0xd6
	.4byte	0x3b6
	.uleb128 0x10
	.4byte	0x32
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	0x3a6
	.uleb128 0xf
	.4byte	0xc5
	.4byte	0x3cb
	.uleb128 0x10
	.4byte	0x32
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	0x3bb
	.uleb128 0x18
	.4byte	.LASF62
	.2byte	0x1b4
	.byte	0x3
	.4byte	0x262
	.uleb128 0x18
	.4byte	.LASF63
	.2byte	0x1b8
	.byte	0x10
	.4byte	0x3d0
	.uleb128 0x22
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x1be
	.byte	0x37
	.4byte	0x400
	.uleb128 0x5
	.byte	0x3
	.4byte	pxCurrentTCB
	.uleb128 0x3
	.4byte	0x3dc
	.uleb128 0xb
	.4byte	0x3fb
	.uleb128 0xf
	.4byte	0x240
	.4byte	0x415
	.uleb128 0x10
	.4byte	0x32
	.byte	0
	.byte	0
	.uleb128 0x1
	.4byte	.LASF66
	.2byte	0x1cb
	.byte	0x1f
	.4byte	0x405
	.uleb128 0x5
	.byte	0x3
	.4byte	pxReadyTasksLists
	.uleb128 0x1
	.4byte	.LASF67
	.2byte	0x1cc
	.byte	0x1f
	.4byte	0x240
	.uleb128 0x5
	.byte	0x3
	.4byte	xDelayedTaskList1
	.uleb128 0x1
	.4byte	.LASF68
	.2byte	0x1cd
	.byte	0x1f
	.4byte	0x240
	.uleb128 0x5
	.byte	0x3
	.4byte	xDelayedTaskList2
	.uleb128 0x1
	.4byte	.LASF69
	.2byte	0x1ce
	.byte	0x2a
	.4byte	0x462
	.uleb128 0x5
	.byte	0x3
	.4byte	pxDelayedTaskList
	.uleb128 0x3
	.4byte	0x240
	.uleb128 0xb
	.4byte	0x45d
	.uleb128 0x5
	.4byte	0x45d
	.uleb128 0x1
	.4byte	.LASF70
	.2byte	0x1cf
	.byte	0x2a
	.4byte	0x462
	.uleb128 0x5
	.byte	0x3
	.4byte	pxOverflowDelayedTaskList
	.uleb128 0x1
	.4byte	.LASF71
	.2byte	0x1d0
	.byte	0x1f
	.4byte	0x240
	.uleb128 0x5
	.byte	0x3
	.4byte	xPendingReadyList
	.uleb128 0x1
	.4byte	.LASF72
	.2byte	0x1e6
	.byte	0x2d
	.4byte	0x12f
	.uleb128 0x5
	.byte	0x3
	.4byte	uxCurrentNumberOfTasks
	.uleb128 0x1
	.4byte	.LASF73
	.2byte	0x1e7
	.byte	0x2c
	.4byte	0x145
	.uleb128 0x5
	.byte	0x3
	.4byte	xTickCount
	.uleb128 0x1
	.4byte	.LASF74
	.2byte	0x1e8
	.byte	0x2d
	.4byte	0x12f
	.uleb128 0x5
	.byte	0x3
	.4byte	uxTopReadyPriority
	.uleb128 0x1
	.4byte	.LASF75
	.2byte	0x1e9
	.byte	0x2c
	.4byte	0x119
	.uleb128 0x5
	.byte	0x3
	.4byte	xSchedulerRunning
	.uleb128 0x1
	.4byte	.LASF76
	.2byte	0x1ea
	.byte	0x2c
	.4byte	0x145
	.uleb128 0x5
	.byte	0x3
	.4byte	xPendedTicks
	.uleb128 0xf
	.4byte	0x119
	.4byte	0x4fa
	.uleb128 0x10
	.4byte	0x32
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	0x4ea
	.uleb128 0x1
	.4byte	.LASF77
	.2byte	0x1eb
	.byte	0x2c
	.4byte	0x4fa
	.uleb128 0x5
	.byte	0x3
	.4byte	xYieldPendings
	.uleb128 0x1
	.4byte	.LASF78
	.2byte	0x1ec
	.byte	0x2c
	.4byte	0x119
	.uleb128 0x5
	.byte	0x3
	.4byte	xNumOfOverflows
	.uleb128 0x1
	.4byte	.LASF79
	.2byte	0x1ed
	.byte	0x24
	.4byte	0x123
	.uleb128 0x5
	.byte	0x3
	.4byte	uxTaskNumber
	.uleb128 0x1
	.4byte	.LASF80
	.2byte	0x1ee
	.byte	0x2c
	.4byte	0x145
	.uleb128 0x5
	.byte	0x3
	.4byte	xNextTaskUnblockTime
	.uleb128 0xf
	.4byte	0x251
	.4byte	0x557
	.uleb128 0x10
	.4byte	0x32
	.byte	0
	.byte	0
	.uleb128 0x1
	.4byte	.LASF81
	.2byte	0x1ef
	.byte	0x25
	.4byte	0x547
	.uleb128 0x5
	.byte	0x3
	.4byte	xIdleTaskHandles
	.uleb128 0x1
	.4byte	.LASF82
	.2byte	0x1f4
	.byte	0x23
	.4byte	0x134
	.uleb128 0x5
	.byte	0x3
	.4byte	uxTopUsedPriority
	.uleb128 0x1
	.4byte	.LASF83
	.2byte	0x202
	.byte	0x2d
	.4byte	0x12f
	.uleb128 0x5
	.byte	0x3
	.4byte	uxSchedulerSuspended
	.uleb128 0x23
	.4byte	.LASF86
	.byte	0x8
	.2byte	0x1f7
	.byte	0xd
	.4byte	0x123
	.4byte	0x5a4
	.uleb128 0x9
	.4byte	0x23b
	.byte	0
	.uleb128 0x16
	.4byte	.LASF84
	.2byte	0x1b9
	.4byte	0x5b5
	.uleb128 0x9
	.4byte	0x467
	.byte	0
	.uleb128 0x16
	.4byte	.LASF85
	.2byte	0x1d1
	.4byte	0x5cb
	.uleb128 0x9
	.4byte	0x467
	.uleb128 0x9
	.4byte	0x23b
	.byte	0
	.uleb128 0x24
	.4byte	.LASF186
	.byte	0xa
	.byte	0xe3
	.byte	0x6
	.uleb128 0x25
	.4byte	.LASF187
	.byte	0xa
	.byte	0xdc
	.byte	0xc
	.4byte	0x10d
	.uleb128 0x17
	.4byte	.LASF87
	.byte	0xa
	.byte	0x85
	.byte	0x17
	.4byte	0x38c
	.4byte	0x5ff
	.uleb128 0x9
	.4byte	0x38c
	.uleb128 0x9
	.4byte	0xdb
	.uleb128 0x9
	.4byte	0x84
	.byte	0
	.uleb128 0x16
	.4byte	.LASF88
	.2byte	0x1c4
	.4byte	0x610
	.uleb128 0x9
	.4byte	0x23b
	.byte	0
	.uleb128 0x26
	.4byte	.LASF89
	.byte	0xa
	.byte	0xb8
	.byte	0x6
	.4byte	0x622
	.uleb128 0x9
	.4byte	0x84
	.byte	0
	.uleb128 0x17
	.4byte	.LASF90
	.byte	0xb
	.byte	0x3d
	.byte	0xe
	.4byte	0x84
	.4byte	0x642
	.uleb128 0x9
	.4byte	0x84
	.uleb128 0x9
	.4byte	0x39
	.uleb128 0x9
	.4byte	0x26
	.byte	0
	.uleb128 0x17
	.4byte	.LASF91
	.byte	0xa
	.byte	0xb5
	.byte	0x8
	.4byte	0x84
	.4byte	0x658
	.uleb128 0x9
	.4byte	0x26
	.byte	0
	.uleb128 0x13
	.4byte	.LASF107
	.2byte	0x21c5
	.byte	0x6
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x67e
	.uleb128 0x1
	.4byte	.LASF92
	.2byte	0x21c7
	.byte	0x10
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x14
	.4byte	.LASF135
	.2byte	0x20df
	.byte	0xd
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6ef
	.uleb128 0x2
	.4byte	.LASF93
	.2byte	0x20df
	.byte	0x38
	.4byte	0x139
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2
	.4byte	.LASF94
	.2byte	0x20e0
	.byte	0x3e
	.4byte	0x11e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.4byte	.LASF95
	.2byte	0x20e2
	.byte	0x10
	.4byte	0x139
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.4byte	.LASF96
	.2byte	0x20e3
	.byte	0x16
	.4byte	0x14a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF97
	.2byte	0x20e4
	.byte	0x14
	.4byte	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.4byte	.LASF98
	.2byte	0x20e5
	.byte	0x14
	.4byte	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xc
	.4byte	.LASF104
	.2byte	0x2050
	.byte	0xe
	.4byte	0xca
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x755
	.uleb128 0x2
	.4byte	.LASF99
	.2byte	0x2050
	.byte	0x3a
	.4byte	0x251
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2
	.4byte	.LASF100
	.2byte	0x2051
	.byte	0x39
	.4byte	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.4byte	.LASF101
	.2byte	0x2052
	.byte	0x36
	.4byte	0xca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1
	.4byte	.LASF102
	.2byte	0x2054
	.byte	0x11
	.4byte	0x3fb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF103
	.2byte	0x2055
	.byte	0x12
	.4byte	0xca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xc
	.4byte	.LASF105
	.2byte	0x202a
	.byte	0x10
	.4byte	0x10d
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7ac
	.uleb128 0x2
	.4byte	.LASF99
	.2byte	0x202a
	.byte	0x3b
	.4byte	0x251
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2
	.4byte	.LASF100
	.2byte	0x202b
	.byte	0x3a
	.4byte	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.4byte	.LASF102
	.2byte	0x202d
	.byte	0x11
	.4byte	0x3fb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.4byte	.LASF106
	.2byte	0x202e
	.byte	0x14
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x13
	.4byte	.LASF108
	.2byte	0x1fb6
	.byte	0xa
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x870
	.uleb128 0x2
	.4byte	.LASF109
	.2byte	0x1fb6
	.byte	0x36
	.4byte	0x251
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.4byte	.LASF110
	.2byte	0x1fb7
	.byte	0x35
	.4byte	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.4byte	.LASF111
	.2byte	0x1fb8
	.byte	0x36
	.4byte	0x870
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1
	.4byte	.LASF102
	.2byte	0x1fba
	.byte	0x11
	.4byte	0x3fb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF112
	.2byte	0x1fbb
	.byte	0x11
	.4byte	0xb9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x1
	.4byte	.LASF113
	.2byte	0x1fbc
	.byte	0x15
	.4byte	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x7
	.4byte	.LBB30
	.4byte	.LBE30-.LBB30
	.4byte	0x839
	.uleb128 0x1
	.4byte	.LASF114
	.2byte	0x1fee
	.byte	0x15
	.4byte	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x7
	.4byte	.LBB31
	.4byte	.LBE31-.LBB31
	.4byte	0x856
	.uleb128 0x1
	.4byte	.LASF31
	.2byte	0x1fef
	.byte	0x15
	.4byte	0x23b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x8
	.4byte	.LBB32
	.4byte	.LBE32-.LBB32
	.uleb128 0x1
	.4byte	.LASF31
	.2byte	0x1ff5
	.byte	0x15
	.4byte	0x23b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0x3
	.4byte	0x10d
	.uleb128 0xc
	.4byte	.LASF115
	.2byte	0x1f10
	.byte	0x10
	.4byte	0x10d
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x97b
	.uleb128 0x2
	.4byte	.LASF109
	.2byte	0x1f10
	.byte	0x38
	.4byte	0x251
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.4byte	.LASF110
	.2byte	0x1f11
	.byte	0x37
	.4byte	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.4byte	.LASF116
	.2byte	0x1f12
	.byte	0x34
	.4byte	0xca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x2
	.4byte	.LASF117
	.2byte	0x1f13
	.byte	0x39
	.4byte	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.4byte	.LASF118
	.2byte	0x1f14
	.byte	0x36
	.4byte	0x97b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x2
	.4byte	.LASF111
	.2byte	0x1f15
	.byte	0x38
	.4byte	0x870
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1
	.4byte	.LASF102
	.2byte	0x1f17
	.byte	0x11
	.4byte	0x3fb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.4byte	.LASF112
	.2byte	0x1f18
	.byte	0x11
	.4byte	0xb9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x1
	.4byte	.LASF106
	.2byte	0x1f19
	.byte	0x14
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF113
	.2byte	0x1f1a
	.byte	0x15
	.4byte	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x7
	.4byte	.LBB27
	.4byte	.LBE27-.LBB27
	.4byte	0x944
	.uleb128 0x1
	.4byte	.LASF114
	.2byte	0x1f78
	.byte	0x15
	.4byte	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x7
	.4byte	.LBB28
	.4byte	.LBE28-.LBB28
	.4byte	0x961
	.uleb128 0x1
	.4byte	.LASF31
	.2byte	0x1f79
	.byte	0x15
	.4byte	0x23b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x8
	.4byte	.LBB29
	.4byte	.LBE29-.LBB29
	.uleb128 0x1
	.4byte	.LASF31
	.2byte	0x1f7f
	.byte	0x15
	.4byte	0x23b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0x3
	.4byte	0xca
	.uleb128 0xc
	.4byte	.LASF119
	.2byte	0x1e98
	.byte	0x10
	.4byte	0x10d
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa4a
	.uleb128 0x2
	.4byte	.LASF109
	.2byte	0x1e98
	.byte	0x31
	.4byte	0x251
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.4byte	.LASF110
	.2byte	0x1e99
	.byte	0x30
	.4byte	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.4byte	.LASF116
	.2byte	0x1e9a
	.byte	0x2d
	.4byte	0xca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x2
	.4byte	.LASF117
	.2byte	0x1e9b
	.byte	0x32
	.4byte	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.4byte	.LASF118
	.2byte	0x1e9c
	.byte	0x2f
	.4byte	0x97b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1
	.4byte	.LASF102
	.2byte	0x1e9e
	.byte	0x11
	.4byte	0x3fb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.4byte	.LASF106
	.2byte	0x1e9f
	.byte	0x14
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF112
	.2byte	0x1ea0
	.byte	0x11
	.4byte	0xb9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x7
	.4byte	.LBB25
	.4byte	.LBE25-.LBB25
	.4byte	0xa30
	.uleb128 0x1
	.4byte	.LASF114
	.2byte	0x1ee5
	.byte	0x11
	.4byte	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x8
	.4byte	.LBB26
	.4byte	.LBE26-.LBB26
	.uleb128 0x1
	.4byte	.LASF31
	.2byte	0x1ee6
	.byte	0x11
	.4byte	0x23b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF120
	.2byte	0x1e25
	.byte	0x10
	.4byte	0x10d
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xadd
	.uleb128 0x2
	.4byte	.LASF121
	.2byte	0x1e25
	.byte	0x34
	.4byte	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2
	.4byte	.LASF122
	.2byte	0x1e26
	.byte	0x31
	.4byte	0xca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.4byte	.LASF123
	.2byte	0x1e27
	.byte	0x31
	.4byte	0xca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x2
	.4byte	.LASF124
	.2byte	0x1e28
	.byte	0x33
	.4byte	0x97b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.4byte	.LASF93
	.2byte	0x1e29
	.byte	0x33
	.4byte	0x139
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1
	.4byte	.LASF106
	.2byte	0x1e2b
	.byte	0x14
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF125
	.2byte	0x1e2b
	.byte	0x1d
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1
	.4byte	.LASF126
	.2byte	0x1e2b
	.byte	0x2e
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xe
	.4byte	.LASF127
	.2byte	0x1dbe
	.byte	0xe
	.4byte	0xca
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb52
	.uleb128 0x2
	.4byte	.LASF121
	.2byte	0x1dbe
	.byte	0x33
	.4byte	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2
	.4byte	.LASF128
	.2byte	0x1dbf
	.byte	0x32
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.4byte	.LASF93
	.2byte	0x1dc0
	.byte	0x32
	.4byte	0x139
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1
	.4byte	.LASF103
	.2byte	0x1dc2
	.byte	0x12
	.4byte	0xca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1
	.4byte	.LASF125
	.2byte	0x1dc3
	.byte	0x14
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.4byte	.LASF126
	.2byte	0x1dc3
	.byte	0x25
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF129
	.2byte	0x1d91
	.byte	0xc
	.4byte	0x139
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb7c
	.uleb128 0x1
	.4byte	.LASF130
	.2byte	0x1d93
	.byte	0x10
	.4byte	0x139
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF131
	.2byte	0x1973
	.byte	0x12
	.4byte	0x251
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbb5
	.uleb128 0x2
	.4byte	.LASF92
	.2byte	0x1973
	.byte	0x3f
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF106
	.2byte	0x1975
	.byte	0x16
	.4byte	0x251
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF132
	.2byte	0x1950
	.byte	0x16
	.4byte	0x251
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbdf
	.uleb128 0x1
	.4byte	.LASF106
	.2byte	0x1952
	.byte	0x1a
	.4byte	0x251
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x19
	.4byte	.LASF133
	.2byte	0x1938
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x19
	.4byte	.LASF134
	.2byte	0x179b
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.4byte	.LASF136
	.2byte	0x177b
	.byte	0xd
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc27
	.uleb128 0x1
	.4byte	.LASF42
	.2byte	0x177d
	.byte	0x11
	.4byte	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x14
	.4byte	.LASF137
	.2byte	0x1674
	.byte	0x8
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc4d
	.uleb128 0x2
	.4byte	.LASF138
	.2byte	0x1674
	.byte	0x8
	.4byte	0x84
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF168
	.2byte	0x15e3
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF139
	.2byte	0x159e
	.byte	0xc
	.4byte	0x10d
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcce
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x159e
	.byte	0x34
	.4byte	0xcd3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2
	.4byte	.LASF141
	.2byte	0x159f
	.byte	0x35
	.4byte	0xcdd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.4byte	.LASF106
	.2byte	0x15a1
	.byte	0x10
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.4byte	.LBB24
	.4byte	.LBE24-.LBB24
	.uleb128 0x1
	.4byte	.LASF96
	.2byte	0x15ab
	.byte	0x1a
	.4byte	0x14a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.4byte	.LASF142
	.2byte	0x15ac
	.byte	0x1a
	.4byte	0x14a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x3
	.4byte	0x33a
	.uleb128 0x5
	.4byte	0xcce
	.uleb128 0x3
	.4byte	0x139
	.uleb128 0x5
	.4byte	0xcd8
	.uleb128 0x13
	.4byte	.LASF143
	.2byte	0x1592
	.byte	0x6
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd08
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x1592
	.byte	0x36
	.4byte	0xcd3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x13
	.4byte	.LASF144
	.2byte	0x1582
	.byte	0x6
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd2e
	.uleb128 0x2
	.4byte	.LASF140
	.2byte	0x1582
	.byte	0x2e
	.4byte	0xcd3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x13
	.4byte	.LASF145
	.2byte	0x153a
	.byte	0x6
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdc5
	.uleb128 0x2
	.4byte	.LASF146
	.2byte	0x153a
	.byte	0x36
	.4byte	0x236
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2
	.4byte	.LASF23
	.2byte	0x153b
	.byte	0x3a
	.4byte	0x14a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1
	.4byte	.LASF147
	.2byte	0x153d
	.byte	0xd
	.4byte	0x3fb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x7
	.4byte	.LBB21
	.4byte	.LBE21-.LBB21
	.4byte	0xd8e
	.uleb128 0x1
	.4byte	.LASF114
	.2byte	0x154f
	.byte	0x5
	.4byte	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x7
	.4byte	.LBB22
	.4byte	.LBE22-.LBB22
	.4byte	0xdab
	.uleb128 0x1
	.4byte	.LASF114
	.2byte	0x1562
	.byte	0x5
	.4byte	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x8
	.4byte	.LBB23
	.4byte	.LBE23-.LBB23
	.uleb128 0x1
	.4byte	.LASF31
	.2byte	0x1563
	.byte	0x5
	.4byte	0x23b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF148
	.2byte	0x14dd
	.byte	0xc
	.4byte	0x10d
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe7d
	.uleb128 0x2
	.4byte	.LASF149
	.2byte	0x14dd
	.byte	0x3b
	.4byte	0xe82
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1
	.4byte	.LASF147
	.2byte	0x14df
	.byte	0xd
	.4byte	0x3fb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.4byte	.LASF106
	.2byte	0x14e0
	.byte	0x10
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x7
	.4byte	.LBB17
	.4byte	.LBE17-.LBB17
	.4byte	0xe29
	.uleb128 0x1
	.4byte	.LASF114
	.2byte	0x14f6
	.byte	0x5
	.4byte	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x7
	.4byte	.LBB18
	.4byte	.LBE18-.LBB18
	.4byte	0xe46
	.uleb128 0x1
	.4byte	.LASF114
	.2byte	0x14fa
	.byte	0x9
	.4byte	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x7
	.4byte	.LBB19
	.4byte	.LBE19-.LBB19
	.4byte	0xe63
	.uleb128 0x1
	.4byte	.LASF31
	.2byte	0x14fb
	.byte	0x9
	.4byte	0x23b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x8
	.4byte	.LBB20
	.4byte	.LBE20-.LBB20
	.uleb128 0x1
	.4byte	.LASF31
	.2byte	0x150f
	.byte	0x9
	.4byte	0x23b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0x3
	.4byte	0x24c
	.uleb128 0x5
	.4byte	0xe7d
	.uleb128 0x15
	.4byte	.LASF150
	.2byte	0x1498
	.byte	0x6
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xee4
	.uleb128 0x2
	.4byte	.LASF149
	.2byte	0x1498
	.byte	0x2f
	.4byte	0x45d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2
	.4byte	.LASF23
	.2byte	0x1499
	.byte	0x37
	.4byte	0x14a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.4byte	.LASF93
	.2byte	0x149a
	.byte	0x37
	.4byte	0x14a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x8
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.uleb128 0x1
	.4byte	.LASF31
	.2byte	0x14ae
	.byte	0x5
	.4byte	0x23b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF151
	.2byte	0x147b
	.byte	0x6
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf19
	.uleb128 0x2
	.4byte	.LASF149
	.2byte	0x147b
	.byte	0x2c
	.4byte	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2
	.4byte	.LASF93
	.2byte	0x147c
	.byte	0x2e
	.4byte	0x14a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x15
	.4byte	.LASF152
	.2byte	0x13c0
	.byte	0xa
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf62
	.uleb128 0x8
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.uleb128 0x1
	.4byte	.LASF153
	.2byte	0x13fa
	.byte	0xd
	.4byte	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.4byte	.LBB15
	.4byte	.LBE15-.LBB15
	.uleb128 0x1
	.4byte	.LASF154
	.2byte	0x13fa
	.byte	0xd
	.4byte	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF155
	.2byte	0x123e
	.byte	0xc
	.4byte	0x10d
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1033
	.uleb128 0x1
	.4byte	.LASF102
	.2byte	0x1240
	.byte	0xd
	.4byte	0x3fb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.4byte	.LASF23
	.2byte	0x1241
	.byte	0x10
	.4byte	0x139
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF156
	.2byte	0x1242
	.byte	0x10
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.uleb128 0x1
	.4byte	.LASF96
	.2byte	0x1257
	.byte	0x1a
	.4byte	0x14a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x7
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.4byte	0xfde
	.uleb128 0x1
	.4byte	.LASF157
	.2byte	0x125f
	.byte	0xd
	.4byte	0x45d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x7
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.4byte	0xffb
	.uleb128 0x1
	.4byte	.LASF114
	.2byte	0x1294
	.byte	0x15
	.4byte	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x7
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.4byte	0x1018
	.uleb128 0x1
	.4byte	.LASF114
	.2byte	0x129a
	.byte	0x19
	.4byte	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x8
	.4byte	.LBB13
	.4byte	.LBE13-.LBB13
	.uleb128 0x1
	.4byte	.LASF31
	.2byte	0x12a3
	.byte	0x15
	.4byte	0x23b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF158
	.2byte	0x11c2
	.byte	0xc
	.4byte	0x10d
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x106c
	.uleb128 0x2
	.4byte	.LASF159
	.2byte	0x11c2
	.byte	0x2a
	.4byte	0x139
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF160
	.2byte	0x11c4
	.byte	0x10
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF161
	.2byte	0x104c
	.byte	0x8
	.4byte	0x8b
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10a5
	.uleb128 0x2
	.4byte	.LASF162
	.2byte	0x104c
	.byte	0x24
	.4byte	0x251
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1
	.4byte	.LASF102
	.2byte	0x104e
	.byte	0xd
	.4byte	0x3fb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x27
	.4byte	.LASF188
	.byte	0x1
	.2byte	0x1040
	.byte	0xd
	.4byte	0x123
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF163
	.2byte	0x101d
	.byte	0xc
	.4byte	0x139
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10f5
	.uleb128 0x1
	.4byte	.LASF106
	.2byte	0x101f
	.byte	0x10
	.4byte	0x139
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.4byte	.LASF113
	.2byte	0x1020
	.byte	0x11
	.4byte	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF164
	.2byte	0x100a
	.byte	0xc
	.4byte	0x139
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x111f
	.uleb128 0x1
	.4byte	.LASF165
	.2byte	0x100c
	.byte	0x10
	.4byte	0x139
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xe
	.4byte	.LASF166
	.2byte	0xf74
	.byte	0xc
	.4byte	0x10d
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11e1
	.uleb128 0x1
	.4byte	.LASF102
	.2byte	0xf76
	.byte	0xd
	.4byte	0x3fb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF125
	.2byte	0xf77
	.byte	0x10
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x8
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x1
	.4byte	.LASF92
	.2byte	0xf86
	.byte	0x18
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x7
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0x118c
	.uleb128 0x1
	.4byte	.LASF114
	.2byte	0xf9c
	.byte	0x19
	.4byte	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x7
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.4byte	0x11a9
	.uleb128 0x1
	.4byte	.LASF114
	.2byte	0xf9e
	.byte	0x19
	.4byte	0x467
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x7
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.4byte	0x11c6
	.uleb128 0x1
	.4byte	.LASF31
	.2byte	0xf9f
	.byte	0x19
	.4byte	0x23b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x8
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.uleb128 0x1
	.4byte	.LASF167
	.2byte	0xfcc
	.byte	0x24
	.4byte	0x139
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF169
	.2byte	0xee3
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x28
	.4byte	.LASF170
	.byte	0x1
	.2byte	0xeb8
	.byte	0x6
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.4byte	.LASF171
	.2byte	0xe51
	.byte	0x6
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x122b
	.uleb128 0x1
	.4byte	.LASF106
	.2byte	0xe53
	.byte	0x10
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x29
	.4byte	.LASF189
	.byte	0x1
	.2byte	0xdb7
	.byte	0x13
	.4byte	0x10d
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1292
	.uleb128 0x1
	.4byte	.LASF106
	.2byte	0xdb9
	.byte	0x10
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1
	.4byte	.LASF92
	.2byte	0xdba
	.byte	0x10
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.4byte	.LASF172
	.2byte	0xdbb
	.byte	0xa
	.4byte	0x396
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1
	.4byte	.LASF173
	.2byte	0xdbc
	.byte	0x14
	.4byte	0xdb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1
	.4byte	.LASF174
	.2byte	0xdbd
	.byte	0x10
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x14
	.4byte	.LASF175
	.2byte	0x7e3
	.byte	0x11
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12d1
	.uleb128 0x2
	.4byte	.LASF176
	.2byte	0x7e3
	.byte	0x33
	.4byte	0x3fb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x8
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x1
	.4byte	.LASF31
	.2byte	0x81d
	.byte	0xd
	.4byte	0x23b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	.LASF177
	.2byte	0x701
	.byte	0xd
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x137d
	.uleb128 0x2
	.4byte	.LASF178
	.2byte	0x701
	.byte	0x32
	.4byte	0xdb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2
	.4byte	.LASF179
	.2byte	0x702
	.byte	0x36
	.4byte	0xad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.4byte	.LASF180
	.2byte	0x703
	.byte	0x40
	.4byte	0x108
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x2
	.4byte	.LASF138
	.2byte	0x704
	.byte	0x30
	.4byte	0x86
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.4byte	.LASF42
	.2byte	0x705
	.byte	0x2f
	.4byte	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.4byte	.LASF181
	.2byte	0x706
	.byte	0x38
	.4byte	0x1382
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.4byte	.LASF176
	.2byte	0x707
	.byte	0x2b
	.4byte	0x3fb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x2
	.4byte	.LASF182
	.2byte	0x708
	.byte	0x40
	.4byte	0x138c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1
	.4byte	.LASF39
	.2byte	0x70a
	.byte	0x13
	.4byte	0x38c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2a
	.string	"x"
	.byte	0x1
	.2byte	0x70b
	.byte	0x11
	.4byte	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x3
	.4byte	0x251
	.uleb128 0x5
	.4byte	0x137d
	.uleb128 0x3
	.4byte	0x387
	.uleb128 0x5
	.4byte	0x1387
	.uleb128 0xe
	.4byte	.LASF183
	.2byte	0x6b6
	.byte	0x10
	.4byte	0x10d
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1424
	.uleb128 0x2
	.4byte	.LASF178
	.2byte	0x6b6
	.byte	0x2c
	.4byte	0xdb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2
	.4byte	.LASF179
	.2byte	0x6b7
	.byte	0x30
	.4byte	0xad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.4byte	.LASF180
	.2byte	0x6b8
	.byte	0x3a
	.4byte	0x108
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x2
	.4byte	.LASF138
	.2byte	0x6b9
	.byte	0x2a
	.4byte	0x86
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.4byte	.LASF42
	.2byte	0x6ba
	.byte	0x29
	.4byte	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.4byte	.LASF181
	.2byte	0x6bb
	.byte	0x32
	.4byte	0x1382
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.4byte	.LASF176
	.2byte	0x6bd
	.byte	0x11
	.4byte	0x3fb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1
	.4byte	.LASF106
	.2byte	0x6be
	.byte	0x14
	.4byte	0x10d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF184
	.byte	0x1
	.2byte	0x654
	.byte	0x14
	.4byte	0x3fb
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF178
	.2byte	0x654
	.byte	0x32
	.4byte	0xdb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2
	.4byte	.LASF179
	.2byte	0x655
	.byte	0x36
	.4byte	0xad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.4byte	.LASF180
	.2byte	0x656
	.byte	0x40
	.4byte	0x108
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x2
	.4byte	.LASF138
	.2byte	0x657
	.byte	0x30
	.4byte	0x86
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.4byte	.LASF42
	.2byte	0x658
	.byte	0x2f
	.4byte	0x123
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x2
	.4byte	.LASF181
	.2byte	0x659
	.byte	0x38
	.4byte	0x1382
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1
	.4byte	.LASF176
	.2byte	0x65b
	.byte	0x11
	.4byte	0x3fb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x1
	.4byte	.LASF43
	.2byte	0x680
	.byte	0x1b
	.4byte	0x38c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x7
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
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
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
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
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
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x16
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
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x22
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
	.uleb128 0x34
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
	.uleb128 0x2b
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
.LASF92:
	.string	"xCoreID"
.LASF44:
	.string	"pcTaskName"
.LASF30:
	.string	"uxNumberOfItems"
.LASF185:
	.string	"GNU C17 14.2.0 -mabi=ilp32 -mtune=rocket -misa-spec=20191213 -mtls-dialect=trad -march=rv32i_zicsr -g -ffreestanding"
.LASF64:
	.string	"xCriticalNesting"
.LASF187:
	.string	"xPortStartScheduler"
.LASF42:
	.string	"uxPriority"
.LASF154:
	.string	"pxConstList"
.LASF38:
	.string	"tskTaskControlBlock"
.LASF123:
	.string	"ulBitsToClearOnExit"
.LASF188:
	.string	"uxTaskGetNumberOfTasks"
.LASF111:
	.string	"pxHigherPriorityTaskWoken"
.LASF47:
	.string	"eNoAction"
.LASF74:
	.string	"uxTopReadyPriority"
.LASF97:
	.string	"pxDelayedList"
.LASF2:
	.string	"unsigned int"
.LASF149:
	.string	"pxEventList"
.LASF75:
	.string	"xSchedulerRunning"
.LASF31:
	.string	"pxIndex"
.LASF19:
	.string	"StackType_t"
.LASF53:
	.string	"xTIME_OUT"
.LASF101:
	.string	"ulBitsToClear"
.LASF11:
	.string	"__int32_t"
.LASF167:
	.string	"xPendedCounts"
.LASF28:
	.string	"xLIST_ITEM"
.LASF66:
	.string	"pxReadyTasksLists"
.LASF112:
	.string	"ucOriginalNotifyState"
.LASF144:
	.string	"vTaskSetTimeOutState"
.LASF115:
	.string	"xTaskGenericNotifyFromISR"
.LASF77:
	.string	"xYieldPendings"
.LASF155:
	.string	"xTaskIncrementTick"
.LASF67:
	.string	"xDelayedTaskList1"
.LASF68:
	.string	"xDelayedTaskList2"
.LASF54:
	.string	"xOverflowCount"
.LASF158:
	.string	"xTaskCatchUpTicks"
.LASF60:
	.string	"ulParameters"
.LASF100:
	.string	"uxIndexToClear"
.LASF62:
	.string	"tskTCB"
.LASF113:
	.string	"uxSavedInterruptStatus"
.LASF17:
	.string	"uint32_t"
.LASF46:
	.string	"ucNotifyState"
.LASF86:
	.string	"uxListRemove"
.LASF119:
	.string	"xTaskGenericNotify"
.LASF147:
	.string	"pxUnblockedTCB"
.LASF128:
	.string	"xClearCountOnExit"
.LASF184:
	.string	"prvCreateTask"
.LASF142:
	.string	"xElapsedTime"
.LASF50:
	.string	"eSetValueWithOverwrite"
.LASF12:
	.string	"long long unsigned int"
.LASF163:
	.string	"xTaskGetTickCountFromISR"
.LASF122:
	.string	"ulBitsToClearOnEntry"
.LASF174:
	.string	"xIdleTaskNameIndex"
.LASF71:
	.string	"xPendingReadyList"
.LASF136:
	.string	"prvInitialiseTaskLists"
.LASF25:
	.string	"pxPrevious"
.LASF107:
	.string	"vTaskResetState"
.LASF157:
	.string	"pxTemp"
.LASF82:
	.string	"uxTopUsedPriority"
.LASF169:
	.string	"vTaskSuspendAll"
.LASF180:
	.string	"uxStackDepth"
.LASF52:
	.string	"eNotifyAction"
.LASF10:
	.string	"size_t"
.LASF49:
	.string	"eIncrement"
.LASF34:
	.string	"xMINI_LIST_ITEM"
.LASF73:
	.string	"xTickCount"
.LASF29:
	.string	"xLIST"
.LASF170:
	.string	"vTaskEndScheduler"
.LASF96:
	.string	"xConstTickCount"
.LASF179:
	.string	"pcName"
.LASF70:
	.string	"pxOverflowDelayedTaskList"
.LASF151:
	.string	"vTaskPlaceOnEventList"
.LASF81:
	.string	"xIdleTaskHandles"
.LASF45:
	.string	"ulNotifiedValue"
.LASF145:
	.string	"vTaskRemoveFromUnorderedEventList"
.LASF148:
	.string	"xTaskRemoveFromEventList"
.LASF13:
	.string	"char"
.LASF33:
	.string	"ListItem_t"
.LASF51:
	.string	"eSetValueWithoutOverwrite"
.LASF21:
	.string	"UBaseType_t"
.LASF120:
	.string	"xTaskGenericNotifyWait"
.LASF137:
	.string	"prvIdleTask"
.LASF32:
	.string	"xListEnd"
.LASF127:
	.string	"ulTaskGenericNotifyTake"
.LASF35:
	.string	"MiniListItem_t"
.LASF183:
	.string	"xTaskCreate"
.LASF175:
	.string	"prvAddNewTaskToReadyList"
.LASF16:
	.string	"uint8_t"
.LASF189:
	.string	"prvCreateIdleTasks"
.LASF176:
	.string	"pxNewTCB"
.LASF178:
	.string	"pxTaskCode"
.LASF160:
	.string	"xYieldOccurred"
.LASF61:
	.string	"MemoryRegion_t"
.LASF80:
	.string	"xNextTaskUnblockTime"
.LASF87:
	.string	"pxPortInitialiseStack"
.LASF4:
	.string	"long long int"
.LASF130:
	.string	"uxReturn"
.LASF103:
	.string	"ulReturn"
.LASF104:
	.string	"ulTaskGenericNotifyValueClear"
.LASF59:
	.string	"ulLengthInBytes"
.LASF20:
	.string	"BaseType_t"
.LASF133:
	.string	"prvResetNextTaskUnblockTime"
.LASF55:
	.string	"xTimeOnEntering"
.LASF18:
	.string	"TaskFunction_t"
.LASF24:
	.string	"pxNext"
.LASF118:
	.string	"pulPreviousNotificationValue"
.LASF90:
	.string	"memset"
.LASF140:
	.string	"pxTimeOut"
.LASF164:
	.string	"xTaskGetTickCount"
.LASF56:
	.string	"TimeOut_t"
.LASF143:
	.string	"vTaskInternalSetTimeOutState"
.LASF79:
	.string	"uxTaskNumber"
.LASF37:
	.string	"TaskHandle_t"
.LASF117:
	.string	"eAction"
.LASF129:
	.string	"uxTaskResetEventItemValue"
.LASF36:
	.string	"List_t"
.LASF162:
	.string	"xTaskToQuery"
.LASF22:
	.string	"TickType_t"
.LASF109:
	.string	"xTaskToNotify"
.LASF99:
	.string	"xTask"
.LASF48:
	.string	"eSetBits"
.LASF15:
	.string	"long double"
.LASF57:
	.string	"xMEMORY_REGION"
.LASF152:
	.string	"vTaskSwitchContext"
.LASF78:
	.string	"xNumOfOverflows"
.LASF27:
	.string	"pvContainer"
.LASF65:
	.string	"pxCurrentTCB"
.LASF126:
	.string	"xShouldBlock"
.LASF172:
	.string	"cIdleName"
.LASF9:
	.string	"short int"
.LASF88:
	.string	"vListInitialiseItem"
.LASF177:
	.string	"prvInitialiseNewTask"
.LASF138:
	.string	"pvParameters"
.LASF23:
	.string	"xItemValue"
.LASF3:
	.string	"long int"
.LASF166:
	.string	"xTaskResumeAll"
.LASF69:
	.string	"pxDelayedTaskList"
.LASF156:
	.string	"xSwitchRequired"
.LASF43:
	.string	"pxStack"
.LASF116:
	.string	"ulValue"
.LASF139:
	.string	"xTaskCheckForTimeOut"
.LASF89:
	.string	"vPortFree"
.LASF173:
	.string	"pxIdleTaskFunction"
.LASF124:
	.string	"pulNotificationValue"
.LASF106:
	.string	"xReturn"
.LASF168:
	.string	"vTaskMissedYield"
.LASF7:
	.string	"long unsigned int"
.LASF161:
	.string	"pcTaskGetName"
.LASF14:
	.string	"int32_t"
.LASF165:
	.string	"xTicks"
.LASF171:
	.string	"vTaskStartScheduler"
.LASF94:
	.string	"xCanBlockIndefinitely"
.LASF58:
	.string	"pvBaseAddress"
.LASF108:
	.string	"vTaskGenericNotifyGiveFromISR"
.LASF5:
	.string	"unsigned char"
.LASF150:
	.string	"vTaskPlaceOnUnorderedEventList"
.LASF84:
	.string	"vListInitialise"
.LASF141:
	.string	"pxTicksToWait"
.LASF85:
	.string	"vListInsert"
.LASF153:
	.string	"uxTopPriority"
.LASF41:
	.string	"xEventListItem"
.LASF63:
	.string	"TCB_t"
.LASF93:
	.string	"xTicksToWait"
.LASF26:
	.string	"pvOwner"
.LASF125:
	.string	"xAlreadyYielded"
.LASF132:
	.string	"xTaskGetCurrentTaskHandle"
.LASF146:
	.string	"pxEventListItem"
.LASF76:
	.string	"xPendedTicks"
.LASF159:
	.string	"xTicksToCatchUp"
.LASF182:
	.string	"xRegions"
.LASF135:
	.string	"prvAddCurrentTaskToDelayedList"
.LASF131:
	.string	"xTaskGetCurrentTaskHandleForCore"
.LASF72:
	.string	"uxCurrentNumberOfTasks"
.LASF8:
	.string	"signed char"
.LASF6:
	.string	"short unsigned int"
.LASF95:
	.string	"xTimeToWake"
.LASF40:
	.string	"xStateListItem"
.LASF102:
	.string	"pxTCB"
.LASF105:
	.string	"xTaskGenericNotifyStateClear"
.LASF83:
	.string	"uxSchedulerSuspended"
.LASF39:
	.string	"pxTopOfStack"
.LASF91:
	.string	"pvPortMalloc"
.LASF186:
	.string	"vPortEndScheduler"
.LASF114:
	.string	"pxList"
.LASF110:
	.string	"uxIndexToNotify"
.LASF181:
	.string	"pxCreatedTask"
.LASF134:
	.string	"prvCheckTasksWaitingTermination"
.LASF98:
	.string	"pxOverflowDelayedList"
.LASF121:
	.string	"uxIndexToWaitOn"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/rur1k/FinalTapeout/FinalTapeout/C_Code"
.LASF0:
	.string	"FreeRTOS-Kernel/tasks.c"
	.globl	__clzsi2
	.ident	"GCC: () 14.2.0"
	.section	.note.GNU-stack,"",@progbits
