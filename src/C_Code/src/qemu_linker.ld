

SECTIONS
{

    . = 0x80000000;
    .text : 
    {
        *(.init)        /* Place startup code at the beginning */
        *(.vector_table)
        *(.text*)
    } 
}
