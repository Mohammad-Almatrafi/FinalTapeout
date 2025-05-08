module compressed_type (
    input logic clk,
    input logic reset_n,
    input logic [31:0] inst,
    input logic [31:0] pc,
    input logic clear_state,
    input logic ff_en,
    input logic stall_compressed,
    
    output logic hf,
    f1f1,
    fh,
    f1f2,
    hh
);
  
  logic all_zero;
  logic prev_info_inst;
  logic first_bits_on;
  logic second_bits_on;
  
  assign all_zero = ~(|inst);
  assign first_bits_on = &inst[1:0];
  assign second_bits_on = &inst[17:16];

  assign f1f1 = ~prev_info_inst & first_bits_on | all_zero;
  assign hf = ~prev_info_inst & ~first_bits_on & second_bits_on & ~all_zero;
  assign hh = ~prev_info_inst & ~first_bits_on & ~second_bits_on & ~all_zero;
  assign fh = prev_info_inst & ~second_bits_on & ~all_zero;
  assign f1f2 = prev_info_inst & second_bits_on & ~all_zero;


//  always_ff @(posedge clk, negedge reset_n) begin : prev_state
//    if (~reset_n | clear_state) prev_info_inst <= 1'b0;
//    else if(en) prev_info_inst <= pc[1] ? second_bits_on : (hf | f1f2);
//  end
  
  n_bit_reg_wclr #(
    .n(1),
    .RESET_VALUE(1'b0),
    .CLR_VALUE(1'b0)
    ) compress_type_ff (
    .clk(clk),
    .reset_n(reset_n),
    .wen(ff_en & ~stall_compressed),
    .data_i(pc[1] ? second_bits_on : (hf | f1f2)),
    .data_o(prev_info_inst),
    .clear(clear_state)
    );

endmodule

