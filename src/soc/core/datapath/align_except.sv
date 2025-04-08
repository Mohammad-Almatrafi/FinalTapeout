module align_except(
    input logic [1:0] alu_result_lsb,
    input logic [1:0] alu_op,
    input logic [2:0] func3_exe,
    input logic [31:0] pc,
    input logic reg_write,
    input logic mem_write,
    input logic reset_n,
    
    output logic store_misaligned, load_misaligned, inst_addr_misaligned
    

);
logic misalignment;
always_comb begin 
    if(alu_op == 2'b00) begin 
        case (func3_exe [1:0]) 
        2'b00: misalignment = 1'b0; // byte alignment 
        2'b01: misalignment = alu_result_lsb[0]; // half-word alignment
        2'b10: misalignment = |alu_result_lsb; // word alignment 
        default: misalignment =1'b0;
        endcase 
    end
    else misalignment = 1'b0;
end

assign store_misaligned = mem_write&misalignment;
assign load_misaligned = reg_write&misalignment;

assign inst_addr_misaligned = (|pc [1:0])&reset_n;


endmodule