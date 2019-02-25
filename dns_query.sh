#!/bin/bash

interface=$1

#check if input variable exist, else take default host
if [ -z $1 ]; then
        interface="google.com"
fi

#check if host exist
exist="$(dig $interface | grep NOERROR | wc -m)"

if [ $exist -gt 0 ]; then
        dig $interface | grep "Query time" | awk '{print "dns:"$4}'
else
        echo "dns:U"
fi

exit 0
