
module alu_control (
    input logic [2:0] fun3,
    input logic [6:0] fun7,
    input logic [2:0] alu_op,
    output alu_t alu_ctrl,
    output logic m_type, // this signal is used to indecate a M extension instruction MUL/DIV/REM along side their different falvours
    output logic  divide_instruction
);

// alu_op 000 for load/store
// alu_op 010 r-type
// alu_op 011 i-type 
// alu_op 001 for branches
// alu_op 100 for M-type

parameter LOAD_STORE = 3'b000, R_TYPE = 3'b011, I_TYPE = 3'b001, B_TYPE = 3'b010;

always_comb begin 

    alu_ctrl           = ADD;
    case(alu_op)
        R_TYPE: begin 
            if(fun7[0])begin
            m_type=1'b1;
                case (fun3)
                    3'b000: begin divide_instruction = 1'b1;alu_ctrl = MUL;end
                    3'b001: begin divide_instruction = 1'b1;alu_ctrl = MULH;end
                    3'b010: begin divide_instruction = 1'b1;alu_ctrl = MULHSU;end
                    3'b011: begin divide_instruction = 1'b1;alu_ctrl = MULHU;end
                    3'b100: begin divide_instruction = 1'b1;alu_ctrl = DIV;end
                    3'b101: begin divide_instruction = 1'b1;alu_ctrl = DIVU;end
                    3'b110: begin divide_instruction = 1'b1;alu_ctrl = REM;end
                    3'b111: begin divide_instruction = 1'b1;alu_ctrl = REMU;end
                endcase
            end else begin
                divide_instruction = 1'b0;
                m_type             = 1'b0;
                alu_ctrl = alu_t'({fun7[5], fun3});
            end
        end

        I_TYPE: begin 
            m_type             = 1'b0;
            divide_instruction = 1'b0;
            alu_ctrl[4] = 0;
            alu_ctrl[3] = (fun3 == 3'b101) ? fun7[5] : 1'b0;
            alu_ctrl[2:0] = fun3; 
        end

        LOAD_STORE: begin
            m_type             = 1'b0;
            divide_instruction = 1'b0;
            alu_ctrl = ADD; 
        end

        B_TYPE: begin 
            m_type             = 1'b0;
            divide_instruction = 1'b0;
            case(fun3[2:1])
                3'b000: alu_ctrl = SUB;
                3'b001: alu_ctrl = SUB;
                3'b010: alu_ctrl = SLT;
                3'b011: alu_ctrl = SLTU;
            endcase
        end
        default: begin
            m_type             = 1'b0;
            divide_instruction = 1'b0;
            alu_ctrl           = ADD;
        end
    endcase
end

endmodule : alu_control
