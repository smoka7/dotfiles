#!/usr/bin/env sh
netspeed() {
    while true; do
        R1=$(cat /sys/class/net/wlp9s0/statistics/rx_bytes)
        T1=$(cat /sys/class/net/wlp9s0/statistics/tx_bytes)
        sleep 1
        R2=$(cat /sys/class/net/wlp9s0/statistics/rx_bytes)
        T2=$(cat /sys/class/net/wlp9s0/statistics/tx_bytes)
        TBPS=$(expr $T2 - $T1)
        RBPS=$(expr $R2 - $R1)
        TKBPS=$(expr $TBPS / 1024)
        RKBPS=$(expr $RBPS / 1024)
        if [ $RKBPS -eq 0 ] && [ $RKBPS -eq 0 ]; then
            echo ""
        else
            echo %{F#e63946}"$TKBPS K %{F#12f84b}$RKBPS K"
            # notify-send -a "volume" --hint=string:x-dunst-stack-tag:volume -t 1000 echo "$TKBPS kB/s $RKBPS kB/s"
        fi
    done
}
status() {
    # for using networkmanager
    # ssid=`nmcli device show wlp9s0 | grep CONNECTION `
    # other nms
    ssid=$(iw dev wlp9s0 info | grep ssid | awk '{ print$2 }')
    echo $ssid
}
case "$1" in
--speed)
    netspeed
    ;;
--stats)
    status
    ;;
esac
