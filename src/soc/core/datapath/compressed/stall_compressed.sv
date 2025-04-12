module stall_compressed (
    input  logic clk,
    input  logic reset_n,
    input  logic f1f1,
    f1f2,
    fh,
    hf,
    hh,
    output logic stall_compressed,
    stall_compressed_ff
);


  always_ff @(posedge clk or negedge reset_n) begin
    if (!reset_n) stall_compressed_ff <= 1'b0;
    else stall_compressed_ff <= stall_compressed;
  end

  assign stall_compressed = (fh | hh) & ~(stall_compressed_ff);
endmodule
