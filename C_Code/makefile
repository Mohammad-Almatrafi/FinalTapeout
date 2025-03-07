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


main.elf: main.o boot_loader.o linker.ld
	$(RV_LD) $(RV_FLAGS_LD) -T linker.ld -o main.elf main.o boot_loader.o

main.o: main.asm
	$(RV_AS) $(RV_FLAGS) main.asm -o main.o

boot_loader.o: boot_loader.s
	$(RV_AS) $(RV_FLAGS_GCC) boot_loader.s -o boot_loader.o

boot_loader.hex: boot_loader.o
	eval $(RV_OBJDUMP) boot_loader.o $(RV_FLAGS_OBJ) >> boot_loader.hex

main.hex: main.elf
	eval $(RV_OBJDUMP) main.elf $(RV_FLAGS_OBJ) >> main.hex

main.asm: main.c
	$(RV_GCC) $(RV_FLAGS_GCC) main.c -o main.asm -S

main.elf2hex: main.elf
	
	$(RV_bin2hex) $(RV_FLAGS_BIN2HEX) main.elf main.elf2hex

.PHONY:clean
clean:
	rm  *.o *.elf *.hex *.asm