

//----------------------------------------------------------------------------- 
// File: plic_core.sv
//-----------------------------------------------------------------------------
module plic_core #(
  parameter int NUM_SOURCES_P  = plic_pkg::NUM_SOURCES,
  parameter int NUM_CONTEXTS_P = plic_pkg::NUM_CONTEXTS
)(
  input  logic                          clk,
  input  logic                          rst_n,

  // Wishbone-lite slave interface
  input  logic [23:0]                   wb_addr_i,
  input  logic [31:0]                   wb_wdata_i,
  input  logic                          wb_write_i,
  input  logic                          wb_read_i,
  input logic  [3:0]                    wb_sel_i,
  output logic [31:0]                   wb_rdata_o,

  // Pending bits from gateways
  input  logic [NUM_SOURCES_P:1]        gateway_pending,

  // Completion ID back to gateways
  output logic [plic_pkg::SOURCE_ID_WIDTH-1:0] complete_id_o,

  // Interrupt Requet to the Core
  output logic [NUM_CONTEXTS_P-1:0]     irq_o
);
  import plic_pkg::*;


  logic [PRIORITY_WIDTH-1:0]  max_priority;
  logic [SOURCE_ID_WIDTH-1:0] max_id;


    logic [SOURCE_ID_WIDTH-1:0] claim_id, complete_id;
    logic claim_sig;
    logic complete_sig;


    // =================================================================== //
    //                           Priority registers                        //
    // =================================================================== //

    // treat sh, sw, sb all as sw
    logic [PRIORITY_WIDTH-1:0] priority_o [1:NUM_SOURCES_P];


    always_ff @(posedge clk, negedge rst_n) begin 
        if(~rst_n) begin 
            for(int i = 1; i <= NUM_SOURCES_P ; i=i+1)
                priority_o[i] <= 'b0; 
        end else if (wb_write_i & wb_addr_i[23:5] == 'b0) begin 
            if (wb_sel_i[0])  priority_o[wb_addr_i[4:2]][PRIORITY_WIDTH-1:0  ] <= wb_wdata_i[PRIORITY_WIDTH-1:0 ];
        end
    end



    // =================================================================== //
    //                    Iterrupt Pending Registers                       //
    // =================================================================== //
    logic [NUM_SOURCES_P:0] ip_reg ;
    
    // Bit 0 of word 0, which represents the non-existent interrupt source 0, is hardwired to zero.
    assign ip_reg[0] = 1'b0;


    always_ff @(posedge clk, negedge rst_n) begin 
        if(~rst_n) begin 
            for(int i = 1; i <= NUM_SOURCES_P ; i=i+1)
                ip_reg[i] <= 'b0; 
        end else begin 
            for(int i = 1; i <= NUM_SOURCES_P ; i=i+1) begin 
               if(gateway_pending[i])  // set logic 
                    ip_reg[i] <= 1'b1;
                else if(claim_sig & claim_id == i) // clear logic (sync)
                    ip_reg[i] <= 1'b0;
            end
        end
    end

    // =================================================================== //
    //                     Iterrupt Enable Registers                      //
    // =================================================================== //
    logic [NUM_SOURCES_P:0] en_reg;

    assign en_reg[0] = 0;
    always @(posedge clk, negedge rst_n) begin 
        if(~rst_n) begin 
            en_reg[NUM_SOURCES_P:1] <= 'b0;
        end else if (wb_write_i & wb_addr_i[23:2] == 22'h00800) begin 
            if (wb_sel_i[0]) en_reg [NUM_SOURCES_P : 1] <= wb_wdata_i[NUM_SOURCES_P : 1];  
        end
    end


    // =================================================================== //
    //                     Iterrupt Priority Threshold                     //
    // =================================================================== //
    logic [THRESHOLD_WIDTH-1:0] thr_reg;
    
    always @(posedge clk, negedge rst_n) begin 
        if(~rst_n) begin 
            thr_reg <= 'b0;
        end else if (wb_write_i & wb_addr_i[23:2] == 22'h80000) begin 
            if (wb_sel_i[0]) thr_reg [7 : 0] <= wb_wdata_i[7 : 0];
            if (wb_sel_i[1]) thr_reg [15: 8] <= wb_wdata_i[15: 8];
            if (wb_sel_i[2]) thr_reg [23:16] <= wb_wdata_i[23:16];
            if (wb_sel_i[3]) thr_reg [31:24] <= wb_wdata_i[31:24];    
        end
    end

    // =================================================================== //
    //                  Iterrupt Priority Claim/Complete                   //
    // =================================================================== //


    // claim, complete signal generation, based on the 
    always_comb begin 
            if(wb_read_i & wb_addr_i[23:2] == 22'h080001) begin 
               claim_sig = 1'b1;
               complete_sig = 1'b0; 
            end else if(wb_write_i & wb_addr_i[23:2] == 22'h080001) begin 
               claim_sig = 1'b0;
               complete_sig = 1'b1; 
            end 
            else begin 
                claim_sig = 'b0;
                complete_sig = 1'b0;
            end
    end





    // =================================================================== //
    //               Iterrupt Notification & Interrupt ID Logic
    // =================================================================== //

    logic [PRIORITY_WIDTH-1:0]  gateway_priority     [NUM_SOURCES_P:0];
    logic [SOURCE_ID_WIDTH-1:0] gateway_id           [NUM_SOURCES_P:0];
    logic [PRIORITY_WIDTH-1:0]  gateway_comparator_i [NUM_SOURCES_P:0];
    logic                       gateway_comparator_o [NUM_SOURCES_P:0];
    logic [PRIORITY_WIDTH-1:0]  gateway_and_o        [NUM_SOURCES_P:0];

    assign gateway_priority[0] = 'b0;
    assign gateway_id[0]       = 'b0;

    genvar j;
    generate 
        for(j = 1; j <= NUM_SOURCES_P; j = j+1) begin : max_priority_sel_loop
           assign gateway_and_o[j]        =  {PRIORITY_WIDTH{ip_reg[j]}} &  priority_o[j];
           assign gateway_comparator_i[j] =  {PRIORITY_WIDTH{en_reg[j]}} &  gateway_and_o[j];
           assign gateway_comparator_o[j] =  (gateway_comparator_i[j] > gateway_priority[j-1]);
           assign gateway_priority[j]     =  gateway_comparator_o[j] ? (gateway_and_o[j]) : (gateway_priority[j-1]);
           assign gateway_id[j]           =  gateway_comparator_o[j] ? j : (gateway_id[j-1]);
        end 
    endgenerate

    assign max_priority  = gateway_priority[NUM_SOURCES_P];
    assign max_id        = gateway_id[NUM_SOURCES_P];
    assign claim_id      = max_id; // no need to check for claim here, if core is not claiming then these are don't care wires
    assign complete_id   = complete_sig ? wb_wdata_i[SOURCE_ID_WIDTH-1:0] : 'b0;
    assign complete_id_o = complete_id;

    assign irq_o         = {{(THRESHOLD_WIDTH - PRIORITY_WIDTH){1'b0}},max_priority} > thr_reg;
    



    // =================================================================== //
    //                             Read Logic
    // =================================================================== //

    always_comb begin
        wb_rdata_o = 32'd0;

        if (wb_read_i) begin

        // — Priority[1..31]: offsets 0x00,0x04,…,0x7C  (word addrs 0–30)
        if (wb_addr_i[23:2] < 22'd32) begin
            // source id = wb_addr_i[4:2] + 1
            wb_rdata_o = {{(32-PRIORITY_WIDTH){1'b0}},priority_o[ wb_addr_i[4:2]]}; // TODO remove + 1
        end

        // — Pending bits @ 0x1000 → word addr 0x400
        else if (wb_addr_i[23:2] == 22'h00400) begin
            // ip_reg[0]=0, ip_reg[1..31] map to bits [1..31]
            wb_rdata_o = {{(32-NUM_SOURCES_P){1'b0}},ip_reg};
        end

        // — Enable bits @ 0x2000 → word addr 0x800
        else if (wb_addr_i[23:2] == 22'h00800) begin
            // en_reg[0][1..31] → bits [1..31]
            wb_rdata_o = {{(32-NUM_SOURCES_P){1'b0}},en_reg};
        end

        // — Threshold @ 0x200000 → word addr 0x080000
        else if (wb_addr_i[23:2] == 22'h080000) begin
            wb_rdata_o = thr_reg;
        end

        // — Claim/Complete @ 0x200004 → word addr 0x080001
        else if (wb_addr_i[23:2] == 22'h080001) begin
            wb_rdata_o = {{(32-SOURCE_ID_WIDTH){1'b0}},claim_id};
        end

        end
    end



endmodule




