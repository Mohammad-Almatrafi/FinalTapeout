import serial
import time
# import keyboard

# Replace '/dev/ttyUSB0' with your serial port or try use '/dev/ttyS0'
ser = serial.Serial('/dev/ttyUSB2', baudrate=9600)

reading, writing = False, False
user_answer_W = input("do you want to write data (send message) ? (y/n)\t")
user_answer_R = input("do you want to read data (read message) ? (y/n)\t")
reading = user_answer_R.lower()=='y'
writing = user_answer_W.lower()=='y'

start_time = time.time()
duration = 300 # 300 sec = 5 min

while True:
    # Stop running after 5 minutes
    elapsed_time = time.time() - start_time
    if elapsed_time >= duration:
        print(f"{duration/60} minutes have passed. Stopping the program.\nre-run the program to test again.")
        break

    # if keyboard.is_pressed('q'):
         #print("quit successfully")
         #reading, writing = False, False
        # break
     #NOTE: but I think you need to access the keyboard as root 

    # Write data
    if writing:
        # ser.write('Hello'.encode('Ascii'))  # Send a message
        ser.write(b'\xFF') # send hex value 0xA5
    
    # Read data
    if reading:
        data = ser.read(1)  # Read a Character of data
        print(f"data = raw_data: {data}, hexa: {data.hex()}") # utf-8 or Ascii
    
    time.sleep(0.1)
