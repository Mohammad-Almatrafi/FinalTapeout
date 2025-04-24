

module data_mem #(
    parameter DEPTH = 1024
)(
  // 8bit WISHBONE bus slave interface
  input  wire        clk_i,         // clock
  input  wire        rst_i,         // reset (synchronous active high)
  input  wire        cyc_i,         // cycle
  input  wire        stb_i,         // strobe
  input  wire [31:0] adr_i,         // address
  input  wire        we_i,          // write enable
  input  wire [3:0]  sel_i,
  input  wire [31:0] dat_i,         // data input
  output reg  [31:0] dat_o,         // data output
  output reg         ack_o,         // normal bus termination
  input              reset_n
);
    
       
logic wb_acc;
logic mem_write, mem_read;

assign wb_acc = cyc_i & stb_i;
assign mem_write = wb_acc &  we_i;
assign mem_read  = wb_acc & ~we_i;

assign ack_o = wb_acc;


logic [25:0] word_addr;
assign word_addr = adr_i[27:2];

// inst memory here
logic [31:0] dmem [0:DEPTH - 1];

always_ff @(posedge clk_i) begin
    
    if(mem_write) begin
        if(sel_i[0]) dmem[word_addr][7:0]   <= dat_i[7:0];
        if(sel_i[1]) dmem[word_addr][15:8]  <= dat_i[15:8];
        if(sel_i[2]) dmem[word_addr][23:16] <= dat_i[23:16];
        if(sel_i[3]) dmem[word_addr][31:24] <= dat_i[31:24];
    end
end

logic [31:0] data_o_reg, mem_rdata;

assign mem_rdata = dmem[word_addr];
n_bit_reg #(
    .n(32)
) data_o_reg_inst (
    .clk(clk_i),
    .reset_n (~rst_i     ),
    .data_i  (mem_rdata  ),
    .data_o  (data_o_reg ),
    .wen     (1'b1       )
);

assign dat_o = data_o_reg;


endmodule





