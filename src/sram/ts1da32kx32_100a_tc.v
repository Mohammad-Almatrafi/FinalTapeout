`timescale 1ns/10ps
`celldefine

module TS1DA32KX32 (CLK, A, CEB, OEB, GWEB, BWEB, BWB, DIN, DOUT);

parameter numAddr   =  15,
          numOut    =  32,
          wordDepth =  32768,
          numByte   =  4;

input CLK, CEB, OEB, GWEB, BWEB;
input [numByte-1:0] BWB;
input [numAddr-1:0] A;
input [numOut-1:0] DIN;
output [numOut-1:0] DOUT;

// internal signals
wire CLK_i, CEB_i, OEB_i, GWEB_i, BWEB_i;
wire [numByte-1:0] BWB_i;
wire [numAddr-1:0] A_i;
wire [numOut-1:0] DIN_i;
wire [numOut-1:0] DOUT_i;

// interface
buf (CLK_i, CLK);
buf (CEB_i, CEB);
buf (OEB_i, OEB);
buf (GWEB_i, GWEB);
buf (BWEB_i, BWEB);
buf (BWB_i[0], BWB[0]);
buf (BWB_i[1], BWB[1]);
buf (BWB_i[2], BWB[2]);
buf (BWB_i[3], BWB[3]);
buf (A_i[0], A[0]);
buf (A_i[1], A[1]);
buf (A_i[2], A[2]);
buf (A_i[3], A[3]);
buf (A_i[4], A[4]);
buf (A_i[5], A[5]);
buf (A_i[6], A[6]);
buf (A_i[7], A[7]);
buf (A_i[8], A[8]);
buf (A_i[9], A[9]);
buf (A_i[10], A[10]);
buf (A_i[11], A[11]);
buf (A_i[12], A[12]);
buf (A_i[13], A[13]);
buf (A_i[14], A[14]);
buf (DIN_i[0], DIN[0]);
buf (DIN_i[1], DIN[1]);
buf (DIN_i[2], DIN[2]);
buf (DIN_i[3], DIN[3]);
buf (DIN_i[4], DIN[4]);
buf (DIN_i[5], DIN[5]);
buf (DIN_i[6], DIN[6]);
buf (DIN_i[7], DIN[7]);
buf (DIN_i[8], DIN[8]);
buf (DIN_i[9], DIN[9]);
buf (DIN_i[10], DIN[10]);
buf (DIN_i[11], DIN[11]);
buf (DIN_i[12], DIN[12]);
buf (DIN_i[13], DIN[13]);
buf (DIN_i[14], DIN[14]);
buf (DIN_i[15], DIN[15]);
buf (DIN_i[16], DIN[16]);
buf (DIN_i[17], DIN[17]);
buf (DIN_i[18], DIN[18]);
buf (DIN_i[19], DIN[19]);
buf (DIN_i[20], DIN[20]);
buf (DIN_i[21], DIN[21]);
buf (DIN_i[22], DIN[22]);
buf (DIN_i[23], DIN[23]);
buf (DIN_i[24], DIN[24]);
buf (DIN_i[25], DIN[25]);
buf (DIN_i[26], DIN[26]);
buf (DIN_i[27], DIN[27]);
buf (DIN_i[28], DIN[28]);
buf (DIN_i[29], DIN[29]);
buf (DIN_i[30], DIN[30]);
buf (DIN_i[31], DIN[31]);
nmos (DOUT[0], DOUT_i[0], 1);
nmos (DOUT[1], DOUT_i[1], 1);
nmos (DOUT[2], DOUT_i[2], 1);
nmos (DOUT[3], DOUT_i[3], 1);
nmos (DOUT[4], DOUT_i[4], 1);
nmos (DOUT[5], DOUT_i[5], 1);
nmos (DOUT[6], DOUT_i[6], 1);
nmos (DOUT[7], DOUT_i[7], 1);
nmos (DOUT[8], DOUT_i[8], 1);
nmos (DOUT[9], DOUT_i[9], 1);
nmos (DOUT[10], DOUT_i[10], 1);
nmos (DOUT[11], DOUT_i[11], 1);
nmos (DOUT[12], DOUT_i[12], 1);
nmos (DOUT[13], DOUT_i[13], 1);
nmos (DOUT[14], DOUT_i[14], 1);
nmos (DOUT[15], DOUT_i[15], 1);
nmos (DOUT[16], DOUT_i[16], 1);
nmos (DOUT[17], DOUT_i[17], 1);
nmos (DOUT[18], DOUT_i[18], 1);
nmos (DOUT[19], DOUT_i[19], 1);
nmos (DOUT[20], DOUT_i[20], 1);
nmos (DOUT[21], DOUT_i[21], 1);
nmos (DOUT[22], DOUT_i[22], 1);
nmos (DOUT[23], DOUT_i[23], 1);
nmos (DOUT[24], DOUT_i[24], 1);
nmos (DOUT[25], DOUT_i[25], 1);
nmos (DOUT[26], DOUT_i[26], 1);
nmos (DOUT[27], DOUT_i[27], 1);
nmos (DOUT[28], DOUT_i[28], 1);
nmos (DOUT[29], DOUT_i[29], 1);
nmos (DOUT[30], DOUT_i[30], 1);
nmos (DOUT[31], DOUT_i[31], 1);

// function
reg [numByte-1:0] BWB_reg;
reg [numOut-1:0] intBus;
reg [numOut-1:0] memory [wordDepth-1:0];
reg WEB_reg;
integer i;

assign DOUT_i=(OEB_i===1'bx) ? {numOut{1'bx}} :
              (OEB_i===1'b1) ? {numOut{1'bz}} : intBus;

always @(posedge CLK_i) begin
  WEB_reg=(GWEB_i && BWEB_i) || (GWEB_i && !BWEB_i && (&BWB_i));
  for (i=0; i<numByte; i=i+1) BWB_reg[i]=GWEB_i && (BWB_i[i] || BWEB_i);
  case (CEB_i)
    1'bx : Access(0);
    1'b0 : Access(1);
  endcase
end

// timing check
reg notify;
wire check_en=!CEB_i;
wire check_r=!CEB_i && WEB_reg;

always @(notify)
  Access(0);

// task
task Access;
input ok_flag;
begin
  case (WEB_reg)
    1'b1 : Read(ok_flag);
    1'b0 : Write(ok_flag);  
    default : begin      
                Read(ok_flag);
                Write(ok_flag);
              end
  endcase
end
endtask

task Read;
input ok_flag;
integer i,s1,s2;
reg [numOut-1:0] tmp;
begin
  if (^A_i === 1'bx) begin
    $display("%m> Address[%b] unknown at time %.1f", A, $realtime);
    ok_flag=0;
  end
  else if (A_i>wordDepth) begin
    $display("%m> Address[%b] larger than wordDepth[%b]", A_i, wordDepth);
    ok_flag=0;
  end
  intBus = ok_flag ? memory[A_i] : {numOut{1'bx}};
end
endtask

task Write;
input ok_flag;
integer i,j;
reg [numOut-1:0] tmp;
begin
  if (^A_i === 1'bx) begin
    $display("%m> Address[%b] unknown at time %.1f", A_i, $realtime);
    for (i=0; i<wordDepth; i=i+1) begin
      tmp=memory[i];

if (!BWB_reg[0]) tmp[7:0]=8'bx;
if (!BWB_reg[1]) tmp[15:8]=8'bx;
if (!BWB_reg[2]) tmp[23:16]=8'bx;
if (!BWB_reg[3]) tmp[31:24]=8'bx;

      memory[i]=tmp;
    end
  end
  else if (A_i>wordDepth) begin
    $display("%m> Address[%b] larger than wordDepth[%b]", A_i, wordDepth);
  end
  else begin
    tmp=memory[A_i];

if (!BWB_reg[0]) tmp[7:0] = ok_flag ? DIN_i[7:0] : 8'bx;
if (!BWB_reg[1]) tmp[15:8] = ok_flag ? DIN_i[15:8] : 8'bx;
if (!BWB_reg[2]) tmp[23:16] = ok_flag ? DIN_i[23:16] : 8'bx;
if (!BWB_reg[3]) tmp[31:24] = ok_flag ? DIN_i[31:24] : 8'bx;

    memory[A_i] = tmp;
  end
end
endtask

// timing
specify
  specparam
    tCYC = 4,
    tKH = 1,
    tKL = 1.2,
    tAS = 0.3,
    tAH = 0.3,
    tCS = 0.3,
    tCH = 0.3,
    tDS = 0.1,
    tDH = 0.3,
    tCD = 2.9,
    tOE = 1.0,
    tOH = 2.5,
    tOHZ = 0.7,
    tOLZ = 0.7;
  (posedge CLK => (DOUT[0] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[1] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[2] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[3] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[4] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[5] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[6] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[7] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[8] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[9] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[10] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[11] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[12] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[13] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[14] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[15] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[16] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[17] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[18] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[19] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[20] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[21] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[22] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[23] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[24] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[25] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[26] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[27] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[28] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[29] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[30] +: CEB)) = (tCD,tCD);
  (posedge CLK => (DOUT[31] +: CEB)) = (tCD,tCD);
  (OEB => DOUT[0]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[1]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[2]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[3]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[4]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[5]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[6]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[7]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[8]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[9]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[10]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[11]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[12]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[13]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[14]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[15]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[16]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[17]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[18]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[19]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[20]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[21]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[22]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[23]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[24]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[25]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[26]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[27]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[28]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[29]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[30]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  (OEB => DOUT[31]) = (0,0,tOHZ,tOE,tOHZ,tOE);
  $width(posedge CLK, tKH, 0, notify);
  $width(negedge CLK, tKL, 0, notify);
  $period(posedge CLK, tCYC, notify);
  $setup(negedge CEB, posedge CLK, tCS, notify);  
  $hold(posedge CLK, posedge CEB, tCH, notify);
  $setup(posedge GWEB, posedge CLK &&& check_en, tCS, notify);  
  $setup(negedge GWEB, posedge CLK &&& check_en, tCS, notify);  
  $hold(posedge CLK &&& check_en, posedge GWEB, tCH, notify);
  $hold(posedge CLK &&& check_en, negedge GWEB, tCH, notify);
  $setup(posedge BWEB, posedge CLK &&& check_en, tCS, notify);  
  $setup(negedge BWEB, posedge CLK &&& check_en, tCS, notify);  
  $hold(posedge CLK &&& check_en, posedge BWEB, tCH, notify);
  $hold(posedge CLK &&& check_en, negedge BWEB, tCH, notify);
  $setup(posedge BWB[0], posedge CLK &&& check_en, tCS, notify);
  $setup(negedge BWB[0], posedge CLK &&& check_en, tCS, notify);
  $setup(posedge BWB[1], posedge CLK &&& check_en, tCS, notify);
  $setup(negedge BWB[1], posedge CLK &&& check_en, tCS, notify);
  $setup(posedge BWB[2], posedge CLK &&& check_en, tCS, notify);
  $setup(negedge BWB[2], posedge CLK &&& check_en, tCS, notify);
  $setup(posedge BWB[3], posedge CLK &&& check_en, tCS, notify);
  $setup(negedge BWB[3], posedge CLK &&& check_en, tCS, notify);
  $hold(posedge CLK &&& check_en, posedge BWB[0], tCH, notify);
  $hold(posedge CLK &&& check_en, posedge BWB[0], tCH, notify);
  $hold(posedge CLK &&& check_en, posedge BWB[1], tCH, notify);
  $hold(posedge CLK &&& check_en, posedge BWB[1], tCH, notify);
  $hold(posedge CLK &&& check_en, posedge BWB[2], tCH, notify);
  $hold(posedge CLK &&& check_en, posedge BWB[2], tCH, notify);
  $hold(posedge CLK &&& check_en, posedge BWB[3], tCH, notify);
  $hold(posedge CLK &&& check_en, posedge BWB[3], tCH, notify);
  $setup(A[0], posedge CLK &&& check_en, tAS, notify);
  $setup(A[1], posedge CLK &&& check_en, tAS, notify);
  $setup(A[2], posedge CLK &&& check_en, tAS, notify);
  $setup(A[3], posedge CLK &&& check_en, tAS, notify);
  $setup(A[4], posedge CLK &&& check_en, tAS, notify);
  $setup(A[5], posedge CLK &&& check_en, tAS, notify);
  $setup(A[6], posedge CLK &&& check_en, tAS, notify);
  $setup(A[7], posedge CLK &&& check_en, tAS, notify);
  $setup(A[8], posedge CLK &&& check_en, tAS, notify);
  $setup(A[9], posedge CLK &&& check_en, tAS, notify);
  $setup(A[10], posedge CLK &&& check_en, tAS, notify);
  $setup(A[11], posedge CLK &&& check_en, tAS, notify);
  $setup(A[12], posedge CLK &&& check_en, tAS, notify);
  $setup(A[13], posedge CLK &&& check_en, tAS, notify);
  $setup(A[14], posedge CLK &&& check_en, tAS, notify);
  $hold(posedge CLK &&& check_en, A[0], tAH, notify);
  $hold(posedge CLK &&& check_en, A[1], tAH, notify);
  $hold(posedge CLK &&& check_en, A[2], tAH, notify);
  $hold(posedge CLK &&& check_en, A[3], tAH, notify);
  $hold(posedge CLK &&& check_en, A[4], tAH, notify);
  $hold(posedge CLK &&& check_en, A[5], tAH, notify);
  $hold(posedge CLK &&& check_en, A[6], tAH, notify);
  $hold(posedge CLK &&& check_en, A[7], tAH, notify);
  $hold(posedge CLK &&& check_en, A[8], tAH, notify);
  $hold(posedge CLK &&& check_en, A[9], tAH, notify);
  $hold(posedge CLK &&& check_en, A[10], tAH, notify);
  $hold(posedge CLK &&& check_en, A[11], tAH, notify);
  $hold(posedge CLK &&& check_en, A[12], tAH, notify);
  $hold(posedge CLK &&& check_en, A[13], tAH, notify);
  $hold(posedge CLK &&& check_en, A[14], tAH, notify);
  $setup(DIN[0], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[1], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[2], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[3], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[4], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[5], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[6], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[7], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[8], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[9], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[10], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[11], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[12], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[13], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[14], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[15], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[16], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[17], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[18], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[19], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[20], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[21], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[22], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[23], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[24], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[25], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[26], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[27], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[28], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[29], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[30], posedge CLK &&& check_r, tDS, notify);
  $setup(DIN[31], posedge CLK &&& check_r, tDS, notify);
  $hold(posedge CLK &&& check_r, DIN[0], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[1], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[2], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[3], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[4], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[5], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[6], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[7], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[8], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[9], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[10], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[11], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[12], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[13], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[14], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[15], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[16], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[17], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[18], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[19], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[20], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[21], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[22], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[23], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[24], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[25], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[26], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[27], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[28], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[29], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[30], tDH, notify);
  $hold(posedge CLK &&& check_r, DIN[31], tDH, notify);

endspecify

endmodule
`endcelldefine
