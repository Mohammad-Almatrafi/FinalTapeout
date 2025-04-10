module stall_compressed (
    input logic clk,
    input logic reset_n,
    input logic fh,hh,
    output logic stall_compressed, stall_compressed_ff
);


always_ff@(posedge clk or negedge reset_n) begin
    if (!reset_n) stall_compressed_ff <= 1'b0;
    else stall_compressed_ff <= (fh|hh);
    end
    
    assign stall_compressed = (fh|hh) & ~(stall_compressed_ff);
endmodule 
