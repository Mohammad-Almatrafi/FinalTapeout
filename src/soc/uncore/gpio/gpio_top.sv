//////////////////////////////////////////////////////////////////////
////                                                              ////
////  WISHBONE General-Purpose I/O with Interrupt Support         ////
////                                                              ////
////  Modified from the OpenCores GPIO core                       ////
////  Adds per-pin interrupt enable, status, edge_-detect & mask  ////
//////////////////////////////////////////////////////////////////////

module gpio_top #(
  parameter NO_OF_GPIO_PINS   = 32,
  parameter NO_OF_SHARED_PINS = 15
)(
  // Wishbone Interface
  input                         wb_clk_i,
  input                         wb_rst_i,
  input                         wb_cyc_i,
  input      [4: 0]             wb_adr_i,
  input      [31:0]             wb_dat_i,
  input      [3: 0]             wb_sel_i,
  input                         wb_we_i,
  input                         wb_stb_i,
  output logic [31:0]           wb_dat_o,
  output logic                  wb_ack_o,
  output                        wb_err_o,

  // GPIO Interface
  input  [NO_OF_GPIO_PINS-1:0]  i_gpio,
  output [NO_OF_GPIO_PINS-1:0]  o_gpio,
  output [NO_OF_GPIO_PINS-1:0]  en_gpio,
  output [NO_OF_SHARED_PINS-1:0] io_sel,

  // Interrupt output
  output                        wb_inta_o
);

// Derived signals
logic wb_acc;
assign wb_acc   = wb_stb_i & wb_cyc_i;
logic gpio_write;
assign gpio_write = wb_acc & wb_we_i;

// Register sets
logic [NO_OF_GPIO_PINS-1:0] rgpio_in;
logic [NO_OF_GPIO_PINS-1:0] rgpio_out;
logic [NO_OF_GPIO_PINS-1:0] rgpio_oe;
logic [NO_OF_SHARED_PINS-1:0] io_sel_reg;

// Interrupt-specific registers
logic [NO_OF_GPIO_PINS-1:0] rgpio_ie;   // Interrupt enable
logic [NO_OF_GPIO_PINS-1:0] rgpio_is;   // Interrupt status (latched)

// Synchronizer & edge_ detect
logic [NO_OF_GPIO_PINS-1:0] sync0, sync1, prev_sync;
wire  [NO_OF_GPIO_PINS-1:0] edge_;
// wire [NO_OF_GPIO_PINS-1:0] fall = ~sync1 &  prev_sync; // for falling-edge_

// Decode WB address to select register
logic rgpio_is_sel, rgpio_ie_sel;
logic io_sel_sel, rgpio_oe_sel, rgpio_out_sel, rgpio_in_sel;

n_bit_dec #(
  .n(3)
) gpio_reg_sel_decoder (
  .in(wb_adr_i[4:2]),
  .out({ rgpio_is_sel,
          rgpio_ie_sel,
          io_sel_sel,
          rgpio_oe_sel,
          rgpio_out_sel,
          rgpio_in_sel  })
);

// Synchronous register writes
always @(posedge wb_clk_i or posedge wb_rst_i) begin
  if (wb_rst_i) begin
    rgpio_out <= '0;
    rgpio_oe  <= 32'hffffffff; // all pins are set to input by default (need to be changes, some will be input(rx, button) some output (tx))
    io_sel_reg<= '0;
    rgpio_ie  <= '0;
  end else if (gpio_write) begin
    if (rgpio_out_sel) begin
      if (wb_sel_i[0]) rgpio_out[ 7: 0] <= wb_dat_i[ 7: 0];
      if (wb_sel_i[1]) rgpio_out[15: 8] <= wb_dat_i[15: 8];
      if (wb_sel_i[2]) rgpio_out[23:16] <= wb_dat_i[23:16];
      if (wb_sel_i[3]) rgpio_out[31:24] <= wb_dat_i[31:24];

    end else if (rgpio_oe_sel) begin
      if (wb_sel_i[0]) rgpio_oe[ 7: 0] <= wb_dat_i[ 7: 0];
      if (wb_sel_i[1]) rgpio_oe[15: 8] <= wb_dat_i[15: 8];
      if (wb_sel_i[2]) rgpio_oe[23:16] <= wb_dat_i[23:16];
      if (wb_sel_i[3]) rgpio_oe[31:24] <= wb_dat_i[31:24];

    end else if (io_sel_sel) begin
      if (wb_sel_i[1]) io_sel_reg[ 7: 0] <= wb_dat_i[ 7: 0];
      if (wb_sel_i[2]) io_sel_reg[NO_OF_SHARED_PINS-1:8] <= wb_dat_i[NO_OF_SHARED_PINS-1:8];

    end else if (rgpio_ie_sel) begin
      if (wb_sel_i[0]) rgpio_ie[ 7: 0] <= wb_dat_i[ 7: 0];
      if (wb_sel_i[1]) rgpio_ie[15: 8] <= wb_dat_i[15: 8];
      if (wb_sel_i[2]) rgpio_ie[23:16] <= wb_dat_i[23:16];
      if (wb_sel_i[3]) rgpio_ie[31:24] <= wb_dat_i[31:24];

    end 
  end
end

// Input sampling & edge_ detection
always @(posedge wb_clk_i or posedge wb_rst_i) begin
  if (wb_rst_i) begin
    sync0     <= '0;
    sync1     <= '0;
    prev_sync <= '0;
  end else begin
    sync0     <= i_gpio;
    sync1     <= sync0;
    prev_sync <= sync1;
  end
end

assign edge_  =  sync1 ^ prev_sync;

// Latch interrupts on rising-edge_ when enabled
always @(posedge wb_clk_i or posedge wb_rst_i) begin
  if (wb_rst_i) begin
    rgpio_is <= '0;
  end else if (rgpio_is_sel) begin
      if (wb_sel_i[0]) rgpio_is[ 7: 0] <= rgpio_is[ 7: 0] & ~wb_dat_i[ 7: 0];
      if (wb_sel_i[1]) rgpio_is[15: 8] <= rgpio_is[15: 8] & ~wb_dat_i[15: 8];
      if (wb_sel_i[2]) rgpio_is[23:16] <= rgpio_is[23:16] & ~wb_dat_i[23:16];
      if (wb_sel_i[3]) rgpio_is[31:24] <= rgpio_is[31:24] & ~wb_dat_i[31:24];
  end else begin
    rgpio_is <= rgpio_is | (rgpio_oe & (rgpio_ie & edge_));
  end
end

// Readback mux
assign wb_dat_o = rgpio_in_sel  ? {{(32-NO_OF_GPIO_PINS){1'b0}}, sync1}       :
                  rgpio_out_sel ? {{(32-NO_OF_GPIO_PINS){1'b0}}, rgpio_out}   :
                  rgpio_oe_sel  ? {{(32-NO_OF_GPIO_PINS){1'b0}}, rgpio_oe}    :
                  rgpio_ie_sel  ? {{(32-NO_OF_GPIO_PINS){1'b0}}, rgpio_ie}    :
                  rgpio_is_sel  ? {{(32-NO_OF_GPIO_PINS){1'b0}}, rgpio_is}    :
                                  {{(32-NO_OF_SHARED_PINS){1'b0}}, io_sel_reg};

// Acknowledge_ logic
always @(posedge wb_clk_i or posedge wb_rst_i) begin
  if (wb_rst_i)
    wb_ack_o <= 1'b0;
  else
    wb_ack_o <= wb_acc & ~wb_ack_o;
end

assign wb_err_o  = 1'b0;
assign o_gpio    = rgpio_out;
assign en_gpio   = rgpio_oe;
assign io_sel    = io_sel_reg;

// Interrupt output: OR of any enabled & pending
assign wb_inta_o = |(rgpio_ie & rgpio_is);

endmodule
