#!/usr/bin/env sh
setxkbmap -option 'grp:alt_shift_toggle,caps:swapescape' -layout us,ir
numlockx on
# xmodmap ~/.xmodmap
killall -q copyq
killall -q dunst
killall -q ulauncher
killall -q picom
killall -q nm-applet
killall -q xob
dunst &
copyq &
ulauncher & 
nm-applet &
picom -b --experimental-backend &
tail -f /tmp/xobbrightness | xob -c .config/xob_brightness &
tail -f /tmp/xobvolume | xob -c .config/xob_volume &
$HOME/.config/polybar/launch.sh &
nitrogen --set-scaled $HOME/Pictures/Torrid.png
# feh --bg-fill ~/Pictures/Torrid.png
