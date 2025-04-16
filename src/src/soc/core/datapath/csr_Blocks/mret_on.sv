module mret_on (
    input logic [11:0] fun12,
    input logic [2:0] fun3,
    input logic csr_type,


    output logic mret_type
);

  assign mret_type = fun3 == 3'b000 & fun12 == 12'b001100000010 & csr_type;
endmodule
