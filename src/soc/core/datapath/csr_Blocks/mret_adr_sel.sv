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
  logic [31:0] mepc_adress_sel[0:4];


  assign mepc_adress_sel[0] = current_pc_if1;
  assign mepc_adress_sel[1] = current_pc_if2;
  assign mepc_adress_sel[2] = current_pc_id;
  assign mepc_adress_sel[3] = current_pc_exe;
  assign mepc_adress_sel[4] = current_pc_mem;


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


