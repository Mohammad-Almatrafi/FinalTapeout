module forwarding_unit (
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
    output wire forward_rd2_mem
);

//  Forwarding to id stage
    assign forward_rd1_id     = reg_write_wb  & (rs1_id === rd_wb ) & (rd_wb!=0 );
    assign forward_rd2_id     = reg_write_wb  & (rs2_id === rd_wb ) & (rd_wb!=0 );
//  Forwarding to exe stage
    assign forward_rd1_exe[0] = reg_write_mem & (rs1_exe === rd_mem) & (rd_mem!=0);
    assign forward_rd1_exe[1] = reg_write_wb  & (rs1_exe === rd_wb ) & (rd_wb!=0 ) & ~forward_rd1_exe[0];
    assign forward_rd2_exe[0] = reg_write_mem & (rs2_exe === rd_mem) & (rd_mem!=0);
    assign forward_rd2_exe[1] = reg_write_wb  & (rs2_exe === rd_wb ) & (rd_wb!=0 ) & ~forward_rd2_exe[0];
//  Forwarding to mem stage
    assign forward_rd2_mem    = reg_write_wb  & (rs2_mem === rd_wb ) & (rd_wb!=0 );


endmodule