module pre_decode (
    input logic clk,
    input logic reset_n,

    input logic [31:0] current_pc_id,
    input logic [31:0] inst_current,
    output logic hw_jump_clr,
    output logic [31:0] inst_id,
    output logic stall_compressed
);
  logic [31:0] inst_prev;
  logic f1f1, f1f2, fh, hf, hh;
  logic [31:0] inst_full_correct;

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

  compressed_type compressed_type (.*);

  mux2x1 #(
      .n(32)
  ) full_inst_mux (
      .in0(inst_current),
      .in1({inst_current[15:0], inst_prev[31:16]}),
      .sel(fh | f1f2),
      .out(inst_full_correct)
  );

  logic stall_compressed_ff;
  stall_compressed compressor_stall (.*);

  logic [15:0] inst_half_correct;
  logic [31:0] inst_decompressed;
  mux2x1 #(
      .n(16)
  ) half_inst_mux (
      .in0(inst_current[15:0]),
      .in1(inst_current[31:16]),
      .sel(stall_compressed_ff | current_pc_id[1]),
      .out(inst_half_correct)

  );
  assign hw_jump_clr = current_pc_id[1] & (hf | f1f2);

  decompress decompressor (
      .inst_16(inst_half_correct),
      .inst_32(inst_decompressed)
  );

  mux2x1 #(
      .n(32)
  ) half_or_full_mux (
      .in0(inst_decompressed),
      .in1(inst_full_correct),
      .sel(((fh & ~stall_compressed_ff) | f1f2 | f1f1) & ~current_pc_id[1]),
      .out(inst_id)
  );

endmodule

