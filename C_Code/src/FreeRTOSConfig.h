/*
 * FreeRTOS V202212.00
 * Copyright (C) 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * https://www.FreeRTOS.org
 * https://github.com/FreeRTOS
 *
 */

#ifndef FREERTOS_CONFIG_H
#define FREERTOS_CONFIG_H

/*-----------------------------------------------------------
 * Application specific definitions.
 *
 * These definitions should be adjusted for your particular hardware and
 * application requirements.
 *
 * THESE PARAMETERS ARE DESCRIBED WITHIN THE 'CONFIGURATION' SECTION OF THE
 * FreeRTOS API DOCUMENTATION AVAILABLE ON THE FreeRTOS.org WEB SITE.
 *
 * See http://www.freertos.org/a00110.html
 *----------------------------------------------------------*/

#define CLINT_ADDR			0x02000000UL
#define CLINT_MSIP			0x0000UL
#define CLINT_MTIMECMP		0x4000UL
#define CLINT_MTIME			0xbff8UL

/* See https://www.freertos.org/Using-FreeRTOS-on-RISC-V.html */
#define configMTIME_BASE_ADDRESS		( CLINT_ADDR + CLINT_MTIME )
#define configMTIMECMP_BASE_ADDRESS		( CLINT_ADDR + CLINT_MTIMECMP )
#define configISR_STACK_SIZE_WORDS		( 300 )

#define configUSE_PREEMPTION			1
#define configUSE_IDLE_HOOK				0
#define configUSE_TICK_HOOK				1
#define configCPU_CLOCK_HZ				( ( unsigned long ) 25000000 )
#define configTICK_RATE_HZ				( ( TickType_t ) 1000 )

#if __riscv_xlen == 64
#define configMINIMAL_STACK_SIZE		( ( unsigned short ) 240 )
#define configTOTAL_HEAP_SIZE			( ( size_t ) ( 220 * 1024 ) )
#else
#define configMINIMAL_STACK_SIZE		( ( unsigned short ) 120 )
#define configTOTAL_HEAP_SIZE			( ( size_t ) ( 80 * 1024 ) )
#endif
#define configMAX_TASK_NAME_LEN			( 12 )
#define configUSE_TRACE_FACILITY		1
#define configUSE_16_BIT_TICKS			0
#define configIDLE_SHOULD_YIELD			0
#define configUSE_CO_ROUTINES 			0
#define configUSE_MUTEXES				1
#define configUSE_RECURSIVE_MUTEXES		1
#define configCHECK_FOR_STACK_OVERFLOW	2
#define configUSE_MALLOC_FAILED_HOOK	1
#define configUSE_QUEUE_SETS			1
#define configUSE_COUNTING_SEMAPHORES	1
#define configUSE_PORT_OPTIMISED_TASK_SELECTION 1

#define configMAX_PRIORITIES			( 9UL )
#define configMAX_CO_ROUTINE_PRIORITIES ( 2 )
#define configQUEUE_REGISTRY_SIZE		10
#define configSUPPORT_STATIC_ALLOCATION	1

/* Timer related defines. */
#define configUSE_TIMERS				1
#define configTIMER_TASK_PRIORITY		( configMAX_PRIORITIES - 3 )
#define configTIMER_QUEUE_LENGTH		20
#define configTIMER_TASK_STACK_DEPTH	( configMINIMAL_STACK_SIZE * 2 )

#define configUSE_TASK_NOTIFICATIONS	1
#define configTASK_NOTIFICATION_ARRAY_ENTRIES 3

/* Set the following definitions to 1 to include the API function, or zero
to exclude the API function. */

#define INCLUDE_vTaskPrioritySet				1
#define INCLUDE_uxTaskPriorityGet				1
#define INCLUDE_vTaskDelete						1
#define INCLUDE_vTaskCleanUpResources			0
#define INCLUDE_vTaskSuspend					1
#define INCLUDE_vTaskDelayUntil					1
#define INCLUDE_vTaskDelay						1
#define INCLUDE_uxTaskGetStackHighWaterMark		1
#define INCLUDE_xTaskGetSchedulerState			1
#define INCLUDE_xTimerGetTimerDaemonTaskHandle	1
#define INCLUDE_xTaskGetIdleTaskHandle			1
#define INCLUDE_xSemaphoreGetMutexHolder		1
#define INCLUDE_eTaskGetState					1
#define INCLUDE_xTimerPendFunctionCall			1
#define INCLUDE_xTaskAbortDelay					1
#define INCLUDE_xTaskGetCurrentTaskHandle		1
#define INCLUDE_xTaskGetHandle					1

/* This demo makes use of one or more example stats formatting functions.  These
format the raw data provided by the uxTaskGetSystemState() function in to human
readable ASCII form.  See the notes in the implementation of vTaskList() within
FreeRTOS/Source/tasks.c for limitations. */
#define configUSE_STATS_FORMATTING_FUNCTIONS	0

/* The QEMU target is capable of running all the tests tasks at the same
 * time. */
#define configRUN_ADDITIONAL_TESTS				1

void vAssertCalled( const char *pcFileName, uint32_t ulLine );
#define configASSERT( x ) if( ( x ) == 0 ) vAssertCalled( __FILE__, __LINE__ );

/* The test that checks the trigger level on stream buffers requires an
allowable margin of error on slower processors (slower than the Win32
machine on which the test is developed). */
#define configSTREAM_BUFFER_TRIGGER_LEVEL_TEST_MARGIN   2

#define intqHIGHER_PRIORITY		( configMAX_PRIORITIES - 5 )
#define bktPRIMARY_PRIORITY		( configMAX_PRIORITIES - 4 )
#define bktSECONDARY_PRIORITY	( configMAX_PRIORITIES - 5 )

#ifdef PICOLIBC_TLS
#define configUSE_PICOLIBC_TLS                  1
#endif

#endif /* FREERTOS_CONFIG_H */


#ifndef FREERTOS_CONFIG_H
#define FREERTOS_CONFIG_H
#define CLINT_ADDR			0x02000000UL
#define CLINT_MSIP			0x0000UL
#define CLINT_MTIMECMP		0x4000UL
#define CLINT_MTIME			0xbff8UL

#define configMTIME_BASE_ADDRESS                ( CLINT_ADDR + CLINT_MTIME )
#define configMTIMECMP_BASE_ADDRESS             ( CLINT_ADDR + CLINT_MTIMECMP )
                                                
#define configISR_STACK_SIZE_WORDS              300

#define configMINIMAL_STACK_SIZE                32
#define configMAX_PRIORITIES                    1
#define configUSE_IDLE_HOOK                     0
#define configUSE_16_BIT_TICKS                  0
#define configUSE_PREEMPTION                    0
#define configUSE_TICK_HOOK                     0
#define configCPU_CLOCK_HZ                      1000*1000
#define configTICK_RATE_HZ                      4
#define configTOTAL_HEAP_SIZE                   1024

#define configUSE_TIMERS				        1
#define configTIMER_TASK_PRIORITY		( configMAX_PRIORITIES - 3 )
#define configTIMER_QUEUE_LENGTH		        20
#define configTIMER_TASK_STACK_DEPTH	( configMINIMAL_STACK_SIZE * 2 )

#define configUSE_TASK_NOTIFICATIONS	        1
#define configTASK_NOTIFICATION_ARRAY_ENTRIES   3

#endif /* FREERTOS_CONFIG_H */

