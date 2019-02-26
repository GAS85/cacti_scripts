# cacti_scripts
This is private cacti scipts repo

# nextcloud_api_poller.sh
Will use nextcloud API call to retrive some infomratin.
Usage: Set user name and password + URL of your NC installation and go!

Example of output:

    /usr/share/cacti/scripts/nextcloud_api_poller.sh
    num_users:7 num_files:606789 num_storages:22 num_storages_local:2 num_storages_home:9 num_storages_other:11 num_shares:35 num_shares_user:30 num_shares_groups:0 num_shares_link:4 num_shares_link_no_password:4 last5minutes:3 last1hour:4 last24hours:6
    
# dns_query.sh
Will return DNS resolvation time in ms.

Example of output:

    /usr/share/cacti/scripts/dns_query.sh google.com
    dns:16

#	netstat_query.sh

Example of output:

    /usr/share/cacti/scripts/netstat_query.sh
    Total:55 https:10 http:0 ssh:0 webmin:2 samba:1 socks5:0 tcp:13 udp:0 totalActive:13 listen:42 listentcp:17 listenudp:25

#	temp_cpu_cubietruck.sh

Example of output:

    /usr/share/cacti/scripts/temp_cpi_cubietruck.sh
    cpuTemp:37.70 hddTemp:35 battTemp:37.50 ac:1 acVolt:4.945 acCur:0.305 acPow:1.508 battStat:Full battVolt:4.150 battCur:0.005 battCapacity:100 battPow:0.021 usb:0 usbVolt:10.000 usbCur:0.000 usbPow:0.000

#	tx_rx_advanced_query.sh
Usage: tx_rx_advanced_query.sh <interface>

Example of output:

    /usr/share/cacti/scripts/tx_rx_advanced_query.sh
    RX-OK-bytes:102827009 RX-OK-packets:13338332 RX-ERR:0 RX-DRP:0 TX-OK-bytes:3869279768 TX-OK-packets:61981899 TX-ERR:0 TX-DRP:0

#	tx_rx_ifconfig_query.sh
Usage: tx_rx_ifconfig_query.sh <interface>

Example of output:

    /usr/share/cacti/scripts/tx_rx_ifconfig_query.sh
    RXbytes:103006040 TXbytes:3870332188
