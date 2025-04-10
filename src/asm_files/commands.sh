input_file=decompress_test.asm
input_file2=decompress_compare_test.asm

riscv64-unknown-linux-gnu-as -mabi=ilp32 -march=rv32ic -g ${input_file} -o ${input_file}.o

riscv64-unknown-linux-gnu-objcopy --verilog-data-width 2 -O verilog -j .text ${input_file}.o temp.hex
sed '1s/^/@/; s/ /\n/g' temp.hex > ../hex_files/compress_test.mem
sed -i '1d' ../hex_files/compress_test.mem
tr -d '\r' < ../hex_files/compress_test.mem > temp && mv temp ../hex_files/compress_test.mem



riscv64-unknown-linux-gnu-as -mabi=ilp32 -march=rv32i -g ${input_file2} -o ${input_file2}.o

riscv64-unknown-linux-gnu-objcopy --verilog-data-width 4 -O verilog -j .text ${input_file2}.o temp.hex
sed '1s/^/@/; s/ /\n/g' temp.hex > ../hex_files/compress_compare_test.mem
sed -i '1d' ../hex_files/compress_compare_test.mem
tr -d '\r' < ../hex_files/compress_compare_test.mem > temp && mv temp ../hex_files/compress_compare_test.mem

rm temp.hex
rm ${input_file}.o
rm ${input_file2}.o
