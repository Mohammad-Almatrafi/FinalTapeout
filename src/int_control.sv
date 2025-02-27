module int_control (
    input logic [31:0] mtvec,
    input logic [31:0] mcause,
    input logic MIE,
    input logic [31:0]mie,
    input logic [31:0]mip,
    output logic interrupt,
    output logic [31:0] pc_addr
);
  assign interrupt = (|(mip & mie)) & MIE;
  assign pc_addr   = mtvec[0] ? {mtvec[31:2], 2'b0} : {mtvec[31:2] + {mcause[28:0], 1'b0}, 2'b0};


endmodule