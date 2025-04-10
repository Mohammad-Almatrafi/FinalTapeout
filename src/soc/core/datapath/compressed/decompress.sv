module decompress (
    input  logic [15:0] inst_16,
    output logic [31:0] inst_32
);
  // localparam logic [2:0]add

  localparam logic [6:0] R_TYPE = 7'b0110011;
  localparam logic [6:0] I_TYPE = 7'b0010011;
  localparam logic [6:0] B_TYPE = 7'b1100011;
  localparam logic [6:0] JAL = 7'b1101111;
  localparam logic [6:0] JALR = 7'b1100111;
  localparam logic [6:0] LOAD = 7'b0000011;
  localparam logic [6:0] STORE = 7'b0100011;
  localparam logic [6:0] LUI = 7'b0110111;
  localparam logic [6:0] AUIPC = 7'b0010111;

  // placement of register adresses in the instructions
  logic [4:0] rd;
  logic [4:0] rd_d[0:1];
  logic [4:0] rs1;
  logic [4:0] rs1_d;
  logic [4:0] rs2;
  logic [4:0] rs2_d;

  // imm values in the instructions
  logic [11:0] sp4_imm;
  logic [11:0] sp16_imm;
  logic [11:0] s_l_imm;
  logic [11:0] comp_logical_imm;
  logic [20:0] j0_imm;
  logic [18:0] j_imm;
  logic [11:0] b_imm;
  logic [7:0] b1_imm;
  logic [4:0] b0_imm;

  logic [11:0] lwsp_imm;
  logic [11:0] swsp_imm;

  assign rd = inst_16[11:7];
  assign rd_d[0] = {2'b01, inst_16[4:2]};
  assign rd_d[1] = {2'b01, inst_16[9:7]};
  assign rs1 = inst_16[11:7];
  assign rs1_d = {2'b01, inst_16[9:7]};
  assign rs2 = inst_16[6:2];
  assign rs2_d = {2'b01, inst_16[4:2]};

  assign sp4_imm = {4'd0, inst_16[10:7], inst_16[12:11], inst_16[5], inst_16[6], 2'd0};
  assign sp16_imm = {
    {5{inst_16[12]}},
    inst_16[12],  // imm[9]
    inst_16[4:3],  //imm[8:7]
    inst_16[5],  //imm[6]
    inst_16[2],  //imm[5]
    inst_16[6],  //imm[4]
    4'd0
  };

  assign s_l_imm = {5'd0, inst_16[5], inst_16[12:10], inst_16[6], 2'd0};
  assign comp_logical_imm = {{7{inst_16[12]}}, inst_16[6:2]};

  assign j0_imm = {
    {12{inst_16[12]}},  // sext(imm[11])
    inst_16[12],  //imm [11]
    inst_16[8],  //imm[10]
    inst_16[10:9],  // imm[9:8]
    inst_16[6],  // imm[7]
    inst_16[7],  // imm[6]
    inst_16[2],  // imm[5]
    inst_16[11],  // imm[4]
    inst_16[5:3],  // imm[3:1]
    1'b0
  };

  assign j_imm = {j0_imm[20], j0_imm[10:1], j0_imm[11], j0_imm[19:12]};

  assign b_imm = {
    {4{inst_16[12]}},  // sext(imm[8])
    inst_16[12],  // imm[8]
    inst_16[6:5],  // imm[7:6]
    inst_16[2],  // imm[5]
    inst_16[11:10],  // imm[4:3]
    inst_16[4:3]  // imm[2:1]
  };

  assign b0_imm = {b_imm[4:1], b_imm[11]};
  assign b1_imm = {b_imm[12], b_imm[10:5]};

  assign swsp_imm = {
    'b0,  // uextend
    inst_16[8:7],  // uimm[7:6]
    inst_16[12:9],  // uimm[5:2]
    2'b00
  };

  assign lwsp_imm = {
    'b0,  // uextend
    inst_16[3:2],  // uimm[7:6]
    inst_16[12],  // uimm[5]
    inst_16[6:4],  // uimm[4:2]
    2'b00
  };

  always_comb begin : translator

    case ({
      inst_16[15:13], inst_16[1:0]
    })
      // c.addi4spn rd', uimm => addi rd', x2, nzuimm
      5'b00000: inst_32 = {sp4_imm, 5'd2, 3'd0, rd_d[0], I_TYPE};

      // c.lw rd', uimm(rs1') => lw rd', offset[6:2](rs1')
      5'b01000: inst_32 = {s_l_imm, rs1_d, 3'd2, rd_d[0], LOAD};

      //c.sw rs2', uimm(rs1') => sw rs2', offset[6:2](rs1')
      5'b11000: inst_32 = {s_l_imm[11:5], rs2_d, rs1_d, 3'd2, s_l_imm[4:0], STORE};

      // c.addi => addi rd, rd, nzimm[5:0]
      // c.nop => addi x0,x0,0
      5'b00001: inst_32 = {comp_logical_imm, rd, 3'd0, rd, I_TYPE};

      // c.jal offset => jal x1, offset[11:1]
      5'b00101: inst_32 = {j_imm, 5'd1, JAL};

      // c.li rd, imm => addi rd, x0, imm[5:0]
      5'b01001: inst_32 = {comp_logical_imm, 5'd0, 3'd0, rd, I_TYPE};

      5'b01101:
      if (inst_16[11:7] == 5'd2) begin

        // c.addi16sp imm => addi x2, x2, nzimm[9:4]
        inst_32 = {sp16_imm, 5'd2, 3'd0, 5'd2, I_TYPE};
      end else begin

        // c.lui imm => lui rd, nzuimm[17:12]
        inst_32 = {{15{inst_16[12]}}, inst_16[6:2], rd, LUI};
      end

      5'b10001: begin
        //////////////////////////////////////////////////////////////////////////////////////
        case (inst_16[11:10])
          2'b00: begin
            // c.srli rd', uimm => srli rd', rd', shamt[5:0]
            inst_32 = {6'b0, inst_16[12], inst_16[6:2], rd_d[1], 3'd5, rd_d[1], I_TYPE};
          end
          2'b01: begin
            // c.srai rd', uimm => srai rd', rd', shamt[5:0]
            inst_32 = {6'b010000, inst_16[12], inst_16[6:2], rd_d[1], 3'd5, rd_d[1], I_TYPE};
          end
          2'b10: begin
            // c.andi rd', imm => andi rd', rd', imm
            inst_32 = {comp_logical_imm, rd_d[1], 3'd7, rd_d[1], I_TYPE};
          end
          2'b11: begin
            case (inst_16[6:5])
              //c.sub rd', rs2' => sub rd', rd', rs2'
              2'b00: inst_32 = {5'b01000, 2'b00, rs2_d, rd_d[1], 3'b000, rd_d[1], R_TYPE};

              //c.xor rd', rs2' => xor rd', rd', rs2'
              2'b01: inst_32 = {5'b00000, 2'b00, rs2_d, rd_d[1], 3'b100, rd_d[1], R_TYPE};

              //c.or rd', rs2' => or rd', rd', rs2'
              2'b10: inst_32 = {5'b00000, 2'b00, rs2_d, rd_d[1], 3'b110, rd_d[1], R_TYPE};

              //c.sub rd', rs2' => sub rd', rd', rs2'
              2'b11:   inst_32 = {5'b00000, 2'b00, rs2_d, rd_d[1], 3'b111, rd_d[1], R_TYPE};
              default: inst_32 = 0;
            endcase
          end

          default: inst_32 = 0;
        endcase

      end

      // c.j offset => jal x0, offset[11:1]
      5'b10101: inst_32 = {j_imm, 5'd0, JAL};


      // c.beqz rs1', offset => beq rs1', x0, offset[8:1]
      5'b11001: inst_32 = {b1_imm, 5'd0, rs1_d, 3'd0, b0_imm, B_TYPE};

      // c.bnez rs1', offset => bne rs1', x0, offset[8:1]
      5'b11101: inst_32 = {b1_imm, 5'd0, rs1_d, 3'd1, b0_imm, B_TYPE};

      // c.slli rd, uimm => slli rd, rd, shamt[5:0]
      5'b00010: inst_32 = {6'b0, inst_16[12], inst_16[6:2], rd, 3'd1, rd, I_TYPE};

      // c.lwsp rd, uimm(x2) => lw rd, offset[7:2](x2)
      5'b01010: inst_32 = {lwsp_imm, 5'd2, 3'd2, rd, LOAD};

      5'b10010: begin
        if (inst_16[12] == 1'b0) begin
          if (rs2 == 5'b0) begin
            // c.jr rs1 => jalr x0,rs1,0
            inst_32 = {12'b0, rs1, 3'b0, 5'b0, JALR};
          end else begin
            // c.mv rd, rs2 => add rd,x0,rs2
            inst_32 = {7'b0, rs2, 5'b0, 3'b0, rd, R_TYPE};
          end
        end else begin
          if (rs2 == 5'b0) begin
            // c.jalr rs1 => jalr x1,rs1,0
            inst_32 = {12'b0, rs1, 3'b0, 5'd1, JALR};
          end else begin
            // c.add rd, rs2 => add rd,rd,rs2
            inst_32 = {5'b00000, 2'b00, rs2, rd, 3'b000, rd, R_TYPE};
          end
        end
      end

      //c.swsp rs2, uimm(x2) => sw rs2, offset[7:2](x2)
      5'b11010: inst_32 = {swsp_imm[11:5], rs2, 5'd2, 3'd2, swsp_imm[4:0], STORE};
      default:  ;
    endcase
  end
endmodule
