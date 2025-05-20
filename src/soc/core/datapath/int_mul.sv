module int_mul(
  input  logic [31:0] rs1,
  input  logic [31:0] rs2,
  input  alu_t alu_ctrl,
  output logic [31:0] result
);

  // Extended operands
  logic [63:0] op_a; //this should be 32bits?
  logic [63:0] op_b;//this too?
  logic [63:0] full_product;

  always_comb begin
    // Default sign extensions
    case (alu_ctrl)
      MUL, // MUL
      MULH: begin // MULH (signed × signed)
        op_a = {{32{rs1[31]}}, rs1}; // sign-extend rs1
        op_b = {{32{rs2[31]}}, rs2}; // sign-extend rs2
      end

      MULHU: begin // MULHU (unsigned × unsigned)
        op_a = {32'b0, rs1}; // zero-extend
        op_b = {32'b0, rs2};
      end

      MULHSU: begin // MULHSU (signed × unsigned)
        op_a = {{32{rs1[31]}}, rs1}; // sign-extend rs1
        op_b = {32'b0, rs2};         // zero-extend rs2
      end

      default: begin
        op_a = 64'd0;
        op_b = 64'd0;
      end
    endcase

    // Single multiplication
    full_product = op_a * op_b;

    // Select result portion
    case (alu_ctrl)
      MUL: result = full_product[31:0];   // MUL
      MULH: result = full_product[63:32];  // MULH
      MULHU: result = full_product[63:32];  // MULHU
      MULHSU: result = full_product[63:32];  // MULHSU
      default: result = 32'hDEADBEEF;
    endcase
  end

endmodule
