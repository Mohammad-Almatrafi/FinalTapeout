ENTRY(_start)

MEMORY
{
    rom (rwx) : ORIGIN = 0xffffff00, LENGTH = 0x100    /* 4 KB Data Memory */
    DMEM (rwx) : ORIGIN = 0x00000000, LENGTH = 0x1000    /* 4 KB Data Memory */
    IMEM (rx)  : ORIGIN = 0x10000000, LENGTH = 0x4000    /* 16 KB Instruction Memory */
}

SECTIONS
{
    /* Place .text (code only) in IMEM */
    .init :
    {
        KEEP(*(.init))
    } > IMEM
    .text : 
    {
              /* Optional: startup code if any */
        *(.text*)
        . = ALIGN(4);
    } > IMEM

    /* All data goes in DMEM: rodata, data, bss, common */
    .rodata : { *(.rodata*) } > DMEM
    .data   : { *(.data*)   } > DMEM
    .bss    : { *(.bss*)    *(.sbss*) *(COMMON) } > DMEM
}
