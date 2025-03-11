RV_PREFIX := riscv64-unknown-linux-gnu-
RV_GCC := $(RV_PREFIX)gcc
RV_AS := $(RV_PREFIX)as
RV_LD := $(RV_PREFIX)ld
RV_OBJDUMP := $(RV_PREFIX)objdump
RV_bin2hex := $(RV_PREFIX)bin2hex

RV_FLAGS_GCC := -mabi=ilp32 -march=rv32i_zicsr -lgcc -lc
RV_FLAGS_AS := -mabi=ilp32 -march=rv32i_zicsr
RV_FLAGS_OBJ := -S -M no-aliases # --no-addresses  -M numeric
RV_FLAGS_LD := -mabi=ilp32 -march=rv32i_zicsr -m elf32lriscv -L/opt/riscv/riscv64-unknown-linux-gnu/lib -L/opt/riscv/lib/gcc/riscv64-unknown-linux-gnu/14.2.0

RV_FLAGS_BIN2HEX := --bit-width 32

SRC_DIR := src/
BUILD_DIR := build/
HEX_DIR := hex_files/
FreeRTOS := FreeRTOS-Kernel/
FreeRTOS_INCLUDE := $(FreeRTOS)include/
FreeRTOS_RISCV_INCLUDE := $(FreeRTOS)portable/GCC/RISC-V/
FreeRTOS_CONFIG := $(SRC_DIR)
FreeRTOS_MEMMANG := FreeRTOS-Kernel/portable/MemMang/


# /opt/riscv/bin/../lib/gcc/riscv64-unknown-linux-gnu/14.2.0/lib32/ilp32/libgcc.a
# /opt/riscv/bin/../sysroot/usr/lib32/ilp32/libc.a

SRCS := $(SRC_DIR)main.c \
        $(FreeRTOS)tasks.c \
        $(FreeRTOS)queue.c \
        $(FreeRTOS)list.c \
        $(FreeRTOS_RISCV_INCLUDE)port.c \
		$(FreeRTOS_MEMMANG)heap_4.c


# Generate .s files in the build directory
ASM_SRCS := $(patsubst $(SRC_DIR)%.c, $(BUILD_DIR)%.s, $(SRC_DIR)main.c)
ASM_SRCS += $(patsubst $(FreeRTOS)%.c, $(BUILD_DIR)%.s, $(FreeRTOS)list.c)
ASM_SRCS += $(patsubst $(FreeRTOS)%.c, $(BUILD_DIR)%.s, $(FreeRTOS)queue.c)
ASM_SRCS += $(patsubst $(FreeRTOS)%.c, $(BUILD_DIR)%.s, $(FreeRTOS)tasks.c)
ASM_SRCS += $(patsubst $(FreeRTOS_RISCV_INCLUDE)%.c, $(BUILD_DIR)%.s, $(FreeRTOS_RISCV_INCLUDE)port.c)
ASM_SRCS += $(FreeRTOS_RISCV_INCLUDE)portASM.S
ASM_SRCS += $(patsubst $(FreeRTOS_MEMMANG)%.c, $(BUILD_DIR)%.s, $(FreeRTOS_MEMMANG)heap_4.c)

# Generate .o files in the build directory
OBJS_SRCS := $(patsubst $(SRC_DIR)%.c, $(BUILD_DIR)%.o, $(SRC_DIR)main.c)
OBJS_SRCS += $(patsubst $(FreeRTOS)%.c, $(BUILD_DIR)%.o, $(FreeRTOS)list.c)
OBJS_SRCS += $(patsubst $(FreeRTOS)%.c, $(BUILD_DIR)%.o, $(FreeRTOS)queue.c)
OBJS_SRCS += $(patsubst $(FreeRTOS)%.c, $(BUILD_DIR)%.o, $(FreeRTOS)tasks.c)
OBJS_SRCS += $(patsubst $(FreeRTOS_RISCV_INCLUDE)%.c, $(BUILD_DIR)%.o, $(FreeRTOS_RISCV_INCLUDE)port.c)
OBJS_SRCS += $(patsubst $(FreeRTOS_RISCV_INCLUDE)%.S, $(BUILD_DIR)%.o, $(FreeRTOS_RISCV_INCLUDE)portASM.S)
OBJS_SRCS += $(patsubst $(FreeRTOS_MEMMANG)%.c, $(BUILD_DIR)%.o, $(FreeRTOS_MEMMANG)heap_4.c)

TARGET := $(BUILD_DIR)main.elf

INCLUDES := -I $(FreeRTOS_INCLUDE) -I $(FreeRTOS_RISCV_INCLUDE) -I $(FreeRTOS_CONFIG)

all: $(BUILD_DIR)main.hex

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

$(BUILD_DIR)main.dump: $(TARGET)
	$(RV_OBJDUMP) $^ $(RV_FLAGS_OBJ) >> $@

$(BUILD_DIR)main.hex: $(TARGET)
	$(RV_bin2hex) $(RV_FLAGS_BIN2HEX) $^ $@

.PHONY: debug
debug: $(BUILD_DIR)/main.elf
	qemu-system-riscv32 -nographic -serial mon:stdio -machine virt -s -S -bios build/main.elf

.PHONY: gdb
gdb: 
	gdb-multiarch main.elf -ex "target remote localhost:1234"

.PHONY: clean
clean:
	clear
	rm -rf $(BUILD_DIR)
	mkdir -p $(BUILD_DIR)

