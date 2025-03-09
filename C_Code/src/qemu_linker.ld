
MEMORY 
{
    RAM : ORIGIN = 0x80000000, LENGTH = 128k
}


SECTIONS
{
    /* .BootLoader :
    {
        *(
    } > ROM */

     .text :
    {
        KEEP(*(.text.__start*))
        *(.text*);
    } > RAM
}