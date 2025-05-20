module io_mux #(
    NO_OF_SHARED_PINS = 15,
    NO_OF_GPIO_PINS = 24
)(
    // io mux control signal 
    input logic [NO_OF_SHARED_PINS - 1: 0] io_sel,

    // spi signals to the spi-flash
    input logic       o_flash_sclk,     // serial clock output
    input logic [1:0] o_flash_cs_n,     // slave select (active low)
    input logic       o_flash_mosi,     // MasterOut SlaveIN
    output  logic     i_flash_miso,     // MasterIn SlaveOut 

    // spi signals to the spi-2
    input logic       o_sclk,     // serial clock output
    input logic [1:0] o_cs_n,     // slave select (active low)
    input logic       o_mosi,     // MasterOut SlaveIN
    output  logic     i_miso,     // MasterIn SlaveOut    

    output logic       i_scl,
    input logic        o_scl,
    input logic        o_scl_oen,
    output logic       i_sda,
    input logic        o_sda,
    input logic        o_sda_oen,

    //  ptc signals 
    input logic pwm_pad_o,
    input logic pwm_padoen_o,

    // uart signal s
    input logic  o_uart2_tx,
    output logic i_uart2_rx,


    // signlas from the gpio module 
    output  logic [NO_OF_GPIO_PINS-1:0] i_gpio_, 
    input  logic  [NO_OF_GPIO_PINS-1:0] o_gpio_,
    input logic   [NO_OF_GPIO_PINS-1:0]  en_gpio_,

    // gpio signals from and to the pad circuit
    input  logic [NO_OF_GPIO_PINS-1:0] i_gpio, 
    output logic [NO_OF_GPIO_PINS-1:0] o_gpio,
    output logic [NO_OF_GPIO_PINS-1:0] en_gpio
);

    // Renaming for readability
    logic spi1_sclk;
    logic spi1_mosi;
    logic spi1_miso;
    logic spi1_ss0;
    logic spi1_ss1;

    logic spi2_sclk;
    logic spi2_mosi;
    logic spi2_miso;
    logic spi2_ss0;
    logic spi2_ss1;

    assign spi1_sclk    = o_flash_sclk;
    assign spi1_mosi    = o_flash_mosi;
    assign i_flash_miso = spi1_miso;
    assign spi1_ss0     = o_flash_cs_n[0];
    assign spi1_ss1     = o_flash_cs_n[1];

    assign spi2_sclk    = o_sclk;
    assign spi2_mosi    = o_mosi;
    assign i_miso       = spi2_miso;
    assign spi2_ss0     = o_cs_n[0];
    assign spi2_ss1     = o_cs_n[1];


    
    // ============================================
    //              To the Pad Circuit
    // ============================================    

    // ---------- Output ------------/

    assign o_gpio[0]  = io_sel[0] ?  spi2_mosi: o_gpio_[0];
    assign o_gpio[1]  =                         o_gpio_[1];
    assign o_gpio[2]  = io_sel[2] ?  spi2_sclk: o_gpio_[2];
    assign o_gpio[3]  = io_sel[3] ?  spi2_ss0:  o_gpio_[3];
    assign o_gpio[4]  = io_sel[4] ?  spi2_ss1:  o_gpio_[4];

    assign o_gpio[5]  = io_sel[5] ? pwm_pad_o:  o_gpio_[5];

    assign o_gpio[6]  = io_sel[6] ? o_uart2_tx: o_gpio_[6];
    assign o_gpio[7]  =                         o_gpio_[7];

    assign o_gpio[8]  = io_sel[8] ?  spi1_mosi: o_gpio_[8];
    assign o_gpio[9]  =                         o_gpio_[9];
    assign o_gpio[10] = io_sel[10] ? spi1_sclk: o_gpio_[10];
    assign o_gpio[11] = io_sel[11] ? spi1_ss0:  o_gpio_[11];
    assign o_gpio[12] = io_sel[12] ? spi1_ss1:  o_gpio_[12];

    assign o_gpio[13] = io_sel[13] ? o_scl:     o_gpio_[13];
    assign o_gpio[14] = io_sel[14] ? o_sda:     o_gpio_[14];

    assign o_gpio[31:15] = o_gpio_[31:15];



    // ---------- Output Enable  ------------/

    assign en_gpio[0]  = io_sel[0] ?  1'b0:  en_gpio_[0];
    assign en_gpio[1]  = io_sel[1] ?  1'b1:  en_gpio_[1];
    assign en_gpio[2]  = io_sel[2] ?  1'b0:  en_gpio_[2];
    assign en_gpio[3]  = io_sel[3] ?  1'b0:  en_gpio_[3];
    assign en_gpio[4]  = io_sel[4] ?  1'b0:  en_gpio_[4];

    assign en_gpio[5]  = io_sel[5] ? pwm_padoen_o:   en_gpio_[5];

    assign en_gpio[6]  = io_sel[6] ? 1'b0:   en_gpio_[6];
    assign en_gpio[7]  = io_sel[7] ? 1'b1:   en_gpio_[7];

    assign en_gpio[8]  = io_sel[8]  ? 1'b0:  en_gpio_[8];
    assign en_gpio[9]  = io_sel[9]  ? 1'b1:  en_gpio_[9];
    assign en_gpio[10] = io_sel[10] ? 1'b0:  en_gpio_[10];
    assign en_gpio[11] = io_sel[11] ? 1'b0:  en_gpio_[11];
    assign en_gpio[12] = io_sel[12] ? 1'b0:  en_gpio_[12];

    assign en_gpio[13] = io_sel[13] ? o_scl_oen: en_gpio_[13];
    assign en_gpio[14] = io_sel[14] ? o_sda_oen: en_gpio_[14];

    assign en_gpio[31:15] = en_gpio_[31:15];

    // ---------- Input ------------/
    assign i_gpio_    = i_gpio;
    assign spi2_miso  = i_gpio[1];
    assign spi1_miso  = i_gpio[9];
    assign i_uart2_rx = i_gpio[7];
    assign i_scl      = i_gpio[13];
    assign i_sda      = i_gpio[14];

endmodule  : io_mux
