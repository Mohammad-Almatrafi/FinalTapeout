

.section .text.__start
__start:
la sp,  __stack_top
add s0,sp,x0
jal zero, main

.section .data
.space 1024 * 8
.align 16
__stack_top:
