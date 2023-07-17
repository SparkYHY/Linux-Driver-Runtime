insmod isl_org.ko

echo 1 > /sys/bus/i2c/drivers/isl29023/2-0044/power_state
echo 5 > /sys/bus/i2c/drivers/isl29023/2-0044/mode
