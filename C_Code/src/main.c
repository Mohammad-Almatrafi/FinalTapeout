#include "FreeRTOS.h"
#include "FreeRTOSConfig.h"
#include "functions.h"
#include "task.h"
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#define _OPEN_SYS_ITOA_EXT
#include <stdlib.h>

void task1(void *param) uart_puts("Task1\n");

void task2(void *param) uart_puts("Task2\n");

void main() {

  int *mtime_addr = (int *)configMTIME_BASE_ADDRESS;
  int *mtimecmp_addr = (int *)configMTIMECMP_BASE_ADDRESS;

  *(mtimecmp_addr + 0) = (int)0xffffffff;
  *(mtimecmp_addr + 1) = (int)0xffffffff;
  *(mtime_addr + 0) = (int)0x0;
  *(mtime_addr + 1) = (int)0x0;
  TaskHandle_t Task_1 = NULL;
  TaskHandle_t Task_2 = NULL;

  uart_setup();

  xTaskCreate(task1, "task 1", 1024, NULL, 1, &Task_1);
  xTaskCreate(task2, "task 2", 1024, NULL, 2, &Task_2);

  vTaskStartScheduler();
}
