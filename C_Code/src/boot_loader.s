
.section .init
__start:
la sp,  __stack_top
add s0,sp,x0
la a0,freertos_risc_v_trap_handler
csrrw zero, mtvec,a0
add a0, zero, zero
j main

.section .data.__stack
.space 1024 * 4
.align 4
__stack_top:
