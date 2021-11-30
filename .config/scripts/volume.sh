#!/usr/bin/sh

get_volume() {
    # Volume=$(amixer -D pulse get Master | grep -o "\[.*%\]" | grep -o "[0-9]*" | head -n1)
    Volume=$(pamixer --get-volume)
    echo $Volume
}
trim_volume() {
    if [ $1 -ge 150 ]; then
        echo 150
    elif [ $1 -lt 150 ] && [ $1 -gt 0 ]; then
        echo $1
    else
        echo 0
    fi
}
set_volume() {
    pactl set-sink-volume alsa_output.pci-0000_00_1b.0.analog-stereo $1%
}
if [ $1 = "get" ]; then
    echo $(get_volume)
elif [ $1 = "up" ]; then
    Current=$(($(get_volume) + $2))
    trim=$(trim_volume $Current)
    set_volume $trim
    echo $trim >>/tmp/xobvolume
    # notify-send -a "volume" --hint=string:x-dunst-stack-tag:volume -t 700 $trim
elif [ $1 = "down" ]; then
    Current=$(($(get_volume) - $2))
    trim=$(trim_volume $Current)
    set_volume $trim
    echo $trim >>/tmp/xobvolume
    # notify-send -a "volume" --hint=string:x-dunst-stack-tag:volume -t 700 $trim
fi
