module rv32i #(
    parameter DMEM_DEPTH = 1024, 
    parameter IMEM_DEPTH = 1024
)(
    input logic clk, 
    input logic reset_n,
    input logic [31:0] mip_in,
    
    // memory bus
    output logic [31:0] mem_addr_mem, 
    output logic [31:0] mem_wdata_mem, 
    output logic mem_write_mem, 
    output logic [2:0] mem_op_mem,
    input logic [31:0] mem_rdata_mem,
    output logic mem_read_mem,

    // inst mem access 
    output logic [31:0] current_pc,
    input logic [31:0] inst,

    // stall signal from wishbone 
    input logic stall_pipl,
    output logic if_id_reg_en
);



    
    // controller to the data path 
    logic reg_write_id; 
    logic mem_write_id;
    logic [1:0] mem_to_reg_id; 
    logic branch_id; 
    logic alu_src_id;
    logic jump_id; 
    logic lui_id;
    logic auipc_id; 
    logic jal_id;
    logic [1:0] alu_op_id;
    logic [3:0] alu_ctrl_exe;
    logic pc_sel_mem;
    logic [1:0] mem_csr_to_reg_id;
    logic csr_type_id;

    // data path to the controller 
    logic [6:0] opcode_id;
    logic fun7_5_exe;
    logic [2:0] fun3_exe, fun3_mem;
    logic zero_mem;
    logic [1:0] alu_op_exe;
    logic jump_mem; 
    logic branch_mem;
    logic hw_jump_clr;
    logic stall_compressed;

    // data path to the controller (forwarding unit)
    wire [4:0] rs1_id;
    wire [4:0] rs2_id;
    wire [4:0] rs1_exe;
    wire [4:0] rs2_exe;
    wire [4:0] rs2_mem;
    wire [4:0] rd_mem;
    wire [4:0] rd_wb;
    wire reg_write_mem;
    wire reg_write_wb;

    // controller(forwarding unit) to the data path 
    wire forward_rd1_id;
    wire forward_rd2_id;
    wire [1:0] forward_rd1_exe;
    wire [1:0] forward_rd2_exe;
    wire forward_rd2_mem;


    // data path to the controller (hazard handler)
    wire [1:0] mem_to_reg_exe;
    wire [4:0] rd_exe;

    // signals to control the flow of the pipeline (handling hazards, stalls ... )
    logic if_id_reg_clr;
    logic id_exe_reg_clr;
    logic exe_mem_reg_clr;
    logic mem_wb_reg_clr;

    logic id_exe_reg_en;
    logic exe_mem_reg_en;
    logic mem_wb_reg_en;
    logic pc_reg_en;
    logic mret_type;
    logic interrupt;

    // inst mem access
    logic [31:0] current_pc_if;
    logic [31:0] inst_if;

    logic [1:0] mem_to_reg_mem;
    
    logic invalid_inst;

    assign current_pc = current_pc_if;
    assign inst_if = inst;

    wire csr_type_exe;
    data_path #(
        .DMEM_DEPTH(DMEM_DEPTH),
        .IMEM_DEPTH(IMEM_DEPTH)
    ) data_path_inst (
        .*
    );

    control_unit controller_inst(
        .*
    );


    assign mem_read_mem = mem_to_reg_mem;

endmodule 