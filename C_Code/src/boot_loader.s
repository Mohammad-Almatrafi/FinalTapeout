
.section .init
__start:
la sp,  __stack_top
add s0,sp,x0
j main

.section .data.__stack
.space 1024 * 4
.align 4
__stack_top:
