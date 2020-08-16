#!/usr/bin/env sh
State="$(ip link | grep 'state UP')"
netspeed(){
while true; do
        R1=`cat /sys/class/net/wlp9s0/statistics/rx_bytes`
        T1=`cat /sys/class/net/wlp9s0/statistics/tx_bytes`
        sleep 1
        R2=`cat /sys/class/net/wlp9s0/statistics/rx_bytes`
        T2=`cat /sys/class/net/wlp9s0/statistics/tx_bytes`
        TBPS=`expr $T2 - $T1`
        RBPS=`expr $R2 - $R1`
        TKBPS=`expr $TBPS / 1024`
        RKBPS=`expr $RBPS / 1024`
        echo "`status`  $TKBPS kB/s  $RKBPS kB/s"
done
}
status(){
ssid=`nmcli device show wlp9s0 | grep CONNECTION `
con="GENERAL.CONNECTION:"
echo ${ssid#G*:} 
}
case "$1" in 
    --speed)
        netspeed
        ;;
    --stats)
        status
        ;;
esac
