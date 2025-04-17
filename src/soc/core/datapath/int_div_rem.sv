///////////////////////////// Nehal's Code - Apr 6 ////////////////////////////////////////
`timescale 1ns / 1ps
import riscv_types::*;

module int_div_rem #(
    parameter WIDTH=32  // width of numbers in bits (integer only)
    ) (
    input wire clk,    // clock
    input wire rst,    // reset
    input wire i_p_signal,  // start calculation NAME IT i_p_signal used to be start
    input alu_t   alu_ctrl,

    output     logic stall,   // calculation in progress  NAME IT STALL USED TO BE  BUSY
    
    output     logic dbz,    // divide by zero
    output     logic ovf,    // overflow
    input reg [WIDTH-1:0] a,   // dividend (numerator)
    input reg [WIDTH-1:0] b,   // divisor (denominator)
    output     logic [WIDTH-1:0] result,  // result value (quotient or remainder based on func3)
    input logic en,
    input logic clear
    );
    
    // func3 operation codes
//    localparam DIV  = 3'b100;  // signed division
//    localparam DIVU = 3'b101;  // unsigned division
//    localparam REM  = 3'b110;  // signed remainder
//    localparam REMU = 3'b111;  // unsigned remainder

    // Use full width for all operations to avoid losing bits
    
    localparam SMALLEST = {1'b1, {WIDTH-1{1'b0}}};  // smallest negative number -2147483648 (-2^31)
    localparam ITER = WIDTH;                        // Use full width iterations
    
    // Internal signals
    logic [$clog2(ITER):0] i;           // iteration counter
    logic is_signed;                     // operation is signed (DIV or REM)
    logic is_remainder;                  // operation is remainder (REM or REMU)
    logic a_signed, b_signed;            // sign flags for operands
    logic [WIDTH-1:0] temp_a, temp_b, temp_a_ff, temp_b_ff;
    logic [WIDTH-1:0] a_abs, b_abs;      // absolute values of operands (full width)
    logic [WIDTH-1:0] quotient, quotient_next;  // quotient accumulator (full width)
    logic [WIDTH:0] acc, acc_next;       // division accumulator (one bit wider)
//    logic [2*WIDTH-1:0] acc, acc_next;       // division accumulator (one bit wider)
    logic temp_is_signed, temp_is_remainder;
    
//    logic [4:0] rd_div_unit_use_ff;
    // Determine operation type from func3
    assign temp_is_signed = (alu_ctrl == DIV || alu_ctrl == REM);
    assign temp_is_remainder = (alu_ctrl == REM || alu_ctrl == REMU);
    assign temp_a = a;
    assign temp_b = b;
//    assign temp_rd_div_unit_use = rd_div_unit_use;

    // Division algorithm iteration
    always_comb begin
    // Get absolute values for operands (full width)
        a_abs = a_signed ? -temp_a_ff : temp_a_ff;
        b_abs = b_signed ? -temp_b_ff : temp_b_ff;
        if (acc >= {1'b0, b_abs}) begin
            acc_next = acc - {1'b0, b_abs};
            {acc_next, quotient_next} = {acc_next[WIDTH-1:0], quotient, 1'b1};
        end else begin
            {acc_next, quotient_next} = {acc, quotient} << 1;
        end
    end 
//    // Division algorithm iteration
//    always_comb begin
//    // Get absolute values for operands (full width)
//        a_abs = a_signed ? -temp_a_ff : temp_a_ff;
//        b_abs = b_signed ? -temp_b_ff : temp_b_ff;
////        acc = {acc[2*WIDTH-2:0], 1'b0};  // Shift left
//if (acc[2*WIDTH-1 -: WIDTH+1] >= {1'b0, b_abs}) begin
//    acc[2*WIDTH-1 -: WIDTH+1] -= {1'b0, b_abs};
//    quotient = (quotient << 1) | 1;
//end else begin
//    quotient = (quotient << 1);
//end
    
    // Calculation state machine
    enum {IDLE, INIT, CALC, FINALIZE} state;
    
    always_ff @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            stall <= 0;
            dbz <= 0;
            ovf <= 0;
            result <= 0;
        end else if (clear) begin
                state <= IDLE;
                stall <= 0;
                dbz <= 0;
                ovf <= 0;
                result <= 0;
        end else 
        if (en) begin
            case (state)
                INIT: begin
//                    temp_i_pipeline_control<=i_pipeline_control;          // Abdulshakoor: i move it into IDLE state to receive the corect values
                    state <= CALC;
                    stall<=1;
                    i <= 0;
                    ovf <= 0;
                    dbz <= 0;
                    // Initialize calculation registers with full width
                    {acc, quotient} <= {{WIDTH{1'b0}}, a_abs, 1'b0};
//                    {acc, quotient} <= {{2*WIDTH{1'b0}}, a_abs, 1'b0};
//                    {acc, quotient} <= {{WIDTH{1'b0}}, a_abs};
                    // rd that Div_unit uses during calcuation
//                    temp_rd_div_unit_use <= temp_i_pipeline_control.rd;
                end // End "INIT" case
                
                CALC: begin
                    if (i == ITER-1) begin  // do this in last cycle of "CALC" state
                        state <= FINALIZE;
                        stall<=1;
                    end else begin      // do this in "CALC" state
                        i <= i + 1;
                        acc <= acc_next;
                        quotient <= quotient_next;
                        stall<=1;
                    end
                end // End "CALC" case
                
                FINALIZE: begin
                    state <= IDLE;
                    stall <= 0;
//                    dbz <= 0;//TODO make sure these are not important here
//                    ovf <= 0;
                    
                    // rd that Div_unit uses during calcuation
//                    temp_rd_div_unit_use <= o_pipeline_control.rd;
                    
                   // o_pipeline_control<= i_pipeline_control;
                   // o_p_signal<=i_p_signal;
                   // OLD LOGIC - WRONG RESULTS
//                    if (is_remainder) begin 
//                        // Return remainder
//                        // Remainder takes sign of dividend (a) for signed operations
//                        if (is_signed && a_signed) begin
//                            result <= -acc[WIDTH-1:0];
//                        end else begin
//                            result <= acc[WIDTH-1:0];
//                        end
                    if (is_remainder) begin 
                        // Return remainder
                        if (temp_a_ff == temp_b_ff) begin // X%X = 0 
                            result <= 'b0; // Hard coded for now
//                            result <= acc_next[WIDTH:2]; // Hard coded for now
                        // Remainder takes sign of dividend (a) for signed operations
                        end else if (is_signed && a_signed) begin
                            result <= -acc[WIDTH:2]; // CORRECT REMAINDER WITHOUT EXTRA SHIFT BITS
                        end else begin
                            result <= acc_next[WIDTH:1]; 
                        end
                    end else begin
                        // Return quotient
                        // For signed operations, quotient is negative if signs differ
                        if (is_signed && (a_signed ^ b_signed)) begin
                            result <= -quotient_next;
                        end else begin
                            result <= quotient_next;
                        end
                    end
                end // End "FINALIZE" case
                default: begin  // IDLE
                    if (i_p_signal) begin
                        // Handle special cases
                        if (temp_b == 0) begin
                            // Divide by zero
//                            state <= IDLE;
                            state <= FINALIZE;
//                            stall <= 1; // TO AVOID ACTIVATING i_p_signal FOR MORE THAN ONE CYCLE
                            stall <= 0;
                            dbz <= 1;
                            result <= 'b0; // Default value
//                        end else if (is_signed && temp_a_ff == SMALLEST && temp_b_ff == {WIDTH{1'b1}}) begin 
                        end else if (is_signed && temp_a == SMALLEST && temp_b == {WIDTH{1'b1}}) begin 
                            // Special case: INT_MIN / -1 (overflow)
//                            state <= IDLE;
                            state <= FINALIZE;
                            stall <= 0;
                            ovf <= 1;
                            result <= 'b0; // Default value
                        end else begin                 
                            dbz <= 0;
                            ovf <= 0;
                            // rd that Div_unit uses during calcuation
//                            temp_rd_div_unit_use <= i_pipeline_control.rd;
                            
                            stall <= 1;
                            is_signed <= temp_is_signed;
                            is_remainder <= temp_is_remainder;
                            // Determine input signs (only relevant for signed operations)
                            a_signed <= temp_is_signed && temp_a[WIDTH-1];
                            b_signed <= temp_is_signed && temp_b[WIDTH-1];
                            
                            temp_a_ff <= temp_a;
                            temp_b_ff <= temp_b;
//                            rd_div_unit_use_ff <= rd_div_unit_use;
                            state <= INIT;
                        end  
                    end
                end // End "IDLE" case
            endcase
        end
    end
endmodule
