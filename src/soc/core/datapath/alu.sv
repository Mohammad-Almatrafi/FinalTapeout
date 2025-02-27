import riscv_types::*;

module alu (
    input alu_t alu_ctrl,
    input logic [31:0] op1,
    input logic [31:0] op2,
    output logic [31:0] alu_result, 
    output logic zero
);

    // addition subtraction here
    logic [31:0] add_sub_result;
    n_bit_add_sub #(
        .n(32)
    ) add_sub_unit (
        .M(alu_ctrl[3]),
        .a(op1),
        .b(op2),
        .add_sub_result(add_sub_result)
    );

    always_comb begin 
        case(alu_ctrl)
            ADD: alu_result = add_sub_result;
            SUB: alu_result = add_sub_result;
            SLT: alu_result = op1 < op2;
            SLL: alu_result = op1 << op2[4:0];
            SRL: alu_result = op1 >> op2[4:0];
            SRA: alu_result = $signed(op1) >>> op2[4:0];
            XOR: alu_result = op1 ^ op2;
            AND: alu_result = op1 & op2;
            OR: alu_result  = op1 | op2;
            SLTU: alu_result = $unsigned(op1) < $unsigned(op2);
            default: alu_result = 32'dz;
        endcase
    end
    
    
    assign zero = (alu_result == 0);
endmodule

module n_bit_add_sub #(
    parameter n = 32
) (
    input logic M, 
    input logic [n-1:0] a, 
    input logic [n-1:0] b,
    output logic [n-1:0] add_sub_result
);

    logic [n-1:0] b_;
    assign b_ = b ^ {n{M}};

    assign add_sub_result = a + b_ + M;

endmodule