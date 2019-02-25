#!/bin/bash
cpuT="$(awk '{printf("%d",$1/1000)}' </etc/armbianmonitor/datasources/pmictemp)"
hddT="$(cat /tmp/hdd.term)"
batt_capacity="$(cat /sys/class/power_supply/battery/capacity)"
battT="$(cat /sys/class/power_supply/battery/temp)"
ac_p="$(cat /sys/class/power_supply/ac/present)"
ac_volt="$(awk '{printf("%d",$1/1000)}' < /sys/class/power_supply/ac/voltage_now)"
ac_cur="$(awk '{printf("%d",$1/1000)}' < /sys/class/power_supply/ac/current_now)"
#batt_stat="$(cat /sys/class/power_supply/battery/status)"
batt_volt="$(awk '{printf("%d",$1/1000)}' < /sys/class/power_supply/battery/voltage_now)"
batt_cur="$(awk '{printf("%d",$1/1000)}' < /sys/class/power_supply/battery/current_now)"
usb_p="$(cat /sys/class/power_supply/usb/present)"
usb_volt="$(awk '{printf("%d",$1/1000)}' < /sys/class/power_supply/usb/voltage_now)"
usb_cur="$(awk '{printf("%d",$1/1000)}' < /sys/class/power_supply/usb/current_now)"

echo cpu:$cpuT hdd:$hddT batt:$battT ac:$ac_p acVolt:$ac_volt acCur:$ac_cur battStat:100 battVolt:$batt_volt battCur:$batt_cur buttCapacity:$batt_capacity usb:$usb_p usbVolt:$usb_volt usbCur:$usb_cur
exit 0
