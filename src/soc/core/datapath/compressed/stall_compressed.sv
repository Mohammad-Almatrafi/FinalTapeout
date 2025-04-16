module stall_compressed (
    input logic clk,
    input logic reset_n,
    input logic clear_state,
    input logic ff_en,
    input logic [31:0] pc,
    input logic f1f1,
    f1f2,
    fh,
    hf,
    hh,
    output logic stall_compressed,
    stall_compressed_ff
);

  always_comb begin
  if ((fh | hh) & (~stall_compressed_ff) & (~pc[1])) 
    stall_compressed = 1'b1;
   else 
    stall_compressed  = 1'b0;
  end

  n_bit_reg_wclr #(
    .n(1),
    .RESET_VALUE(1'b0),
    .CLR_VALUE(1'b0)
    ) stall_compress_ff (
    .clk(clk),
    .reset_n(reset_n),
    .wen(ff_en),
    .data_i(stall_compressed),
    .data_o(stall_compressed_ff),
    .clear(clear_state)
    );

endmodule
