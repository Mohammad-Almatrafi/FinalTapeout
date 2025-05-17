
module rv32i_soc_fpag_top (
    input logic CLK100MHZ,
    input logic CPU_RESETN,

    // FPGA core signals
    input  logic UART_TXD_IN,
    output logic UART_RXD_OUT,

    output wire CA,
    CB,
    CC,
    CD,
    CE,
    CF,
    CG,
    DP,
    output wire [7:0] AN,

    output logic [15:0] LED
);
  parameter integer DMEM_DEPTH = 128;
  parameter integer IMEM_DEPTH = 128;
  parameter integer NO_OF_GPIO_PINS = 24;

  logic o_flash_sclk;
  STARTUPE2 STARTUPE2 (
      .CFGCLK   (),
      .CFGMCLK  (),
      .EOS      (),
      .PREQ     (),
      .CLK      (1'b0),
      .GSR      (1'b0),
      .GTS      (1'b0),
      .KEYCLEARB(1'b1),
      .PACK     (1'b0),
      .USRCCLKO (o_flash_sclk),
      .USRCCLKTS(1'b0),
      .USRDONEO (1'b1),
      .USRDONETS(1'b0)
  );

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
      .clk_i  (CLK100MHZ),
      .clk_o  (clk),
      .reset_n(CPU_RESETN)
  );

  // GPIO - Leds and Switches
  wire [NO_OF_GPIO_PINS - 1:0] en_gpio;
  wire [NO_OF_GPIO_PINS - 1:0] i_gpio;
  wire [NO_OF_GPIO_PINS - 1:0] o_gpio;
  wire [NO_OF_GPIO_PINS - 1:0] io_data;
  wire [NO_OF_GPIO_PINS - 1:0] oen_gpio;

  assign oen_gpio = 24'h00FFFF;

`ifndef VIVADO_BUILD
  bit tck_i;
  bit tdi_i;
  bit tms_i = 1;
  bit tdo_o;
`endif

//  assign i_gpio = {SW[7:0],16'dz};
  assign LED[15:11]    = o_gpio[4:0];
  // assign LED[10:0]     = 10'b0;


  logic jump_trigger, jump_ff;
  logic ebreak_trigger, ebreak_ff;
  logic inst_valid_trigger, valid_ff;

  logic [10:8] led_;

  always @(posedge clk) begin
    // jump_ff   <= ~soc_inst.rv32i_core_inst.u_core_dbg_fsm.no_jump;
    ebreak_ff <= soc_inst.rv32i_core_inst.u_core_dbg_fsm.ebreak_inst_mem;
    valid_ff  <= soc_inst.rv32i_core_inst.u_core_dbg_fsm.inst_valid_wb;
    if (ebreak_trigger) led_[8] = ~led_[8];
    if (jump_trigger) led_[9] = ~led_[9];
    if (inst_valid_trigger) led_[10] = ~led_[10];

  end

  assign ebreak_trigger     = ebreak_ff ^ soc_inst.rv32i_core_inst.u_core_dbg_fsm.ebreak_inst_mem;
  assign jump_trigger       = 1'b0; //  jump_ff ^ (~soc_inst.rv32i_core_inst.u_core_dbg_fsm.no_jump);
  assign inst_valid_trigger = valid_ff ^ soc_inst.rv32i_core_inst.u_core_dbg_fsm.inst_valid_wb;



  assign LED[0]             = soc_inst.core_halted;
  assign LED[1]             = soc_inst.rv32i_core_inst.u_core_dbg_fsm.debug_step;
  assign LED[4:2]           = soc_inst.rv32i_core_inst.u_core_dbg_fsm.debug_cause;
  // assign LED[5]             = ~soc_inst.rv32i_core_inst.u_core_dbg_fsm.no_jump;
  assign LED[5]             = 1'b0;
  assign LED[6]             = soc_inst.rv32i_core_inst.u_core_dbg_fsm.inst_valid_wb;
  assign LED[7]             = soc_inst.rv32i_core_inst.u_core_dbg_fsm.ebreak_inst_mem;
  assign LED[10:8]          = led_[10:8];

  rv32i_soc #(
      .DMEM_DEPTH(DMEM_DEPTH),
      .IMEM_DEPTH(IMEM_DEPTH),
      .NO_OF_GPIO_PINS(NO_OF_GPIO_PINS)
  ) soc_inst (
      .*,
      .reset_n  (CPU_RESETN),
      .i_uart_rx(UART_TXD_IN),
      .o_uart_tx(UART_RXD_OUT)
//      ,
//      .io_data  ({32'h00000000})
  );

  wire [3:0] digits[0:7];
  wire [31:0] display_reg;


  assign display_reg = soc_inst.rv32i_core_inst.dpc;

//  assign digits[0]   = display_reg[3 : 0];
//  assign digits[1]   = display_reg[7 : 4];
//  assign digits[2]   = display_reg[11:8];
//  assign digits[3]   = display_reg[15:12];
//  assign digits[4]   = display_reg[19:16];
//  assign digits[5]   = display_reg[23:20];
//  assign digits[6]   = display_reg[27:24];
//  assign digits[7]   = display_reg[31:28];

  sev_seg_top sev_Seg_top (
      .CPU_RESETN(CPU_RESETN),
      .CLK100MHZ(clk),
      .CA(CA),
      .CB(CB),
      .CC(CC),
      .CD(CD),
      .CE(CE),
      .CF(CF),
      .CG(CG),
      .DP(DP),
      .AN(AN),
      .t(display_reg)
  );

endmodule : rv32i_soc_fpag_top

module clk_div_by_2 (
    input  logic reset_n,
    input  logic clk_i,
    output logic clk_o
);
  always @(posedge clk_i, negedge reset_n) begin
    if (~reset_n) clk_o <= 0;
    else clk_o <= ~clk_o;
  end
endmodule
