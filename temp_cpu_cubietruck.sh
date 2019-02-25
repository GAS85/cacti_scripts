#!/bin/bash

cpuT="$(printf "%0.2f\n" "$(echo "$(cat /etc/armbianmonitor/datasources/pmictemp)" / 1000 | bc -l)")"
hddT="$(cat /tmp/hdd.term)"
battT="$(printf "%0.2f\n" "$(echo "$(cat /sys/class/power_supply/battery/temp)"*0.125 | bc -l)")"

batt_capacity="$(cat /sys/class/power_supply/battery/capacity)"
batt_volt="$(printf "%0.3f\n" "$(echo "$(cat /sys/class/power_supply/battery/voltage_now)" / 1000000 | bc -l)")"
batt_cur="$(printf "%0.3f\n" "$(echo "$(cat /sys/class/power_supply/battery/current_now)" / 1000000 | bc -l)")"
batt_power="$(printf "%0.3f\n" "$(echo $batt_volt*$batt_cur | bc -l)")" #P in W
batt_stat="$(cat /sys/class/power_supply/battery/status)"

ac_p="$(cat /sys/class/power_supply/ac/present)"
ac_volt="$(printf "%0.3f\n" "$(echo "$(cat /sys/class/power_supply/ac/voltage_now)" / 1000000 | bc -l)")" #U in V
ac_cur="$(printf "%0.3f\n" "$(echo "$(cat /sys/class/power_supply/ac/current_now)" / 1000000 | bc -l)")" #U in A
ac_power="$(printf "%0.3f\n" "$(echo $ac_volt*$ac_cur | bc -l)")" #P in W

usb_p="$(cat /sys/class/power_supply/usb/present)"
usb_volt="$(printf "%0.3f\n" "$(echo "$(cat /sys/class/power_supply/usb/voltage_now)" / 1000 | bc -l)")"
usb_cur="$(printf "%0.3f\n" "$(echo "$(cat /sys/class/power_supply/usb/current_now)" / 1000 | bc -l)")"
usb_power="$(printf "%0.3f\n" "$(echo $usb_volt*$usb_cur | bc -l)")" #P in W

echo cpu:$cpuT \
hddTemp:$hddT \
battTemp:$battT \
ac:$ac_p \
acVolt:$ac_volt \
acCur:$ac_cur \
acPow:$ac_power \
battStat:$batt_stat \
battVolt:$batt_volt \
battCur:$batt_cur \
battCapacity:$batt_capacity \
battPow:$batt_power \
usb:$usb_p \
usbVolt:$usb_volt \
usbCur:$usb_cur \
usbPow:$usb_power

exit 0
