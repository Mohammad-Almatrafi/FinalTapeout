

.section .text.__start
__start:
la sp,  __stack_top
add s0,sp,x0
j main

.section .data
.space 1024 * 4
.align 16
__stack_top:
