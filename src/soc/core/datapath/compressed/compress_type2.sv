module compressed_type2 (
    input logic clk,
    input logic reset_n,
    input logic stall_compressed_ff,
    //    input logic [31:0] inst_prev,
    input logic [31:0] inst_current,
//    output logic [1:0] full_half_current,
    output logic f1f1, f1f2, fh, hf,hh
);

logic f1f1_prev, f1f2_prev, fh_prev, hf_prev,hh_prev, middle_inst;

     always_ff @(posedge clk or negedge reset_n) begin
    if (~reset_n) begin 
         middle_inst <= 1'b0;
          
    end
    else begin
         middle_inst <= hf|f1f2;     
         end
  end

endmodule