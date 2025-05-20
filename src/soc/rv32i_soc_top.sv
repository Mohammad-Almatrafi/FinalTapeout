module top_rv32i_soc
  (
    input  CLK_PAD,             
    input  RESET_N_PAD,          
    output O_UART_TX_PAD,        
    input  I_UART_RX_PAD,        
    inout  [31:0] IO_DATA_PAD,  
    input I_TCK_PAD, 
    input I_TMS_PAD, 
    input I_TDI_PAD, 
    output O_TDO_PAD 


`ifdef PD_BUILD
    // Power ports
    ,
    input  VDD_LEFT,               // Power
    input  VDD_RIGHT,              // Ground
    input  VDD_TOP,                // Power
    input  VDD_BOTTOM,             // Ground
    input  VSS_LEFT,               // Power
    input  VSS_RIGHT,              // Ground
    input  VSS_TOP,                // Power
    input  VSS_BOTTOM,             // Ground
    input VDDPST_LEFT,             // Power
    input VDDPST_RIGHT,            // Ground
    input VDDPST_TOP,              // Power
    input VDDPST_BOTTOM,           // Ground
    input VSSPST_LEFT,             // Ground
    input VSSPST_RIGHT,            // Power
    input VSSPST_TOP,              // Ground
    input VSSPST_BOTTOM            // Power
`endif
  );

 
  wire clk_internal;
 
  PDXO03DG u_clk_pad (
      .XIN  (CLK_PAD),
      .XC   (clk_internal)
  );

  wire reset_n_internal;
  PDD24DGZ u_reset_pad (
      .I   (1'b0),
      .OEN (1'b1),		// OEN is disabled, using this pin as input
      .PAD (RESET_N_PAD),
      .C   (reset_n_internal)
  );


  wire o_uart_tx_internal;
  PDD24DGZ u_uart_tx_pad (
      .I   (o_uart_tx_internal),
      .OEN (1'b0),
      .PAD (O_UART_TX_PAD),
      .C   ()
  );

  wire i_uart_rx_internal;
  PDD24DGZ u_uart_rx_pad (
      .I   (1'b0),
      .OEN (1'b1),
      .PAD (I_UART_RX_PAD),
      .C   (i_uart_rx_internal)
  );

  wire [31:0] gpio_input_internal;
  wire [31:0] gpio_output_internal;
  wire [31:0] gpio_enable_internal;

  genvar k;
  generate
    for (k = 0; k < 32; k = k + 1) begin : gpio_pad_gen
      PDD24DGZ u_gpio_pad (
          .I   (gpio_output_internal[k]),
          .OEN (gpio_enable_internal[k]),     
          .PAD (IO_DATA_PAD[k]),
          .C   (gpio_input_internal[k])           
      );
    end
  endgenerate


  wire tck_i_internal;
  PDD24DGZ u_tck_pad (
      .I   (1'b0),
      .OEN (1'b1),
      .PAD (I_TCK_PAD),
      .C   (tck_i_internal)
  );
  wire tms_i_internal;
  PDD24DGZ u_tms_pad (
      .I   (1'b0),
      .OEN (1'b1),
      .PAD (I_TMS_PAD),
      .C   (tms_i_internal)
  );
  wire tdi_i_internal;
  PDD24DGZ u_tdi_pad (
      .I   (1'b0),
      .OEN (1'b1),
      .PAD (I_TDI_PAD),
      .C   (tdi_i_internal)
  );
  wire tdo_o_internal;
  PDD24DGZ u_tdo_pad (
      .I   (tdo_o_internal),
      .OEN (1'b0),
      .PAD (O_TDO_PAD),
      .C   ()
  );


  //-------------------------------------------------------------------------
  // Instantiate the RISC-V SoC
  //-------------------------------------------------------------------------
  // The internal nets from the pads are connected to the chip instance.
  
  rv32i_soc u_rv32i_soc (
      .clk          (clk_internal),
      .reset_n      (reset_n_internal),
      .o_uart1_tx   (o_uart_tx_internal),
      .i_uart1_rx   (i_uart_rx_internal),
      .i_gpio       (gpio_input_internal),
      .o_gpio       (gpio_output_internal),
      .en_gpio      (gpio_enable_internal),
      .tck_i        (tck_i_internal),
      .tms_i        (tms_i_internal),
      .tdi_i        (tdi_i_internal),
      .tdo_o        (tdo_o_internal)
  );

  //-------------------------------------------------------------------------
  // Power and ground pads

`ifdef PD_BUILD

  PVDD1DGZ vdd_left (
      .VDD(VDD_LEFT)
  );
  PVDD1DGZ vdd_right (
      .VDD(VDD_RIGHT)
  );
  PVDD1DGZ vdd_top (
      .VDD(VDD_TOP)
  );
  PVDD1DGZ vdd_bottom (
      .VDD(VDD_BOTTOM)
  );
  PVSS1DGZ vss_left (
      .VSS(VSS_LEFT)
  );
  PVSS1DGZ vss_right (
      .VSS(VSS_RIGHT)
  );
  PVSS1DGZ vss_top (
      .VSS(VSS_TOP)
  );
  PVSS1DGZ vss_bottom (
      .VSS(VSS_BOTTOM)
  );
  PVDD2DGZ iovdd_left (
      .VDDPST(VDDPST_LEFT)
  );
  PVDD2DGZ iovdd_right (
      .VDDPST(VDDPST_RIGHT)
  );
  PVDD2DGZ iovdd_top (
      .VDDPST(VDDPST_TOP)
  );
  PVDD2DGZ iovdd_bottom (
      .VDDPST(VDDPST_BOTTOM)
  );
  PVSS2DGZ iovss_left (
      .VSSPST(VSSPST_LEFT)
  );
  PVSS2DGZ iovss_right (
      .VSSPST(VSSPST_RIGHT)
  );
  PVSS2DGZ iovss_top (
      .VSSPST(VSSPST_TOP)
  );
  PVSS2DGZ iovss_bottom (
      .VSSPST(VSSPST_BOTTOM)
  );
`endif
  //-------------------------------------------------------------------------

endmodule