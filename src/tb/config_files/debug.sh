#!/bin/bash
# Automatically free FTDI and launch OpenOCD

USB_PATH=$(for d in /sys/bus/usb/devices/*; do
  grep -q "0403" "$d/idVendor" 2>/dev/null && echo "$d"
done)

if [ -z "$USB_PATH" ]; then
  echo "FTDI device not found."
  exit 1
fi

echo "Found FTDI at $USB_PATH"

for intf in ${USB_PATH}:*; do
  echo "Unbinding $intf..."
  echo -n "$(basename $intf)" | sudo tee /sys/bus/usb/drivers/usb/unbind
done

# Now start OpenOCD
sudo ./run_my_openocd.sh
