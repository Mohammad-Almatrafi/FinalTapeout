ENTRY(_start)

MEMORY
{
    RAM (rwx): ORIGIN = 0x80000000, LENGTH = 512k


    STACK (rwx): ORIGIN = 0xf0000000, LENGTH = 128k
}

SECTIONS
{
    /* Reserve a stack section in DMEM and define _stack_top as the end of DMEM */
    .stack (NOLOAD) : 
    {
        *(.stack*)
        _stack_top = ORIGIN(STACK) + LENGTH(STACK);
    } > STACK

    .text : 
    {
        *(.init)        /* Place startup code at the beginning */
        *(.text*)
        *(.rodata*)
        . = ALIGN(4);
    } > RAM

    .data : 
    {
        *(.data*)
        . = ALIGN(4);
    }

    .bss : 
    {
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
    } > RAM
}