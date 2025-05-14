# ───────────────
# Toolchain Vars
# ───────────────
VCS           := vcs -full64 -sverilog
VCS_FLAGS     := -F ../filelist.f \
				 /home/Mohammed_Almatrafi/FTO/FinalTapeout/src/tb/SimJTAG.cc /home/Mohammed_Almatrafi/FTO/FinalTapeout/src/tb/remote_bitbang.cc \
                 -cc g++ \
				 -timescale=1ns/1ps \
                 -CFLAGS "-std=c++11 -Itb" \
                 -debug_all -debug_pp -debug_access+all+xrw \
                 -kdb +vcs+lic+wait \
                 -cm line+cond+fsm \
                 -o simv

OPENOCD       := openocd
OPENOCD_CFG   := tb/config_files/remote_bitbang.cfg

BUILD_DIR     := build
GDB           := riscv32-unknown-elf-gdb
GDB_ELF       := $(BUILD_DIR)/JTAG_TEST.elf

CC      = riscv32-unknown-elf-gcc
OBJCOPY = riscv32-unknown-elf-objcopy
ASM_DIR = asm_files


CFLAGS = -march=rv32imc_zicsr -mabi=ilp32 -nostdlib -Wall -g
LDSCRIPT = tb/scripts/linker.ld

TARGET   = JTAG_TEST
SRC      = $(ASM_DIR)/JTAG_TEST.S


# ───────────────
# Default target
# ───────────────
.PHONY: all
all: all_Test $(BUILD_DIR)/simv

# ───────────────
# Build the simulator
# ───────────────
$(BUILD_DIR): 
	mkdir $(BUILD_DIR)

$(BUILD_DIR)/simv: $(BUILD_DIR)
	@echo ">>> Building simv with VCS..."
	cd $(BUILD_DIR) && $(VCS) $(VCS_FLAGS)
	

# ───────────────
# Remove stale database directory
# ───────────────
.PHONY: clean_daidir
clean_daidir:
	@echo ">>> Removing stale simv.daidir (if any)…"
	-@ cd $(BUILD_DIR) && rm -rf simv.daidir

# ───────────────
# Run each component
# ───────────────
.PHONY: run_simv openocd run_gdb
run_simv: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/simv
	@echo ">>> Launching simv…"
	cd $(BUILD_DIR) && ./simv 

openocd:
	@echo ">>> Launching OpenOCD…"
	$(OPENOCD) -f $(OPENOCD_CFG) 

run_gdb:
	@echo ">>> Launching GDB…"
	$(GDB) $(GDB_ELF) -ex "target remote localhost:1324"

kill:
	killall -9 simv
	killall -9 openocd
.PHONY: gen_fst
gen_fst: $(BUILD_DIR)/waveform.vcd
	vcd2fst -v $(BUILD_DIR)/waveform.vcd -f $(BUILD_DIR)/waveform.fst
	rm $(BUILD_DIR)/waveform.vcd

# Build JTAG Test


$(BUILD_DIR)/$(TARGET).elf: $(SRC) $(BUILD_DIR)
	$(CC) $(CFLAGS) -T $(LDSCRIPT) -o $@ $(SRC)

# Generate the assembly file for reference 
$(BUILD_DIR)/$(TARGET).dis: $(BUILD_DIR)/$(TARGET).elf
	riscv32-unknown-elf-objdump -d $(BUILD_DIR)/$(TARGET).elf > $(BUILD_DIR)/$(TARGET).dis

# Extract .text section for instruction memory
$(BUILD_DIR)/inst.hex: $(BUILD_DIR)/$(TARGET).elf
	$(OBJCOPY) -O verilog -j .text $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/inst.hex
	tb/scripts/convert_hex $(BUILD_DIR)/inst.hex $(BUILD_DIR)/inst.hex

# Extract .data, .rodata, .bss (merged) for data memory
$(BUILD_DIR)/data.hex: $(BUILD_DIR)/$(TARGET).elf
	$(OBJCOPY) -O verilog -j .data -j .rodata -j .bss $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/data.hex
	tb/scripts/convert_hex $(BUILD_DIR)/data.hex $(BUILD_DIR)/data.hex
.PHONY: all_Test clean_Test clean

all_Test: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).dis $(BUILD_DIR)/inst.hex $(BUILD_DIR)/data.hex

clean_Test:
	cd build & rm -f *.elf *.hex *.bin 

clean:
	rm -rf build
