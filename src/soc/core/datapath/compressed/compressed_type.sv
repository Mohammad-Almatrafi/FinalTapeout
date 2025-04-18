module compressed_type (
    input logic clk,
    input logic reset_n,
    input logic [31:0] inst,
    output logic hf,
    f1f1,
    fh,
    f1f2,
    hh
);

  logic prev_info_inst;

  assign first_bits_on = &inst[1:0];
  assign second_bits_on = &inst[17:16];

  assign f1f1 = ~prev_info_inst & first_bits_on;
  assign hf = ~prev_info_inst & ~first_bits_on & second_bits_on;
  assign hh = ~prev_info_inst & ~first_bits_on & ~second_bits_on;
  assign fh = prev_info_inst & ~second_bits_on;
  assign f1f2 = prev_info_inst & second_bits_on;

  always_ff @(posedge clk, negedge reset_n) begin : prev_state
    if (~reset_n) prev_info_inst <= 1'b0;
    else prev_info_inst <= hf | f1f2;
  end

endmodule

