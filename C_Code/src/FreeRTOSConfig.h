
#ifndef FREERTOS_CONFIG_H
#define FREERTOS_CONFIG_H

#define configMTIME_BASE_ADDRESS                0x2000008
#define configMTIMECMP_BASE_ADDRESS             0x2000000
                                                
#define configISR_STACK_SIZE_WORDS              500

#define configMINIMAL_STACK_SIZE                32

#define configMAX_PRIORITIES                    1
#define configUSE_IDLE_HOOK                     0
#define configUSE_16_BIT_TICKS                  0
#define configUSE_PREEMPTION                    0
#define configUSE_TICK_HOOK                     0
#define configCPU_CLOCK_HZ                      1000*1000
#define configTICK_RATE_HZ                      4
#define configTOTAL_HEAP_SIZE                   1024

#endif /* FREERTOS_CONFIG_H */

