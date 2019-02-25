#!/bin/bash

interface=$1

#check if input variable exist, else take default
if [ -z $1 ]; then
        interface=eth0     
fi

stat="$(grep $interface /proc/net/dev)"

#bytes    packets errs drop
echo $stat | awk '{print "RX-OK-bytes:"$2" RX-OK-packets:"$3" RX-ERR:"$4" RX-DRP:"$5" TX-OK-bytes:"$10" TX-OK-packets:"$11" TX-ERR:"$12" TX-DRP:"$13}'

exit 0
