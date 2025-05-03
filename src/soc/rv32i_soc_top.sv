module rv32i_soc_top (

    // ================
    // clk reset_n pins
    // ================

    clk,
    reset_n,

    // ================
    // Shared pins
    // ================

    // SPI1 GPIO[23:19]
    GPIO_23_SPI1_MOSI,
    GPIO_22_SPI1_MISO,
    GPIO_21_SPI1_SCK,
    GPIO_20_SPI1_SS0,
    GPIO_19_SPI1_SS1,

    // PWM GPIO[18]
    GPIO_18_PWM,

    // I2C GPIO[17:16]
    GPIO_17_SDA,
    GPIO_16_SCL,

    // SPI2 GPIO[15:11]
    GPIO_15_SPI2_MOSI,
    GPIO_14_SPI2_MISO,
    GPIO_13_SPI2_SCK,
    GPIO_12_SPI2_SS0,
    GPIO_11_SPI2_SS1,


    // ================
    // Independent pins
    // ================

    // GPIO[10:0]
    GPIO_10,
    GPIO_9,
    GPIO_8,
    GPIO_7,
    GPIO_6,
    GPIO_5,
    GPIO_4,
    GPIO_3,
    GPIO_2,
    GPIO_1,
    GPIO_0,

    // UART
    UART_TXD,
    UART_RXD,

    // JTAG
    JTAG_TDI,
    JTAG_TDO,
    JTAG_TMS,
    JTAG_TCK

);


  logic reset_n_internal;
  logic clk_internal;

  logic GPIO_23_SPI1_MOSI_internal;
  logic GPIO_22_SPI1_MISO_internal;
  logic GPIO_21_SPI1_SCK_internal;
  logic GPIO_20_SPI1_SS0_internal;
  logic GPIO_19_SPI1_SS1_internal;
  logic GPIO_18_PWM_internal;
  logic GPIO_17_SDA_internal;
  logic GPIO_16_SCL_internal;
  logic GPIO_15_SPI2_MOSI_internal;
  logic GPIO_14_SPI2_MISO_internal;
  logic GPIO_13_SPI2_SCK_internal;
  logic GPIO_12_SPI2_SS0_internal;
  logic GPIO_11_SPI2_SS1_internal;
  logic GPIO_10_internal;
  logic GPIO_9_internal;
  logic GPIO_8_internal;
  logic GPIO_7_internal;
  logic GPIO_6_internal;
  logic GPIO_5_internal;
  logic GPIO_4_internal;
  logic GPIO_3_internal;
  logic GPIO_2_internal;
  logic GPIO_1_internal;
  logic GPIO_0_internal;
  logic UART_TXD_internal;
  logic UART_RXD_internal;
  logic JTAG_TDI_internal;
  logic JTAG_TDO_internal;
  logic JTAG_TMS_internal;
  logic JTAG_TCK_internal;



  //  rv32i_soc (    input logic clk,
  //     input logic reset_n,
  //
  //     // spi signals to the spi-flash
  //     // uart signals
  //     input i_uart_rx,
  //     output o_uart_tx,
  //     // gpio signals
  //     inout wire [31:0]   io_data
  // );

  // INOUT_CONFIG
  //  PDD24DGZ INOUT_CONFIG (
  //    .I   (output),
  //    .OEN (OEN_n),
  //    .PAD (inout),
  //    .C   (input)
  //);



  // ================
  // UART PADS
  // ================

  PDD24DGZ UART_TX_PAD (
      .I  (TXD),
      .OEN(1'b0),
      .PAD(UART_TXD),
      .C  ()
  );

  PDD24DGZ UART_RX_PAD (
      .I  (),
      .OEN(1'b0),
      .PAD(UART_RXD),
      .C  (RXD)
  );


  // ================
  // GPIO PADS
  // ================

  PDD24DGZ GPIO0_PAD (
      .I  (),
      .OEN(),
      .PAD(GPIO_0),
      .C  ()
  );

  PDD24DGZ GPIO1_PAD (
      .I  (),
      .OEN(),
      .PAD(GPIO_1),
      .C  ()
  );

  PDD24DGZ GPIO2_PAD (
      .I  (),
      .OEN(),
      .PAD(GPIO_2),
      .C  ()
  );

  PDD24DGZ GPIO3_PAD (
      .I  (),
      .OEN(),
      .PAD(GPIO_3),
      .C  ()
  );

  PDD24DGZ GPIO4_PAD (
      .I  (),
      .OEN(),
      .PAD(GPIO_4),
      .C  ()
  );

  PDD24DGZ GPIO5_PAD (
      .I  (),
      .OEN(),
      .PAD(GPIO_5),
      .C  ()
  );

  PDD24DGZ GPIO6_PAD (
      .I  (),
      .OEN(),
      .PAD(GPIO_6),
      .C  ()
  );

  PDD24DGZ GPIO7_PAD (
      .I  (),
      .OEN(),
      .PAD(GPIO_7),
      .C  ()
  );

  PDD24DGZ GPIO8_PAD (
      .I  (),
      .OEN(),
      .PAD(GPIO_8),
      .C  ()
  );


  PDD24DGZ GPIO9_PAD (
      .I  (),
      .OEN(),
      .PAD(GPIO_9),
      .C  ()
  );


  PDD24DGZ GPIO10_PAD (
      .I  (),
      .OEN(),
      .PAD(GPIO_10),
      .C  ()
  );


  // ================
  // JTAG PADS
  // ================

  PDD24DGZ JTAG_TDO_PAD (
      .I  (),
      .OEN(1'b0),
      .PAD(JTAG_TDO),
      .C  (JTAG_TDO_internal)
  );

  PDD24DGZ JTAG_TDI_PAD (
      .I  (),
      .OEN(1'b1),
      .PAD(JTAG_TDI),
      .C  (JTAG_TDI_internal)
  );

  PDD24DGZ JTAG_TMS_PAD (
      .I  (),
      .OEN(1'b1),
      .PAD(JTAG_TMS),
      .C  (JTAG_TMS_internal)
  );


  // could be clk pad or input pad
  PDXO01DG JTAG_TCK_PAD (
      .XI(JTAG_TCK),
      .XO(),
      .XC(JTAG_TCK_internal)
  );

  // PDD24DGZ JTAG_TCK_PAD (
  //     .I  (),
  //     .OEN(1'b1),
  //     .PAD(JTAG_TCK),
  //     .C  (JTAG_TCK_internal)
  // );






  // ================
  // CLK RESET PADS
  // ================

  PDXO01DG CLK_PAD (
      .XI(clk),
      .XO(),
      .XC(clk_internal)
  );

  PDD24DGZ RESET_PAD (
      .I  (),
      .OEN(1'b1),
      .PAD(reset_n),
      .C  (reset_n_internal)
  );

  // ================
  // GPIO[23:19]/SPI1 PADS
  // ================

  PDD24DGZ GPIO_23_shared (
      .I  (GPIO_23_SPI1_MOSI_internal),
      .OEN(OEN_MOSI1_GPIO23),
      .PAD(GPIO_23_SPI1_MOSI),
      .C  (GPIO_23_SPI1_MOSI_internal)
  );

  PDD24DGZ GPIO_22_shared (
      .I  (GPIO_22_SPI1_MISO_internal),
      .OEN(OEN_MISO1_GPIO22),
      .PAD(GPIO_22_SPI1_MISO),
      .C  (GPIO_22_SPI1_MISO_internal)
  );

  PDD24DGZ GPIO_21_shared (
      .I  (GPIO_21_SPI1_SCK_internal),
      .OEN(OEN_SCK1_GPIO21),
      .PAD(GPIO_21_SPI1_SCK),
      .C  (GPIO_21_SPI1_SCK_internal)
  );

  PDD24DGZ GPIO_20_shared (
      .I  (GPIO_20_SPI1_SS0_internal),
      .OEN(OEN_SS0_GPIO20),
      .PAD(GPIO_20_SPI1_SS0),
      .C  (GPIO_20_SPI1_SS0_internal)
  );

  PDD24DGZ GPIO_19_shared (
      .I  (GPIO_19_SPI1_SS1_internal),
      .OEN(OEN_SS1_GPIO19),
      .PAD(GPIO_19_SPI1_SS1),
      .C  (GPIO_19_SPI1_SS1_internal)
  );

  // ================
  // GPIO[23:19]/PWM PADS
  // ================

    // GPIO_18_PWM,
  PDD24DGZ GPIO_18_shared (
      .I  (GPIO_18_PWM_internal),
      .OEN(OEN_PWM_GPIO18),
      .PAD(GPIO_18_PWM),
      .C  (GPIO_18_PWM_internal)
  );

  PDD24DGZ GPIO_17_shared (
      .I  (GPIO_17_SDA_internal),
      .OEN(OEN_SDA_GPIO17),
      .PAD(GPIO_17_SDA),
      .C  (GPIO_17_SDA_internal)
  );

  PDD24DGZ GPIO_16_shared (
      .I  (GPIO_16_SCL_internal),
      .OEN(OEN_SCL_GPIO17),
      .PAD(GPIO_16_SCL),
      .C  (GPIO_16_SCL_internal)
  );

  // ================
  // GPIO[15:11]/SPI2 PADS
  // ================

  PDD24DGZ GPIO_15_shared (
      .I  (GPIO_15_SPI2_MOSI_internal),
      .OEN(OEN_MOSI2_GPIO15),
      .PAD(GPIO_15_SPI2_MOSI),
      .C  (GPIO_15_SPI2_MOSI_internal)
  );

  PDD24DGZ GPIO_14_shared (
      .I  (GPIO_14_SPI2_MISO_internal),
      .OEN(OEN_MISO2_GPIO14),
      .PAD(GPIO_14_SPI2_MISO),
      .C  (GPIO_14_SPI2_MISO_internal)
  );

  PDD24DGZ GPIO_13_shared (
      .I  (GPIO_13_SPI2_SCK_internal),
      .OEN(OEN_SCK2_GPIO13),
      .PAD(GPIO_13_SPI2_SCK),
      .C  (GPIO_13_SPI2_SCK_internal)
  );

  PDD24DGZ GPIO_12_shared (
      .I  (GPIO_12_SPI2_SS0_internal),
      .OEN(OEN_SS0_GPIO12),
      .PAD(GPIO_12_SPI2_SS0),
      .C  (GPIO_12_SPI2_SS0_internal)
  );

  PDD24DGZ GPIO_11_shared (
      .I  (GPIO_11_SPI2_SS1_internal),
      .OEN(OEN_SS1_GPIO19),
      .PAD(GPIO_11_SPI2_SS1),
      .C  (GPIO_11_SPI2_SS1_internal)
  );

    // // SPI1 GPIO[23:19]
    // GPIO_23_SPI1_MOSI,
    // GPIO_22_SPI1_MISO,
    // GPIO_21_SPI1_SCK,
    // GPIO_20_SPI1_SS0,
    // GPIO_19_SPI1_SS1,
    //
    // // PWM GPIO[18]
    // GPIO_18_PWM,
    //
    // // I2C GPIO[17:16]
    // GPIO_17_SDA,
    // GPIO_16_SCL,
    //
    // // SPI2 GPIO[15:11]
    // GPIO_15_SPI2_MOSI,
    // GPIO_14_SPI2_MISO,
    // GPIO_13_SPI2_SCK,
    // GPIO_12_SPI2_SS0,
    // GPIO_11_SPI2_SS1,
    //
endmodule
