module int_control (// This block gives whether we have interrupt or not, pc_addr to jump to, and decodes mip for inputting it to mcause
    input logic clk,
    input logic reset_n,
    input logic [31:0] mtvec,
    input logic MIE,
    input logic [31:0] mie,
    input logic [31:0] mip,
    input logic [31:0] mip_in,
    input logic pc_reg_en,

    input logic [31:0] mcause,
    input logic invalid_inst_mem,
    store_misaligned_mem,
    load_misaligned_mem,
    inst_addr_misaligned_mem,
    ecall_type,
    output logic interrupt,
    output logic exception,
    output logic [31:0] pc_addr,
    output logic [4:0] int_code
);

  logic [31:0] victored;
  assign interrupt = pc_reg_en & ((|(mip & mie)) & MIE);
  assign exception = invalid_inst_mem | store_misaligned_mem | load_misaligned_mem | inst_addr_misaligned_mem | ecall_type;
  assign pc_addr = mtvec[0] ? victored : {mtvec[31:2], 2'b0};
  assign victored = {mtvec[31:2] + {24'b0000_0000_0000_0000_0000_0000, int_code, 1'b0}, 2'b0};
  always_comb begin
    if (inst_addr_misaligned_mem == 1) int_code = 5'd0;
    else if (invalid_inst_mem == 1) int_code = 5'd2;
    else if (load_misaligned_mem == 1) int_code = 5'd4;
    else if (store_misaligned_mem == 1) int_code = 5'd6;
    else if (ecall_type == 1) int_code = 5'd11;
    else if ((mip_in[0] == 1)) int_code = 5'd0;
    else if (mip_in[1] == 1) int_code = 5'd1;
    else if ((mip_in[2] == 1)) int_code = 5'd2;
    else if (mip_in[3] == 1) int_code = 5'd3;
    else if ((mip_in[4] == 1)) int_code = 5'd4;
    else if (mip_in[5] == 1) int_code = 5'd5;
    else if ((mip_in[6] == 1)) int_code = 5'd6;
    else if (mip_in[7] == 1) int_code = 5'd7;
    else int_code = 3'b0;
  end


endmodule
