#!/usr/bin/env sh
killall -q dunst albert wlsunset nm-applet
dunst &
albert &
wlsunset -S 06:30 -s 17:30 &
nm-applet --indicator &
# copyq &
touch /tmp/xobbrightness && touch /tmp/xobvolume
# tail -f /tmp/xobbrightness | xob -c $HOME/.config/xob_brightness &
tail -f /tmp/xobvolume | xob -c $HOME/.config/xob_volume &
