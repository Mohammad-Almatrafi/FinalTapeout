RV_PREFIX := riscv64-unknown-linux-gnu-
RV_GCC := $(RV_PREFIX)gcc
RV_AS := $(RV_PREFIX)as
RV_FLAGS := -mabi=ilp32 -march=rv32i_zicsr
RV_OBJDUMP := $(RV_PREFIX)objdump
RV_FLAGS_OBJ := -S --no-addresses -M no-aliases -M numeric

main.asm: main.c
	$(RV_GCC) $(RV_FLAGS) main.c -o main.asm -S

main.o: main.c
	$(RV_GCC) $(RV_FLAGS) main.c -o main.o -S

main.elf: main.o
	$(RV_AS) $(RV_FLAGS) main.o -o main.elf


.PHONY:clean

clean:
	rm  *.o *.elf *.hex *.asm

main.hex: main.elf
	eval $(RV_OBJDUMP) main.elf $(RV_FLAGS_OBJ) >> main.hex
# 


# start.hex: start.elf
# 	eval riscv64-unknown-linux-gnu-objdump start.elf -S >> start.hex

# start.elf: start.s
# 	$(RV_AS) $(RV_FLAGS) start.s -o start.elf