#!/bin/bash

# Define the input file
input_file="compress_test.mem"
# Define the output file
output_file="binary_values.txt"

# Clear the output file if it exists
> "$output_file"

# Read each line from the input file
while IFS= read -r hex_value; do
  # Convert the hexadecimal value to binary and write it to the output file
  printf "%016d\n" "$(echo "obase=2; ibase=16; $hex_value" | bc)" >> "$output_file"
done < "$input_file"

echo "Conversion complete. Check the '$output_file' for the binary values."

