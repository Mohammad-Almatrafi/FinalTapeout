module rv32i_soc #(
    parameter DMEM_DEPTH = 128,
    parameter IMEM_DEPTH = 128
) (
    input logic clk,
    input logic reset_n,

    // spi signals to the spi-flash
    // uart signals
    input 		i_uart_rx,
    output 		o_uart_tx,
    // gpio signals
    inout wire [31:0]   io_data
);


    // Memory bus signals
    logic [31:0] mem_addr_mem;
    logic [31:0] mem_wdata_mem;
    logic        mem_write_mem;
    logic [2:0]  mem_op_mem;
    logic [31:0] mem_rdata_mem;
    logic        mem_read_mem;


/////////////////////////////////////////////// This is to set the other periphirals to zero 

////////////////////////////////////////////////
logic [31:0] current_pc;

logic [31:0] mip_in;
assign mip_in[31:8]=0;
assign mip_in[6:0]=0;
    // ============================================
    //          Processor Core Instantiation
    // ============================================
    //Useless signals but for just connecting
    logic stall_pipl;
    logic if_id_reg_en;
    // Instantiate the processor core here 
    rv32i #(
        .DMEM_DEPTH(1024),
        .IMEM_DEPTH(1024)
     )rv32i_core_inst(//Checked all the inputs, block is done. Reset is neg edge
         .*,
         .current_pc(current_pc),
         .inst(inst),
         .if_id_reg_en(if_id_reg_en),
         .stall_pipl(stall_pipl)
    );

    // ============================================
    //                 Wishbone Master
    // ============================================
    wishbone_controller wishbone_master (
        .*,
        .clk        (clk),
        .rst        (~reset_n),
        .proc_addr  (mem_addr_mem),
        .proc_wdata (mem_wdata_mem),
        .proc_write (mem_write_mem),
        .proc_read  (mem_read_mem),
        .proc_op    (mem_op_mem),
        .proc_rdata (mem_rdata_mem),
        .proc_stall_pipl(stall_pipl), // Stall pipeline if needed
        .wb_adr_o   (wb_io_adr_i),     // Connect to the external Wishbone bus as required
        .wb_dat_o   (wb_io_dat_i),
        .wb_sel_o   (wb_io_sel_i),
        .wb_we_o    (wb_io_we_i),
        .wb_cyc_o   (wb_io_cyc_i),
        .wb_stb_o   (wb_io_stb_i),
        .wb_dat_i   (wb_io_dat_o), // For simplicity, no data input
        .wb_ack_i   (wb_io_ack_o)   // For simplicity, no acknowledgment signal
    );
    assign wb_m2s_io_cti = 0;
    assign wb_m2s_io_bte  = 0;
    
    
//===============================//
// Wishbone interconnect signals//
//===============================//  
              
    // IO ( wb master signals ) 
                                   
              
logic  [31:0] wb_io_adr_i;               
logic  [31:0] wb_io_dat_i;               
logic   [3:0] wb_io_sel_i;               
logic         wb_io_we_i;               
logic         wb_io_cyc_i;               
logic         wb_io_stb_i;               
logic   [2:0] wb_io_cti_i;               
logic   [1:0] wb_io_bte_i;               
logic  [31:0] wb_io_dat_o;               
logic         wb_io_ack_o;               
logic         wb_io_err_o;               
logic         wb_io_rty_o;  
             
    // SPI FLASH SIGNALS 
                                        
                    
logic  [31:0] wb_spi_flash_adr_o;        
logic  [31:0] wb_spi_flash_dat_o;        
logic   [3:0] wb_spi_flash_sel_o;        
logic         wb_spi_flash_we_o;        
logic         wb_spi_flash_cyc_o;        
logic         wb_spi_flash_stb_o;        
logic   [2:0] wb_spi_flash_cti_o;        
logic   [1:0] wb_spi_flash_bte_o;        
logic  [31:0] wb_spi_flash_dat_i;        
logic         wb_spi_flash_ack_i;        
logic         wb_spi_flash_err_i;        
logic         wb_spi_flash_rty_i;        
                                    
//  DATA MEM  
                            
logic  [31:0] wb_dmem_adr_o;             
logic  [31:0] wb_dmem_dat_o;             
logic   [3:0] wb_dmem_sel_o;             
logic         wb_dmem_we_o;             
logic         wb_dmem_cyc_o;             
logic         wb_dmem_stb_o;             
logic   [2:0] wb_dmem_cti_o;             
logic   [1:0] wb_dmem_bte_o;             
logic  [31:0] wb_dmem_dat_i;             
logic         wb_dmem_ack_i;             
logic         wb_dmem_err_i;             
logic         wb_dmem_rty_i;             
                                    
    // IMEM
                                 
logic  [31:0] wb_imem_adr_o;           
logic  [31:0] wb_imem_dat_o;           
logic   [3:0] wb_imem_sel_o;           
logic         wb_imem_we_o;           
logic         wb_imem_cyc_o;           
logic         wb_imem_stb_o;           
logic   [2:0] wb_imem_cti_o;           
logic   [1:0] wb_imem_bte_o;           
logic  [31:0] wb_imem_dat_i;           
logic         wb_imem_ack_i;           
logic         wb_imem_err_i;           
logic         wb_imem_rty_i;
                           
    // UART                
                              
logic  [31:0] wb_uart_adr_o;           
logic  [31:0] wb_uart_dat_o;           
logic   [3:0] wb_uart_sel_o;           
logic         wb_uart_we_o;           
logic         wb_uart_cyc_o;           
logic         wb_uart_stb_o;           
logic   [2:0] wb_uart_cti_o;           
logic   [1:0] wb_uart_bte_o;           
logic  [31:0] wb_uart_dat_i;           
logic         wb_uart_ack_i;           
logic         wb_uart_err_i;           
logic         wb_uart_rty_i;
                           
    // GPIO                
                             
logic  [31:0] wb_gpio_adr_o;           
logic  [31:0] wb_gpio_dat_o;           
logic   [3:0] wb_gpio_sel_o;           
logic         wb_gpio_we_o;           
logic         wb_gpio_cyc_o;           
logic         wb_gpio_stb_o;           
logic   [2:0] wb_gpio_cti_o;           
logic   [1:0] wb_gpio_bte_o;           
logic  [31:0] wb_gpio_dat_i;           
logic         wb_gpio_ack_i;           
logic         wb_gpio_err_i;           
logic         wb_gpio_rty_i;           
     
// CLINT 

logic [31:0] wb_clint_adr_o;
logic [31:0] wb_clint_dat_o;
logic  [3:0] wb_clint_sel_o;
logic        wb_clint_we_o;
logic        wb_clint_cyc_o;
logic        wb_clint_stb_o;
logic  [2:0] wb_clint_cti_o;
logic  [1:0] wb_clint_bte_o;
logic [31:0] wb_clint_dat_i;
logic        wb_clint_ack_i;
logic        wb_clint_err_i;
logic        wb_clint_rty_i;
    // ============================================
    //             Wishbone Interconnect 
    // ============================================
    
      wb_intercon  wishbone_intercon (.wb_clk_i(clk),
                                      .wb_rst_i(~reset_n),
                                      .*);

    // ============================================
    //                   Peripherals
    // ============================================
    // Instantate the peripherals here

    // Here is the tri state buffer logic for setting iopin as input or output based
    // on the bits stored in the en_gpio register
    wire [31:0] en_gpio;
    wire        gpio_irq;

    wire [31:0] i_gpio;
    wire [31:0] o_gpio;

    genvar i;
    generate
            for( i = 0; i<32; i = i+1) 
            begin:gpio_gen_loop
                bidirec gpio1  (.oe(en_gpio[i] ), .inp(o_gpio[i] ), .outp(i_gpio[i] ), .bidir(io_data[i]));
            end
    endgenerate

    // ============================================
    //                 GPIO Instantiation
    // ============================================

    gpio_top  GPIO  ( 
                    .wb_clk_i(clk),   
                    .wb_rst_i(~reset_n), 
                    .wb_cyc_i(wb_gpio_cyc_o),   
                    .wb_adr_i(wb_gpio_adr_o),   
                    .wb_dat_i(wb_gpio_dat_o),   
                    .wb_sel_i(wb_gpio_sel_o),   
                    .wb_we_i(wb_gpio_we_o)  ,  
                    .wb_stb_i(wb_gpio_stb_o) ,  
	                .wb_dat_o(wb_gpio_dat_i) , 
	                .wb_ack_o(wb_gpio_ack_i) , 
	                .wb_err_o(wb_gpio_err_i) , 
	                
                    .i_gpio(i_gpio),
                    .o_gpio(o_gpio),
                    .en_gpio(en_gpio)
                    

   );


    // ============================================
    //             Data Memory Instance
    // ============================================

    // Instantiate data memory here 
     data_mem #(
        .DEPTH(DMEM_DEPTH)
     ) data_mem_inst(
        // 8bit WISHBONE bus slave interface
        .clk_i(clk),         // clock
        .rst_i(~reset_n),         // reset (synchronous active high)
        .cyc_i(wb_dmem_cyc_o),         // cycle
        .stb_i(wb_dmem_stb_o),         // strobe
        .adr_i(wb_dmem_adr_o),         // address
        .we_i(wb_dmem_we_o),          // write enable
        .sel_i(wb_dmem_sel_o),
        .dat_i(wb_dmem_dat_o),         // data input
        .dat_o(wb_dmem_dat_i),         // data output
        .ack_o(wb_dmem_ack_i)         // normal bus termination
    );

    // logic  [31:0] wb_dmem_adr_o;
    // logic  [31:0] wb_dmem_dat_o;
    // logic   [3:0] wb_dmem_sel_o;
    // logic         wb_dmem_we_o;
    // logic         wb_dmem_cyc_o;
    // logic         wb_dmem_stb_o;
    // logic   [2:0] wb_dmem_cti_o;
    // logic   [1:0] wb_dmem_bte_o;
    // logic  [31:0] wb_dmem_dat_i;
    // logic         wb_dmem_ack_i;
    // logic         wb_dmem_err_i;
    // logic         wb_dmem_rty_i;
    // ============================================
    //          UART Instance
    // ============================================
    //input 		srx_pad_i;
    //output 		stx_pad_o;
    //output 		rts_pad_o;
    //input 		cts_pad_i;
    //output 		dtr_pad_o;
    //input 		dsr_pad_i;
    //input 		ri_pad_i;
    //input 		dcd_pad_i;

    uart_top UART(
 	              .wb_adr_i(wb_uart_adr_o),
                  .wb_dat_i(wb_uart_dat_o),
 	              .wb_dat_o(wb_uart_dat_i),
 				  .wb_cyc_i(wb_uart_cyc_o),
                  .wb_clk_i(clk),
                  .wb_rst_i(~reset_n),
                  .wb_we_i (wb_uart_we_o),
                  .wb_stb_i(wb_uart_stb_o),
                  .wb_sel_i(wb_uart_sel_o),
                  //.int_o   (),
                  .wb_ack_o(wb_uart_ack_i),
                  .srx_pad_i(i_uart_rx), 
                  .stx_pad_o(o_uart_tx)
    );
    // ============================================
    //          Instruction Memory Instance
    // ============================================

    logic [31:0] imem_inst;

    logic [31:0] imem_addr;
    
    logic [31:0] inst;
    
    assign imem_addr = sel_boot_rom ? wb_dmem_adr_o: current_pc;

    data_mem #(
        .DEPTH(IMEM_DEPTH)
    ) inst_mem_inst (
        .clk_i       (clk            ),
        .rst_i       (~reset_n         ),
        .cyc_i       (wb_imem_cyc_o),
        .stb_i       (wb_imem_stb_o),
        .adr_i       (imem_addr),
        .we_i        (wb_imem_we_o ),
        .sel_i       (wb_imem_sel_o),
        .dat_i       (wb_imem_dat_o),
        .dat_o       (wb_imem_dat_i),
        .ack_o       (wb_imem_ack_i)
    );


    // ============================================
    //          CLINT Instance
    // ============================================
    
    
    clint CLINT (
                    .wb_clk_i(clk),
                    .wb_rst_i(~reset_n),
                    .wb_cyc_i(wb_clint_cyc_o),
                    .wb_stb_i(wb_clint_stb_o),
                    .wb_we_i (wb_clint_we_o),
                    .wb_adr_i(wb_clint_adr_o),
                    .wb_dat_i(wb_clint_dat_o) ,
                    .wb_dat_o(wb_clint_dat_i),
                    .wb_ack_o(wb_clint_ack_i),
                    .mtip_o  (mip_in[7])
                              
                          );    
                    
                    
                     
    assign imem_inst = wb_imem_dat_i;


    // BOOT ROM 
    logic [31:0] rom_inst, rom_inst_ff;
    rom rom_instance(
        .addr     (current_pc[11:0]),
        .inst     (rom_inst  )
    );

    // register after boot rom (to syncronize with the pipeline and inst mem)
    n_bit_reg #(
        .n(32)
    ) rom_inst_reg (
        .clk(clk),
        .reset_n(reset_n),
        .data_i(rom_inst),
        .data_o(rom_inst_ff),
        .wen(if_id_reg_en)
    );



    // Inst selection mux
    logic sel_boot_rom;
    logic sel_boot_rom_ff;
    
    assign sel_boot_rom = &current_pc[31:12]; // 0xfffff000 - to - 0xffffffff 
    
    always @(posedge clk) sel_boot_rom_ff <= sel_boot_rom;
    mux2x1 #(
        .n(32)
    ) rom_imem_inst_sel_mux (
        .in0    (imem_inst      ),
        .in1    (rom_inst_ff    ),
        .sel    (sel_boot_rom_ff),
        .out    (inst           )
    );


    
endmodule : rv32i_soc