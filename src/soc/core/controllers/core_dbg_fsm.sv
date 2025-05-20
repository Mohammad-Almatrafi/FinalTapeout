import debug_pkg::*;
module core_dbg_fsm (
    input logic clk_i, 
    input logic reset_i,
    input logic ebreak_inst_mem,
    input logic dbg_resumereq_i, 
    input logic dbg_haltreq_i,
    input logic trap,
    input logic trap_ret,
    input logic inst_valid_wb,

    output logic core_resumeack_o,
    output logic core_running_o,
    output logic core_halted_o,
    output logic dbg_ret,
    output logic dont_trap,


    input logic [31:0] cinst_pc,
    input logic [31:0] pc_if_jump,
     
    output logic [31:0] dcsr_o, 
    output logic [31:0] dpc_o,

    // abstract register access interface 
    input  logic        dbg_ar_en,
    input  logic        dbg_ar_wr,
    input  logic [15:0] dbg_ar_ad,
    input  logic [31:0] dbg_ar_do
);

    logic core_running_o_ff;
    logic [31:0] dpc, dcsr;
    dcause_e debug_cause;
    logic debug_step;
    

    enum logic [1:0] {RUNNING, HALTED, RESUME} pstate, nstate;
    always_ff@(posedge clk_i or posedge reset_i)
    begin
        if(reset_i)
            pstate <= RUNNING;
        else
            pstate <= nstate;
    end
    always_comb
    begin
        case(pstate)
            RUNNING: nstate = ((ebreak_inst_mem && dcsr[15]) || ((debug_step | dbg_haltreq_i) && (trap  | inst_valid_wb)))? HALTED : RUNNING;
            HALTED: nstate = dbg_resumereq_i? RESUME : HALTED;
            RESUME: nstate = dbg_resumereq_i? RESUME : RUNNING;
            default: nstate = RUNNING;
        endcase
    end
    assign core_resumeack_o = (pstate == RESUME);
    assign core_running_o = (pstate == RUNNING);
    assign core_halted_o = ((pstate == HALTED) || (pstate == RESUME));

    //dcsr
    always_ff@(posedge clk_i or posedge reset_i)
    begin
        if(reset_i)
            debug_cause <= NO_DBG_CAUSE;
        else if(core_running_o && ebreak_inst_mem && dcsr[15])
            debug_cause <= DBG_EBREAK;
        else if(core_running_o && dbg_haltreq_i)
            debug_cause <= DBG_HALTREQ;
        else if(core_running_o && debug_step)
            debug_cause <= DBG_STEP;
    end

    assign debug_step = (dcsr[2]);

    always_ff@(posedge clk_i or posedge reset_i)
    begin
            if(reset_i)
                dcsr <= 0;
            else if(dbg_ar_en && dbg_ar_wr && (dbg_ar_ad == 16'h07b0))
                dcsr <= dbg_ar_do;//add dcsr
    end
    //dpc
    always_ff@(posedge clk_i or posedge reset_i)
    begin
        if(reset_i)
            dpc <= 0;
        else if(dbg_ar_en & dbg_ar_wr & (dbg_ar_ad == 16'h07b1)) 
            dpc <= dbg_ar_do;
        else if(core_running_o & ebreak_inst_mem & dcsr[15])
            dpc <= cinst_pc;
        else if(core_running_o & (debug_step | dbg_haltreq_i) & inst_valid_wb)
            dpc <= cinst_pc;
        else if(core_running_o & (debug_step | dbg_haltreq_i) & (trap))
            dpc <= pc_if_jump;
    end

    assign dcsr_o = {4'd4, 12'd0, dcsr[15], 1'b0, dcsr[13:9], debug_cause, 1'b0, dcsr[4], 1'b0, dcsr[2], 2'd3};
    assign dpc_o  = dpc;

    always @(posedge clk_i, posedge reset_i ) begin
        if(reset_i)
            core_running_o_ff <= 1'b0;
        else
            core_running_o_ff <= core_running_o;
    end

    assign dbg_ret = ~core_running_o_ff & core_running_o & ~reset_i;

    assign dont_trap =  core_running_o & (((debug_step | dbg_haltreq_i) & inst_valid_wb) | (ebreak_inst_mem & dcsr[15]));


endmodule : core_dbg_fsm
