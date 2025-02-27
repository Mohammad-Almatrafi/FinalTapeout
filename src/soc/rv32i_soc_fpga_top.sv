
module rv32i_soc_fpag_top (
    input logic CLK100MHZ,
    input logic CPU_RESETN,

    // FPGA core signals
    input logic        UART_TXD_IN,
    output  logic      UART_RXD_OUT,
     
    output wire CA, CB, CC, CD, CE, CF, CG, DP,
    output wire [7:0] AN 
//    output logic        o_flash_cs_n,
//    output logic        o_flash_mosi,
//    input  logic        i_flash_miso,


//    input logic [15:0] SW,
//    output logic [15:0] LED
);

    parameter DMEM_DEPTH = 128;
    parameter IMEM_DEPTH = 128;

//    assign UART_TXD_IN = LED[0];
//    assign LED[7:0] = soc_inst.UART.wb_dat8_o;
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
//    assign LED[15:0] = soc_inst.rv32i_core_inst.data_path_inst.reg_file_inst.reg_file[1][15:0];
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
        .reset_n(CPU_RESETN),
        .i_uart_rx(UART_TXD_IN), 
        .o_uart_tx(UART_RXD_OUT),
        .io_data({32'h00000000})
    );
logic [31:0] disp, disp2;
assign disp = soc_inst.rv32i_core_inst.data_path_inst.reg_file_inst.reg_file[1][31:0];
assign disp2 = soc_inst.inst_mem_inst.dmem [0][31:0];
sev_seg_top sev_Seg_top ( 
                      .CPU_RESETN(CPU_RESETN),
                      .CLK100MHZ(clk),  
                      .CA(CA), .CB(CB), .CC(CC), .CD(CD), .CE(CE), .CF(CF), .CG(CG), .DP(DP),
                      .AN(AN),                                       
                      .t(disp)
                      );                                          
//ila_0 ila_core (
//	.clk(clk), // input wire clk


//	.probe0(UART_TXD_IN), // input wire [0:0]  probe0  
//	.probe1(UART_RXD_OUT) // input wire [0:0]  probe1
//);

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