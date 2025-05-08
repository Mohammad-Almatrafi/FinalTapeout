import riscv_types::*;
// typedef enum logic [1:0] {STORE_BYTE, STORE_HALFWORD, STORE_WORD} store_t;
module wishbone_controller (
    input  wire        clk,           // Clock signal
    input  wire        rst,           // Reset signal

    // Processor interface signals
    input  wire [31:0] proc_addr,     // Processor address
    input  wire [31:0] proc_wdata,    // Processor write data
    input  wire        proc_write,    // Processor write enable
    input  wire        proc_read,    // Processor write enable
    input  wire [2:0]  proc_op,       // Processor operation
    output reg  [31:0] proc_rdata,    // Processor read data
    output logic proc_stall_pipl,
    output logic proc_ack,
    // Wishbone bus signals
    output reg  [31:0] wb_adr_o,      // Wishbone address output
    output reg  [31:0] wb_dat_o,      // Wishbone data output
    output reg  [3:0]  wb_sel_o,      // Wishbone byte enable
    output reg         wb_we_o,       // Wishbone write enable
    output reg         wb_cyc_o,      // Wishbone cycle valid
    output reg         wb_stb_o,      // Wishbone strobe
    input  wire [31:0] wb_dat_i,      // Wishbone data input
    input  wire        wb_ack_i       // Wishbone acknowledge
);

always_comb begin
    wb_adr_o = proc_addr;
    wb_cyc_o = proc_write | proc_read;
    wb_stb_o = proc_write | proc_read;
    wb_we_o = proc_write;
    if(proc_write | proc_read) begin
        proc_stall_pipl = ~wb_ack_i;
    end else proc_stall_pipl = 0; // currently there is no stall from the memory side
    proc_ack = wb_ack_i;
end


// assign wb_sel_o = 4'b0001;
// assign wb_dat_o = proc_wdata;
store_aligner store_alignment_unit(
    .wdata(proc_wdata),
    .store_type(store_t'(proc_op)),
    .addr(proc_addr[1:0]),
    .mem_write(proc_write),
    .wsel(wb_sel_o),
    .aligned_data(wb_dat_o)
);


// registers in the wishbone controller as mem read is moved to write back stage
logic [1:0] proc_addr_ff;
logic [2:0] proc_op_ff;
n_bit_reg #(
    .n(5)
) wishbone_cont_reg (
    .clk(clk),
    .reset_n(~rst),
    .data_i({proc_addr[1:0], proc_op}),
    .data_o({proc_addr_ff[1:0], proc_op_ff}),
    .wen(1'b1)
);


// assign proc_rdata = wb_dat_i;
load_aligner load_alignment_unit (
    .addr(proc_addr_ff[1:0]),
    .fun3(proc_op_ff),
    .rdata(wb_dat_i),
    .aligned_data(proc_rdata)
);

endmodule
