module sram_8k_wrapper (
    // 32bit WISHBONE bus slave interface
    input  wire        clk_i,  // clock
    input  wire        rst_i,  // reset (synchronous active high)
    input  wire        cyc_i,  // cycle
    input  wire        stb_i,  // strobe
    input  wire [31:0] adr_i,  // address
    input  wire        we_i,   // write enable
    input  wire [ 3:0] sel_i,
    input  wire [31:0] dat_i,  // data input
    output reg  [31:0] dat_o,  // data output
    output reg         ack_o   // normal bus termination

);

  logic wb_acc;
  logic mem_write, mem_read;
  logic [31:0] Q_dat;
  logic [31:0] write_mask;
  logic [10:0] word_adr;

  assign wb_acc = cyc_i & stb_i;
  assign mem_write = wb_acc & we_i;
  assign mem_read = wb_acc & ~we_i;
  assign word_adr = adr_i[12:2];

  assign write_mask[0] = sel_i[0];
  assign write_mask[1] = sel_i[0];
  assign write_mask[2] = sel_i[0];
  assign write_mask[3] = sel_i[0];
  assign write_mask[4] = sel_i[0];
  assign write_mask[5] = sel_i[0];
  assign write_mask[6] = sel_i[0];
  assign write_mask[7] = sel_i[0];
  assign write_mask[8] = sel_i[1];
  assign write_mask[9] = sel_i[1];
  assign write_mask[10] = sel_i[1];
  assign write_mask[11] = sel_i[1];
  assign write_mask[12] = sel_i[1];
  assign write_mask[13] = sel_i[1];
  assign write_mask[14] = sel_i[1];
  assign write_mask[15] = sel_i[1];
  assign write_mask[16] = sel_i[2];
  assign write_mask[17] = sel_i[2];
  assign write_mask[18] = sel_i[2];
  assign write_mask[19] = sel_i[2];
  assign write_mask[20] = sel_i[2];
  assign write_mask[21] = sel_i[2];
  assign write_mask[22] = sel_i[2];
  assign write_mask[23] = sel_i[2];
  assign write_mask[24] = sel_i[3];
  assign write_mask[25] = sel_i[3];
  assign write_mask[26] = sel_i[3];
  assign write_mask[27] = sel_i[3];
  assign write_mask[28] = sel_i[3];
  assign write_mask[29] = sel_i[3];
  assign write_mask[30] = sel_i[3];
  assign write_mask[31] = sel_i[3];

  always_ff @(posedge clk_i) ack_o <= wb_acc & ~ack_o;  // delayed acknoledge

  // inst memory here

  tsmc_8k tsmc_ram(
      .CLK(clk_i),
      .ADR(word_adr),
      .D(dat_i),
      .WEM(write_mask),
      .WE(mem_write),
      .OE(1'b1),
      .ME(1'b1),
      .RM(4'b1101),
      .Q(Q_dat)
  );

  logic [31:0] data_o_reg;

  n_bit_reg #(
      .n(32)
  ) data_o_reg_inst (
      .clk    (clk_i),
      .reset_n(~rst_i),
      .data_i (Q_dat),
      .data_o (data_o_reg),
      .wen    (1'b1)
  );

  assign dat_o = data_o_reg;

endmodule


module sram_32k_wrapper (
    // 32bit WISHBONE bus slave interface
    input  wire        clk_i,  // clock
    input  wire        rst_i,  // reset (synchronous active high)
    input  wire        cyc_i,  // cycle
    input  wire        stb_i,  // strobe
    input  wire [31:0] adr_i,  // address
    input  wire        we_i,   // write enable
    input  wire [ 3:0] sel_i,
    input  wire [31:0] dat_i,  // data input
    output reg  [31:0] dat_o,  // data output
    output reg         ack_o   // normal bus termination
);

  logic wb_acc;
  logic mem_write, mem_read;
  logic [31:0] Q_dat;
  logic [31:0] write_mask;
  logic [12:0] word_adr;

  assign wb_acc = cyc_i & stb_i;
  assign mem_write = wb_acc & we_i;
  assign mem_read = wb_acc & ~we_i;
  assign word_adr = adr_i[14:2];

  assign write_mask[0] = sel_i[0];
  assign write_mask[1] = sel_i[0];
  assign write_mask[2] = sel_i[0];
  assign write_mask[3] = sel_i[0];
  assign write_mask[4] = sel_i[0];
  assign write_mask[5] = sel_i[0];
  assign write_mask[6] = sel_i[0];
  assign write_mask[7] = sel_i[0];
  assign write_mask[8] = sel_i[1];
  assign write_mask[9] = sel_i[1];
  assign write_mask[10] = sel_i[1];
  assign write_mask[11] = sel_i[1];
  assign write_mask[12] = sel_i[1];
  assign write_mask[13] = sel_i[1];
  assign write_mask[14] = sel_i[1];
  assign write_mask[15] = sel_i[1];
  assign write_mask[16] = sel_i[2];
  assign write_mask[17] = sel_i[2];
  assign write_mask[18] = sel_i[2];
  assign write_mask[19] = sel_i[2];
  assign write_mask[20] = sel_i[2];
  assign write_mask[21] = sel_i[2];
  assign write_mask[22] = sel_i[2];
  assign write_mask[23] = sel_i[2];
  assign write_mask[24] = sel_i[3];
  assign write_mask[25] = sel_i[3];
  assign write_mask[26] = sel_i[3];
  assign write_mask[27] = sel_i[3];
  assign write_mask[28] = sel_i[3];
  assign write_mask[29] = sel_i[3];
  assign write_mask[30] = sel_i[3];
  assign write_mask[31] = sel_i[3];

  always_ff @(posedge clk_i) ack_o <= wb_acc & ~ack_o;  // delayed acknoledge

  // inst memory here

  tsmc_32k_sq tsmc_ram(
      .CLK(clk_i),
      .ADR(word_adr),
      .D(dat_i),
      .WEM(write_mask),
      .WE(mem_write),
      .OE(1'b1),
      .ME(1'b1),
      .RM(4'b1011),
      .Q(Q_dat)
  );

  logic [31:0] data_o_reg;

  n_bit_reg #(
      .n(32)
  ) data_o_reg_inst (
      .clk    (clk_i),
      .reset_n(~rst_i),
      .data_i (Q_dat),
      .data_o (data_o_reg),
      .wen    (1'b1)
  );

  assign dat_o = data_o_reg;

endmodule
