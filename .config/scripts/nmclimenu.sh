#!/bin/sh

disconnect() {
    nmcli con down id "$active"
}

connect() {
    nmcli device wifi connect "$chosen"
}

# Get the list of wifi
nmcli device wifi rescan
mapfile -t list < <(nmcli -g SSID device wifi list)
# Get the active wifi connection if there's one
active="$(iw dev wlp9s0 info | grep ssid | awk '{print$2}')"

# A wifi is active
if [ -n "$active" ]; then
    status="👍 Connected to $active"
    status_style="#prompt { background-color: @on; }"
    special="-a 0 "
    # Variable passed to rofi
    options="$active"
    for i in "${!list[@]}"; do
        [ "${list[i]}" == "$active" ] && unset "list[i]" || options+="\n${list[i]}"
    done
# No wifi is active
else
    status="😞 Disconnected"
    status_style="#prompt { background-color: @accent; }"
    special=""
    # Variable passed to rofi
    options=""
    for i in "${!list[@]}"; do
        options+="${list[i]}\n"
    done
    options=${options::-2}
fi

chosen=$(echo -e "$options" | rofi -theme themes/nmvpnmenu.rasi -theme-str "$status_style" -p "$status" -dmenu -i $special)
if [ -n "$chosen" ]; then
    if [ "$chosen" == "$active" ]; then
        # Disconnect the active wifi
        disconnect
    else
        take_action=false
        # Check if the chosen option is in the list, to avoid taking action
        # on the user pressing Escape for example
        for i in "${!list[@]}"; do
            [ "${list[i]}" == "$chosen" ] && {
                take_action=true
                break
            }
        done
        if $take_action; then
            # A wifi is active
            if [ -n "$active" ]; then
                # Disconnect the active wifi
                disconnect
                wait
                sleep 1
                # Connect to the chosen one
                connect
            # No wifi is active
            else
                # Connect to the chosen one
                connect
            fi
        fi
    fi
fi
