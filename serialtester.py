import serial

# Initialize serial connection
ser = serial.Serial(
    port='/dev/ttyUSB0',  # Replace with your actual port (e.g., COM3 on Windows, /dev/ttyACM0 on Linux)
    baudrate=9600,        # Baud rate (adjust as needed)
    timeout=1             # Read timeout in seconds
)

print(f"Connected to: {ser.name}")  # Confirm connection

# Example: Read one line from serial
data = ser.readline().decode('utf-8').strip()
print("Received:", data)

# Close the connection when done
ser.close()
