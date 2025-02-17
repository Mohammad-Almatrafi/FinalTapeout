module rv32i_soc #(
    parameter DMEM_DEPTH = 128,
    parameter IMEM_DEPTH = 128
) (
    input logic clk,
    input logic reset_n,

    // spi signals to the spi-flash
    // uart signals

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



    // ============================================
    //          Processor Core Instantiation
    // ============================================
    
    // Instantiate the processor core here 


    // ============================================
    //                 Wishbone Master
    // ============================================
    
    wishbone_controller wishbone_master (
        .clk        (clk),
        .rst        (~reset_n),
        .proc_addr  (mem_addr_mem),
        .proc_wdata (mem_wdata_mem),
        .proc_write (mem_write_mem),
        .proc_read  (mem_read_mem),
        .proc_op    (mem_op_mem),
        .proc_rdata (mem_rdata_mem),
        .proc_stall_pipl(stall_pipl), // Stall pipeline if needed
        .wb_adr_o   (/*connect these signals*/),     // Connect to the external Wishbone bus as required
        .wb_dat_o   (/*connect these signals*/),
        .wb_sel_o   (/*connect these signals*/),
        .wb_we_o    (/*connect these signals*/),
        .wb_cyc_o   (/*connect these signals*/),
        .wb_stb_o   (/*connect these signals*/),
        .wb_dat_i   (/*connect these signals*/), // For simplicity, no data input
        .wb_ack_i   (/*connect these signals*/)   // For simplicity, no acknowledgment signal
    );
    assign wb_m2s_io_cti = 0;
    assign wb_m2s_io_bte  = 0;
    // wishbone interconnect signals


    // DATA MEM
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


    
    // ============================================
    //             Wishbone Interconnect 
    // ============================================
    
    // Instantiate the wishbone interconnect here 
  


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

    // Instantiate the GPIO peripheral here 

   


    // ============================================
    //             Data Memory Instance
    // ============================================

    // Instantiate data memory here 
     data_mem #(
        .DEPTH(DMEM_DEPTH)
     ) Data_mem(
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
    //          Instruction Memory Instance
    // ============================================

    logic [31:0] imem_inst;

    logic [31:0] imem_addr;
    

    assign imem_addr = sel_boot_rom ? wb_m2s_dmem_adr: current_pc;

    data_mem #(
        .DEPTH(IMEM_DEPTH)
    ) inst_mem_inst (
        .clk_i       (clk            ),
        .rst_i       (wb_rst         ),
        .cyc_i       (wb_m2s_imem_cyc),
        .stb_i       (wb_m2s_imem_stb),
        .adr_i       (imem_addr      ),
        .we_i        (wb_m2s_imem_we ),
        .sel_i       (wb_m2s_imem_sel),
        .dat_i       (wb_m2s_imem_dat),
        .dat_o       (wb_s2m_imem_dat),
        .ack_o       (wb_s2m_imem_ack)
    );

    assign imem_inst = wb_s2m_imem_dat;


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