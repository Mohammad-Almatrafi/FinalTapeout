module rv32i_soc_top #(
    parameter DMEM_DEPTH = 128,
    parameter IMEM_DEPTH = 128
) (
    inout logic O_UART_TX_PAD,
    inout logic I_UART_RX_PAD,
    inout logic [23:0] IO_GPIO_PAD,
    input CLK_PAD,
    input RESET_PAD
);

logic o_uart_tx_internal;
logic i_uart_rx_internal;
logic [31:0] i_gpio;
logic [31:0] o_gpio;
logic [31:0] en_gpio;
logic clk_internal;
logic reset_n_internal;

  
  
  // UART (2)
  //1
 PDD24DGZ u_reset_pad (
      .I   (1'b0),
      .OEN (1'b1),
      .PAD (RESET_PAD),
      .C   (reset_n_internal)
  );


 PDXO03DG u_clk_pad (
    .XIN (CLK_PAD),
    .XC (clk_internal)
 );



  PDD24DGZ u_uart_tx_pad (
      .I   (o_uart_tx_internal),
      .OEN (1'b0),
      .PAD (O_UART_TX_PAD),
      .C   ()
  );

//2
    PDD24DGZ u_uart_rx_pad (
      .I   (),
      .OEN (1'b1),
      .PAD (I_UART_RX_PAD),
      .C   (i_uart_rx_internal)
  );

//=============== GPIO (24)

//0
  PDD24DGZ gpio_pad_gen0 (
      .I   (o_gpio[0]),
      .OEN (en_gpio[0]),
      .PAD (IO_GPIO_PAD[0]),
      .C   (i_gpio[0])
  );
//1
  PDD24DGZ gpio_pad_gen1 (
      .I   (o_gpio[1]),
      .OEN (en_gpio[1]),
      .PAD (IO_GPIO_PAD[1]),
      .C   (i_gpio[1])
  );
//2
  PDD24DGZ gpio_pad_gen2 (
      .I   (o_gpio[2]),
      .OEN (en_gpio[2]),
      .PAD (IO_GPIO_PAD[2]),
      .C   (i_gpio[2])
  );
//3
  PDD24DGZ gpio_pad_gen3 (
      .I   (o_gpio[3]),
      .OEN (en_gpio[3]),
      .PAD (IO_GPIO_PAD[3]),
      .C   (i_gpio[3])
  );
//4
  PDD24DGZ gpio_pad_gen4 (
      .I   (o_gpio[4]),
      .OEN (en_gpio[4]),
      .PAD (IO_GPIO_PAD[4]),
      .C   (i_gpio[4])
  );
//5
  PDD24DGZ gpio_pad_gen5 (
      .I   (o_gpio[5]),
      .OEN (en_gpio[5]),
      .PAD (IO_GPIO_PAD[5]),
      .C   (i_gpio[5])
  );
//6
  PDD24DGZ gpio_pad_gen6 (
      .I   (o_gpio[6]),
      .OEN (en_gpio[6]),
      .PAD (IO_GPIO_PAD[6]),
      .C   (i_gpio[6])
  );
//7
  PDD24DGZ gpio_pad_gen7 (
      .I   (o_gpio[7]),
      .OEN (en_gpio[7]),
      .PAD (IO_GPIO_PAD[7]),
      .C   (i_gpio[7])
  );
//8
  PDD24DGZ gpio_pad_gen8 (
      .I   (o_gpio[8]),
      .OEN (en_gpio[8]),
      .PAD (IO_GPIO_PAD[8]),
      .C   (i_gpio[8])
  );
//9
  PDD24DGZ gpio_pad_gen9 (
      .I   (o_gpio[9]),
      .OEN (en_gpio[9]),
      .PAD (IO_GPIO_PAD[9]),
      .C   (i_gpio[9])
  );
//10
  PDD24DGZ gpio_pad_gen10 (
      .I   (o_gpio[10]),
      .OEN (en_gpio[10]),
      .PAD (IO_GPIO_PAD[10]),
      .C   (i_gpio[10])
  );
//11
  PDD24DGZ gpio_pad_gen11 (
      .I   (o_gpio[11]),
      .OEN (en_gpio[11]),
      .PAD (IO_GPIO_PAD[11]),
      .C   (i_gpio[11])
  );

//12
  PDD24DGZ gpio_pad_gen12 (
      .I   (o_gpio[12]),
      .OEN (en_gpio[12]),
      .PAD (IO_GPIO_PAD[12]),
      .C   (i_gpio[12])
  );
//13
  PDD24DGZ gpio_pad_gen13 (
      .I   (o_gpio[13]),
      .OEN (en_gpio[13]),
      .PAD (IO_GPIO_PAD[13]),
      .C   (i_gpio[13])
  );
//14
  PDD24DGZ gpio_pad_gen14 (
      .I   (o_gpio[14]),
      .OEN (en_gpio[14]),
      .PAD (IO_GPIO_PAD[14]),
      .C   (i_gpio[14])
  );
//15
  PDD24DGZ gpio_pad_gen15 (
      .I   (o_gpio[15]),
      .OEN (en_gpio[15]),
      .PAD (IO_GPIO_PAD[15]),
      .C   (i_gpio[15])
  );
//16
  PDD24DGZ gpio_pad_gen16 (
      .I   (o_gpio[16]),
      .OEN (en_gpio[16]),
      .PAD (IO_GPIO_PAD[16]),
      .C   (i_gpio[16])
  );
//17
   PDD24DGZ gpio_pad_gen17 (
      .I   (o_gpio[17]),
      .OEN (en_gpio[17]),
      .PAD (IO_GPIO_PAD[17]),
      .C   (i_gpio[17])
  );
//18
  PDD24DGZ gpio_pad_gen18 (
      .I   (o_gpio[18]),
      .OEN (en_gpio[18]),
      .PAD (IO_GPIO_PAD[18]),
      .C   (i_gpio[18])
  );
//19
  PDD24DGZ gpio_pad_gen19 (
      .I   (o_gpio[19]),
      .OEN (en_gpio[19]),
      .PAD (IO_GPIO_PAD[19]),
      .C   (i_gpio[19])
  );
//20
  PDD24DGZ gpio_pad_gen20 (
      .I   (o_gpio[20]),
      .OEN (en_gpio[20]),
      .PAD (IO_GPIO_PAD[20]),
      .C   (i_gpio[20])
  );
//21
  PDD24DGZ gpio_pad_gen21 (
      .I   (o_gpio[21]),
      .OEN (en_gpio[21]),
      .PAD (IO_GPIO_PAD[21]),
      .C   (i_gpio[21])
  );
//22
  PDD24DGZ gpio_pad_gen22 (
      .I   (o_gpio[22]),
      .OEN (en_gpio[22]),
      .PAD (IO_GPIO_PAD[22]),
      .C   (i_gpio[22])
  );
//23
  PDD24DGZ gpio_pad_gen23 (
      .I   (o_gpio[23]),
      .OEN (en_gpio[23]),
      .PAD (IO_GPIO_PAD[23]),
      .C   (i_gpio[23])
  );

rv32i_soc #(
    .DMEM_DEPTH(DMEM_DEPTH),
    .IMEM_DEPTH(DMEM_DEPTH)
) rv32_soc (
     .clk(clk_internal),
     .reset_n(reset_n_internal),
    
    .i_uart_rx(i_uart_rx_internal),
    .o_uart_tx(o_uart_tx_internal),

    //[31:0]   io_data
     .i_gpio(i_gpio),
     .o_gpio(o_gpio),
     .en_gpio(en_gpio)
);
  


  endmodule