package common_pkg;

typedef enum logic[0:0] {
	FALSE,
	TRUE
} onebit_sig_e;

endpackage

package debug_pkg;

typedef enum logic[4:0] {
    IDCODE = 5'b00001,
    BYPASS = 5'b11111,
    DTMCS  = 5'b10000,
    DMI    = 5'b10001
} tap_ins_e;

typedef enum logic [3:0]{
    TEST_LOGIC_RESET = 4'hF,
    RUN_TEST_IDLE    = 4'hC,
    SELECT_DR_SCAN   = 4'h7,
    CAPTURE_DR       = 4'h6,
    SHIFT_DR         = 4'h2,
    EXIT1_DR         = 4'h1,
    PAUSE_DR         = 4'h3,
    EXIT2_DR         = 4'h0,
    UPDATE_DR        = 4'h5,
    SELECT_IR_SCAN   = 4'h4,
    CAPTURE_IR       = 4'hE,
    SHIFT_IR         = 4'hA,
    EXIT1_IR         = 4'h9,
    PAUSE_IR         = 4'hB,
    EXIT2_IR         = 4'h8,
    UPDATE_IR        = 4'hD
} tap_states_e;

typedef enum logic [6:0]{
    DATA0        = 7'h04,
    DATA1        = 7'h05,
    DATA2        = 7'h06,
    DATA3        = 7'h07,
    DATA4        = 7'h08,
    DATA5        = 7'h09,
    DATA6        = 7'h0a,
    DATA7        = 7'h0b,
    DATA8        = 7'h0c,
    DATA9        = 7'h0d,
    DATA10       = 7'h0e,
    DATA11       = 7'h0f,
    DMCONTROL    = 7'h10,
    DMSTATUS     = 7'h11,
    HALTSUM1     = 7'h12,
    HARTINFO     = 7'h13,
    HAWINDOWSEL  = 7'h14,
    HAWINDOW     = 7'h15,
    ABSTRACTCS   = 7'h16,
    COMMAND      = 7'h17,
    ABSTRACTAUTO = 7'h18,
    CONFSTRPTR0  = 7'h19,
    CONFSTRPTR1  = 7'h1A,
    CONFSTRPTR2  = 7'h1B,
    CONFSTRPTR3  = 7'h1C,
    NEXTDM       = 7'h1D,
    PROGBUF0     = 7'h20,
    PROGBUF1     = 7'h21,
    PROGBUF2     = 7'h22,
    PROGBUF3     = 7'h23,
    PROGBUF4     = 7'h24,
    PROGBUF5     = 7'h25,
    PROGBUF6     = 7'h26,
    PROGBUF7     = 7'h27,
    PROGBUF8     = 7'h28,
    PROGBUF9     = 7'h29,
    PROGBUF10    = 7'h2A,
    PROGBUF11    = 7'h2B,
    PROGBUF12    = 7'h2C,
    PROGBUF13    = 7'h2D,
    PROGBUF14    = 7'h2E,
    PROGBUF15    = 7'h2F,
    AUTODATA     = 7'h30,
    HALTSUM2     = 7'h34,
    HALTSUM3     = 7'h35,
    HALTSUM0     = 7'h40
} dm_addresses_e;

typedef enum logic [2:0]{
    NO_DBG_CAUSE,
    DBG_EBREAK,
    DBG_HALTREQ = 3'd3,
    DBG_STEP = 3'd4
} dcause_e;

typedef enum logic [2:0]{
    NONE,
    BUSY,
    UNSUPPORTED
} cmderr_e;

endpackage