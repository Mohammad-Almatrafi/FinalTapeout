module mret_on (
input logic [11:0]fun12,
input logic [2:0] fun3,
input logic csr_type,


output logic mret_type
);

always_comb
begin
    if(fun3==3'b000 & fun12==12'b001100000010 & csr_type)
        mret_type=1;
end
endmodule