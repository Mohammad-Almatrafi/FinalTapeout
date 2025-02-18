
module rv32i_soc_fpag_top (
    input logic CLK100MHZ,
    input logic CPU_RESETN,

    // FPGA core signals
//    output logic        o_uart_tx,
//    input  logic        i_uart_rx,
//    output logic        o_flash_cs_n,
//    output logic        o_flash_mosi,
//    input  logic        i_flash_miso,


    input logic [15:0] SW,
    output logic [15:0] LED
);

    parameter DMEM_DEPTH = 128;
    parameter IMEM_DEPTH = 128;


    logic        o_flash_sclk;
    STARTUPE2 STARTUPE2
        (
        .CFGCLK    (),
        .CFGMCLK   (),
        .EOS       (),
        .PREQ      (),
        .CLK       (1'b0),
        .GSR       (1'b0),
        .GTS       (1'b0),
        .KEYCLEARB (1'b1),
        .PACK      (1'b0),
        .USRCCLKO  (o_flash_sclk),
        .USRCCLKTS (1'b0),
        .USRDONEO  (1'b1),
        .USRDONETS (1'b0));

    // soc core instance

    // spi signals here
         // serial clock output
         // slave select (active low)
         // MasterOut SlaveIN
         // MasterIn SlaveOut

    // uart signals


    // gpio signals

    // wire [31:0]   io_data;
    // assign io_data[31:16] = SW;
    // assign LED = io_data[15:0];

    logic reset_n;
    logic clk;

    assign reset_n = CPU_RESETN;

    clk_div_by_2 gen_core_clk (
        .clk_i(CLK100MHZ),
        .clk_o(clk),
        .reset_n(CPU_RESETN)
    );

    rv32i_soc #(
        .DMEM_DEPTH(DMEM_DEPTH),
        .IMEM_DEPTH(IMEM_DEPTH)
    ) soc_inst (
        .*,
        .io_data({SW, LED})
    );

endmodule : rv32i_soc_fpag_top

module clk_div_by_2 (
    input logic reset_n,
    input logic clk_i, 
    output logic clk_o
);
    always @(posedge clk_i, negedge reset_n)
    begin 
        if(~reset_n)    clk_o <= 0;
        else            clk_o <= ~clk_o;
    end
endmodule 