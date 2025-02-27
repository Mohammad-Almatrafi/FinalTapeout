module control_CSR(
    input logic [4:0] imm ,
    input logic [31:0] RS1 ,
    input logic [31:0] CSR_in ,
    input logic [2:0] func3 ,
    output logic [31:0] CSR_out 
    );
    
    logic [31:0] data ;
    always @(*) begin
        case (func3[2])
            1'b1: data = {'b0,imm};
            1'b0: data = RS1;
            
        endcase
    
    
        case (func3[1:0])
            2'b01: CSR_out = data ; // csrrw
            2'b10: CSR_out = data | CSR_in; // csrrs
            2'b11: CSR_out = (~data) & CSR_in; //csrrc
            default: CSR_out = 32'h00000000;  // Default case for safety
        endcase
    end
    
    
endmodule
