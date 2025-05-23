# Filelist for VCS simulation
tb/SimJTAG.sv

# -timescale=1ns/10ps

+define+tracer
+define+VCS_SIM
+define+JTAG
# +define+JTAG_verf
+define+dump_wave
+define+dump_mem

# lib that many module accesses should be compiled first 
soc/core/datapath/lib.sv
soc/uncore/debug/debug_pkg.sv
tb/pkg.sv
tb/tracer_pkg.sv

# Core files
# ------ datapath ------
# compressed
soc/dump_mem.sv
soc/core/datapath/compressed/compressed_type.sv
soc/core/datapath/compressed/decompress.sv
soc/core/datapath/compressed/pc_corrector.sv
soc/core/datapath/compressed/pre_decode.sv
soc/core/datapath/compressed/stall_compressed.sv

# csr_Blocks
soc/core/datapath/csr_Blocks/control_CSR.sv
soc/core/datapath/csr_Blocks/csr_forwarding.sv
soc/core/datapath/csr_Blocks/csr_reg.sv
soc/core/datapath/csr_Blocks/csr_top.sv
soc/core/datapath/csr_Blocks/int_control.sv
soc/core/datapath/csr_Blocks/mret_adr_sel.sv
soc/core/datapath/csr_Blocks/mret_ecall_type.sv


soc/core/datapath/align_except.sv
soc/core/datapath/alignment_units.sv
soc/core/datapath/alu.sv
soc/core/datapath/data_mem.sv
soc/core/datapath/data_path.sv
soc/core/datapath/imm_gen.sv
soc/core/datapath/program_counter.sv
soc/core/datapath/reg_file.sv
soc/core/datapath/rom.sv
soc/core/datapath/atomic_access_controller.sv
#------   -------

#------ controllers ------
soc/core/controllers/alu_control.sv
soc/core/controllers/branch_controller.sv
soc/core/controllers/control_unit.sv
soc/core/controllers/forwarding_unit.sv
soc/core/controllers/hazard_controller.sv
soc/core/controllers/main_control.sv
soc/core/controllers/pipeline_controller.sv
soc/core/controllers/core_dbg_fsm.sv
#------   -------
soc/core/datapath/int_mul.sv

soc/core/datapath/int_div_rem.sv

soc/core/rv32i_top.sv





# Wishbone interconnect files
soc/WishboneInterconnect/wb_intercon_1.2.2-r1/wb_mux.v
soc/WishboneInterconnect/wb_intercon.sv
soc/WishboneInterconnect/wishbone_controller.sv

// soc/WishboneInterconnect/wb_intercon_1.2.2-r1/wb_mux.v
// soc/WishboneInterconnect/wb_intercon.sv
// ##soc/WishboneInterconnect/wb_intercon.svh
// soc/WishboneInterconnect/wishbone_controller.sv




# Peripheral files
soc/uncore/gpio/gpio_defines.v
soc/uncore/gpio/bidirec.sv
soc/uncore/gpio/gpio_top.sv
soc/uncore/spi/fifo4.v
soc/uncore/spi/simple_spi_top.v
soc/uncore/uart/uart_defines.v
soc/uncore/uart/raminfr.v
soc/uncore/uart/uart_receiver.v
soc/uncore/uart/uart_regs.v
soc/uncore/uart/uart_rfifo.v
soc/uncore/uart/uart_sync_flops.v
soc/uncore/uart/uart_tfifo.v
soc/uncore/uart/uart_top.v
soc/uncore/uart/uart_transmitter.v
soc/uncore/uart/uart_wb.v

soc/uncore/clint.sv

soc/uncore/debug/debug_top.sv
soc/uncore/debug/dm.sv
soc/uncore/debug/dtm.sv
soc/uncore/i2c/rtl/i2c_master_defines.v
soc/uncore/i2c/rtl/i2c_master_bit_ctrl.v
soc/uncore/i2c/rtl/i2c_master_byte_ctrl.v
soc/uncore/i2c/rtl/i2c_master_top.v
soc/uncore/ptc/ptc_defines.v
soc/uncore/ptc/ptc_top.v


# rv32i soc top
soc/rv32i_soc.sv

# Testbench fil
tb/tracer.sv
tb/rv32i_soc_tb.sv


# Optionally, include any other files you want for the simulation.

# soc/uncore/debug/bscan_tap.sv

