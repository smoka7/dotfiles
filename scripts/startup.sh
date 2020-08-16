#!/usr/bin/env sh
setxkbmap -option 'grp:alt_shift_toggle,caps:swapescape' -layout us,ir
numlockx on
killall -q copyq
copyq &
killall -q dunst
dunst &
killall -q ulauncher
ulauncher & 
killall -q nm-applet
nm-applet &
killall -q compton
compton -b &
$HOME/.config/polybar/launch.sh &
nitrogen --set-centered $HOME/Pictures/background.jpg
