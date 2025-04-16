MEMORY 
{
    ROM : ORIGIN = 0xfffff000, LENGTH = 512
    IM  : ORIGIN = 0x10000000, LENGTH = 32768
}

SECTIONS
{
    .init : {
        *(.init*)        /* Place startup code at the beginning */
    } > ROM

    .text : {
        *(.text*)
    } > IM
}

