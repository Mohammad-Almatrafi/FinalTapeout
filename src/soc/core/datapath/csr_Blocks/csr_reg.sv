`timescale 1ns / 1ps

`define MIE_G_ADDR [3][3]
// 1000
`define MPIE_ADDR [3][7]
`define HW_INT_BIT_MCAUSE_ADDR [0][31]
`define EXC_CODE_MCAUSE_ADDR [0][30:0]

`define MCAUSE_ADDR [0]
`define MTVEC_ADDR [1]
`define SCRATCH_ADDR [2]
`define MSTATUS_ADDR [3]
`define MEPC_ADDR [4]
`define MIP_ADDR [5]
`define MIE_ADDR [6]

module csr_reg (
    input logic [31:0] csr_in,// This is for the CSR Reg input after doing the control_CSR block DONE

    input logic [31:0] mip_in,// This is to update the value of the register mip( Takes from the preipherals and goes to the register)
                              // This should be connected to the CLINT interrupt only the 7th bit of mip_in will be used

    input logic [11:0] offset,
    input logic csr_en,       // This signal will be and gate of csr_type and mret
    input logic clk,
    input logic reset_n,
    input logic int_action,   // This is coming from the inerrupt
    input logic ret_action,   // This comes from knowing that the signal is mret which comes from mret_on
    input logic hw_int,       // Hardware or software interrupt (make it one)
    input logic [4:0] int_code,// This changes the cause which means it decides which handler we go to, it will use a encoder and the priority will be from the document
    input logic [31:0] current_pc,
    output logic [31:0] mcause, // This will be to decide which address we go to (offset from mvec)
    output logic [31:0] csr_out, // This will be written to Rd
    output logic [31:0]mepc, // Connect to the 2nd mux
    output logic MIE, // This is needed as input to int_control which will output to first PC mux
    output logic [31:0]mie,
    output logic [31:0]mip,
    output logic [31:0]mtvec
);

  logic [31:0] csr_mem[7];
  logic [3:0] actual_offset;

  always @(offset) begin
    case(offset) //address translation block
      12'h304: actual_offset = 3'd6 ;
      12'h344:  actual_offset = 3'd5;
      12'h341: actual_offset = 3'd4;
      12'h300: actual_offset = 3'd3;
      12'h340: actual_offset = 3'd2;
      12'h305: actual_offset = 3'd1;
      12'h342: actual_offset = 3'd0;
      default: actual_offset = 0;
    endcase
  end

  assign mepc = csr_mem`MEPC_ADDR;
  assign mie = csr_mem`MIE_ADDR;
  assign mip = csr_mem`MIP_ADDR;
  assign mtvec = csr_mem`MTVEC_ADDR;
  assign MIE = csr_mem`MIE_G_ADDR;
  assign mcause = csr_mem`MCAUSE_ADDR;


  assign csr_out = csr_mem[actual_offset];
  always @(posedge clk, negedge reset_n) begin

    if (~reset_n) csr_mem <= '{default: 'b0};
    else begin

    case({int_action,ret_action,csr_en})
    3'd1: begin
      csr_mem[actual_offset] <= csr_in;
    end

    3'd2: begin
        csr_mem`MIE_G_ADDR  <= csr_mem`MPIE_ADDR;
        csr_mem`MPIE_ADDR <= 1'b0;
    end

    3'd3: begin
        csr_mem`MIE_G_ADDR  <= csr_mem`MPIE_ADDR;
        csr_mem`MPIE_ADDR <= 1'b0;
    end

    3'd4:begin
        csr_mem`MPIE_ADDR <= csr_mem`MIE_ADDR;
        csr_mem`MIE_G_ADDR <= 1'b0;
        csr_mem`MEPC_ADDR <= current_pc;
        csr_mem`HW_INT_BIT_MCAUSE_ADDR <= hw_int;
    end

    3'd5:begin
        csr_mem`MPIE_ADDR <= csr_mem`MIE_ADDR;
        csr_mem`MIE_G_ADDR <= 1'b0;
        csr_mem`MEPC_ADDR <= current_pc;
        csr_mem`HW_INT_BIT_MCAUSE_ADDR <= hw_int;
    end

    default:begin
    end
    endcase
    csr_mem`MIP_ADDR <= mip_in;
    csr_mem`EXC_CODE_MCAUSE_ADDR <= {'b0,int_code};
    end


    end
endmodule

