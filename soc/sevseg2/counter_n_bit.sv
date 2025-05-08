module counter_n_bit#(
    parameter n
)(
    input logic clk,
    input logic resetn,
    input logic load,
    input logic en,
    input logic [n - 1: 0] load_data,
    output logic [n - 1: 0] count
);

    always_ff @(posedge clk) begin 
        if(~resetn) count <= 0;
        else begin 
            if(load) count <= load_data;
            else if(en) count <= count + 1;
        end
    end
endmodule : counter_n_bit