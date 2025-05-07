module csr_forwarding (
    input logic [4:0] rs1_mem,  // From exe/mem reg
    input logic [4:0] rd_wb,  // From mem/wb reg
    input logic [31:0] alu_op1_mem,  // From exe/mem reg
    input logic [31:0] non_mem_result_wb,  // From mem/wb reg which takes from result_mem

    output logic [31:0] RS1
);
  logic sel;
  assign sel = rs1_mem == rd_wb;

  always_comb begin
    if (sel)  //forwarding case
      RS1 = non_mem_result_wb;
    else  //non forwarding case
      RS1 = alu_op1_mem;
  end

endmodule
