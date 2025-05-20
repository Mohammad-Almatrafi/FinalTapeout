import serial
import time

# Serial configuration
SERIAL_PORT = "/dev/ttyUSB2"  # Change this to your actual port (e.g., "COM3" on Windows)
BAUD_RATE = 9600

path_to_hex_file = "./src/hex_files/incrementer.mem"
# Open serial connection
ser = serial.Serial(SERIAL_PORT, BAUD_RATE, timeout = 1)
while(True):
    x = input("start programming ? (y/n): ")
    if x.lower()=='y':
        break
with open(path_to_hex_file) as f:
    lines = [line for line in f if line.strip()]  
    # num_inst = len(lines)
    # num_inst_hex = num_inst.to_bytes(1,"little")
    # ser.write(num_inst_hex)
    # time.sleep(1)
    # print(f"number of instructions 0x{num_inst_hex.hex()}")
    for i, line in enumerate(lines,start=1):
        bytes_to_send = line.strip().lstrip("0x")  # Remove "0x" if present
        bytes_to_send = bytes_to_send.zfill(8)  # Ensure it's always 8 characters

        # Extract bytes
        byte0 = bytes.fromhex(bytes_to_send[-2:])
        byte1 = bytes.fromhex(bytes_to_send[-4:-2])
        byte2 = bytes.fromhex(bytes_to_send[-6:-4])
        byte3 = bytes.fromhex(bytes_to_send[-8:-6])

        # Send bytes individually
        ser.write(byte0)
        time.sleep(0.1)
        ser.write(byte1)
        time.sleep(0.1)
        ser.write(byte2)
        time.sleep(0.1)
        ser.write(byte3)
        time.sleep(0.1)

        print(f"line: {i}: Sent: {byte3.hex()} {byte2.hex()} {byte1.hex()} {byte0.hex()}")


for k in range(1,128-i+1):
    ser.write(b'\x00')
    time.sleep(0.01)
    ser.write(b'\x00')
    time.sleep(0.01)
    ser.write(b'\x00')
    time.sleep(0.01)
    ser.write(b'\x00')
    time.sleep(0.01)
    # print(f'fill line number {i+k}')
    


# Close serial connection
ser.close()
print("Transmission complete.")