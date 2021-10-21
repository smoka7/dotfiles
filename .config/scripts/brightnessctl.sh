#!/bin/sh
brightness() {
    br=$(brightnessctl g)
    echo $br
}
if [ $1 = "up" ]; then
    brightnessctl set 10%+
    echo $(brightness) >/tmp/xobbrightness
    brightnessctl set 5%+
    echo $(brightness) >/tmp/xobbrightness
elif [ $1 = "down" ]; then
    brightnessctl set 10%-
    echo $(brightness) >/tmp/xobbrightness
    brightnessctl set 5%-
    echo $(brightness) >/tmp/xobbrightness
fi
