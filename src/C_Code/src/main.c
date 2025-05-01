#include "FreeRTOS.h"
#include "FreeRTOSConfig.h"
#include "functions.h"
#include "task.h"
#include <stddef.h>
#include <stdint.h>

void task1(void *param) {

  while (1) {
    uart_puts("Task1\n");
    vTaskDelay(1000 / portTICK_PERIOD_MS);
  }
}

void task2(void *param) {

  while (1) {
    uart_puts("Task2\n");
    vTaskDelay(1000 / portTICK_PERIOD_MS);
  }
}

void main() {

  TaskHandle_t Task_1 = NULL;
  TaskHandle_t Task_2 = NULL;

  uart_setup();

  xTaskCreate(task1, "task 1", 1024, NULL, tskIDLE_PRIORITY, &Task_1);
  xTaskCreate(task2, "task 2", 1024, NULL, tskIDLE_PRIORITY, &Task_2);

  vTaskStartScheduler();

  for (;;) {
  }
}
