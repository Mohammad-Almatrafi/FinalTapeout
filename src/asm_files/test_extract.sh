input_file=a_ext.asm

riscv64-unknown-linux-gnu-as -mabi=ilp32 -march=rv32ia_zicsr ${input_file} -o ${input_file}.o
riscv64-unknown-linux-gnu-ld -mabi=ilp32 -march=rv32ia_zicsr -m elf32lriscv -nostdlib -T linker.ld -o ${input_file}.elf ${input_file}.o

riscv64-unknown-linux-gnu-objdump ${input_file}.elf -D -S -M no-aliases -M numeric > ${input_file}.dump
# --no-addresses  

riscv64-unknown-linux-gnu-objcopy --verilog-data-width 4 -O verilog -j .init ${input_file}.elf temp.hex

sed '1s/^/@/; s/ /\n/g' temp.hex > ../hex_files/test.mem
sed -i '1d' ../hex_files/test.mem
tr -d '\r' < ../hex_files/test.mem > temp && mv temp ../hex_files/test.mem


riscv64-unknown-linux-gnu-objcopy --verilog-data-width 4 -O verilog -j .text ${input_file}.elf temp.hex

sed '1s/^/@/; s/ /\n/g' temp.hex > ../hex_files/fib.mem
tr -d '\r' < ../hex_files/fib.mem > temp && mv temp ../hex_files/fib.mem
sed -i '1d' ../hex_files/fib.mem

rm temp.hex
rm ${input_file}.o
rm ${input_file}.elf
