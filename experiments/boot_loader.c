#include <stdint.h>

#define MSTATUS 0x300  // mstatus CSR address
#define MIE 0x304      // mie CSR address
#define MTVEC 0x305    // mtvec CSR address

#define MTIMECMP_ADDR ((volatile uint32_t *)0x20000C00)  // mtimecmp address

// Function to set a CSR (Control and Status Register)
static inline void write_csr(uint32_t csr, uint32_t value) {
    __asm__ volatile ("csrrw %0, %1" : : "i"(csr), "r"(value));
}

// Function to set specific bits in a CSR
static inline void set_csr(uint32_t csr, uint32_t mask) {
    __asm__ volatile ("csrrs zero, %0, %1" : : "i"(csr), "r"(mask));
}

// Trap handler function (interrupt service routine)
void __attribute__((interrupt)) trap_handler(void) {
    MTIMECMP_ADDR[2] = 0;  // Clear the interrupt by writing to mtimecmp + 8
        __asm__ volatile ("mret");  // Return from interrupt
}

int main() {
    uint32_t mie_value = 0xFF;         // Enable all machine interrupts
    uint32_t mtimecmp_value = 0x10000000;  // Timer compare value
    uint32_t mstatus_value = 0x8;      // Enable MIE bit in mstatus

    // Set mtvec to trap handler function address
    write_csr(MTVEC, (uint32_t)&trap_handler);

    // Enable machine interrupts
    write_csr(MIE, mie_value);

    // Enable global machine interrupts
    set_csr(MSTATUS, mstatus_value);

    // Set mtimecmp
    MTIMECMP_ADDR[1] = 0;  // Clear pending interrupts
    MTIMECMP_ADDR[0] = mtimecmp_value;  // Set new compare value

    // Infinite loop
    while (1) {
        // Do nothing, waiting for interrupt
    }

    return 0;
}
