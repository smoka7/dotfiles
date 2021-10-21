#!/usr/bin/env sh
print_bytes() {
  if [ "$1" -eq 0 ] || [ "$1" -lt 1000 ]; then
    bytes="0 kB/s"
  elif [ "$1" -lt 1000000 ]; then
    bytes="$(echo "scale=0;$1/1000" | bc -l) K"
  else
    bytes="$(echo "scale=1;$1/1000000" | bc -l) M"
  fi

  echo "$bytes"
}
ssid=$(nmcli device status | grep wifi | awk '{print$4}')
netspeed() {
  while true; do
    R1=$(cat /sys/class/net/wlp9s0/statistics/rx_bytes)
    T1=$(cat /sys/class/net/wlp9s0/statistics/tx_bytes)
    sleep 1
    R2=$(cat /sys/class/net/wlp9s0/statistics/rx_bytes)
    T2=$(cat /sys/class/net/wlp9s0/statistics/tx_bytes)
    TBPS=$(($T2 - $T1))
    RBPS=$(($R2 - $R1))
    TKBPS=$(print_bytes $TPBS)
    RKBPS=$RPBS
    echo %{F#ffffff}" $TKBPS  %{F#12f84b} $RKBPS"
  done
}
status() {
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
