module decompress_tb;

  logic [15:0] inst_16;
  logic [31:0] inst_32;

  decompress DUT (
      .inst_16(inst_16),
      .inst_32(inst_32)
  );

  int i;
  logic [15:0] instructions[0:128];
  logic [31:0] instructions_decompressed[0:128];
  logic correct;
  logic [15:0] current_16;
  logic [31:0] current_32;
  logic [31:0] difference;
  assign current_32 = instructions_decompressed[i];
  assign current_16 = instructions[i];

  initial $readmemh("compress_test.mem", instructions);
  initial $readmemh("compress_compare_test.mem", instructions_decompressed);
  assign correct = inst_32 == instructions_decompressed[i];
  assign difference = (inst_32 ^ instructions_decompressed[i]);

  initial begin

    inst_16 = 16'b0;
    #5;
    for (i = 0; i < 129; i++) begin
      inst_16 = instructions[i];
      #5;
      $display(i, "\t", correct);
    end
    $finish;
  end


endmodule
