// NEWCHANGES
// Make this at the start of the pipeline then pass it through

module mret_on (
    input logic [31:0] full_instruction,


    output logic mret_type
);

  assign mret_type = full_instruction == 32'b00110000001000000000000001110011;
endmodule
