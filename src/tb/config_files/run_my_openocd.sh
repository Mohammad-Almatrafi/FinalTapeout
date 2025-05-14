# 1) Free the FTDI port
pkill openocd
pkill hw_server  
sudo modprobe -r ftdi_sio usbserial

# 2) Launch OpenOCD as JTAG server
openocd \
  -s ~/.platformio/packages/tool-openocd-riscv-chipsalliance \
  -s ~/.platformio/packages/framework-wd-riscv-sdk/board/nexys_a7_eh1 \
  -s /usr/share/openocd/scripts \
  -f /home/it/RivRtos/src/tb/config_files/debug.cfg \
  -c "ftdi tdo_sample_edge rising" \
  -c "adapter speed 1000" \
  -c "riscv set_mem_access abstract" \
  -c "riscv set_command_timeout_sec 20" \
  -c "init" \
  -c "reset halt" \
  -c "wait_halt 500"