# 0 "FreeRTOS-Kernel/portable/GCC/RISC-V/portASM.S"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/opt/riscv/sysroot/usr/include/stdc-predef.h" 1 3 4
# 0 "<command-line>" 2
# 1 "FreeRTOS-Kernel/portable/GCC/RISC-V/portASM.S"
# 60 "FreeRTOS-Kernel/portable/GCC/RISC-V/portASM.S"
# 1 "FreeRTOS-Kernel/portable/GCC/RISC-V/portContext.h" 1
# 44 "FreeRTOS-Kernel/portable/GCC/RISC-V/portContext.h"
# 1 "src/freertos_risc_v_chip_specific_extensions.h" 1
# 10 "src/freertos_risc_v_chip_specific_extensions.h"
.macro portasmSAVE_ADDITIONAL_REGISTERS

   .endm

   .macro portasmRESTORE_ADDITIONAL_REGISTERS

   .endm
# 45 "FreeRTOS-Kernel/portable/GCC/RISC-V/portContext.h" 2
# 63 "FreeRTOS-Kernel/portable/GCC/RISC-V/portContext.h"
.extern pxCurrentTCB
   .extern xISRStackTop
   .extern xCriticalNesting
   .extern pxCriticalNesting


   .macro portcontextSAVE_CONTEXT_INTERNAL
addi sp, sp, -( 31 * 4 )
sw x1, 1 * 4( sp )
sw x5, 2 * 4( sp )
sw x6, 3 * 4( sp )
sw x7, 4 * 4( sp )
sw x8, 5 * 4( sp )
sw x9, 6 * 4( sp )
sw x10, 7 * 4( sp )
sw x11, 8 * 4( sp )
sw x12, 9 * 4( sp )
sw x13, 10 * 4( sp )
sw x14, 11 * 4( sp )
sw x15, 12 * 4( sp )

    sw x16, 13 * 4( sp )
    sw x17, 14 * 4( sp )
    sw x18, 15 * 4( sp )
    sw x19, 16 * 4( sp )
    sw x20, 17 * 4( sp )
    sw x21, 18 * 4( sp )
    sw x22, 19 * 4( sp )
    sw x23, 20 * 4( sp )
    sw x24, 21 * 4( sp )
    sw x25, 22 * 4( sp )
    sw x26, 23 * 4( sp )
    sw x27, 24 * 4( sp )
    sw x28, 25 * 4( sp )
    sw x29, 26 * 4( sp )
    sw x30, 27 * 4( sp )
    sw x31, 28 * 4( sp )


lw t0, xCriticalNesting
sw t0, 29 * 4( sp )


csrr t0, mstatus
sw t0, 30 * 4( sp )


portasmSAVE_ADDITIONAL_REGISTERS

lw t0, pxCurrentTCB
sw sp, 0 ( t0 )

   .endm


   .macro portcontextSAVE_EXCEPTION_CONTEXT
portcontextSAVE_CONTEXT_INTERNAL
csrr a0, mcause
csrr a1, mepc
addi a1, a1, 4
sw a1, 0 ( sp )
lw sp, xISRStackTop
   .endm


   .macro portcontextSAVE_INTERRUPT_CONTEXT
portcontextSAVE_CONTEXT_INTERNAL
csrr a0, mcause
csrr a1, mepc
sw a1, 0 ( sp )
lw sp, xISRStackTop
   .endm


   .macro portcontextRESTORE_CONTEXT
lw t1, pxCurrentTCB
lw sp, 0 ( t1 )


lw t0, 0 ( sp )
csrw mepc, t0


portasmRESTORE_ADDITIONAL_REGISTERS


lw t0, 30 * 4( sp )
csrw mstatus, t0

lw t0, 29 * 4( sp )
lw t1, pxCriticalNesting
sw t0, 0 ( t1 )

lw x1, 1 * 4( sp )
lw x5, 2 * 4( sp )
lw x6, 3 * 4( sp )
lw x7, 4 * 4( sp )
lw x8, 5 * 4( sp )
lw x9, 6 * 4( sp )
lw x10, 7 * 4( sp )
lw x11, 8 * 4( sp )
lw x12, 9 * 4( sp )
lw x13, 10 * 4( sp )
lw x14, 11 * 4( sp )
lw x15, 12 * 4( sp )

    lw x16, 13 * 4( sp )
    lw x17, 14 * 4( sp )
    lw x18, 15 * 4( sp )
    lw x19, 16 * 4( sp )
    lw x20, 17 * 4( sp )
    lw x21, 18 * 4( sp )
    lw x22, 19 * 4( sp )
    lw x23, 20 * 4( sp )
    lw x24, 21 * 4( sp )
    lw x25, 22 * 4( sp )
    lw x26, 23 * 4( sp )
    lw x27, 24 * 4( sp )
    lw x28, 25 * 4( sp )
    lw x29, 26 * 4( sp )
    lw x30, 27 * 4( sp )
    lw x31, 28 * 4( sp )

addi sp, sp, ( 31 * 4 )

mret
   .endm
# 61 "FreeRTOS-Kernel/portable/GCC/RISC-V/portASM.S" 2
# 82 "FreeRTOS-Kernel/portable/GCC/RISC-V/portASM.S"
.global xPortStartFirstTask
.global pxPortInitialiseStack
.global freertos_risc_v_trap_handler
.global freertos_risc_v_exception_handler
.global freertos_risc_v_interrupt_handler
.global freertos_risc_v_mtimer_interrupt_handler

.extern vTaskSwitchContext
.extern xTaskIncrementTick
.extern pullMachineTimerCompareRegister
.extern pullNextTime
.extern uxTimerIncrementsForOneTick
.extern xTaskReturnAddress

.weak freertos_risc_v_application_exception_handler
.weak freertos_risc_v_application_interrupt_handler


.macro portUPDATE_MTIMER_COMPARE_REGISTER
    lw a0, pullMachineTimerCompareRegister
    lw a1, pullNextTime




        li a4, -1
        lw a2, 0(a1)
        lw a3, 4(a1)
        sw a4, 0(a0)
        sw a3, 4(a0)
        sw a2, 0(a0)
        lw t0, uxTimerIncrementsForOneTick
        add a4, t0, a2
        sltu t1, a4, a2
        add t2, a3, t1
        sw a4, 0(a1)
        sw t2, 4(a1)
# 132 "FreeRTOS-Kernel/portable/GCC/RISC-V/portASM.S"
    .endm
# 198 "FreeRTOS-Kernel/portable/GCC/RISC-V/portASM.S"
pxPortInitialiseStack:
    csrr t0, mstatus
    andi t0, t0, ~0x8
    addi t1, x0, 0x188
    slli t1, t1, 4
    or t0, t0, t1

    addi a0, a0, -4
    sw t0, 0(a0)
    addi a0, a0, -4
    sw x0, 0(a0)




    addi a0, a0, -(22 * 4)

    sw a2, 0(a0)
    addi a0, a0, -(6 * 4)
    lw t0, xTaskReturnAddress
    sw t0, 0(a0)
    addi t0, x0, 0
chip_specific_stack_frame:
    beq t0, x0, 1f
    addi a0, a0, -4
    sw x0, 0(a0)
    addi t0, t0, -1
    j chip_specific_stack_frame
1:
    addi a0, a0, -4
    sw a1, 0(a0)
    ret


xPortStartFirstTask:
    lw sp, pxCurrentTCB
    lw sp, 0( sp )

    lw x1, 0( sp )

    portasmRESTORE_ADDITIONAL_REGISTERS

    lw x7, 4 * 4( sp )
    lw x8, 5 * 4( sp )
    lw x9, 6 * 4( sp )
    lw x10, 7 * 4( sp )
    lw x11, 8 * 4( sp )
    lw x12, 9 * 4( sp )
    lw x13, 10 * 4( sp )
    lw x14, 11 * 4( sp )
    lw x15, 12 * 4( sp )

    lw x16, 13 * 4( sp )
    lw x17, 14 * 4( sp )
    lw x18, 15 * 4( sp )
    lw x19, 16 * 4( sp )
    lw x20, 17 * 4( sp )
    lw x21, 18 * 4( sp )
    lw x22, 19 * 4( sp )
    lw x23, 20 * 4( sp )
    lw x24, 21 * 4( sp )
    lw x25, 22 * 4( sp )
    lw x26, 23 * 4( sp )
    lw x27, 24 * 4( sp )
    lw x28, 25 * 4( sp )
    lw x29, 26 * 4( sp )
    lw x30, 27 * 4( sp )
    lw x31, 28 * 4( sp )


    lw x5, 29 * 4( sp )
    lw x6, pxCriticalNesting
    sw x5, 0( x6 )

    lw x5, 30 * 4( sp )
    addi x5, x5, 0x08
    csrrw x0, mstatus, x5

    lw x5, 2 * 4( sp )
    lw x6, 3 * 4( sp )

    addi sp, sp, ( 31 * 4 )
    ret


freertos_risc_v_application_exception_handler:
    csrr t0, mcause
    csrr t1, mepc
    csrr t2, mstatus
    j .


freertos_risc_v_application_interrupt_handler:
    csrr t0, mcause
    csrr t1, mepc
    csrr t2, mstatus
    j .


.section .text.freertos_risc_v_exception_handler
freertos_risc_v_exception_handler:
    portcontextSAVE_EXCEPTION_CONTEXT

    li t0, 11
    bne a0, t0, other_exception
    call vTaskSwitchContext
    portcontextRESTORE_CONTEXT

other_exception:
    call freertos_risc_v_application_exception_handler
    portcontextRESTORE_CONTEXT


.section .text.freertos_risc_v_interrupt_handler
freertos_risc_v_interrupt_handler:
    portcontextSAVE_INTERRUPT_CONTEXT
    call freertos_risc_v_application_interrupt_handler
    portcontextRESTORE_CONTEXT


.section .text.freertos_risc_v_mtimer_interrupt_handler
freertos_risc_v_mtimer_interrupt_handler:
    portcontextSAVE_INTERRUPT_CONTEXT
    portUPDATE_MTIMER_COMPARE_REGISTER
    call xTaskIncrementTick
    beqz a0, exit_without_context_switch
    call vTaskSwitchContext
exit_without_context_switch:
    portcontextRESTORE_CONTEXT


.section .text.freertos_risc_v_trap_handler
.align 8
freertos_risc_v_trap_handler:
    portcontextSAVE_CONTEXT_INTERNAL

    csrr a0, mcause
    csrr a1, mepc

    bge a0, x0, synchronous_exception

asynchronous_interrupt:
    sw a1, 0( sp )
    lw sp, xISRStackTop
    j handle_interrupt

synchronous_exception:
    addi a1, a1, 4
    sw a1, 0( sp )
    lw sp, xISRStackTop
    j handle_exception

handle_interrupt:


    test_if_mtimer:
        addi t0, x0, 1
        slli t0, t0, 32 - 1
        addi t1, t0, 7
        bne a0, t1, application_interrupt_handler

        portUPDATE_MTIMER_COMPARE_REGISTER
        call xTaskIncrementTick
        beqz a0, processed_source
        call vTaskSwitchContext
        j processed_source



application_interrupt_handler:
    call freertos_risc_v_application_interrupt_handler
    j processed_source

handle_exception:

    li t0, 11
    bne a0, t0, application_exception_handler
    call vTaskSwitchContext
    j processed_source

application_exception_handler:
    call freertos_risc_v_application_exception_handler
    j processed_source

processed_source:
    portcontextRESTORE_CONTEXT
