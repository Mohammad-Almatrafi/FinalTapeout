//----------------------------------------------------------------------------- 
// File: plic_pkg.sv
//-----------------------------------------------------------------------------
package plic_pkg;
  // Number of interrupt sources (1..NUM_SOURCES)
  parameter int NUM_SOURCES     = 6;               // Example: 6 sources
  // Number of hart contexts (only machine mode)
  parameter int NUM_CONTEXTS    = 1;               // Single machine context
  // Widths
  localparam int SOURCE_ID_WIDTH = $clog2(NUM_SOURCES+1);
  localparam int PRIORITY_WIDTH  = SOURCE_ID_WIDTH;
  localparam int THRESHOLD_WIDTH = 32;

  // Memory map offsets (relative to PLIC_BASE_ADDR)
  localparam int PRIORITY_BASE    = 'h000000;
  localparam int PRIORITY_MASK    = 'hFFF000;  // Upper bits mask for priority region
  localparam int PENDING_BASE     = 'h001000;
  localparam int PENDING_MASK     = 'hFFFF80;  // Mask for 128B pending region
  localparam int ENABLE_BASE      = 'h002000;
  localparam int ENABLE_MASK      = 'hFFFF80;  // Mask for 128B enable region
  localparam int CONTEXT_STRIDE   = 'h001000;
  localparam int THRESHOLD_OFFSET = 'h200000; // for hart/target 0
  localparam int CLAIM_OFFSET     = 'h200004; // for hart/target 0

  // Only machine-mode context defined
  typedef enum logic [0:0] {
    CONTEXT_MACHINE = 1'b0
  } plic_context_e;
endpackage