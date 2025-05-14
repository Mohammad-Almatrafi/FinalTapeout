module mret_adr_sel (
    input logic clk,
    input logic reset_n,
    input logic if_id_reg_clr_ff,
    input logic clear_counter,
    input logic [31:0] current_pc_if1,
    input logic [31:0] current_pc_if2,
    input logic [31:0] current_pc_id,
    input logic [31:0] current_pc_exe,
    input logic [31:0] current_pc_mem,

    output logic [31:0] mepc_adr
);
  logic [2:0] count_i;
  logic [2:0] count_o;
  logic count_en;
  logic [31:0] mepc_adress_sel[0:5];

  assign count_i = count_o;
  assign count_en = (count_o <= 3);

  assign mepc_adress_sel[0] = current_pc_if1;
  assign mepc_adress_sel[1] = current_pc_if2;
  assign mepc_adress_sel[2] = current_pc_id;
  assign mepc_adress_sel[3] = current_pc_exe;
  assign mepc_adress_sel[4] = current_pc_mem;

  // n_bit_count_wclr #(.n(3)) counter_reg(
  //     .clk(clk),
  //     .reset_n(reset_n),
  //     .clear(clear_counter),
  //     .wen(count_en),
  //     .data_i(count_i),
  //     .data_o(count_o) );

  logic [2:0] selector;
  always_comb begin : selector_logic

    if (current_pc_mem != 0) selector = 3'b100;
    else if (current_pc_exe != 0) selector = 3'b011;
    else if (current_pc_id != 0) selector = 3'b010;
    else if (current_pc_if2 != 0 & ~if_id_reg_clr_ff) selector = 3'b001;
    else selector = 3'b000;

  end


  assign mepc_adr = mepc_adress_sel[selector];


endmodule


// counter module
module n_bit_count_wclr #(
    parameter n = 8,
    parameter RESET_VALUE = 0,
    parameter CLR_VALUE = 0
) (
    input logic clk,
    input logic reset_n,

    input logic wen,
    input logic [n-1:0] data_i,
    output logic [n-1:0] data_o,
    input logic clear
);

  logic [n-1:0] n_bit_reg;
  always_ff @(posedge clk, negedge reset_n) begin
    if (~reset_n) begin
      n_bit_reg <= RESET_VALUE;
    end else if (clear) begin
      n_bit_reg <= CLR_VALUE;
    end else if (wen) begin
      n_bit_reg <= data_i + 1;
    end
  end

  assign data_o = n_bit_reg;

endmodule : n_bit_count_wclr
