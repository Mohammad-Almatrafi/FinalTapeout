module mret_ecall_type (
    input logic [11:0] fun12,
    input logic [2:0] fun3,
    input logic csr_type,

    output logic mret_type,
    output logic ecall_type
);

  assign mret_type  = fun3 == 3'b000 & fun12 == 12'b001100000010 & csr_type;
  assign ecall_type = fun3 == 3'b000 & fun12 == 12'b000000000000 & csr_type;
// 000000000000 00000 000 00000 11100 11
// csr          rs1   001 rd    11100 11
endmodule
