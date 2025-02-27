import riscv_types::*;
module store_aligner (
    input logic [31:0] wdata,
    input store_t store_type,  // 2-bit enum type
    input logic [1:0] addr,
    input logic mem_write,
    output logic [3:0] wsel,
    output logic [31:0] aligned_data
);

    logic [3:0] decoded_store_type;  // One-hot output of decoder
    logic store_byte, store_half, store_word;

    // Instantiate the decoder
    n_bit_dec #(
        .n(2)  // 2-bit input for 4 one-hot outputs
    ) store_type_decoder (
        .in(store_type),
        .out(decoded_store_type)
    );

    // Assign decoded signals
    assign store_byte = decoded_store_type[0];
    assign store_half = decoded_store_type[1];
    assign store_word = decoded_store_type[2];

    logic [4:0] shamt;  // Shift amount

    logic [4:0] shift_amount_for_byte;
    logic [4:0] shift_amount_for_half;

    assign shift_amount_for_byte = addr[1:0] <<3;
    assign shift_amount_for_half = addr[1] <<4;

    one_hot_mux2x1 #(
        .n(5)
    ) shamt_mux (
        .sel(decoded_store_type[1:0]), // when its store word, the output will be auto-zero
        .in0(shift_amount_for_byte),
        .in1(shift_amount_for_half),
        .out(shamt)
    );

    assign aligned_data = wdata << shamt;

    // Generating Write enables based on the type of store and also the address

    logic [3:0] store_byte_wsel;
    n_bit_dec #(
        .n(2)
    ) store_byte_wsel_decoder (
        .in(addr[1:0]),
        .out(store_byte_wsel)
    );

    logic [1:0] store_half_wsel_temp;
    n_bit_dec #(
        .n(1)
    ) store_half_wsel_decoder (
        .in(addr[1]),
        .out(store_half_wsel_temp)
    );

    logic [3:0] store_half_wsel;
    assign store_half_wsel[0] = store_half_wsel_temp[0];
    assign store_half_wsel[1] = store_half_wsel_temp[0];
    assign store_half_wsel[2] = store_half_wsel_temp[1];
    assign store_half_wsel[3] = store_half_wsel_temp[1];

    logic [3:0] wsel_temp;
    one_hot_mux3x1 #(
        .n(4)
    ) wsel_mux (
        .sel(decoded_store_type[2:0]),
        .in0(store_byte_wsel),
        .in1(store_half_wsel),
        .in2(4'b1111),
        .out(wsel_temp)
    );

    assign wsel = wsel_temp & {4{mem_write}};

endmodule




module load_aligner (
    input logic [1:0] addr,
    input logic [2:0] fun3,
    input logic [31:0] rdata,
    output logic [31:0] aligned_data
);

    logic [7:0] selected_byte;
    logic [15:0] selected_half;

    mux4x1 # (
        .n(8)
    ) byte_sel_mux (
        .in0(rdata[7:0]),
        .in1(rdata[15:8]),
        .in2(rdata[23:16]),
        .in3(rdata[31:24]),
        .out(selected_byte),
        .sel(addr[1:0])
    );

    // signed extension or zero extension based on fun3[2]
    logic [31:0] extended_byte;

    assign extended_byte[7:0] = selected_byte;
    mux2x1 #(
        .n(24)
    ) sign_extension_mux (
        .sel(fun3[2]),
        .in0({24{selected_byte[7]}}),
        .in1(24'd0),
        .out(extended_byte[31:8])   
    );

    mux2x1 #(
        .n(16)
    ) half_word_sel_mux_byte (
        .in0(rdata[15:0]),
        .in1(rdata[31:16]),
        .out(selected_half),
        .sel(addr[1])        
    );

    logic [31:0] extended_half_word;

    assign extended_half_word[15:0] = selected_half;
    mux2x1 #(
        .n(16)
    ) sign_extension_mux_half_word (
        .sel(fun3[2]),
        .in0({16{selected_half[15]}}),
        .in1(16'd0),
        .out(extended_half_word[31:16])   
    );

    mux4x1 #(
        .n(32)
    ) load_aligner_mux (
        .sel(fun3[1:0]),
        .in0(extended_byte),
        .in1(extended_half_word),
        .in2(rdata),
        .in3(),
        .out(aligned_data)
    ); 
endmodule : load_aligner