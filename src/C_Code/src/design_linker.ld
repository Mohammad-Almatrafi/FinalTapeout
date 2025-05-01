

MEMORY 
{
    ROM : ORIGIN = 0xfffff000, LENGTH = 128 * 4
    IM : ORIGIN = 0x10000000, LENGTH = 32k
}


SECTIONS
{
    .BootLoader :
    {
        *(.text._BootLoader*)
    } > ROM

     .text :
    {
        *(.text*)
    } > IM
}