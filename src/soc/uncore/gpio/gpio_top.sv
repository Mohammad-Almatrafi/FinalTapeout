//////////////////////////////////////////////////////////////////////
////                                                              ////
////  WISHBONE General-Purpose I/O                                ////
////                                                              ////
////  This file is part of the GPIO project                       ////
////  http://www.opencores.org/cores/gpio/                        ////
////                                                              ////
////  Description                                                 ////
////  Implementation of GPIO IP core according to                 ////
////  GPIO IP core specification document.                        ////
////                                                              ////
////  To Do:                                                      ////
////   Nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Damjan Lampret, lampret@opencores.org                 ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.17  2004/05/05 08:21:00  andreje
// Bugfixes when GPIO_RGPIO_ECLK/GPIO_RGPIO_NEC disabled, gpio oe name change and set to active-high according to spec
//
// Revision 1.16  2003/12/17 13:00:52  gorand
// added ECLK and NEC registers, all tests passed.
//
// Revision 1.15  2003/11/10 23:21:22  gorand
// bug fixed. all tests passed.
//
// Revision 1.14  2003/11/06 13:59:07  gorand
// added support for 8-bit access to registers.
//
// Revision 1.13  2002/11/18 22:35:18  lampret
// Bug fix. Interrupts were also asserted when condition was not met.
//
// Revision 1.12  2002/11/11 21:36:28  lampret
// Added ifdef to remove mux from clk_pad_i if mux is not allowed. This also removes RGPIO_CTRL[NEC].
//
// Revision 1.11  2002/03/13 20:56:28  lampret
// Removed zero padding as per Avi Shamli suggestion.
//
// Revision 1.10  2002/03/13 20:47:57  lampret
// Ports changed per Ran Aviram suggestions.
//
// Revision 1.9  2002/03/09 03:43:27  lampret
// Interrupt is asserted only when an input changes (code patch by Jacob Gorban)
//
// Revision 1.8  2002/01/14 19:06:28  lampret
// Changed registered WISHBONE outputs wb_ack_o/wb_err_o to follow WB specification.
//
// Revision 1.7  2001/12/25 17:21:21  lampret
// Fixed two typos.
//
// Revision 1.6  2001/12/25 17:12:35  lampret
// Added RGPIO_INTS.
//
// Revision 1.5  2001/12/12 20:35:53  lampret
// Fixing style.
//
// Revision 1.4  2001/12/12 07:12:58  lampret
// Fixed bug when wb_inta_o is registered (GPIO_WB_REGISTERED_OUTPUTS)
//
// Revision 1.3  2001/11/15 02:24:37  lampret
// Added GPIO_REGISTERED_WB_OUTPUTS, GPIO_REGISTERED_IO_OUTPUTS and GPIO_NO_NEGEDGE_FLOPS.
//
// Revision 1.2  2001/10/31 02:26:51  lampret
// Fixed wb_err_o.
//
// Revision 1.1  2001/09/18 18:49:07  lampret
// Changed top level ptc into gpio_top. Changed defines.v into gpio_defines.v.
//
// Revision 1.1  2001/08/21 21:39:28  lampret
// Changed directory structure, port names and drfines.
//
// Revision 1.2  2001/07/14 20:39:26  lampret
// Better configurability.
//
// Revision 1.1  2001/06/05 07:45:26  lampret
// Added initial RTL and test benches. There are still some issues with these files.
//


// synopsys translate_off
//`include "timescale.v"
// synopsys translate_on
`ifndef VCS
     `include "gpio_defines.v"
`endif
module gpio_top #(
  parameter NO_OF_GPIO_PINS = 24,
  parameter NO_OF_SHARED_PINS = 13
)(
	// WISHBONE Interface
	wb_clk_i, wb_rst_i, wb_cyc_i, wb_adr_i, wb_dat_i, wb_sel_i, wb_we_i, wb_stb_i,
	wb_dat_o, wb_ack_o, wb_err_o, wb_inta_o,

  // 
  i_gpio,
  o_gpio,
  en_gpio,
  io_sel
);

localparam dw = 32;
parameter aw = `GPIO_ADDRHH+1;
parameter gw = `GPIO_IOS;
//
// WISHBONE Interface
//
input             wb_clk_i;	// Clock
input             wb_rst_i;	// Reset
input             wb_cyc_i;	// cycle valid input
input   [aw-1:0]	wb_adr_i;	// address bus inputs
input   [dw-1:0]	wb_dat_i;	// input data bus
input	  [3:0]     wb_sel_i;	// byte select inputs
input             wb_we_i;	// indicates write transfer
input             wb_stb_i;	// strobe input
output  [dw-1:0]  wb_dat_o;	// output data bus
output            wb_ack_o;	// normal termination
output            wb_err_o;	// termination w/ error
output            wb_inta_o;	// Interrupt request output
input   [NO_OF_GPIO_PINS - 1:0]    i_gpio;
output  [NO_OF_GPIO_PINS - 1:0]    o_gpio;
output  [NO_OF_GPIO_PINS - 1:0]    en_gpio;
output  [NO_OF_SHARED_PINS - 1:0]  io_sel;



// Logic here
logic wb_acc;
logic gpio_write;
assign wb_acc = wb_stb_i & wb_cyc_i;
assign gpio_write = wb_acc & wb_we_i;

logic [NO_OF_GPIO_PINS - 1:0] rgpio_in;
logic [NO_OF_GPIO_PINS - 1:0] rgpio_out;
logic [NO_OF_GPIO_PINS - 1:0] rgpio_oe;
logic [NO_OF_SHARED_PINS - 1:0] io_sel;


logic rgpio_in_sel;
logic rgpio_out_sel;
logic rgpio_oe_sel;
logic io_sel_sel;

n_bit_dec #(
  .n(2)
) gpio_reg_sel_decoder (
  .in(wb_adr_i[3:2]),
  .out({ io_sel_sel ,rgpio_oe_sel, rgpio_out_sel, rgpio_in_sel})
);


always @(posedge wb_clk_i, posedge wb_rst_i) begin 
  if(wb_rst_i) begin 
    rgpio_out <= 0;
    rgpio_oe  <= 0;
    io_sel <= 0;
  end else if(gpio_write) begin 
    if(rgpio_out_sel) begin 
      if(wb_sel_i[0])                          rgpio_out[ 7: 0] <= wb_dat_i[ 7: 0];
      if(wb_sel_i[1])                          rgpio_out[15: 8] <= wb_dat_i[15: 8];
      if(wb_sel_i[2])                          rgpio_out[23:16] <= wb_dat_i[23:16];

    end else if(rgpio_oe_sel) begin 
      if(wb_sel_i[0])                          rgpio_oe[ 7: 0] <= wb_dat_i[ 7: 0];
      if(wb_sel_i[1])                          rgpio_oe[15: 8] <= wb_dat_i[15: 8];
      if(wb_sel_i[2])                          rgpio_oe[23:16] <= wb_dat_i[23:16];
    

    end else if(io_sel_sel) begin // TODO LOGIC NOT PARAMETERIZED
      if(wb_sel_i[1])                          io_sel[ 4: 0] <= wb_dat_i[15: 11];
      if(wb_sel_i[2])                          io_sel[12: 5] <= wb_dat_i[23: 16]; 
    end
  end
end

assign rgpio_in = i_gpio;
assign o_gpio   = rgpio_out;
assign en_gpio  = rgpio_oe;


// output logic here 
assign wb_dat_o = rgpio_in_sel  ? {{(32-NO_OF_GPIO_PINS){1'b0}}, rgpio_in }  :
                  rgpio_out_sel ? {{(32-NO_OF_GPIO_PINS){1'b0}}, rgpio_out } :
                  rgpio_oe_sel  ? {{(32-NO_OF_GPIO_PINS){1'b0}}, rgpio_oe  } :
                  {{(32-NO_OF_SHARED_PINS){1'b0}},io_sel};

assign wb_ack_o = wb_acc;
assign wb_err_o = 1'b0;
assign wb_inta_o = 1'b0;

endmodule

