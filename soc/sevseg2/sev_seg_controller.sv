
module sev_seg_controller #(
    parameter display_speed = 20
)(
    input logic clk,
    input logic resetn,
    input logic [3:0] digits [0:7],      // 4-bit binary input logic)
    output logic  [6:0] Seg,       // 7-bit output for segments a-g
    output logic  [7:0] AN
);

    logic [display_speed - 1:0] count;

    //  Seven Segment decoder to generate sev signals from 4
    seven_seg_decoder ssd(
        .bin(digits[count[display_speed - 1:display_speed - 3]]),
        .seg(Seg)
    );

    // Decoder to POWER one segment at a time
    wire [7:0] decoder_out;
    decoder #(
        .n(3)
    ) decoder_inst (
        .in(count[display_speed - 1:display_speed - 3]),
        .out(decoder_out)
    );
    assign AN = ~decoder_out;

    // Counter to slow down to the tranfer of digits to there segment
    counter_n_bit #(
        .n(display_speed)
    ) counter (
        .clk(clk),
        .resetn(resetn),
        .load(1'b0),
        .en(1'b1),
        .load_data(),
        .count(count)
    );

endmodule