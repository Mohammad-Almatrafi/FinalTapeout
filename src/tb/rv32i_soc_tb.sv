`ifdef JTAG_verf
    `ifndef PD_BUILD
        `ifdef tracer 
            `include "tb/pkg.sv"
            `include "tb/tracer_pkg.sv"
            `include "tb/tracer.sv"
        `endif 

        // `include "tb/SimJTAG.sv" 

        module rv32i_soc_tb;
            logic clk;
            logic reset_n;
            logic o_flash_sclk;
            logic o_flash_cs_n;
            logic o_flash_mosi;
            logic i_flash_miso;
            logic o_uart1_tx;
            logic i_uart1_rx;
            logic pwm_pad_o;
            logic tck_i;
            logic tms_i;
            logic tdi_i;
            logic tdo_o;
            
            logic        i_scl;
            logic        o_scl;
            logic        o_scl_oen;
            logic        i_sda;
            logic        o_sda;
            logic        o_sda_oen;

            parameter DMEM_DEPTH = 250;
            parameter IMEM_DEPTH = 1000;
            parameter NO_OF_GPIO_PINS = 32;
            
            logic [31:0] initial_imem [0:IMEM_DEPTH - 1];
            logic [31:0] initial_dmem [0:DMEM_DEPTH - 1];

            // GPIO - Leds and Switches
            wire [NO_OF_GPIO_PINS - 1:0] en_gpio;
            wire [NO_OF_GPIO_PINS - 1:0] i_gpio;
            wire [NO_OF_GPIO_PINS - 1:0] o_gpio;

            // ================================================//
            //                     DUT Instance                //
            // ================================================//

            rv32i_soc #(
                .IMEM_DEPTH(IMEM_DEPTH),
                .DMEM_DEPTH(DMEM_DEPTH),
                .NO_OF_GPIO_PINS(NO_OF_GPIO_PINS)
            )DUT(
                .*
            );

            // ================================================//
            //                       JTAG DPI                  //
            // ================================================//

            logic jtag_enable = 1'b1;
            logic jtag_init_done = 1'b1;  // Set to 1 when you want JTAG to start ticking
            logic jtag_exit_valid;
            
            SimJTAG sim_jtag_inst (
                .clock    (clk),
                .reset    (~reset_n),      // active high in SimJTAG
                .enable   (jtag_enable),
                .init_done(jtag_init_done),
                .jtag_TCK (tck_i),
                .jtag_TMS (tms_i),
                .jtag_TDI (tdi_i),
                .jtag_TRSTn(),             // leave unconnected if you don’t use TRST
                .srstn    (),              // optional system reset (usually not needed)
                .jtag_TDO_data(tdo_o),
                .jtag_TDO_driven(1'b1),    // mark TDO always valid
                .exit     ()
            );

            // ================================================//
            //                  Tracer Instance                //
            // ================================================//

            `ifdef tracer 
                tracer tracer_inst (
                .clk_i(clk),
                .rst_ni(reset_n),
                .hart_id_i(1),
                .rvfi_insn_t(DUT.rv32i_core_inst.data_path_inst.rvfi_insn),
                .rvfi_rs1_addr_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rs1_addr),
                .rvfi_rs2_addr_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rs2_addr),
                .rvfi_rs3_addr_t(),
                .rvfi_rs3_rdata_t(),
                .rvfi_mem_rmask(),
                .rvfi_mem_wmask(),
                .rvfi_rs1_rdata_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rs1_rdata),
                .rvfi_rs2_rdata_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rs2_rdata),
                .rvfi_rd_addr_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rd_addr),
                .rvfi_rd_wdata_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rd_wdata),
                .rvfi_pc_rdata_t(DUT.rv32i_core_inst.data_path_inst.rvfi_pc_rdata),
                .rvfi_pc_wdata_t(DUT.rv32i_core_inst.data_path_inst.rvfi_pc_wdata),
                .rvfi_mem_addr(DUT.rv32i_core_inst.data_path_inst.rvfi_mem_addr),
                .rvfi_mem_wdata(DUT.rv32i_core_inst.data_path_inst.rvfi_mem_wdata),
                .rvfi_mem_rdata(DUT.rv32i_core_inst.data_path_inst.rvfi_mem_rdata),
                .rvfi_valid(DUT.rv32i_core_inst.data_path_inst.rvfi_valid)
                );
            `endif



            // Clock generator 
            initial clk = 0;
            always #5 clk = ~clk;

            // signal geneartion here
            initial begin 
                reset_n = 0;
                repeat(2) @(negedge clk);
                reset_n = 1; // dropping reset after two clk cycles
            end


        // initializing the instruction memory after every reset
        initial begin
                `ifdef USE_SRAM
                    $readmemh("data.hex", DUT.inst_mem_inst.tsmc_32k_inst.u0.mem_core_array);
                    $readmemh("inst.hex", DUT.data_mem_inst.tsmc_8k_inst.u0.mem_core_array);
                `elsif VCS_SIM
                    $readmemh("data.hex", initial_imem);
                    $readmemh("inst.hex", initial_dmem);
                    force DUT.inst_mem_inst.dmem = initial_imem;
                    force DUT.data_mem_inst.dmem = initial_dmem;
                    #1; 
                    release DUT.inst_mem_inst.dmem;
                    release DUT.data_mem_inst.dmem;          
                `else 
                    $readmemh("/home/it/RivRtos/src/tb/crypto_tests/inst.hex", initial_imem);
                    $readmemh("/home/it/RivRtos/src/tb/crypto_tests/data.hex", initial_dmem);
                    force DUT.inst_mem_inst.dmem = initial_imem;
                    force DUT.data_mem_inst.dmem = initial_dmem;
                    #1; 
                    release DUT.inst_mem_inst.dmem;
                    release DUT.data_mem_inst.dmem;
                `endif

        end // wait 

        initial begin 
        `ifdef tracer     
            repeat(500000) @(posedge clk);
            `else 
            repeat(5000) @(posedge clk);  
            `endif
        end
        integer lp;
        wire [31:0]dmem_wire [IMEM_DEPTH-1:0];
        genvar i;
        generate
            for (i = 0; i < IMEM_DEPTH; i++) begin : expose_mem
                assign dmem_wire[i] = DUT.inst_mem_inst.dmem[i]; // Assign memory elements to wires
            end
        endgenerate


        initial begin
            `ifdef VCS_SIM    
                `ifdef dump_wave
                    $dumpfile("waveform.vcd");
                    $dumpvars(1, DUT.wishbone_master); 
                    $dumpvars(1, DUT.rv32i_core_inst);            
                    $dumpvars(1, DUT.rv32i_core_inst.u_core_dbg_fsm);
                    $dumpvars(1, DUT.rv32i_core_inst.data_path_inst);
                    $dumpvars(1, DUT.rv32i_core_inst.controller_inst);
                    `ifdef dump_mem
                        $dumpvars(1, DUT.dat_dump);
                    `endif
                  
                `endif

            `endif 
        end


        endmodule
    `endif
`else
    module rv32i_soc_tb;
          
      // gpio signals
      logic [31:0] i_gpio;
      logic [31:0] o_gpio;
      logic [31:0] en_gpio;

      logic tck_i;
      logic tdi_i;
      logic tms_i;
      logic tdo_o;
      logic clk;
      logic reset_n;
      logic o_flash_sclk;
      logic o_flash_cs_n;
      logic o_flash_mosi;
      logic i_flash_miso;
      logic o_uart_tx;
      logic i_uart_rx;

      localparam K = 2**10;
      parameter IMEM_DEPTH = 32 * K;
      parameter DMEM_DEPTH = 32 * K;
      wire [31:0] io_data;
    logic [31:0] initial_imem [0:IMEM_DEPTH - 1];
    logic [31:0] initial_dmem [0:DMEM_DEPTH - 1];

      // ============================================================================ //
      //     Example connection of tracer with WB stage signals in the data path
      // ============================================================================ //
    `ifdef tracer
      tracer tracer_inst (
          .clk_i(clk),
          .rst_ni(reset_n),
          .hart_id_i(1),
          .rvfi_insn_t(DUT.rv32i_core_inst.data_path_inst.rvfi_insn),
          .rvfi_rs1_addr_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rs1_addr),
          .rvfi_rs2_addr_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rs2_addr),
          .rvfi_rs3_addr_t(),
          .rvfi_rs3_rdata_t(),
          .rvfi_mem_rmask(),
          .rvfi_mem_wmask(),
          .rvfi_rs1_rdata_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rs1_rdata),
          .rvfi_rs2_rdata_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rs2_rdata),
          .rvfi_rd_addr_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rd_addr),
          .rvfi_rd_wdata_t(DUT.rv32i_core_inst.data_path_inst.rvfi_rd_wdata),
          .rvfi_pc_rdata_t(DUT.rv32i_core_inst.data_path_inst.rvfi_pc_rdata),
          .rvfi_pc_wdata_t(DUT.rv32i_core_inst.data_path_inst.rvfi_pc_wdata),
          .rvfi_mem_addr(),
          .rvfi_mem_wdata(),
          .rvfi_mem_rdata(),
          .rvfi_valid(DUT.rv32i_core_inst.data_path_inst.rvfi_valid)
      );
    `endif

      // Dut instantiation
      rv32i_soc #(
        .IMEM_DEPTH(IMEM_DEPTH),
        .DMEM_DEPTH(DMEM_DEPTH)
      )DUT (
          .*,
          .i_uart1_rx(o_uart1_tx)

      );
      
      // Clock generator
      initial clk = 0;
      always #5 clk = ~clk;

      // signal geneartion here
      initial begin
        tck_i = 0;
        tdi_i = 0;
        tms_i = 0;
        reset_n = 0;
        repeat (2) @(negedge clk);
        reset_n = 1;  // dropping reset after two clk cycles
      end


`ifdef dump_mem
    dump_mem dat_dum(DUT.rv32i_core_inst.data_path_inst.reg_file_inst.reg_file);
`endif



      // initializing the instruction memory after every reset
      initial begin
            initial_imem = '{default: 0};
            initial_dmem = '{default: 0};
                $readmemh("/home/Hammad_AlReshoud/hammad/FinalTapeout/src/tb/inst_formatted.hex", initial_imem);
                $readmemh("/home/Hammad_AlReshoud/hammad/FinalTapeout/src/tb/data_formatted.hex", initial_dmem);
            
            force DUT.inst_mem_inst.dmem = initial_imem;
            force DUT.data_mem_inst.dmem = initial_dmem;
            #1; 
            release DUT.inst_mem_inst.dmem;
            release DUT.data_mem_inst.dmem;
      end  // wait

      initial begin
        repeat (100000) @(posedge clk);
        for (int i = 0; i < 100; i = i + 1) begin
          $display("dmem[%02d] => %8h <=> %8h <= imem[%02d] ", i, DUT.data_mem_inst.dmem[i],
                   DUT.inst_mem_inst.dmem[i], i);
        end

        for (int i = 0; i < 32; i = i + 1) begin
          $display("reg_file[%02d] = %03d", i,
                   DUT.rv32i_core_inst.data_path_inst.reg_file_inst.reg_file[i]);
        end
        $finish;
      end
      initial begin
        `ifdef dump_wave
            $dumpfile("waveform.vcd");
            $dumpvars(0, DUT);
`ifdef dump_mem
            $dumpvars(0, dat_dum);
`endif
        `endif
        //   $dumpvars(0, DUT.data_mem_inst);
        //   $dumpvars(0, DUT.inst_mem_inst);
      end

      // initial begin
      //   // Enable VCD file dumping
      //   $dumpfile("waveform.vcd");

      //   // Force signals for data memory
      //   $dumpvars(0, DUT.data_mem_inst);  // Force signals inside data_mem_inst

      //   // Force signals for instruction memory
      //   $dumpvars(0, DUT.inst_mem_inst);  // Force signals inside inst_mem_inst

      //   // Optionally force other internal signals if needed
      //   $dumpvars(0, DUT.wb_m2s_dmem_adr, DUT.wb_m2s_dmem_dat, DUT.wb_s2m_dmem_dat);
      //   $dumpvars(0, DUT.wb_m2s_imem_adr, DUT.wb_m2s_imem_dat, DUT.wb_s2m_imem_dat);
      // end

    endmodule
`endif
