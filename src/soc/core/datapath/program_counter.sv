module program_counter #(
    parameter MAX_LIMIT = 800 // ignored in the current implementation
)(
    input logic clk, 
    input logic reset_n, 
    input logic en,
    input logic [31:0] next_pc_if1, 
    output logic [31:0] current_pc_if1
);

    always_ff @(posedge clk, negedge reset_n) 
    begin 
        if(~reset_n)
`ifdef tracer
            current_pc_if1 <= 32'h8000_0000; // base address IM
`elsif JTAG
            current_pc_if1 <= 32'h1000_0000; // base address IM
`else
            current_pc_if1 <= 32'hffff_ff00; // base address IM
`endif

        else if (en)
            current_pc_if1 <=  next_pc_if1;
    end
    
endmodule
