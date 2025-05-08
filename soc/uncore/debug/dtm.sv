import common_pkg::*;
import debug_pkg::*;


`define IDCODE_VALUE  32'h10e31913
`define DTMCS_ABITS   6'b000111
`define DTMCS_VERSION 4'b0001
`define DTMCS_VALUE   32'h00000101

module dtm(
  input         tms_i,
  input         tck_i,
  input         trstn_i,
  input         tdi_i,
  output logic  tdo_o,

//sync
  output onebit_sig_e dmi_wr_o,
  output onebit_sig_e dmi_rd_o,
  output dm_addresses_e  dmi_ad_o,
  input [31:0]  dmi_di_i,
  output [31:0] dmi_do_o
);

onebit_sig_e test_logic_reset;
onebit_sig_e capture_dr;
onebit_sig_e shift_dr;
onebit_sig_e update_dr;
onebit_sig_e capture_ir;
onebit_sig_e shift_ir;
onebit_sig_e update_ir;
//tap fsm
tap_states_e pstate ;
tap_states_e nstate;
//ff block
always_ff@(posedge tck_i or negedge trstn_i)
begin : tap_fsm_hopper
  if(~trstn_i)
    pstate <= TEST_LOGIC_RESET;
  else
    pstate <= nstate;
end : tap_fsm_hopper
//next state logic
always_comb
begin : tap_fsm_next_logic
  case(pstate)
    TEST_LOGIC_RESET: nstate = tms_i? TEST_LOGIC_RESET:RUN_TEST_IDLE;
    RUN_TEST_IDLE   : nstate = tms_i? SELECT_DR_SCAN:RUN_TEST_IDLE;
    SELECT_DR_SCAN  : nstate = tms_i? SELECT_IR_SCAN:CAPTURE_DR;
    CAPTURE_DR      : nstate = tms_i? EXIT1_DR:SHIFT_DR;
    SHIFT_DR        : nstate = tms_i? EXIT1_DR:SHIFT_DR;
    EXIT1_DR        : nstate = tms_i? UPDATE_DR:PAUSE_DR;
    PAUSE_DR        : nstate = tms_i? EXIT2_DR:PAUSE_DR;
    EXIT2_DR        : nstate = tms_i? UPDATE_DR:SHIFT_DR;
    UPDATE_DR       : nstate = tms_i? SELECT_DR_SCAN:RUN_TEST_IDLE;
    SELECT_IR_SCAN  : nstate = tms_i? TEST_LOGIC_RESET:CAPTURE_IR;
    CAPTURE_IR      : nstate = tms_i? EXIT1_IR:SHIFT_IR;
    SHIFT_IR        : nstate = tms_i? EXIT1_IR:SHIFT_IR;
    EXIT1_IR        : nstate = tms_i? UPDATE_IR:PAUSE_IR;
    PAUSE_IR        : nstate = tms_i? EXIT2_IR:PAUSE_IR;
    EXIT2_IR        : nstate = tms_i? UPDATE_IR:SHIFT_IR;
    UPDATE_IR       : nstate = tms_i? SELECT_DR_SCAN:RUN_TEST_IDLE;
    default         : nstate = TEST_LOGIC_RESET;
  endcase
end : tap_fsm_next_logic
//output logic
always_comb
begin : tap_fsm_output_logic
    test_logic_reset = onebit_sig_e'(pstate == TEST_LOGIC_RESET);
    capture_dr       = onebit_sig_e'(pstate == CAPTURE_DR);
    shift_dr         = onebit_sig_e'(pstate == SHIFT_DR);
    update_dr        = onebit_sig_e'(pstate == UPDATE_DR);
    capture_ir       = onebit_sig_e'(pstate == CAPTURE_IR);
    shift_ir         = onebit_sig_e'(pstate == SHIFT_IR);
    update_ir        = onebit_sig_e'(pstate == UPDATE_IR);
end : tap_fsm_output_logic

//registers

// JTAG_IR
tap_ins_e instruction_reg;
tap_ins_e instruction_reg_q;
logic instruction_tdo;

always_ff@(posedge tck_i or negedge trstn_i)
begin : shift_ir_block
  if(~trstn_i)                instruction_reg <= tap_ins_e'(5'b0);
  else if(test_logic_reset)   instruction_reg <= tap_ins_e'(5'b0);
  else if(capture_ir)         instruction_reg <= tap_ins_e'(5'b00101);
  else if(shift_ir)           instruction_reg <= tap_ins_e'({tdi_i, instruction_reg[4:1]});
end : shift_ir_block

always_ff@(posedge tck_i or negedge trstn_i)
begin : update_ir_block
  if(~trstn_i)              instruction_reg_q <= IDCODE;
  else if(test_logic_reset) instruction_reg_q <= IDCODE;
  else if(update_ir)        instruction_reg_q <= instruction_reg;
end : update_ir_block

assign instruction_tdo = instruction_reg[0];

onebit_sig_e idcode_sel;
onebit_sig_e bypass_sel;
onebit_sig_e dtmcs_sel;
onebit_sig_e dmi_sel;

always_comb
begin : reg_sel
  idcode_sel = onebit_sig_e'(instruction_reg_q == IDCODE);
  dtmcs_sel  = onebit_sig_e'(instruction_reg_q == DTMCS);
  dmi_sel    = onebit_sig_e'(instruction_reg_q == DMI);
  bypass_sel = onebit_sig_e'((instruction_reg_q == BYPASS) || (instruction_reg_q == 0));
end : reg_sel


// ICODE
logic [31:0] idcode_reg;
logic idcode_tdo;

always_ff@(posedge tck_i or negedge trstn_i)
begin : shift_idcode
  if(~trstn_i)                     idcode_reg <= `IDCODE_VALUE;
  else if(test_logic_reset)        idcode_reg <= `IDCODE_VALUE;
  else if(idcode_sel & capture_dr) idcode_reg <= `IDCODE_VALUE;
  else if(idcode_sel & shift_dr)   idcode_reg <= {tdi_i, idcode_reg[31:1]};
end : shift_idcode

assign idcode_tdo = idcode_reg[0];

// DTMCS
// dtmcs control logic
//1) dmi reset
//2) dmi error codes
logic [31:0] dtmcs_reg;
logic dtmcs_tdo;

always_ff@(posedge tck_i or negedge trstn_i)
begin : shift_dtmcs
  if(~trstn_i)                    dtmcs_reg <= {22'd0, `DTMCS_ABITS, `DTMCS_VERSION};
  else if(test_logic_reset)       dtmcs_reg <= {22'd0, `DTMCS_ABITS, `DTMCS_VERSION};
  else if(dtmcs_sel & capture_dr) dtmcs_reg <= {dtmcs_reg[31:10], `DTMCS_ABITS, `DTMCS_VERSION} ;
  else if(dtmcs_sel & shift_dr)   dtmcs_reg <= {tdi_i, dtmcs_reg[31:1]};
end : shift_dtmcs

assign dtmcs_tdo = dtmcs_reg[0];

// DMI
// dmi logic
//1) error codes
logic [33+`DTMCS_ABITS:0] dmi_reg;
logic                    dmi_tdo;

always_ff@(posedge tck_i or negedge trstn_i)
begin : shift_dmi
  if(~trstn_i)                  dmi_reg <= 0;
  else if(test_logic_reset)     dmi_reg <= 0;
  else if(dmi_sel & capture_dr) dmi_reg <= {dmi_reg[33+`DTMCS_ABITS:34], dmi_di_i[31:0], 2'b00};
  else if(dmi_sel & shift_dr)   dmi_reg <= {tdi_i, dmi_reg[33+`DTMCS_ABITS:1]};
end : shift_dmi

assign dmi_tdo = dmi_reg[0];

assign dmi_wr_o = onebit_sig_e'(update_dr & (dmi_reg[1:0] == 2'b10));
assign dmi_rd_o = onebit_sig_e'(update_dr & (dmi_reg[1:0] == 2'b01));
assign dmi_ad_o = dm_addresses_e'(dmi_reg[33+`DTMCS_ABITS:34]);
assign dmi_do_o = dmi_reg[33:2];

// BYPASS
logic bypassed_tdo;
logic bypass_reg;

always_ff@(posedge tck_i or negedge trstn_i)
begin : shift_bypass
  if(~trstn_i)                     bypass_reg <= 1'b0;
  else if(test_logic_reset)        bypass_reg <= 1'b0;
  else if(bypass_sel & capture_dr) bypass_reg <= 1'b0;
  else if(bypass_sel & shift_dr)   bypass_reg <= tdi_i;
end

assign bypassed_tdo = bypass_reg;

//tdo out logic
always_ff@(negedge tck_i)
begin : tdo_mux
  if(shift_ir)
    tdo_o <= instruction_tdo;
  else
    case(instruction_reg_q)
      IDCODE:  tdo_o <= idcode_tdo;
      DTMCS:   tdo_o <= dtmcs_tdo;
      DMI:     tdo_o <= dmi_tdo;
      default: tdo_o <= bypassed_tdo;
    endcase
end : tdo_mux

endmodule