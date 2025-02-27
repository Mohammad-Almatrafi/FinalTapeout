module hazard_handler (
    input wire pc_sel_mem,
    input wire exe_use_rs1_id,
    input wire exe_use_rs2_id,
    input wire [4:0] rs1_id,
    input wire [4:0] rs2_id,
    input wire mem_read_exe,
    input wire [4:0] rd_exe,

    output wire load_hazard,
    output wire branch_hazard
);

    assign branch_hazard = pc_sel_mem;
    assign load_hazard   =   (mem_read_exe  &  (rd_exe !=0)) 
                         &   (((rd_exe === rs1_id) & exe_use_rs1_id) | ((rd_exe === rs2_id) & exe_use_rs2_id));

endmodule : hazard_handler