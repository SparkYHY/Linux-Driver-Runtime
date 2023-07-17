insmod mag3110.ko

echo 1 > /sys/devices/virtual/input/input7/enable
evtest /dev/input/event3
