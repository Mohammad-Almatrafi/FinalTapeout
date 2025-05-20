module control_unit (
    input logic [6:0] opcode_id,
    input logic [6:0] fun7_exe,
    input logic [2:0] fun3_exe,
    fun3_mem,
    input logic if_id_reg_clr_ff,
    input logic zero_mem,
    input logic [1:0] alu_op_exe,
    input logic jump_mem,
    input logic branch_mem,
    input logic mret_type,
    input logic interrupt,
    input logic clk,
    reset_n,
    input logic hw_jump_clr,
    input logic stall_compressed,
    
    input logic jump_stall_ff,
    input logic atomic_unit_stall,

    input logic core_halted,
    input logic core_running,
    input logic dbg_ret,

    // outputs from the decode controller
    output logic reg_write_id,
    output logic mem_write_id,
    output logic [1:0] mem_to_reg_id,
    output logic branch_id,
    output logic alu_src_id,
    output logic jump_id,
    output logic lui_id,
    output logic auipc_id,
    output logic jal_id,
    output logic [1:0] alu_op_id,
    output logic invalid_inst,
    output logic is_atomic_id,
    //    output logic [1:0] mem_csr_to_reg_id,
    output logic csr_type_id,
    output logic m_type_exe,
    output divide_instruction,
    input divide_stall,
    
    // alu_controller output
    output alu_t alu_ctrl_exe,

    // branch controller output 
    output wire pc_sel_mem,

    // forwarding unit stuff
    input wire [4:0] rs1_id,
    input wire [4:0] rs2_id,
    input wire [4:0] rs1_exe,
    input wire [4:0] rs2_exe,
    input wire [4:0] rs2_mem,
    input wire [4:0] rd_mem,
    input wire [4:0] rd_wb,
    input wire reg_write_mem,
    input wire reg_write_wb,

    output wire forward_rd1_id,
    output wire forward_rd2_id,
    output wire [1:0] forward_rd1_exe,
    output wire [1:0] forward_rd2_exe,
    output wire forward_rd2_mem,
    
    //new signals needed for handling atomic hazard
    
    input wire is_atomic_mem,
    
    output wire atomic_unit_hazard,

    // hazard handler data required from the data path
    input wire [1:0] mem_to_reg_exe,
    input wire [4:0] rd_exe,
    input wire csr_type_exe,

    // signals to control the flow of the pipeline
    output logic if_id_reg_clr,
    output logic id_exe_reg_clr,
    output logic exe_mem_reg_clr,
    output logic mem_wb_reg_clr,

    output logic if_id_reg_en,
    output logic id_exe_reg_en,
    output logic exe_mem_reg_en,
    output logic mem_wb_reg_en,
    output logic pc_reg_en,

    output logic load_hazard,

    input logic stall_pipl
);


  decode_control dec_ctrl_inst (
      .opcode(opcode_id),
      .reg_write(reg_write_id),
      .mem_write(mem_write_id),
      .branch(branch_id),
      .alu_src(alu_src_id),
      .jump(jump_id),
      .alu_op(alu_op_id),
      .lui(lui_id),
      .auipc(auipc_id),
      .jal(jal_id),
      .r_type(r_type_id),
      .csr_type(csr_type_id),
      .is_atomic(is_atomic_id),
      .mem_csr_to_reg(mem_to_reg_id),
      .*
  );

  wire exe_use_rs1_id;
  wire exe_use_rs2_id;

  assign exe_use_rs1_id = ~(auipc_id | lui_id);
  assign exe_use_rs2_id = r_type_id | branch_id;
  alu_control alu_controller_inst (
      .fun3(fun3_exe),
      .fun7(fun7_exe),
      .alu_op(alu_op_exe),
      .alu_ctrl(alu_ctrl_exe),
      .m_type(m_type_exe),
      .divide_instruction(divide_instruction)
  );

  branch_controller branch_controller_inst (
      .fun3  (branch_t'(fun3_mem)),
      .branch(branch_mem),
      .jump  (jump_mem),
      .zero  (zero_mem),
      .pc_sel(pc_sel_mem)
  );

  // 
  forwarding_unit forwarding_unit_inst (.*);

  // detect if there is load hazard

  wire  branch_hazard;
  logic mem_read_exe;
  assign mem_read_exe = mem_to_reg_exe[0];

  hazard_handler hazard_handler_inst (.*);

  pipeline_controller pipeline_controller_inst (
      .load_hazard(load_hazard),
      .branch_hazard(branch_hazard),
      .stall_pipl(stall_pipl),
      .divide_stall(divide_stall),
      .*
  );

endmodule

