#!/bin/bash
FOREGROUND=$(xrdb -query | grep 'color6:'| awk 'NR==1{print $NF}')

another=$(echo "data
home" | awk '{print $(NF-1)}' | rofi "${ROFI_OPTIONS[@]}" -dmenu -i -p "search: ")


if [ "$another" == "home" ] ; then
	find /home/smoka | rofi "${ROFI_OPTIONS[@]}" -threads 0 -dmenu -i -p 'locate:' | xargs -r -0 xdg-open;

elif [ "$another" == "data" ] ; then
	find /mnt | rofi "${ROFI_OPTIONS[@]}" -threads 0 -dmenu -i -p 'locate:' | xargs -r -0 xdg-open;

else
    echo $another
fi



