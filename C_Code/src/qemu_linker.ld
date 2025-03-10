


SECTIONS
{
    . = 0x80000000;
    .text : /* code section */
    {
        KEEP(*(.text.__start*));
        *(.text*);
    }
}