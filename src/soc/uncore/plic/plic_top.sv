//----------------------------------------------------------------------------- 
// File: plic_top.sv
//-----------------------------------------------------------------------------

import plic_pkg::*;
module plic_top #(
  parameter int NUM_SOURCES_P  = plic_pkg::NUM_SOURCES,
  parameter int NUM_CONTEXTS_P = plic_pkg::NUM_CONTEXTS
)(
  // Wishbone Interface
  input  logic             wb_clk_i,
  input  logic             wb_rst_i,
  input  logic             wb_cyc_i,
  input  logic             wb_stb_i,
  input  logic             wb_we_i,
  input  logic [23:0]      wb_adr_i,
  input  logic [31:0]      wb_dat_i,
  input  logic [3:0]       wb_sel_i,
  output logic [31:0]      wb_dat_o,
  output logic             wb_ack_o,

  // Interrupt sources vector
  input  logic [NUM_SOURCES_P-1:0] int_sources,

  // External IRQ (single context)
  output logic             external_irq
);

  // Simplified WB signals
  logic wb_acc;
  logic wb_write, wb_read;

  assign wb_acc   = wb_cyc_i & wb_stb_i;
  assign wb_write = wb_acc & wb_we_i;
  assign wb_read  = wb_acc & ~wb_we_i;
  assign wb_ack_o = wb_acc;

  // Generate gateways
  logic [NUM_SOURCES_P:1] gateway_pending;
  logic [SOURCE_ID_WIDTH-1:0] complete_id;
  generate
    for (genvar i=1; i<=NUM_SOURCES_P; i++) begin: gw
      plic_gateway #(.ID(i)) gateway_i (
        .clk          (wb_clk_i),
        .rst_n        (!wb_rst_i),
        .int_in       (int_sources[i-1]),
        .complete_id  (complete_id),
        .pending_to_plic(gateway_pending[i])
      );
    end
  endgenerate


  // PLIC core instance
  plic_core #(
    .NUM_SOURCES_P (NUM_SOURCES_P),
    .NUM_CONTEXTS_P(NUM_CONTEXTS_P)
  ) core_i (
    .clk            (wb_clk_i),
    .rst_n          (!wb_rst_i),

    .wb_addr_i      (wb_adr_i),
    .wb_wdata_i     (wb_dat_i),
    .wb_write_i     (wb_write),
    .wb_read_i      (wb_read ),
    .wb_rdata_o     (wb_dat_o),
    .wb_sel_i       (wb_sel_i),

    .gateway_pending(gateway_pending),
    .complete_id_o  (complete_id),
    .irq_o          (external_irq)
  );


endmodule