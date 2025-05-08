typedef enum logic [6:0] {
  R_TYPE = 7'b0110011,
  I_TYPE = 7'b0010011,
  B_TYPE = 7'b1100011,
  JAL    = 7'b1101111,
  JALR   = 7'b1100111,
  LOAD   = 7'b0000011,
  STORE  = 7'b0100011,
  LUI    = 7'b0110111,
  AUIPC = 7'b0010111
} inst_type;

module decode_control (
    input logic [6:0] opcode,
    input logic reset_n,
    clk,
    input clear_invalid_counter,
    output logic reg_write,
    output logic mem_write,
    output logic [1:0] mem_csr_to_reg,
    output logic branch,
    output logic alu_src,
    output logic jump,
    output logic [1:0] alu_op,
    output logic lui,
    output logic auipc,
    output logic jal,
    output logic r_type,
    output logic csr_type,  // this gives signal that tells us that it is a CSR command or mret
    output logic invalid_inst

);
  logic [1:0] invalid_counter;
 always @(posedge clk or negedge reset_n) begin /// we split the reset | clear_invalid_counter
  if (!reset_n) 
  begin
    invalid_counter <= 2'b11;
  end 
  else if (clear_invalid_counter) 
  begin
    invalid_counter <= 2'b11;
  end 
  else 
  begin
    invalid_counter <= invalid_counter >> 1;
  end
end

  //  assign invalid_inst = ~|opcode[1:0];  // all valid instructions start with 2'b11
  parameter LOAD_STORE = 2'b00, R_TYPE = 2'b11, I_TYPE = 2'b01, B_TYPE = 2'b10;

  always @(opcode) begin
    case (opcode[6:0])
      7'b0110011: begin
        reg_write = 1;
        mem_write = 0;
        mem_csr_to_reg = 'b00;
        alu_op = R_TYPE;
        alu_src = 0;
        branch = 0;
        jump = 0;
        lui = 0;
        auipc = 0;
        jal = 0;
        r_type = 1;
        csr_type = 1'b0;
        invalid_inst = 1'b0;
      end  // R-type

      7'b0010011: begin
        reg_write = 1;
        mem_write = 0;
        mem_csr_to_reg = 'b00;
        alu_op = I_TYPE;
        alu_src = 1;
        branch = 0;
        jump = 0;
        lui = 0;
        auipc = 0;
        jal = 0;
        r_type = 0;
        csr_type = 1'b0;
        invalid_inst = 1'b0;
      end  // I-type

      7'b1100111: begin
        reg_write = 1;
        mem_write = 0;
        mem_csr_to_reg = 'b00;
        alu_op = LOAD_STORE;
        alu_src = 1;
        branch = 0;
        jump = 1;
        lui = 0;
        auipc = 0;
        jal = 0;
        r_type = 0;
        csr_type = 1'b0;
        invalid_inst = 1'b0;
      end  // I-type JALR

      7'b0000011: begin
        reg_write = 1;
        mem_write = 0;
        mem_csr_to_reg = 'b01;
        alu_op = LOAD_STORE;
        alu_src = 1;
        branch = 0;
        jump = 0;
        lui = 0;
        auipc = 0;
        jal = 0;
        r_type = 0;
        csr_type = 1'b0;
        invalid_inst = 1'b0;
      end  // Load

      7'b0100011: begin
        reg_write = 0;
        mem_write = 1;
        mem_csr_to_reg = 'b00;
        alu_op = LOAD_STORE;
        alu_src = 1;
        branch = 0;
        jump = 0;
        lui = 0;
        auipc = 0;
        jal = 0;
        r_type = 0;
        csr_type = 1'b0;
        invalid_inst = 1'b0;
      end  // Store

      7'b1100011: begin
        reg_write = 0;
        mem_write = 0;
        mem_csr_to_reg = 'b00;
        alu_op = B_TYPE;
        alu_src = 0;
        branch = 1;
        jump = 0;
        lui = 0;
        auipc = 0;
        jal = 0;
        r_type = 0;
        csr_type = 1'b0;
        invalid_inst = 1'b0;
      end  // B-type

      7'b1101111: begin
        reg_write = 1;
        mem_write = 0;
        mem_csr_to_reg = 'b00;
        alu_op = LOAD_STORE;
        alu_src = 1;
        branch = 0;
        jump = 1;
        lui = 0;
        auipc = 0;
        jal = 1;
        r_type = 0;
        csr_type = 1'b0;
        invalid_inst = 1'b0;
      end  // J-type

      7'b0110111: begin
        reg_write = 1;
        mem_write = 0;
        mem_csr_to_reg = 'b00;
        alu_op = LOAD_STORE;
        alu_src = 1;
        branch = 0;
        jump = 0;
        lui = 1;
        auipc = 0;
        jal = 0;
        r_type = 0;
        csr_type = 1'b0;
        invalid_inst = 1'b0;
      end  // LUI

      7'b0010111: begin
        reg_write = 1;
        mem_write = 0;
        mem_csr_to_reg = 'b00;
        alu_op = LOAD_STORE;
        alu_src = 1;
        branch = 0;
        jump = 0;
        lui = 0;
        auipc = 1;
        jal = 0;
        r_type = 0;
        csr_type = 1'b0;
        invalid_inst = 1'b0;
      end  // AUIPC

      7'b1110011: begin
        reg_write = 1'b1;
        mem_write = 'b0;
        mem_csr_to_reg = 'b10;
        alu_op = R_TYPE;
        alu_src = 'b0;
        branch = 'b0;
        jump = 'b0;
        lui = 'b0;
        auipc = 'b0;
        jal = 'b0;
        r_type = 'b0;
        csr_type = 1'b1;
        invalid_inst = 1'b0;
      end  // CSRR // TODO Xs to be replaced with correct signals
        
      default: begin
        reg_write = 0;
        mem_write = 0;
        mem_csr_to_reg = 'b00;
        alu_op = R_TYPE;
        alu_src = 0;
        branch = 0;
        jump = 0;
        lui = 0;
        auipc = 0;
        jal = 0;
        r_type = 0;
        csr_type = 1'b0;
        invalid_inst = ~(|invalid_counter);
      end  // NOP
    endcase
  end

  //      assign csr_type = (opcode == 7'b1110011);


  //      logic jump_or_upper_immediate;
  //      assign jump_or_upper_immediate = opcode[2];

  //      logic jalr;

  //      logic br_or_jump;
  //      assign br_or_jump = opcode[6];

  //      logic [3:0] decoder_o;
  //      n_bit_dec_with_en #(
  //              .n(2)
  //      ) type_decoder (
  //              .en(~jump_or_upper_immediate & ~br_or_jump),
  //              .in(opcode[5:4]),
  //              .out(decoder_o)
  //          );

  //      logic i_type, load, store, b_type, u_type;

  //      assign b_type = br_or_jump & ~jump;
  //      assign i_type =  decoder_o[1];
  //      assign r_type =  decoder_o[3]&(~csr_type);
  //      assign load   =  decoder_o[0];
  //      assign store =  decoder_o[2];
  //      assign u_type = jump_or_upper_immediate & opcode[4];


  //      assign jump     = jump_or_upper_immediate & ~opcode[4] &(~csr_type); 
  //      assign jal   = jump_or_upper_immediate & ~opcode[4] & opcode[3]; 
  //      assign lui   = u_type & opcode[5] &(~csr_type); 
  //      assign auipc = u_type & ~opcode[5] &(~csr_type);


  //      assign mem_write = store &(~csr_type);
  //      assign branch    = b_type &(~csr_type);
  //      assign alu_src   = ~(r_type | b_type)&(~csr_type);
  //      assign alu_op = opcode[5:4] & {2{~(store | jump_or_upper_immediate)}};
  //      assign mem_csr_to_reg[0] = load & ~invalid_inst;
  //      assign mem_csr_to_reg[1] = csr_type;

  //      assign reg_write = ~ (b_type | store) | csr_type;

endmodule : decode_control

