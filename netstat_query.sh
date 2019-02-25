tmp#!/bin/bash

tempfile=/tmp/netstat_$(date +"%Y-%m-%d").tmp

[ -f "$tempfile" ] && exit

touch $tempfile

#write network statistik in file without LISTEN ports
#Active Internet connections (servers and established)
netstat -tuna | grep -E "tcp|udp" > $tempfile

#no Listen ports
#netstat -tuna | grep -E "tcp|udp" | grep -v LISTEN > $tempfile

#Some more exceptions
#netstat -tuna | grep -E "tcp|udp" | grep -Ev "LISTEN|0.0.0.0|:::" > $tempfile

total="$(cat $tempfile | wc -l)"
listen="$(grep -E "LISTEN|0.0.0.0|:::" $tempfile | wc -l)"
listentcp="$(grep -E "LISTEN|0.0.0.0|:::" $tempfile | grep tcp | wc -l)"
listenudp="$(grep -E "LISTEN|0.0.0.0|:::" $tempfile | grep udp | wc -l)"

#clen up from the listen ports
grep -vE "LISTEN|0.0.0.0|:::" $tempfile > $tempfile.tmp

total_active="$(cat $tempfile.tmp | wc -l)"
port1="$(grep :443 $tempfile.tmp | wc -l)"
port2="$(grep :80 $tempfile.tmp | wc -l)"
port3="$(grep :22 $tempfile.tmp | wc -l)"
#use AWK if needed to exclude UDP listening portmpt
#port4="$(awk '/1tmp0000/ && !/0.0.0.0/' $tempfile | wc -l)"
port4="$(grep :10000 $tempfile.tmp | wc -l)"
port5="$(grep :445 $tempfile.tmp | wc -l)"
port6="$(grep :7777 $tempfile.tmp | wc -l)"
tcp="$(grep tcp $tempfile.tmp | wc -l)"
udp="$(grep udp $tempfile.tmp | wc -l)"

echo Total:$total https:$port1 http:$port2 ssh:$port3 webmin:$port4 samba:$port5 socks5:$port6 tcp:$tcp udp:$udp totalActive:$total_active listen:$listen listentcp:$listentcp listenudp:$listenudp

rm $tempfile
exit 0
