module TS1DA32KX32_tb;

  // Parameters for the module
  parameter numAddr   =  15;
  parameter numOut    =  32;
  parameter wordDepth =  32768;
  parameter numByte   =  4;

  // Testbench signals
  reg CLK = 0;
  reg CEB;
  reg OEB;
  reg GWEB;
  reg BWEB;
  reg [numByte-1:0] BWB;
  reg [numAddr-1:0] A;
  reg [numOut-1:0] DIN;
  wire [numOut-1:0] DOUT;

  logic [31:0] rdata;

  logic debug = 1;

  // Instantiate the TS1DA32KX32 module (data memory)
  TS1DA32KX32 #(
      .numAddr(numAddr),
      .numOut(numOut),
      .wordDepth(wordDepth),
      .numByte(numByte)
  ) DUT (
      .CLK(CLK),
      .A(A),
      .CEB(CEB),
      .OEB(OEB),
      .GWEB(GWEB),
      .BWEB(BWEB),
      .BWB(BWB),
      .DIN(DIN),
      .DOUT(DOUT)
  );

  // Clock generation
  always begin
    #5 CLK = ~CLK;  // Toggle clock every 5 time units
  end

  // Stimulus generation
  initial begin
    // # enable the chip
    CEB = 0;
    OEB  = 0;
    // Test writing and reading operations
    #10;
    mem_write(0, 4'b1110,32'hEF);    // Write byte at address 0 with data 0xA5
    mem_write(0, 4'b1101,32'hEF00);    // Write byte at address 0 with data 0xA5
    mem_write(0, 4'b1011,32'hCD0000);    // Write byte at address 0 with data 0xA5
    mem_write(0, 4'b0111,32'hAB000000);    // Write byte at address 0 with data 0xA5

    // Now read back the values from the first few addresses
    mem_read(0, rdata);  // Read word at address 2

    // Finish the simulation
    #20;

    for(int i= 0; i<10; i = i+1) begin 
        $display("imme[%d] = %h", i, DUT.memory[i]);
    end
    $finish;
  end

  // Write a byte (8 bits) to a given address
  task mem_write(input [numAddr-1:0] addr, logic [3:0] byte_sel,  input [31:0] data);
    begin
      @(posedge CLK);
      A = addr;
      DIN = data;
      GWEB = 1;  // Global write enable
      BWEB = 0;  // Byte write enable
      BWB = byte_sel; // Only write the first byte
    @(posedge CLK);
      BWEB = 1;  // Byte write enable
    end
  endtask

  // Read a word (32 bits) from a given address
  task mem_read(input [numAddr-1:0] addr, output logic [31:0] rdata);
    begin
      @(posedge CLK);
      A = addr;
      GWEB = 1; // read mode
      BWEB = 1; // read mode
      BWB = 4'b0000; 
    @(posedge CLK);
    rdata = DOUT;
    if(debug) $display("READ add %d: %h", A, DOUT); // Display the data
    end
  endtask

  // // Monitor the signals (optional, useful for debugging)
  // initial begin
  //   $monitor("Time = %0t, CLK = %b, A = %b, CEB = %b, OEB = %b, GWEB = %b, BWB = %b, DIN = %h, DOUT = %h",
  //            $time, CLK, A, CEB, OEB, GWEB, BWB, DIN, DOUT);
  // end

  // VCD Dump
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, TS1DA32KX32_tb);
  end

endmodule
