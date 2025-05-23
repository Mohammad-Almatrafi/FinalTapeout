import plic_pkg::*;

module plic_gateway #(
  parameter int ID = 0
)(
  input  logic                             clk,
  input  logic                             rst_n,
  input  logic                             int_in,
  input  logic [plic_pkg::SOURCE_ID_WIDTH-1:0] complete_id,
  output logic                             pending_to_plic
);

  // State encoding for gateway FSM
  typedef enum logic [1:0] {
    IDLE,        
    REQUEST,       
    WAIT_COMPLETE  
  } state_e;

  state_e state, next_state;

  logic sync_int_1, sync_int_2;
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      sync_int_1 <= 1'b0;
      sync_int_2 <= 1'b0;
    end else begin
      sync_int_1 <= int_in;
      sync_int_2 <= sync_int_1;
    end
  end

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      state <= IDLE;
    else
      state <= next_state;
  end


  always_comb begin
    pending_to_plic = 1'b0;
    next_state      = state;

    case (state)
      IDLE: begin
        if (sync_int_2)
          next_state = REQUEST;
      end
      REQUEST: begin
        pending_to_plic = 1'b1;  
        next_state      = WAIT_COMPLETE;
      end
      WAIT_COMPLETE: begin
        if (complete_id == ID) begin

          next_state = sync_int_2 ? REQUEST : IDLE;
        end
      end
      default: next_state = IDLE;
    endcase
  end
endmodule
