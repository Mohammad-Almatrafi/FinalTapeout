//module bidirec (
//    input wire oe,          // Output Enable (1: output, 0: input)
//    input wire inp,         // Input to the GPIO pin
//    output wire outp,       // Output from the GPIO pin
//    inout wire bidir        // Bidirectional GPIO pin
//);

//    assign bidir = oe ? inp : 1'bz; // Drive `inp` to bidir when `oe` is 1, otherwise high-Z
//    assign outp = bidir;           // Read the state of the `bidir` pin

//endmodule

 module bidirec (input wire oe, input wire inp, output wire outp, inout wire bidir);

    assign bidir = oe ? inp : 1'bZ ;
    assign outp  = bidir;

 endmodule