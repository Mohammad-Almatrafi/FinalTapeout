module pc_corrector (
    input logic [31:0] pc,
    input logic f1f1,
    f1f2,
    hf,
    fh,
    hh,
    input logic stall_compressed,
    output logic [31:0] corrected_pc
);
  logic no_change, pc_plus_2, pc_minus_2;

  assign no_change  = f1f1 | hf | (hh & stall_compressed) | pc[1];
  assign pc_plus_2  = ~pc[1] & ((fh & (~stall_compressed)) | (hh & (~stall_compressed)));
  assign pc_minus_2 = ~pc[1] & (f1f2 | (fh & stall_compressed));

  one_hot_mux3x1 #(
      .n(32)
  ) pc_sel_mux_compressed (
      .in0(pc),
      .in1(pc + 2),
      .in2(pc - 2),
      .sel({pc_minus_2, pc_plus_2, no_change}),
      .out(corrected_pc)
  );

endmodule

