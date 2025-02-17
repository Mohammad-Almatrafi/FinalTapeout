module wb_intercon
   (input         wb_clk_i,
    input         wb_rst_i,

    // IO ( wb master signals )
    input  [31:0] wb_io_adr_i,
    input  [31:0] wb_io_dat_i,
    input   [3:0] wb_io_sel_i,
    input         wb_io_we_i,
    input         wb_io_cyc_i,
    input         wb_io_stb_i,
    input   [2:0] wb_io_cti_i,
    input   [1:0] wb_io_bte_i,
    output [31:0] wb_io_dat_o,
    output        wb_io_ack_o,
    output        wb_io_err_o,
    output        wb_io_rty_o,

    // SPI FLASH SIGNALS
    output [31:0] wb_spi_flash_adr_o,
    output [31:0] wb_spi_flash_dat_o,
    output  [3:0] wb_spi_flash_sel_o,
    output        wb_spi_flash_we_o,
    output        wb_spi_flash_cyc_o,
    output        wb_spi_flash_stb_o,
    output  [2:0] wb_spi_flash_cti_o,
    output  [1:0] wb_spi_flash_bte_o,
    input  [31:0] wb_spi_flash_dat_i,
    input         wb_spi_flash_ack_i,
    input         wb_spi_flash_err_i,
    input         wb_spi_flash_rty_i,

    // DATA MEM
    
    output [31:0] wb_dmem_adr_o,
    output [31:0] wb_dmem_dat_o,
    output  [3:0] wb_dmem_sel_o,
    output        wb_dmem_we_o,
    output        wb_dmem_cyc_o,
    output        wb_dmem_stb_o,
    output  [2:0] wb_dmem_cti_o,
    output  [1:0] wb_dmem_bte_o,
    input  [31:0] wb_dmem_dat_i,
    input         wb_dmem_ack_i,
    input         wb_dmem_err_i,
    input         wb_dmem_rty_i,

    // IMEM
    output [31:0] wb_imem_adr_o,
    output [31:0] wb_imem_dat_o,
    output  [3:0] wb_imem_sel_o,
    output        wb_imem_we_o, 
    output        wb_imem_cyc_o,
    output        wb_imem_stb_o,
    output  [2:0] wb_imem_cti_o,
    output  [1:0] wb_imem_bte_o,
    input  [31:0] wb_imem_dat_i,
    input         wb_imem_ack_i,
    input         wb_imem_err_i,
    input         wb_imem_rty_i,

    // UART
    output [31:0] wb_uart_adr_o,
    output [31:0] wb_uart_dat_o,
    output  [3:0] wb_uart_sel_o,
    output        wb_uart_we_o,
    output        wb_uart_cyc_o,
    output        wb_uart_stb_o,
    output  [2:0] wb_uart_cti_o,
    output  [1:0] wb_uart_bte_o,
    input  [31:0] wb_uart_dat_i,
    input         wb_uart_ack_i,
    input         wb_uart_err_i,
    input         wb_uart_rty_i,

    // GPIO
    output [31:0] wb_gpio_adr_o,
    output [31:0] wb_gpio_dat_o,
    output  [3:0] wb_gpio_sel_o,
    output        wb_gpio_we_o,
    output        wb_gpio_cyc_o,
    output        wb_gpio_stb_o,
    output  [2:0] wb_gpio_cti_o,
    output  [1:0] wb_gpio_bte_o,
    input  [31:0] wb_gpio_dat_i,
    input         wb_gpio_ack_i,
    input         wb_gpio_err_i,
    input         wb_gpio_rty_i 
);


// =============================================//
//                Wishbone Multiplixer          //
// =============================================//

  // x00000000 - 0x0FFFFFFF	  RAM (Data Memory - DMEM)
  // 0x10000000 - 0x1FFFFFFF	Instruction Memory (IMEM)
  // 0x20000000 - 0x20FFFFFF	Peripheral Memory (e.g., UART, GPIO, SPI)
  //   0x20000000 - 0x200000ff UART
  //   0x20000100 - 0x200001ff GPIO
  //   0x20000200 - 0x200002ff SPI
  // 0x30000000 - 0x3FFFFFFF	Boot ROM
  // 0x40000000 - 0x4FFFFFFF	MMIO (Memory-Mapped I/O)
  // 0x80000000 - 0xFFFFFFFF	External DRAM

wb_mux
  #(.num_slaves (5),
    .MATCH_ADDR ({32'h20000200, 32'h00000000, 32'h10000000, 32'h20000100, 32'h20000000}),
    .MATCH_MASK ({32'hffffff00, 32'hf0000000, 32'hf0000000, 32'hffffff00, 32'hffffff00}))
 wb_mux_io
   (.wb_clk_i  (wb_clk_i),
    .wb_rst_i  (wb_rst_i),
    .wbm_adr_i (wb_io_adr_i),
    .wbm_dat_i (wb_io_dat_i),
    .wbm_sel_i (wb_io_sel_i),
    .wbm_we_i  (wb_io_we_i),
    .wbm_cyc_i (wb_io_cyc_i),
    .wbm_stb_i (wb_io_stb_i),
    .wbm_cti_i (wb_io_cti_i),
    .wbm_bte_i (wb_io_bte_i),
    .wbm_dat_o (wb_io_dat_o),
    .wbm_ack_o (wb_io_ack_o),
    .wbm_err_o (wb_io_err_o),
    .wbm_rty_o (wb_io_rty_o),
    .wbs_adr_o ({wb_spi_flash_adr_o, wb_dmem_adr_o, wb_imem_adr_o, wb_gpio_adr_o,  wb_uart_adr_o}),
    .wbs_dat_o ({wb_spi_flash_dat_o, wb_dmem_dat_o, wb_imem_dat_o, wb_gpio_dat_o,  wb_uart_dat_o}),
    .wbs_sel_o ({wb_spi_flash_sel_o, wb_dmem_sel_o, wb_imem_sel_o, wb_gpio_sel_o,  wb_uart_sel_o}),
    .wbs_we_o  ({wb_spi_flash_we_o,  wb_dmem_we_o,  wb_imem_we_o,  wb_gpio_we_o,   wb_uart_we_o}),
    .wbs_cyc_o ({wb_spi_flash_cyc_o, wb_dmem_cyc_o, wb_imem_cyc_o, wb_gpio_cyc_o,  wb_uart_cyc_o}),
    .wbs_stb_o ({wb_spi_flash_stb_o, wb_dmem_stb_o, wb_imem_stb_o, wb_gpio_stb_o,  wb_uart_stb_o}),
    .wbs_cti_o ({wb_spi_flash_cti_o, wb_dmem_cti_o, wb_imem_cti_o, wb_gpio_cti_o,  wb_uart_cti_o}),
    .wbs_bte_o ({wb_spi_flash_bte_o, wb_dmem_bte_o, wb_imem_bte_o, wb_gpio_bte_o,  wb_uart_bte_o}),
    .wbs_dat_i ({wb_spi_flash_dat_i, wb_dmem_dat_i, wb_imem_dat_i, wb_gpio_dat_i,  wb_uart_dat_i}),
    .wbs_ack_i ({wb_spi_flash_ack_i, wb_dmem_ack_i, wb_imem_ack_i, wb_gpio_ack_i,  wb_uart_ack_i}),
    .wbs_err_i ({wb_spi_flash_err_i, wb_dmem_err_i, wb_imem_err_i, wb_gpio_err_i,  wb_uart_err_i}),
    .wbs_rty_i ({wb_spi_flash_rty_i, wb_dmem_rty_i, wb_imem_rty_i, wb_gpio_rty_i,  wb_uart_rty_i}));


endmodule
