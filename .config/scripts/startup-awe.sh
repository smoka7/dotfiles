#!/usr/bin/env sh
# setxkbmap -option 'grp:alt_shift_toggle,caps:swapescape' -layout us,ir
# xmodmap ~/.Xmodmap
# xcape -e 'Hyper_L=Escape' -t=1
numlockx on
$HOME/.config/polybar/launch.sh &
killall -q copyq albert picom nm-applet xob tail
copyq &
albert >/dev/null 2>&1 &
nm-applet &
picom -b --experimental-backend

touch /tmp/xobbrightness && touch /tmp/xobvolume
# tail -f /tmp/xobbrightness | xob -c $HOME/.config/xob_brightness &
# tail -f /tmp/xobvolume | xob -c $HOME/.config/xob_volume &
