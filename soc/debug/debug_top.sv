import common_pkg::*;
import debug_pkg::*;

`default_nettype wire
module debug_top
(

`ifndef VIVADO_BUILD

  input         tms_i,
  input         tck_i,
  input         trstn_i,
  input         tdi_i,
  output        tdo_o,
`endif
  input         rst_i,
  input         clk_i,

  input onebit_sig_e resumeack_i,
  input onebit_sig_e running_i,
  input onebit_sig_e halted_i,

  output onebit_sig_e haltreq_o,
  output onebit_sig_e resumereq_o,
  output onebit_sig_e ndmreset_o,

  output onebit_sig_e ar_en_o,
  output onebit_sig_e ar_wr_o,
  output [15:0] ar_ad_o,
  input  onebit_sig_e ar_done_i,
  input [31:0]  ar_di_i,
  output [31:0] ar_do_o,

  output onebit_sig_e am_en_o,
  output onebit_sig_e am_wr_o,
  output [3:0]  am_st_o,
  output [31:0] am_ad_o,
  input [31:0]  am_di_i,
  output [31:0] am_do_o,
  input onebit_sig_e am_done_i
);

onebit_sig_e dmi_wr;
onebit_sig_e dmi_rd;
onebit_sig_e dmi_wr_sync;
onebit_sig_e dmi_rd_sync;
dm_addresses_e dmi_ad;
logic [31:0] dmi_di;
logic [31:0] dmi_do;

`ifdef VIVADO_BUILD


  logic dmi_reg_wr_en;
  logic dmi_reg_en;
wire busy = ~(ar_done_i | am_done_i);

wire [1:0] dtmcs_stat = { busy, 1'b0 };

wire [1:0] dstatus   = { 1'b0,  busy };

bscan_tap tap_u (
  .clk            (clk_i),
  .rst            (rst_i),

  .dmi_reg_wdata  (dmi_do),
  .dmi_reg_addr   (dmi_ad),
  .dmi_reg_wr_en  (dmi_reg_wr_en),
  .dmi_reg_en     (dmi_reg_en),
  .dmi_reg_rdata  (dmi_di),

  .idle           (3'd0),

  .dmi_stat       (2'b0),

  .rd_status      (2'b0),

  .dmi_hard_reset (),
  .jtag_id        (31'd0),
  .version        (4'd1)
);

  assign dmi_wr = onebit_sig_e'( dmi_reg_wr_en & dmi_reg_en);
  assign dmi_rd = onebit_sig_e'(~dmi_reg_wr_en & dmi_reg_en);

`else
  dtm dtm_inst(
    .tms_i(tms_i),
    .tck_i(tck_i),
    .trstn_i(trstn_i),
    .tdi_i(tdi_i),
    .tdo_o(tdo_o),

  //sync
    .dmi_wr_o(dmi_wr),
    .dmi_rd_o(dmi_rd),
    .dmi_ad_o(dmi_ad),
    .dmi_di_i(dmi_di),
    .dmi_do_o(dmi_do)
  );


`endif


  dmi_to_dm_sync dmi_to_dm_sync_inst(
    .rd_en(dmi_rd),
    .wr_en(dmi_wr),
    .rst(rst_i),
    .clk(clk_i),
    .reg_rd_en(dmi_rd_sync),
    .reg_wr_en(dmi_wr_sync)
  );


dm dm_inst(
  .rst_i(rst_i),
  .clk_i(clk_i),

  // DMI
  .dmi_wr_i(dmi_wr_sync),
  .dmi_rd_i(dmi_rd_sync),
  .dmi_ad_i(dmi_ad),
  .dmi_di_i(dmi_do),
  .dmi_do_o(dmi_di),

  // Debug Module Status
  .resumeack_i(resumeack_i),
  .running_i(running_i),
  .halted_i(halted_i),

  .haltreq_o(haltreq_o),
  .resumereq_o(resumereq_o),
  .ndmreset_o(ndmreset_o),

  .ar_en_o(ar_en_o),
  .ar_wr_o(ar_wr_o),
  .ar_ad_o(ar_ad_o),
  .ar_di_i(ar_di_i),
  .ar_do_o(ar_do_o),
  .ar_done_i(ar_done_i),

  .am_en_o(am_en_o),
  .am_wr_o(am_wr_o),
  .am_st_o(am_st_o),
  .am_ad_o(am_ad_o),
  .am_di_i(am_di_i),
  .am_do_o(am_do_o),
  .am_done_i(am_done_i)
);
endmodule

module dmi_to_dm_sync (
// JTAG signals
input onebit_sig_e rd_en,      // 1 bit  Read Enable from JTAG
input onebit_sig_e wr_en,      // 1 bit  Write enable from JTAG
// Processor Signals
input       rst,      // Core reset
input       clk,        // Core clock
output onebit_sig_e reg_rd_en,  // 1 bit  Write interface bit to Processor
output onebit_sig_e reg_wr_en   // 1 bit  Write enable to Processor
);
logic        c_rd_en;
logic        c_wr_en;
logic [2:0]   rden, wren;
// Outputs
assign reg_rd_en = onebit_sig_e'(c_rd_en);
assign reg_wr_en = onebit_sig_e'(c_wr_en);
// synchronizers
always_ff@( posedge clk or posedge rst) begin
    if(rst) begin
        rden <= '0;
        wren <= '0;
    end
    else begin
        rden <= {rden[1:0], rd_en};
        wren <= {wren[1:0], wr_en};
    end
end
assign c_rd_en = rden[1] & ~rden[2];
assign c_wr_en = wren[1] & ~wren[2];

endmodule
