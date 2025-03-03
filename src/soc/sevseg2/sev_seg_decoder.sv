module seven_seg_decoder(
    input  wire [3:0] bin,      // 4-bit binary input (0–F)
    output reg  [6:0] seg       // 7-bit output for segments a-g
);
logic A,B,C,D;
assign D = bin[0];
assign C = bin[1];
assign B = bin[2];
assign A = bin[3];

// Add your code here -----------------------------------
assign seg[0] = (~A)&(~B)&(~C)&D|(~A)&B&(~C)&(~D)|A&B&(~C)&D|A&(~B)&C&D;
assign seg[1] = (~A)&B&(~C)&D|A&B&(~D)|A&B&C|A&C&D|B&C&(~D);
assign seg[2] = A&B&C|A&B&(~D)|(~A)&(~B)&C&(~D);
assign seg[3] = (~A)&(~B)&(~C)&D|(~A)&B&(~C)&(~D)|B&C&D|A&(~B)&C&(~D);
assign seg[4] = (~B)&(~C)&D|(~A)&B&(~C)|(~A)&D;
assign seg[5] = (~A)&(~B)&D|(~A)&(~B)&C|(~A)&C&D|A&B&(~C)&D;
assign seg[6] = (~A)&(~B)&(~C)|(~A)&B&C&D|A&B&(~C)&(~D);



// Add your code here -----------------------------------

endmodule
