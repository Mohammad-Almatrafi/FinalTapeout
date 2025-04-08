module int_control (// This block gives whether we have interrupt or not, pc_addr to jump to, and decodes mip for inputting it to mcause
    input logic [31:0] mtvec,
    input logic MIE,
    input logic [31:0]mie,
    input logic [31:0]mip,
    input logic [31:0]mip_in,

    input logic [31:0]mcause,
    input logic invalid_inst, store_misaligned, load_misaligned, inst_addr_misaligned,
    output logic interrupt,
    output logic exception,
    output logic [31:0] pc_addr,
    output logic [4:0] int_code
);
  assign interrupt = (|(mip & mie)) & MIE;
  assign exception = invalid_inst| store_misaligned| load_misaligned| inst_addr_misaligned;
  assign pc_addr   = mtvec[0] ?  {mtvec[31:2] + {mcause[28:0], 1'b0}, 2'b0}: {mtvec[31:2], 2'b0};
  
  always @(mip_in)begin
        if(mip_in[0]==1)int_code=5'b000;
        else if(mip_in[1]==1) int_code=5'b001;
        else if(mip_in[2]==1) int_code=5'b010;
        else if(mip_in[3]==1) int_code=5'b011;
        else if(mip_in[4]==1) int_code=5'b100;
        else if(mip_in[5]==1) int_code=5'b101;
        else if(mip_in[6]==1) int_code=5'b110;
        else if(mip_in[7]==1) int_code=5'b111;
        else int_code = 3'b0;
  end
  
  always @(invalid_inst, store_misaligned, load_misaligned, inst_addr_misaligned) begin 
        if (invalid_inst == 1)              int_code = 5'd2;
        else if (store_misaligned == 1)     int_code = 5'd6;
        else if (load_misaligned == 1)      int_code = 5'd4;
        else if (inst_addr_misaligned == 1) int_code = 5'd0;
  end
endmodule
