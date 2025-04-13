input_file=exception_test.s

riscv64-unknown-linux-gnu-as -mabi=ilp32 -march=rv32ic_zicsr -g ${input_file} -o ${input_file}.o

riscv64-unknown-linux-gnu-objcopy --verilog-data-width 4 -O verilog -j .text ${input_file}.o temp.hex
sed '1s/^/@/; s/ /\n/g' temp.hex > ../hex_files/test.mem
sed -i '1d' ../hex_files/test.mem
tr -d '\r' < ../hex_files/test.mem > temp && mv temp ../hex_files/test.mem

rm temp.hex
rm ${input_file}.o
