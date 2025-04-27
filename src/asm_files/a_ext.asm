.section .init
main:

    li t0, 0x0       # Base address

    # -------------------------
    # Init shared = 10
    li t1, 10
    sw t1, 0(t0)
    
    # -------------------------
    lr.w t2, (t0)
    sc.w t3 ,zero, 0(t0)
    # -------------------------
    # Done
    loop:
    j loop
    nop

