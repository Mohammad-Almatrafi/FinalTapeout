#!/usr/bin/env python3
import sys

def convert_hex_file(input_filename, output_filename):
    words = []
    with open(input_filename, "r") as infile:
        for line in infile:
            line = line.strip()
            # Skip empty lines and lines starting with '@' (addresses)
            if not line or line.startswith("@"):
                continue
            # Remove all spaces to get a continuous string of hex digits.
            hexdata = line.replace(" ", "")
            # Process every 8 hex digits (4 bytes) as one word.
            for i in range(0, len(hexdata), 8):
                word = hexdata[i:i+8]
                if len(word) == 8:
                    # Split into 2-digit bytes, reverse their order, and join them.
                    bytes_list = [word[j:j+2] for j in range(0, 8, 2)]
                    reversed_word = "".join(bytes_list[::-1])
                    words.append(reversed_word.upper())
    # Write the results to the output file.
    with open(output_filename, "w") as outfile:
        for word in words:
            outfile.write(word + "\n")

def main():
    if len(sys.argv) != 3:
        print("Usage: {} <input_hex_file> <output_hex_file>".format(sys.argv[0]))
        sys.exit(1)
    convert_hex_file(sys.argv[1], sys.argv[2])

if __name__ == "__main__":
    main()
