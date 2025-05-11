module control_CSR(
    input logic [31:0] data_in,
    input logic [31:0] CSR_in ,
    input logic [1:0] csr_cmd ,
    output logic [31:0] CSR_out 
    );
    
    logic [31:0] data ;

    assign data = data_in;

    always @(*) begin
        CSR_out = CSR_in;
        case (csr_cmd)
            2'b01: CSR_out = data ; // csrrw
            2'b10: CSR_out = data | CSR_in; // csrrs
            2'b11: CSR_out = (~data) & CSR_in; //csrrc
        endcase

    end
    
    
endmodule
