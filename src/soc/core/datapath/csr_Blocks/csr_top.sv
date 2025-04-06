module csr_top (
    input logic clk,
    input logic reset_n,
    input logic [31:0] mip_in,
    input logic [11:0] offset,
    input logic csr_en,
    input logic int_action,
    input logic ret_action,
    input logic hw_int,
    input logic [4:0] int_code,
    input logic [31:0] current_pc,

    input logic [4:0] imm ,
    input logic [31:0] RS1 ,
    input logic [2:0] func3 ,

    output logic [31:0] mcause, // This will be to decide which address we go to (offset from mvec)
    output logic [31:0] csr_out, // This will be written to Rd
    output logic [31:0]mepc, // Connect to the 2nd mux
    output logic MIE, // This is needed as input to int_control which will output to first PC mux
    output logic [31:0]mie,
    output logic [31:0]mip,
    output logic [31:0]mtvec
);

logic [31:0] csr_in;// This is in caps in the control_csr
logic [31:0] CSR_intermed;// this will go out into the reg csr


assign csr_in = csr_out;

control_CSR control_CSR(
.imm(imm),
.RS1(RS1),
.CSR_in(csr_in),
.func3(func3),
.CSR_out(CSR_intermed)
);

csr_reg csr_reg(
.*, .csr_in(CSR_intermed)
);

endmodule

