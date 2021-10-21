#!/usr/bin/env sh
# setxkbmap -option 'grp:alt_shift_toggle,caps:swapescape' -layout us,ir
# xmodmap ~/.Xmodmap
# xcape -e 'Hyper_L=Escape' -t=1 
numlockx on
$HOME/.config/polybar/launch.sh &
killall -q copyq dunst albert picom nm-applet xob redshift
dunst &
copyq &
albert & 
nm-applet &
redshift-gtk &>/dev/null &
picom -b --experimental-backend

touch /tmp/xobbrightness && touch /tmp/xobvolume
tail -f /tmp/xobbrightness | xob -c $HOME/.config/xob_brightness &
tail -f /tmp/xobvolume | xob -c $HOME/.config/xob_volume &
# nitrogen --set-scaled $HOME/Pictures/Torrid.png
feh --bg-fill ~/Pictures/wallpaper
