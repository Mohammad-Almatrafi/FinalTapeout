module pipeline_controller (
    input logic load_hazard,
    input logic branch_hazard,
    input logic stall_pipl,
    input logic mret_type,
    input logic interrupt,
    input logic hw_jump_clr,
    input logic stall_compressed,
    input logic jump_stall_ff,
    input logic divide_stall,

    input logic core_halted,
    input logic core_running,
    input logic dbg_ret,
    
    output logic if_id_reg_clr,
    output logic id_exe_reg_clr,
    output logic exe_mem_reg_clr,
    output logic mem_wb_reg_clr,

    output logic if_id_reg_en,
    output logic id_exe_reg_en,
    output logic exe_mem_reg_en,
    output logic mem_wb_reg_en,
    output logic pc_reg_en
);

  assign if_id_reg_clr   = dbg_ret | core_halted | branch_hazard | mret_type | interrupt;
  assign id_exe_reg_clr  =           core_halted | branch_hazard | (load_hazard & ~stall_pipl) | mret_type | interrupt | hw_jump_clr;
  assign exe_mem_reg_clr =           core_halted | branch_hazard | mret_type | interrupt;
  assign mem_wb_reg_clr  =           core_halted | interrupt;  // never clear

  assign if_id_reg_en = core_running & ~(stall_pipl | load_hazard | divide_stall );
  assign id_exe_reg_en = core_running & ~(stall_pipl | divide_stall);
  assign exe_mem_reg_en = core_running & ~(stall_pipl | divide_stall);
  assign mem_wb_reg_en = core_running & ~(stall_pipl | divide_stall);
  assign pc_reg_en = core_running & (~(stall_pipl | load_hazard | stall_compressed | divide_stall) | (exe_mem_reg_clr));


endmodule

