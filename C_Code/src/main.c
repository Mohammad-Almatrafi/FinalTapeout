#include <stdint.h>
#include <stddef.h>

void main(){
    int i = 0;
    while(1) {
        i = i+1;
    }


}

void vApplicationIdleHook(void) {
    // Custom idle task behavior
}

void vApplicationTickHook(void) {
    // Custom tick hook behavior
}
// TaskHandle_t xTask, char *pcTaskName
void vApplicationStackOverflowHook(void) {
    // Handle stack overflow
}
// StaticTask_t **ppxIdleTaskTCBBuffer, StackType_t **ppxIdleTaskStackBuffer, uint32_t *pulIdleTaskStackSize
void vApplicationGetIdleTaskMemory(void) {
    // Provide memory for the idle task
}
// StaticTask_t **ppxTimerTaskTCBBuffer, StackType_t **ppxTimerTaskStackBuffer, uint32_t *pulTimerTaskStackSize
void vApplicationGetTimerTaskMemory(void) {
    // Provide memory for the timer task
}

// #include "FreeRTOS.h"
// #include "task.h"

// // CLINT registers
// #define CLINT_BASE 0x02000000
// #define MTIME (volatile uint64_t*)(CLINT_BASE + 0xBFF8)
// #define MTIMECMP (volatile uint64_t*)(CLINT_BASE + 0x4000)

// // Timer interrupt handler
// void Timer_Handler(void) {
//     // Clear the timer interrupt by setting mtimecmp to a future value
//     *MTIMECMP = *MTIME + (configCPU_CLOCK_HZ / configTICK_RATE_HZ);

//     // Call the FreeRTOS tick handler
//     xPortSysTickHandler();
// }

// // Initialize the timer
// void vPortSetupTimerInterrupt(void) {
//     // Set the timer compare value
//     *MTIMECMP = *MTIME + (configCPU_CLOCK_HZ / configTICK_RATE_HZ);

//     // Enable timer interrupts in the mie CSR
//     __asm volatile("csrs mie, %0" : : "r"(0x80)); // MTIE bit
// }

// // Start the scheduler
// void vPortStartScheduler(void) {
//     // Enable global interrupts in the mstatus CSR
//     __asm volatile("csrs mstatus, 8");

//     // Start the first task
//     __asm volatile("mv a0, %0" : : "r"(pxCurrentTCB));
//     __asm volatile("jr a0");
// }



