#include <stddef.h>
#include <stdint.h>

#define UART0_BASE 0x10000000

// Use a datasheet for a 16550 UART
// For example: https://www.ti.com/lit/ds/symlink/tl16c550d.pdf
#define REG(base, offset) ((*((volatile unsigned char *)(base + offset))))
#define UART0_DR REG(UART0_BASE, 0x00)
#define UART0_FCR REG(UART0_BASE, 0x02)
#define UART0_LSR REG(UART0_BASE, 0x05)

#define UARTFCR_FFENA 0x01 // UART FIFO Control Register enable bit
#define UARTLSR_THRE                                                           \
  0x20 // UART Line Status Register Transmit Hold Register Empty bit
#define UART0_FF_THR_EMPTY (UART0_LSR & UARTLSR_THRE)

void uart_setup();

void uart_putc(char c);

void uart_puts(const char *str);
int32_t __mulsi3(int32_t a, int32_t b);
int32_t __clzsi2(uint32_t x);
unsigned int __udivsi3(unsigned int a, unsigned int b);

void *memcpy(void *dest, const void *src, size_t n);
void *memset(void *s, int c, size_t n);
