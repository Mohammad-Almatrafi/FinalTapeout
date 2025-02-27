typedef enum logic [2:0] {
    BEQ, 
    BNE, 
    BLT, 
    BGE, 
    BLTU, 
    BGEU
} branch_t;

module branch_controller (
    input branch_t fun3,
    input logic branch, 
    input logic jump, 
    input logic zero,
    output logic pc_sel
);


    logic comp_result;
    logic do_branch;
    
    always @(*) begin 
        case(fun3)
            BEQ: comp_result = zero;
            BNE: comp_result = ~zero;
            BLT: comp_result = ~zero;
            BGE: comp_result = zero;
            BLTU: comp_result = ~zero;
            BGEU: comp_result = zero;
            default: comp_result = 1'bx;
        endcase
    end

    assign do_branch = comp_result & branch;
    assign pc_sel = do_branch | jump;

endmodule 