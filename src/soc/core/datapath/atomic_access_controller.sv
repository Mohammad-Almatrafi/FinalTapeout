/*
 * Atomic Access Controller for RISC-V AMO/LR/SC Instructions
 *
 * Developed entirely by Qamar Moavia using ChatGPT (OpenAI GPT-4).
 * This code implements atomic memory operation handling (AMOs and LR/SC)
 * for single-core RISC-V pipelines with memory-mapped interfaces such as Wishbone.
 */

module atomic_access_controller (
    input         clk,
    input         rst,

    // Inputs from MEM stage
    input         is_atomic_mem,          // Is this an atomic instruction?
    input  [4:0]  amo_funct5_mem,         // AMO funct5 field (from funct7[6:2])
    input  [31:0] rs2_val_mem,            // rs2 value (for SC and AMOs)
    input         mem_read_req,           // read enable from MEM stage
    input         mem_write_req,          // write enable from MEM stage
    input  [31:0] mem_addr_req,           // address from MEM stage
    input  [31:0] mem_wdata_req,          // write data from MEM stage

    // Interface to memory bus or Wishbone controller
    output reg         mem_read,
    output reg         mem_write,
    output reg [31:0]  mem_addr,
    output reg [31:0]  mem_wdata,
    input      [31:0]  mem_rdata,
    input              mem_ack,

    // Output to pipeline
    output reg         stall_mem,
    output reg [31:0]  result_rd,         // Data to write back to rd
    output reg         valid_rd,           // High when result_rd is valid


    // Memory Access exceptions 
    output logic load_addr_malign,
    output logic store_amo_addr_malign
);

    // Not generating address mislaigned exceptions yet 
    assign load_addr_malign = 1'b0;
    assign store_amo_addr_malign = 1'b0;

    // AMO Operation Encoding
    localparam AMO_LR   = 5'b00010;
    localparam AMO_SC   = 5'b00011;
    localparam AMO_SWAP = 5'b00001;
    localparam AMO_ADD  = 5'b00000;
    localparam AMO_XOR  = 5'b00100;
    localparam AMO_AND  = 5'b01100;
    localparam AMO_OR   = 5'b01000;
    localparam AMO_MIN  = 5'b10000;
    localparam AMO_MAX  = 5'b10100;
    localparam AMO_MINU = 5'b11000;
    localparam AMO_MAXU = 5'b11100;

    typedef enum logic [2:0] {
        IDLE,
        READ,
        EXECUTE,
        WRITE,
        LR_WAIT,
        SC_WRITE
    } state_t;

    state_t state, next_state;

    reg [31:0] read_val;
    reg [31:0] computed_val, computed_val_ff;
    reg        reservation_valid;
    reg [31:0] reservation_addr;

    // FSM state transition and data register updates
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            reservation_valid <= 1'b0;
            read_val <= 32'b0;
        end else begin
            state <= next_state;

            if (state == LR_WAIT && mem_ack) begin
                read_val <= mem_rdata;
                reservation_valid <= 1'b1;
                reservation_addr <= mem_addr_req;
            end else if (state == READ && mem_ack) begin
                read_val <= mem_rdata;
            end else if (state == SC_WRITE && mem_ack) begin
                reservation_valid <= 1'b0; // Always drop reservation after SC
            end
        end
    end

    // Combinational logic (The output logic and the next state logic both are in one always block which is not recommended)
    always_comb begin
        next_state = state;
        stall_mem  = 1'b0;
        mem_read   = mem_read_req;
        mem_write  = mem_write_req;
        mem_addr   = mem_addr_req;
        mem_wdata  = mem_wdata_req;
        result_rd  = mem_rdata;
        valid_rd   = mem_read_req;
        computed_val = 'd0;

        case (state)
            IDLE: begin
                if (is_atomic_mem) begin
                    case (amo_funct5_mem)
                        AMO_LR: next_state = LR_WAIT;
                        AMO_SC: next_state = SC_WRITE;
                        default: next_state = READ;
                    endcase
                    stall_mem = 1'b1;
                end
            end

            LR_WAIT: begin
                mem_read = 1'b1;
                stall_mem = 1'b1;
                if (mem_ack) begin
                    result_rd = mem_rdata;
                    valid_rd = 1'b1;
                    next_state = IDLE;
                    stall_mem = 1'b0;
                end
            end

            SC_WRITE: begin
                stall_mem = 1'b1;
                if (reservation_valid && reservation_addr == mem_addr_req) begin
                    mem_write = 1'b1;
                    mem_wdata = rs2_val_mem;
                    if (mem_ack) begin
                        result_rd = 32'b0; // success = rd = 0
                        valid_rd = 1'b1;
                        stall_mem = 1'b0;
                        next_state = IDLE;
                    end
                end else begin
                    result_rd = 32'b1; // failure = rd = non-zero
                    valid_rd = 1'b1;
                    next_state = IDLE;
                    stall_mem = 1'b0;
                end
            end

            READ: begin
                mem_read = 1'b1;
                stall_mem = 1'b1;
                if (mem_ack) begin
                    next_state = EXECUTE;
                end
            end

            EXECUTE: begin
                stall_mem = 1'b1;
                case (amo_funct5_mem)
                    AMO_ADD:  computed_val = read_val + rs2_val_mem;
                    AMO_XOR:  computed_val = read_val ^ rs2_val_mem;
                    AMO_OR:   computed_val = read_val | rs2_val_mem;
                    AMO_AND:  computed_val = read_val & rs2_val_mem;
                    AMO_MIN:  computed_val = ($signed(read_val) < $signed(rs2_val_mem)) ? read_val : rs2_val_mem;
                    AMO_MAX:  computed_val = ($signed(read_val) > $signed(rs2_val_mem)) ? read_val : rs2_val_mem;
                    AMO_MINU: computed_val = (read_val < rs2_val_mem) ? read_val : rs2_val_mem;
                    AMO_MAXU: computed_val = (read_val > rs2_val_mem) ? read_val : rs2_val_mem;
                    AMO_SWAP: computed_val = rs2_val_mem;
                    default:  computed_val = read_val;
                endcase
                next_state = WRITE;
            end

            WRITE: begin
                mem_write = 1'b1;
                mem_wdata = computed_val_ff;
                stall_mem = 1'b1;
                if (mem_ack) begin
                    result_rd = read_val; // original value loaded
                    valid_rd  = 1'b1;
                    next_state = IDLE;
                    stall_mem = 1'b0;
                end
            end
        endcase
    end

    always_ff @(posedge clk) if(state == EXECUTE) computed_val_ff <= computed_val;

endmodule
