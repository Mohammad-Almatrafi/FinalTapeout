.section .init
__start:
la sp,  __stack_top
add s0,sp,x0
la a0,freertos_vector_table
csrrw zero, mtvec,a0
csrrsi zero, mtvec, 1
csrrs a0, mtvec, zero
add a0, zero, zero
j main

.section .data.__stack
.space 1024 * 4
.align 4
__stack_top:

.section .vector_table
.balign 128, 0
.option norvc
.global freertos_vector_table
freertos_vector_table:
IRQ_0:
j freertos_risc_v_exception_handler
IRQ_1:
j freertos_risc_v_interrupt_handler
IRQ_2:
j freertos_risc_v_interrupt_handler
IRQ_3:
j freertos_risc_v_interrupt_handler
IRQ_4:
j freertos_risc_v_interrupt_handler
IRQ_5:
j freertos_risc_v_interrupt_handler
IRQ_6:
j freertos_risc_v_interrupt_handler
IRQ_7:
j freertos_risc_v_mtimer_interrupt_handler
IRQ_8:
j freertos_risc_v_interrupt_handler
IRQ_9:
j freertos_risc_v_interrupt_handler
IRQ_10:
j freertos_risc_v_interrupt_handler
IRQ_11:
j freertos_risc_v_interrupt_handler
IRQ_12:
j freertos_risc_v_interrupt_handler
IRQ_13:
j freertos_risc_v_interrupt_handler
IRQ_14:
j freertos_risc_v_interrupt_handler
IRQ_15:
j freertos_risc_v_interrupt_handler

