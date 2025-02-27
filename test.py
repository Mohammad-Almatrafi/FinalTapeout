with open("src/hex_files/fib.mem") as f:
    for i, line in enumerate(f):
        hex_value = line.strip()[2:]
        bytes_to_send = bytes.fromhex(hex_value)
        print(f"{i}: Raw bytes: {bytes_to_send}")
        print(f"{i}: Hex format: {bytes_to_send.hex()}")
        print(f"{i}: Original value: {line.strip()}")
        # print(f"{i}: individual bytes: {bytes_to_send[0].hex()}, {bytes_to_send[1].hex()}, {bytes_to_send[2].hex()}, {bytes_to_send[3].hex()}")
        # ser.write(bytes_to_send)
        for byte in bytes_to_send:
            printed = f"\x{byte}"
            print(b'{printed}')