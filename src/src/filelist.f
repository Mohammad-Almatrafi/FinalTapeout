# Filelist for VCS simulation



# lib that many module accesses should be compiled first
soc/core/lib.sv

# Core files
soc/core/alignment_units.sv
soc/core/alu_control.sv
soc/core/alu.sv
soc/core/branch_controller.sv
soc/core/control_unit.sv
soc/core/data_path.sv
soc/core/imm_gen.sv
soc/core/main_control.sv
soc/core/program_counter.sv
soc/core/reg_file.sv
soc/core/rom.sv
soc/core/forwarding_unit.sv
soc/core/hazard_controller.sv
soc/core/pipeline_controller.sv
soc/core/rv32i_top.sv

# Wishbone interconnect files
soc/WishboneInterconnect/wb_intercon_1.2.2-r1/wb_mux.v
soc/WishboneInterconnect/wb_intercon.sv
soc/WishboneInterconnect/wb_intercon.svh
soc/WishboneInterconnect/wishbone_controller.sv

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

# sram 
# verilog model for simulation
# sram/ts1da32kx32_100a_tc.v

# verilog models for prototyping
soc/core/data_mem.sv


# rv32i soc top
soc/rv32i_soc.sv

# Testbench files
tb/rv32i_soc_tb.sv


# Optionally, include any other files you want for the simulation.
