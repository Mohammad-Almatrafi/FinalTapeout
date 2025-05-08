//abstract access
import common_pkg::*;
import debug_pkg::*;

module dm(
  input         rst_i,
  input         clk_i,

  // DMI
  input onebit_sig_e dmi_wr_i,
  input onebit_sig_e dmi_rd_i,
  input dm_addresses_e dmi_ad_i,
  input [31:0]  dmi_di_i,
  output logic[31:0] dmi_do_o,

  // Debug Module Status
  input onebit_sig_e resumeack_i,
  input onebit_sig_e running_i,
  input onebit_sig_e halted_i,

  output onebit_sig_e haltreq_o,
  output onebit_sig_e resumereq_o,
  output onebit_sig_e ndmreset_o,

  output onebit_sig_e ar_en_o,
  output onebit_sig_e ar_wr_o,
  output logic[15:0] ar_ad_o,
  input  onebit_sig_e ar_done_i,
  input [31:0]  ar_di_i,
  output logic[31:0] ar_do_o,

  output onebit_sig_e am_en_o,
  output onebit_sig_e am_wr_o,
  output logic[3:0] am_st_o,
  output logic[31:0] am_ad_o,
  input [31:0]  am_di_i,
  output logic[31:0] am_do_o,
  input  onebit_sig_e am_done_i
);

//registers
logic [31:0] dmstatus;
logic [31:0] dmcontrol;
logic [31:0] abstractcs;
logic [31:0] command;
logic [31:0] abstractauto;
logic [31:0] data0;
logic [31:0] data1;

logic ackhavereset;
logic dmactive;
logic busy;
logic [7:0] cmdtype;
logic [15:0] regno;
logic write;
logic transfer;
logic aapostincrement;
logic [2:0]aasize;
enum logic [1:0] {IDLE, DECODE, POST} pstate, nstate;
logic autoexeccmd;


always_ff@(posedge clk_i)
begin : dmstatus_reg
  //ndmreset logic and clear
  if(ndmreset_o)
  begin
    dmstatus[19] <= 1'b1;
    dmstatus[18] <= 1'b1;
  end
  else if(ackhavereset)
  begin
    dmstatus[19] <= 1'b0;
    dmstatus[18] <= 1'b0;
  end
  dmstatus[17] <= resumeack_i;
  dmstatus[16] <= resumeack_i;
  dmstatus[11] <= running_i;
  dmstatus[10] <= running_i;
  dmstatus[9] <= halted_i;
  dmstatus[8] <= halted_i;
end : dmstatus_reg


//dmcontrol logic
assign haltreq_o = onebit_sig_e'(dmcontrol[31]);
assign resumereq_o = onebit_sig_e'(dmcontrol[30]);
assign ackhavereset = dmcontrol[28];
assign ndmreset_o = onebit_sig_e'(dmcontrol[1]);
assign dmactive = dmcontrol[0];

always_ff@(posedge clk_i or posedge rst_i)
begin : dmcontrol_reg
  if(rst_i)
  begin
    dmcontrol[31] <= 1'b0;
    dmcontrol[30] <= 1'b0;
    dmcontrol[28] <= 1'b0;
    dmcontrol[1] <= 1'b0;
    dmcontrol[0] <= 1'b0;
  end
  else if(dmi_wr_i && dmi_ad_i == DMCONTROL)
    begin
      dmcontrol[31] <= dmi_di_i[31];
      dmcontrol[30] <= dmi_di_i[30];
      dmcontrol[28] <= dmi_di_i[28];
      dmcontrol[1] <= dmi_di_i[1];
      dmcontrol[0] <= dmi_di_i[0];
    end
end : dmcontrol_reg

//abstractcs
logic aaccess;
assign aaccess = (dmi_wr_i && (dmi_ad_i == ABSTRACTCS || dmi_ad_i == COMMAND || dmi_ad_i == DATA0 || dmi_ad_i == DATA1 || dmi_ad_i == ABSTRACTAUTO)) ||
                 (dmi_rd_i && (dmi_ad_i == DATA0 || dmi_ad_i == DATA1));
always_ff@(posedge clk_i or posedge rst_i)
begin : abstractcs_reg
  if(rst_i)
    abstractcs[10:8] <= 3'd0;
  else if(!abstractcs[12] && dmi_wr_i && dmi_ad_i == ABSTRACTCS)
    abstractcs[10:8] <= (~dmi_di_i[10:8]) & abstractcs[10:8];
  else if(abstractcs[12] && abstractcs[10:8] == 3'd0 && aaccess)
    abstractcs[10:8] <= 3'd1;
  else if(ar_en_o && aasize != 3'd2)
    abstractcs[10:8] <= 3'd2;
  /*else
    abstractcs[10:8] <= 3'd0;*/
end : abstractcs_reg
always_ff@(posedge clk_i or posedge rst_i)
begin
  if(rst_i)
    abstractcs[12]  <= 1'b0;
  else
    abstractcs[12] <= busy;
end

//command
assign cmdtype = command[31:24];
assign regno = command[15:0];
assign write = command[16];
assign transfer = command[17];
assign aapostincrement = command[19];
assign aasize = command[22:20];

always_ff@(posedge clk_i or posedge rst_i)
begin : command_reg
  if(rst_i)
    command <= 0;
  else if(!abstractcs[12] && dmi_wr_i && dmi_ad_i == COMMAND)
    command <= dmi_di_i;
  else if(pstate == POST && aapostincrement && cmdtype == 8'd0)
    if(aasize == 3'd2)
      command[15:0] <= command[15:0] + 16'd1;
end : command_reg

//fsm
always_ff@(posedge clk_i or posedge rst_i)
begin
  if(rst_i)
    pstate <= IDLE;
  else
    pstate <= nstate;
end
always_comb
begin
  case(pstate)
    IDLE: begin
            if(dmi_wr_i && dmi_ad_i == COMMAND || autoexeccmd)
              nstate = DECODE;
            else
              nstate = IDLE;
            ar_en_o = FALSE;
            ar_wr_o = FALSE;
            ar_ad_o = 16'd0;
            ar_do_o = 0;
            am_en_o = FALSE;
            am_wr_o = FALSE;
            am_st_o = 4'd0;
            am_ad_o = 0;
            am_do_o = 0;
            busy = 1'b0;
          end
    DECODE: begin
              ar_en_o = onebit_sig_e'((cmdtype == 8'd0) & transfer);
              ar_wr_o = onebit_sig_e'(transfer & write);
              ar_ad_o = regno;
              ar_do_o = data0;  
              am_en_o = onebit_sig_e'((cmdtype == 8'd2));
              am_wr_o = onebit_sig_e'(write);
              am_st_o = aasize;
              am_ad_o = data1;
              am_do_o = data0;
              nstate = ((cmdtype == 8'd2) && !am_done_i)? DECODE : POST; // Assumes that abstract reg access only take one cycle
              busy = 1'b1;
            end
    POST: begin
            ar_en_o = FALSE;
            ar_wr_o = FALSE;
            ar_ad_o = 16'd0;
            ar_do_o = 0;
            am_en_o = FALSE;
            am_wr_o = FALSE;
            am_st_o = 4'd0;
            am_ad_o = 0;
            am_do_o = 0;
            busy = 1'b0;
            nstate = (dmi_wr_i && !aapostincrement)? POST : IDLE;
          end
    default:begin
              nstate = IDLE;
              ar_en_o = FALSE;
              ar_wr_o = FALSE;
              ar_ad_o = 16'd0;
              ar_do_o = 0;
              am_en_o = FALSE;
              am_wr_o = FALSE;
              am_st_o = 4'd0;
              am_ad_o = 0;
              am_do_o = 0;
              busy = 1'b0;
            end
  endcase
end

//data0
always_ff@(posedge clk_i or posedge rst_i)
begin : data0_reg
  if(rst_i)
    data0 <= 0;
  else if(!abstractcs[12] && dmi_wr_i && dmi_ad_i == DATA0)
    data0 <= dmi_di_i;
  else if(ar_done_i)
    data0 <= ar_di_i;
  else if(am_done_i)
    data0 <= am_di_i;
end : data0_reg

//data1
always_ff@(posedge clk_i or posedge rst_i)
begin : data1_reg
  if(rst_i)
    data1 <= 0;
  else if(!abstractcs[12] && dmi_wr_i && dmi_ad_i == DATA1)
    data1 <= dmi_di_i;
  else if(pstate == POST && aapostincrement && cmdtype == 8'd2)
    if(aasize == 3'd1)
      data1 <= data1 + 2;
    else if(aasize == 3'd2)
      data1 <= data1 + 4;
end : data1_reg

//abstarctauto
always_ff@(posedge clk_i or posedge rst_i)
begin : abstarctauto_reg
  if(rst_i)
    abstractauto[1:0] <= 0;
  else if(!abstractcs[12] && dmi_wr_i && dmi_ad_i == ABSTRACTAUTO)
    abstractauto[1:0] <= dmi_di_i;
end : abstarctauto_reg

assign autoexeccmd = (dmi_wr_i || dmi_rd_i) &&  ((abstractauto[0] && dmi_ad_i == DATA0) ||
                                                 (abstractauto[1] && dmi_ad_i == DATA1));

//readlogic
always_ff@(posedge clk_i or posedge rst_i)
begin : dm_readlogic
  if(rst_i)
    dmi_do_o <= 0;
  else if(dmi_rd_i)
    case(dmi_ad_i)
      DATA0:        dmi_do_o <= data0;
      DATA1:        dmi_do_o <= data1;
      DMCONTROL:    dmi_do_o <= {dmcontrol[31:30], 1'b0, dmcontrol[28], 26'd0, dmcontrol[1:0]};
      DMSTATUS:     dmi_do_o <= {12'd0,dmstatus[19:16],4'd0,dmstatus[11:8],1'b1,3'd0,4'd2};
      ABSTRACTCS:   dmi_do_o <= {3'd0, 5'd0, 11'd0, abstractcs[12], 1'b0, abstractcs[10:8], 4'd0, 4'd1};
      COMMAND:      dmi_do_o <= command;
      ABSTRACTAUTO: dmi_do_o <= {30'd0, abstractauto[1:0]};
      default:      dmi_do_o <= 0;
    endcase
end : dm_readlogic

endmodule