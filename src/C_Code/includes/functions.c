#include "functions.h"
#include "FreeRTOS.h"
#include "FreeRTOSConfig.h"
#include "task.h"
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

// void vFullDemoTickHookFunction(void) {
//     /* Write to a queue that is in use as part of the queue set demo to
//    * demonstrate using queue sets from an ISR. */
//     vQueueSetAccessQueueSetFromISR();
//
//     /* Call the event group ISR tests. */
//     vPeriodicEventGroupsProcessing();
//
//     /* Exercise stream buffers from interrupts. */
//     vPeriodicStreamBufferProcessing();
//
//     /* Exercise using queue overwrites from interrupts. */
//     vQueueOverwritePeriodicISRDemo();
//
//     /* Exercise using Queue Sets from interrupts. */
//     vQueueSetPollingInterruptAccess();
//
//     /* Exercise using task notifications from interrupts. */
//     xNotifyTaskFromISR();
//     xNotifyArrayTaskFromISR();
//
//     /* Exercise software timers from interrupts. */
//     vTimerPeriodicISRTests();
//
//     /* Exercise stream buffers from interrupts. */
//     vBasicStreamBufferSendFromISR();
//
//     /* Exercise semaphores from interrupts. */
//     vInterruptSemaphorePeriodicTest();
// }

void vApplicationGetTimerTaskMemory(StaticTask_t **ppxTimerTaskTCBBuffer,
                                    StackType_t **ppxTimerTaskStackBuffer,
                                    uint32_t *pulTimerTaskStackSize) {
  /* If the buffers to be provided to the Timer task are declared inside this
   * function then they must be declared static - otherwise they will be
   * allocated on the stack and so not exists after this function exits. */
  static StaticTask_t xTimerTaskTCB;
  static StackType_t uxTimerTaskStack[configTIMER_TASK_STACK_DEPTH];

  /* Pass out a pointer to the StaticTask_t structure in which the Timer
   * task's state will be stored. */
  *ppxTimerTaskTCBBuffer = &xTimerTaskTCB;

  /* Pass out the array that will be used as the Timer task's stack. */
  *ppxTimerTaskStackBuffer = uxTimerTaskStack;

  /* Pass out the size of the array pointed to by *ppxTimerTaskStackBuffer.
   * Note that, as the array is necessarily of type StackType_t,
   * configMINIMAL_STACK_SIZE is specified in words, not bytes. */
  *pulTimerTaskStackSize = configTIMER_TASK_STACK_DEPTH;
}

void vApplicationGetIdleTaskMemory(StaticTask_t **ppxIdleTaskTCBBuffer,
                                   StackType_t **ppxIdleTaskStackBuffer,
                                   StackType_t *pulIdleTaskStackSize) {
  /* If the buffers to be provided to the Idle task are declared inside this
   * function then they must be declared static - otherwise they will be
   * allocated on the stack and so not exists after this function exits. */
  static StaticTask_t xIdleTaskTCB;
  static StackType_t uxIdleTaskStack[configMINIMAL_STACK_SIZE];

  /* Pass out a pointer to the StaticTask_t structure in which the Idle task's
   * state will be stored. */
  *ppxIdleTaskTCBBuffer = &xIdleTaskTCB;

  /* Pass out the array that will be used as the Idle task's stack. */
  *ppxIdleTaskStackBuffer = uxIdleTaskStack;

  /* Pass out the size of the array pointed to by *ppxIdleTaskStackBuffer.
   * Note that, as the array is necessarily of type StackType_t,
   * configMINIMAL_STACK_SIZE is specified in words, not bytes. */
  *pulIdleTaskStackSize = configMINIMAL_STACK_SIZE;
}

void vApplicationMallocFailedHook(void) {
  /* vApplicationMallocFailedHook() will only be called if
   * configUSE_MALLOC_FAILED_HOOK is set to 1 in FreeRTOSConfig.h.  It is a hook
   * function that will get called if a call to pvPortMalloc() fails.
   * pvPortMalloc() is called internally by the kernel whenever a task, queue,
   * timer or semaphore is created using the dynamic allocation (as opposed to
   * static allocation) option.  It is also called by various parts of the
   * demo application.  If heap_1.c, heap_2.c or heap_4.c is being used, then
   * the size of the	heap available to pvPortMalloc() is defined by
   * configTOTAL_HEAP_SIZE in FreeRTOSConfig.h, and the xPortGetFreeHeapSize()
   * API function can be used to query the size of free heap space that remains
   * (although it does not provide information on how the remaining heap might
   * be fragmented).  See http://www.freertos.org/a00111.html for more
   * information. */
  uart_puts("\r\n\r\nMalloc failed\r\n");
  portDISABLE_INTERRUPTS();

  for (;;) {
  }
}

void vApplicationIdleHook(void) {
  /* vApplicationIdleHook() will only be called if configUSE_IDLE_HOOK is set
   * to 1 in FreeRTOSConfig.h.  It will be called on each iteration of the idle
   * task.  It is essential that code added to this hook function never attempts
   * to block in any way (for example, call xQueueReceive() with a block time
   * specified, or call vTaskDelay()).  If application tasks make use of the
   * vTaskDelete() API function to delete themselves then it is also important
   * that vApplicationIdleHook() is permitted to return to its calling function,
   * because it is the responsibility of the idle task to clean up memory
   * allocated by the kernel to any task that has since deleted itself. */
}
/*-----------------------------------------------------------*/

void vApplicationStackOverflowHook(TaskHandle_t pxTask, char *pcTaskName) {
  (void)pcTaskName;
  (void)pxTask;

  /* Run time stack overflow checking is performed if
   * configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  This hook
   * function is called if a stack overflow is detected. */
  uart_puts("\r\n\r\nStack overflow in \r\n"); //, pcTaskName);
  portDISABLE_INTERRUPTS();

  for (;;) {
  }
}
/*-----------------------------------------------------------*/

void vApplicationTickHook(void) {
  /* This function will be called by each tick interrupt if
   * configUSE_TICK_HOOK is set to 1 in FreeRTOSConfig.h.  User code can be
   * added here, but the tick hook is called from an interrupt context, so
   * code must not attempt to block, and only the interrupt safe FreeRTOS API
   * functions can be used (those that end in FromISR()). */

// #if (mainCREATE_SIMPLE_BLINKY_DEMO_ONLY != 1)
//   {
//     extern void vFullDemoTickHookFunction(void);
//
//     vFullDemoTickHookFunction();
//   }
// #endif /* mainCREATE_SIMPLE_BLINKY_DEMO_ONLY */
}
/*-----------------------------------------------------------*/

void vApplicationDaemonTaskStartupHook(void) {
  /* This function will be called once only, when the daemon task starts to
   * execute (sometimes called the timer task).  This is useful if the
   * application includes initialisation code that would benefit from executing
   * after the scheduler has been started. */
}
/*-----------------------------------------------------------*/

void vAssertCalled(const char *pcFileName, uint32_t ulLine) {
  volatile uint32_t ulSetToNonZeroInDebuggerToContinue = 0;

  /* Called if an assertion passed to configASSERT() fails.  See
   * http://www.freertos.org/a00110.html#configASSERT for more information. */

  uart_puts("ASSERT! Line , file \n"); //, (int)ulLine, pcFileName);

  taskENTER_CRITICAL();
  {
    /* You can step out of this function to debug the assertion by using
     * the debugger to set ulSetToNonZeroInDebuggerToContinue to a non-zero
     * value. */
    while (ulSetToNonZeroInDebuggerToContinue == 0) {
      __asm volatile("NOP");
      __asm volatile("NOP");
    }
  }
  taskEXIT_CRITICAL();
}

void uart_setup() {
  UART0_FCR = UARTFCR_FFENA; // Set the FIFO for polled operation
}

void uart_putc(char c) {
  while (!UART0_FF_THR_EMPTY)
    ;           // Wait until the FIFO holding register is empty
  UART0_DR = c; // Write character to transmitter register
}

void uart_puts(const char *str) {
  while (*str) {       // Loop until value at string pointer is zero
    uart_putc(*str++); // Write the character and increment pointer
  }
}

// 32-bit signed multiplication using bitwise operations and addition
int32_t __mulsi3(int32_t a, int32_t b) {
  int32_t result = 0;
  int negative =
      (a < 0) ^ (b < 0); // Determine if the result should be negative

  // Convert to absolute values
  uint32_t x = (a < 0) ? -a : a;
  uint32_t y = (b < 0) ? -b : b;

  while (y) {
    if (y & 1) {
      result += x;
    }
    x <<= 1; // Shift left (multiply by 2)
    y >>= 1; // Shift right (divide by 2)
  }

  return negative ? -result : result;
}

// Count leading zeros for 32-bit integer
int32_t __clzsi2(uint32_t x) {
  if (x == 0)
    return 32;
  int count = 0;
  for (int32_t mask = 0x80000000; (x & mask) == 0; mask >>= 1) {
    count++;
  }
  return count;
}

unsigned int __udivsi3(unsigned int a, unsigned int b) {
  unsigned int q = 0;
  unsigned int r = 0;

  // Loop over the bits of the dividend
  for (int i = 31; i >= 0; --i) {
    // Shift remainder left and add the next bit of the dividend
    r = (r << 1) | ((a >> i) & 1);

    // If the remainder is greater than or equal to the divisor, subtract
    // divisor
    if (r >= b) {
      r -= b;
      q |= (1U << i);
    }
  }

  return q;
}

size_t strlen(const char *str) {
    size_t len = 0;
    while (str[len] != '\0') {
        len++;
    }
    return len;
}


void *memcpy(void *dest, const void *src, size_t n) {
  char *d = dest;
  const char *s = src;
  while (n--)
    *d++ = *s++;
  return dest;
}

void *memset(void *s, int c, size_t n) {
  char *p = s;
  while (n--)
    *p++ = c;
  return s;
}
