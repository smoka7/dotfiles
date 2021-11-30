#!/usr/bin/fish

set white '%{F#ffffff}'
set yellow '%{F#fdd835}'

set disconnected 
set wireless_connected 
set vpn_connected 

while true
    set connectivity (nmcli networking connectivity check)
    if test connectivity="full"
        set wifi (ip link | grep wlp9s0 | grep "state UP")
        set vpn (nmcli -g name,type con show --active | egrep -h "vpn|tun")
            set ssid (iw dev wlp9s0 info | grep ssid | awk '{print$2}')
        if test $vpn
            echo "$vpn_connected" $white $ssid
        else if test $wifi
            echo "$wireless_connected" $white $ssid
        else
            echo $yellow" " $white "eth"
        end
        sleep 5
    else
        sleep 2
    end
end
