module rv32i_soc_tb;
  logic clk;
  logic reset_n;
  logic o_flash_sclk;
  logic o_flash_cs_n;
  logic o_flash_mosi;
  logic i_flash_miso;
  logic o_uart_tx;
  logic i_uart_rx;
  parameter IMEM_DEPTH = 100000;
  parameter DMEM_DEPTH = 128;
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
      .i_uart_rx(o_uart_tx)
  );
  
  // Clock generator
  initial clk = 0;
  always #5 clk = ~clk;

  // signal geneartion here
  initial begin
    reset_n = 0;
    repeat (2) @(negedge clk);
    reset_n = 1;  // dropping reset after two clk cycles
  end





  // initializing the instruction memory after every reset
  initial begin

            $readmemh("/home/Mohammed_Almatrafi/FTO/FinalTapeout/src/tb/inst_formatted.hex", initial_imem);
            $readmemh("/home/Mohammed_Almatrafi/FTO/FinalTapeout/src/tb/data_formatted.hex", initial_dmem);
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
    $dumpfile("waveform.vcd");
    $dumpvars(0, DUT);
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

