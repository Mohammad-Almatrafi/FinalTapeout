module io_mux #(
    NO_OF_SHARED_PINS = 13
)(
    // io mux control signal 
    input logic [11 + NO_OF_SHARED_PINS - 1: 11] io_sel,

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


    // signlas from the gpio module 
    output  logic [23:0] i_gpio_, 
    input  logic  [23:0] o_gpio_,
    input logic  [23:0]  en_gpio_,

    // gpio signals from and to the pad circuit
    input  logic [23:0] i_gpio, 
    output logic [23:0] o_gpio,
    output logic [23:0] en_gpio
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
    assign o_gpio[10:0] = o_gpio_[10:0];

    assign o_gpio[11] = io_sel[11] ? spi2_ss1:  o_gpio_[11];
    assign o_gpio[12] = io_sel[12] ? spi2_ss0:  o_gpio_[12];
    assign o_gpio[13] = io_sel[13] ? spi2_sclk: o_gpio_[13];
    assign o_gpio[14] =                         o_gpio_[14];
    assign o_gpio[15] = io_sel[15] ? spi2_mosi: o_gpio_[15];

    assign o_gpio[16] = io_sel[16] ? o_scl:     o_gpio_[16];
    assign o_gpio[17] = io_sel[17] ? o_sda:     o_gpio_[17];
    assign o_gpio[18] = io_sel[18] ? pwm_pad_o: o_gpio_[18];
    assign o_gpio[19] = io_sel[19] ? spi1_ss1:  o_gpio_[19];
    assign o_gpio[20] = io_sel[20] ? spi1_ss0:  o_gpio_[20];
    assign o_gpio[21] = io_sel[21] ? spi1_sclk: o_gpio_[21];
    assign o_gpio[22] =                         o_gpio_[22];
    assign o_gpio[23] = io_sel[23] ? spi1_mosi: o_gpio_[23];

    // ---------- Output Enable  ------------/
    assign en_gpio[11] = io_sel[11] ? 1'b0:  en_gpio_[11];
    assign en_gpio[12] = io_sel[12] ? 1'b0:  en_gpio_[12];
    assign en_gpio[13] = io_sel[13] ? 1'b0:  en_gpio_[13];
    assign en_gpio[14] = io_sel[14] ? 1'b1:  en_gpio_[14];
    assign en_gpio[15] = io_sel[15] ? 1'b0:  en_gpio_[15];

    assign en_gpio[16] = io_sel[16] ? o_scl_oen:  en_gpio_[16];
    assign en_gpio[17] = io_sel[17] ? o_sda_oen:  en_gpio_[17];
    assign en_gpio[18] = io_sel[18] ? 1'b0:  en_gpio_[18];
    assign en_gpio[19] = io_sel[19] ? 1'b0:  en_gpio_[19];
    assign en_gpio[20] = io_sel[20] ? 1'b0:  en_gpio_[20];
    assign en_gpio[21] = io_sel[21] ? 1'b0:  en_gpio_[21];
    assign en_gpio[22] = io_sel[22] ? 1'b1:  en_gpio_[22];
    assign en_gpio[23] = io_sel[23] ? 1'b0:  en_gpio_[23];

    // ---------- Input ------------/
    assign i_gpio_ = i_gpio;
    assign spi2_miso = i_gpio[14];
    assign i_scl = i_gpio[16];
    assign i_sda = i_gpio[17];
    assign spi1_miso = i_gpio[22];

endmodule  : io_mux
