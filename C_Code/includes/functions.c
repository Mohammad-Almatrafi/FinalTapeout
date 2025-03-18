#include "functions.h"
#include <stddef.h>
#include <stdint.h>

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
