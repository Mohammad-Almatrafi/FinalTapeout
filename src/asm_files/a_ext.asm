start:
        # a0 holds address of memory location
        # a1 holds expected value
        # a2 holds desired value
        # a0 holds return value, 0 if successful, !0 otherwise
        li a0,0x10000000
        li a1, 1
        li a2, 1
        li a0, 0
   
    cas:
        lr.w t0, 0(a0)        # Load original value.
        bne t0, a1, fail     # Doesn't match, so fail.
        sc.w t0, a2, 0(a0)    # Try to update.
        bnez t0, cas         # Retry if store-conditional failed.
        li a0, 0             # Set return to success.
        j start                # Return.
    fail:
        li a0, 1             # Set return to failure.
        j start               # Return.