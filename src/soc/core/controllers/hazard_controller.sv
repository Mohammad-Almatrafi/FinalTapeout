module hazard_handler (
    input wire pc_sel_mem,
    input wire exe_use_rs1_id,
    input wire exe_use_rs2_id,
    input wire [4:0] rs1_id,
    input wire [4:0] rs2_id,
    input wire [4:0] rs1_exe,
    input wire [4:0] rs2_exe,
    input wire mem_read_exe,
    input wire [4:0] rd_exe,
    input wire csr_type_exe,

    output wire load_hazard,
    output wire branch_hazard,
    
    input wire [4:0] rd_mem,
    input wire is_atomic_mem,
    input wire atomic_unit_stall,
    
    output wire atomic_unit_hazard
);

    assign branch_hazard = pc_sel_mem;
    assign load_hazard   =   ((mem_read_exe  &  (rd_exe !=0)) 
                         &   (((rd_exe == rs1_id) & exe_use_rs1_id) | ((rd_exe == rs2_id) & exe_use_rs2_id)))
                         | 
                         
                         ( 
                         (csr_type_exe  &  (rd_exe !=0)) 
                         &   (((rd_exe == rs1_id) & exe_use_rs1_id) | ((rd_exe == rs2_id) & exe_use_rs2_id))
                         );
    assign atomic_unit_hazard   =   (is_atomic_mem  &  ~atomic_unit_stall & (rd_mem !=0)) 
                                &   ((rd_mem === rs2_exe) | (rd_mem === rs1_exe));
                                
endmodule : hazard_handler
