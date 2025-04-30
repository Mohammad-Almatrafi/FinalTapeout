module pre_decode (
    input logic clk,
    input logic reset_n,
    input logic [31:0] current_pc_id,
    input logic [31:0] inst_current, 
    input logic clear_state,
    input logic ff_en,

    output logic hw_jump_clr,
    output logic [31:0] inst_id,
    output logic stall_compressed,
    output logic [31:0] corrected_pc,
    output logic sel_half_full
);

  logic [31:0] inst_prev;
  logic f1f1, f1f2, fh, hf, hh;
  logic [31:0] inst_full_correct;
  logic combined;
  logic secondHalf;
  logic stall_compressed_ff;
  logic [15:0] inst_half_correct;
  logic [31:0] inst_decompressed;
  logic sel_half_full;

  n_bit_reg_wclr #(
      .n(32)
  ) inst_id_reg (
      .clk(clk),
      .reset_n(reset_n),
      .clear(1'b0),
      .wen(1'b1),
      .data_i(inst_current),
      .data_o(inst_prev)
  );

  compressed_type compressed_type (
      .*,
      .pc  (current_pc_id),
      .inst(inst_current)
  );  //

  assign combined = fh | f1f2;
  assign secondHalf = stall_compressed_ff | current_pc_id[1];

  mux2x1 #(
      .n(32)
  ) full_inst_mux (
      .in0(inst_current),
      .in1({inst_current[15:0], inst_prev[31:16]}),
      .sel(combined),
      .out(inst_full_correct)
  );

  stall_compressed compressor_stall (
      .*,
      .pc(current_pc_id)
  );  //

  mux2x1 #(
      .n(16)
  ) half_inst_mux (
      .in0(inst_current[15:0]),
      .in1(inst_current[31:16]),
      .sel(secondHalf),
      .out(inst_half_correct)
  );

  assign hw_jump_clr = current_pc_id[1] & (&inst_current[17:16]);

  decompress decompressor (
      .inst_16(inst_half_correct),
      .inst_32(inst_decompressed)
  );

  pc_corrector pc_corrector_inst (  //
      .pc(current_pc_id),
      .f1f1(f1f1),
      .f1f2(f1f2),
      .hf(hf),
      .fh(fh),
      .hh(hh),
      .stall_compressed(stall_compressed),
      .corrected_pc(corrected_pc)
  );

  always_comb begin
    if (((fh & ~stall_compressed_ff) | f1f2 | f1f1) & ~current_pc_id[1]) sel_half_full = 1'b1;
    else sel_half_full = 1'b0;
  end
  mux2x1 #(
      .n(32)
  ) half_or_full_mux (
      .in0(inst_decompressed),
      .in1(inst_full_correct),
      .sel(sel_half_full),
      .out(inst_id)
  );

endmodule
