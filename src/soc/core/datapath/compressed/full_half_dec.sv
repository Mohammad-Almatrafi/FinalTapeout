module full_half_dec (
    input logic clk,
    input logic reset_n,
    input logic [15:0] inst_16,
    output logic [31:0] inst_32,
    output logic compressed_en
);

  logic [15:0] inst_16_prev;

  logic fetch_state;
  logic next_fetch_state;

  always_ff @(posedge clk, negedge reset_n) begin : current_state
    if (~reset_n) begin
      fetch_state <= 0;
    end else begin
      fetch_state <= next_fetch_state;
    end
  end

  always_ff @(posedge clk, negedge reset_n) begin : inst_16_prev_ff
    if (~reset_n) inst_16_prev <= 16'b0;
    else inst_16_prev <= inst_16;
  end

  always_comb begin : next_state
    case (fetch_state)
      1'b0: begin
        if (inst_16[1:0] == 2'b11) next_fetch_state = 1'b1;
        else next_fetch_state = 1'b0;
      end
      1'b1: next_fetch_state = 1'b0;
      default: ;
    endcase
  end

  always_comb begin : inst_32_fetcher
    case ({
      next_fetch_state, fetch_state
    })
      2'b00: begin
        inst_32 = {'b0, inst_16};
        compressed_en = 1'b1;
      end
      2'b10: begin
        inst_32 = 32'h00000013;
        compressed_en = 1'b0;
      end
      2'b01: begin
        inst_32 = {inst_16, inst_16_prev};
        compressed_en = 1'b0;
      end
      default: begin
        inst_32 = 32'h00000000;
        compressed_en = 1'b0;
      end
    endcase
  end

endmodule
