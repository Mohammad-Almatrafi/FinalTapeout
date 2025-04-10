module compressed_type (
    input logic clk,
    input logic reset_n,
    //    input logic [31:0] inst_prev,
    input logic [31:0] inst_current,
//    output logic [1:0] full_half_current,
    output logic f1f1, f1f2, fh, hf,hh
);
  logic [1:0] full_half_current;
  logic [1:0] full_half_prev;
  logic [1:0] first_half;
  logic [1:0] second_half;
  logic first_bit;
  logic second_bit;
  logic sel;
//  logic f1f1, f1f2, fh, hf;
  //typedef enum logic [1:0] {
  //    full = 2'b11,
  //    half1 = 2'b00,
  //    half2 = 2'b01,
  //    half3 = 2'b10
  //    }opcode;


  assign first_half = inst_current[1:0];
  assign second_half = inst_current[17:16];

  assign first_bit = (first_half == 2'b11);
  assign second_bit = (second_half == 2'b11) | (first_half == 2'b11);
  assign sel = (full_half_prev == 2'b10);

  assign full_half_current = sel ? {second_bit, 1'b1} : {second_bit, first_bit};

  assign f1f1 = (full_half_current == 2'b11) & ~(sel);
  assign f1f2 = (full_half_current == 2'b11) & sel;
  assign fh = (full_half_current == 2'b01);
  assign hf = (full_half_current == 2'b10);
  assign hh = (full_half_current == 2'b00);


  always_ff @(posedge clk or negedge reset_n) begin
    if (~reset_n) full_half_prev <= 2'b00;
    else full_half_prev <= full_half_current;
  end



  //always_comb begin
  //    case ({inst_prev[17:16],inst_prev[1:0]})
  //        {2'bxx,full}: full_half_prev = 00;
  //        {half, half}: full_half_prev = 11;
  //        {full, half}: full_half_prev = 01;
  //    endcase

  //    casez ({inst_current[17:16],inst_current[1:0]})
  //        {2'b??,full}: full_half_current = 00;
  //        {half1|half2|half3, half1|half2|half3}: full_half_current = 11;
  //        {full, half1|half2|half3}: full_half_current = 01;
  //        default: if(full_half_prev == 01) full_half_current = 10;
  //    endcase
  //end

endmodule

