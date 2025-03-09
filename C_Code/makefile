RV_PREFIX := riscv64-unknown-linux-gnu-
RV_GCC := $(RV_PREFIX)gcc
RV_AS := $(RV_PREFIX)as
RV_LD := $(RV_PREFIX)ld
RV_OBJDUMP := $(RV_PREFIX)objdump
RV_bin2hex := $(RV_PREFIX)bin2hex
RV_FLAGS_GCC := -mabi=ilp32 -march=rv32i_zicsr
RV_FLAGS_OBJ := -S -M no-aliases#--no-addresses  -M numeric
RV_FLAGS_LD := -m elf32lriscv
RV_FLAGS_BIN2HEX := --bit-width 32
SRC_DIR := src/
BUILD_DIR := build/
HEX_DIR := hex_files/

all: $(BUILD_DIR)main.hex

$(BUILD_DIR)main.elf: $(SRC_DIR)qemu_linker.ld $(BUILD_DIR)main.o $(BUILD_DIR)boot_loader.o 
	$(RV_LD) $(RV_FLAGS_LD) -T $< -o $@ $(BUILD_DIR)main.o $(BUILD_DIR)boot_loader.o

$(BUILD_DIR)main.o: $(BUILD_DIR)main.asm
	$(RV_AS) $(RV_FLAGS) -g $^ -o $@

$(BUILD_DIR)boot_loader.o: $(SRC_DIR)boot_loader.s
	$(RV_AS) $(RV_FLAGS_GCC) -g $^ -o $@

$(BUILD_DIR)boot_loader.hex: $(BUILD_DIR)boot_loader.o
	eval $(RV_OBJDUMP) $^ $(RV_FLAGS_OBJ) >> $@

$(BUILD_DIR)main.dump: $(BUILD_DIR)main.elf
	eval $(RV_OBJDUMP) $^ $(RV_FLAGS_OBJ) >> $@

$(BUILD_DIR)main.asm: $(SRC_DIR)main.c
	$(RV_GCC) $(RV_FLAGS_GCC) -g $^ -o $@ -S

$(BUILD_DIR)main.hex: $(BUILD_DIR)main.elf
	$(RV_bin2hex) $(RV_FLAGS_BIN2HEX) $^ $@

.PHONY:clean
clean:
	rm -r build
	mkdir build