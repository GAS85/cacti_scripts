#!/bin/bash

interface=$1

#check if input variable exist, else take default
if [ -z $1 ]; then
        interface=eth0     
fi

/sbin/ifconfig $interface | grep " bytes:" | awk '{print $1$2" "$5$6}'

exit 0
