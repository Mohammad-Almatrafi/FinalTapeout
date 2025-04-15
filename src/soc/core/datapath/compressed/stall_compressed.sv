module stall_compressed (
    input logic clk,
    input logic reset_n,
    input logic clear,
    input logic en,
    input logic [31:0] pc,
    input logic f1f1,
    f1f2,
    fh,
    hf,
    hh,
    output logic stall_compressed,
    stall_compressed_ff
);

  assign stall_compressed = (fh | hh) & (~stall_compressed_ff) & (~pc[1]);

  always_ff @(posedge clk or negedge reset_n) begin
    if (!reset_n | clear) stall_compressed_ff <= 1'b0;
    else if (en) stall_compressed_ff <= stall_compressed;
  end

endmodule
