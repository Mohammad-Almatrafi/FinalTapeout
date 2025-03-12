RV_PREFIX := riscv64-unknown-linux-gnu-
RV_GCC := $(RV_PREFIX)gcc
RV_AS := $(RV_PREFIX)as
RV_LD := $(RV_PREFIX)ld
RV_OBJDUMP := $(RV_PREFIX)objdump
RV_bin2hex := $(RV_PREFIX)bin2hex
RV_OBJCOPY := $(RV_PREFIX)objcopy

RV_FLAGS_GCC     := -mabi=ilp32 -march=rv32i_zicsr -Wall -ffreestanding -nostdlib -nostartfiles -O
RV_FLAGS_AS      := -mabi=ilp32 -march=rv32i_zicsr
RV_FLAGS_OBJ     := -D -S -M no-aliases # --no-addresses  -M numeric
RV_FLAGS_LD      := -mabi=ilp32 -march=rv32i_zicsr -m elf32lriscv -nostdlib
RV_FLAGS_OBJCOPY := -O verilog

SRC_DIR := src/
BUILD_DIR := build/
HEX_DIR := hex_files/
FreeRTOS := FreeRTOS-Kernel/
FreeRTOS_INCLUDE := $(FreeRTOS)include/
FreeRTOS_RISCV_INCLUDE := $(FreeRTOS)portable/GCC/RISC-V/
FreeRTOS_CONFIG := $(SRC_DIR)
FreeRTOS_MEMMANG := FreeRTOS-Kernel/portable/MemMang/


SRCS := $(SRC_DIR)main.c \
        $(FreeRTOS)tasks.c \
        $(FreeRTOS)queue.c \
        $(FreeRTOS)list.c \
        $(FreeRTOS_RISCV_INCLUDE)port.c \
        $(FreeRTOS_MEMMANG)heap_4.c \
        includes/functions.c



# Generate .s files in the build directory
ASM_SRCS := $(patsubst $(SRC_DIR)%.c, $(BUILD_DIR)%.s, $(SRC_DIR)main.c)
ASM_SRCS += $(patsubst $(FreeRTOS)%.c, $(BUILD_DIR)%.s, $(FreeRTOS)list.c)
ASM_SRCS += $(patsubst $(FreeRTOS)%.c, $(BUILD_DIR)%.s, $(FreeRTOS)queue.c)
ASM_SRCS += $(patsubst $(FreeRTOS)%.c, $(BUILD_DIR)%.s, $(FreeRTOS)tasks.c)
ASM_SRCS += $(patsubst $(FreeRTOS_RISCV_INCLUDE)%.c, $(BUILD_DIR)%.s, $(FreeRTOS_RISCV_INCLUDE)port.c)
ASM_SRCS += $(FreeRTOS_RISCV_INCLUDE)portASM.S
ASM_SRCS += $(patsubst $(FreeRTOS_MEMMANG)%.c, $(BUILD_DIR)%.s, $(FreeRTOS_MEMMANG)heap_4.c)
ASM_SRCS += $(SRC_DIR)boot_loader.s
ASM_SRCS += $(BUILD_DIR)functions.s

# Generate .o files in the build directory
OBJS_SRCS := $(patsubst $(SRC_DIR)%.c, $(BUILD_DIR)%.o, $(SRC_DIR)main.c)
OBJS_SRCS += $(patsubst $(FreeRTOS)%.c, $(BUILD_DIR)%.o, $(FreeRTOS)list.c)
OBJS_SRCS += $(patsubst $(FreeRTOS)%.c, $(BUILD_DIR)%.o, $(FreeRTOS)queue.c)
OBJS_SRCS += $(patsubst $(FreeRTOS)%.c, $(BUILD_DIR)%.o, $(FreeRTOS)tasks.c)
OBJS_SRCS += $(patsubst $(FreeRTOS_RISCV_INCLUDE)%.c, $(BUILD_DIR)%.o, $(FreeRTOS_RISCV_INCLUDE)port.c)
OBJS_SRCS += $(patsubst $(FreeRTOS_RISCV_INCLUDE)%.S, $(BUILD_DIR)%.o, $(FreeRTOS_RISCV_INCLUDE)portASM.S)
OBJS_SRCS += $(patsubst $(FreeRTOS_MEMMANG)%.c, $(BUILD_DIR)%.o, $(FreeRTOS_MEMMANG)heap_4.c)
OBJS_SRCS += $(patsubst $(SRC_DIR)%.s, $(BUILD_DIR)%.o, $(SRC_DIR)boot_loader.s)
OBJS_SRCS += $(BUILD_DIR)functions.o

TARGET := $(BUILD_DIR)main.elf

INCLUDES := -I $(FreeRTOS_INCLUDE) -I $(FreeRTOS_RISCV_INCLUDE) -I $(FreeRTOS_CONFIG)

.PHONY: buildASM
buildASM: $(ASM_SRCS)

.PHONY: buildOBJS
buildOBJS: $(OBJS_SRCS)

.PHONY: buildHex
buildHex: $(HEX_DIR)main_text.hex $(HEX_DIR)main_data.hex $(BUILD_DIR)main.dump $(HEX_DIR)main_text_ver.mem $(HEX_DIR)main_data_ver.mem

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(TARGET): $(SRC_DIR)qemu_linker.ld $(OBJS_SRCS)
	$(RV_LD) $(RV_FLAGS_LD) -T $< -o $@ $(OBJS_SRCS)

# Rule to compile .c files in src/ to .s files
$(BUILD_DIR)%.s: $(SRC_DIR)%.c | $(BUILD_DIR)
	$(RV_GCC) $(RV_FLAGS_GCC) -g -S $< -o $@ $(INCLUDES)

# Rule to compile .c files in FreeRTOS/ to .s files
$(BUILD_DIR)%.s: $(FreeRTOS)%.c | $(BUILD_DIR)
	$(RV_GCC) $(RV_FLAGS_GCC) -g -S $< -o $@ $(INCLUDES)

# Rule to compile .c files in FreeRTOS_RISCV_INCLUDE/ to .s files
$(BUILD_DIR)%.s: $(FreeRTOS_RISCV_INCLUDE)%.c | $(BUILD_DIR)
	$(RV_GCC) $(RV_FLAGS_GCC) -g -S $< -o $@ $(INCLUDES)

$(BUILD_DIR)%.s: $(FreeRTOS_MEMMANG)%.c | $(BUILD_DIR)
	$(RV_GCC) $(RV_FLAGS_GCC) -g -S $< -o $@ $(INCLUDES)

# Rule to assemble .s files into .o files
$(BUILD_DIR)%.o: $(BUILD_DIR)%.s
	$(RV_AS) $(RV_FLAGS_AS) $(INCLUDES) -g $< -o $@

$(BUILD_DIR)portASM.preprocessed.S: $(FreeRTOS_RISCV_INCLUDE)portASM.S
	$(RV_GCC) $(RV_FLAGS_GCC) -E -I FreeRTOS-Kernel/include/ -I FreeRTOS-Kernel/portable/GCC/RISC-V/ -I src/ $^ -o $@

$(BUILD_DIR)portASM.o: $(BUILD_DIR)portASM.preprocessed.S
	$(RV_AS) $(RV_FLAGS_AS) $(INCLUDES) -g $< -o $@

$(BUILD_DIR)boot_loader.o: $(SRC_DIR)boot_loader.s
	$(RV_AS) $(RV_FLAGS_AS) $(INCLUDES) -g $< -o $@

$(BUILD_DIR)functions.s: includes/functions.c
	$(RV_GCC) -mabi=ilp32 -march=rv32i_zicsr -Wall -ffreestanding -nostdlib -nostartfiles -g -S $< -o $@ $(INCLUDES)


$(BUILD_DIR)main.dump: $(BUILD_DIR)main.elf
	$(RV_OBJDUMP) $^ $(RV_FLAGS_OBJ) >> $@

$(HEX_DIR)main_text.hex $(HEX_DIR)main_data.hex: $(TARGET)
	$(RV_OBJCOPY) -j .text $(RV_FLAGS_OBJCOPY) $^ $(HEX_DIR)main_text.hex
	$(RV_OBJCOPY) -j .data $(RV_FLAGS_OBJCOPY) $^ $(HEX_DIR)main_data.hex

$(HEX_DIR)main_text_ver.mem $(HEX_DIR)main_data_ver.mem: $(TARGET)
	$(RV_OBJCOPY) --verilog-data-width 4 -O verilog -j .text build/main.elf $(HEX_DIR)temp.hex
	sed '1s/^/@/; s/ /\n/g' $(HEX_DIR)temp.hex > $(HEX_DIR)main_text_ver.mem
	rm $(HEX_DIR)temp.hex
	$(RV_OBJCOPY) --verilog-data-width 4 -O verilog -j .data build/main.elf $(HEX_DIR)temp.hex
	sed '1s/^/@/; s/ /\n/g' $(HEX_DIR)temp.hex > $(HEX_DIR)main_data_ver.mem
	rm $(HEX_DIR)temp.hex




.PHONY: debug
debug: $(BUILD_DIR)/main.elf
	qemu-system-riscv32 -nographic -serial mon:stdio -machine virt -s -S -bios build/main.elf

.PHONY: gdb
gdb: 
	gdb-multiarch build/main.elf -ex "target remote localhost:1234"

.PHONY: clean
clean:
	clear
	@rm -rf $(BUILD_DIR)
	@mkdir -p $(BUILD_DIR)

