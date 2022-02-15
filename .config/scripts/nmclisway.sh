#!/bin/bash
if [[ $1 == "search" ]]; then
    wifi=$(nmcli -g SSID,SIGNAL,BARS device wifi list)
    vpns=$(nmcli -g NAME,TYPE connection show | grep vpn | sed -e 's#:vpn$#cc#')
    connection=$(echo -e "$wifi \n$vpns" | fzf | cut -d : -f 1)
else
    all=$(nmcli -g NAME,TYPE connection show | sed -e 's#:vpn$# 🔒#' | sed -e 's#:802-11-wireless$# 📶#')
    connection=$(echo -e "$all" | fzf | cut -d : -f 1 | awk '{print$1}')
fi
active=$(nmcli device show wlp9s0 | grep CONNECTION | awk '{ print$2 }')
if [[ $connection == $active ]]; then
    nmcli connection down $active
else
    nmcli connection up $connection
fi
