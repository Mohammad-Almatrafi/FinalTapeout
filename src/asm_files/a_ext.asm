.section .init
main:

    li x5, 0x969600
    li x6, 0x12
    sw x6, (x5)
    li x6, 0xbb
    nop
    nop
    nop
    nop
    nop
    
    lr.w x7, (x5)      # Load-reserved from data-mem into x5
    sc.w x9, x6, (x5)
    nop
    sc.w x9, x6, (x5)  # Attempt to store x2 into data-mem

    # -------------------------
    # Done
    loop:
    j loop
    nop

