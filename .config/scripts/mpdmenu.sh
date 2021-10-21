#!/bin/sh

rofi_command="rofi -theme /themes/mpdmenu.rasi"
export MPD_HOST=127.0.0.1
export MPD_PORT=6601
### Options ###
# Gets the current status of mpd (for us to parse it later on)
status="$(mpc status)"
# Defines the Play / Pause option content
if [[ $status == *"[playing]"* ]]; then
    play_pause="🙏"
else
    play_pause="👌"
fi
active=""
urgent=""
# Display if repeat mode is on / off
tog_repeat="🔁"
if [[ $status == *"repeat: on"* ]]; then
    active="-a 4"
elif [[ $status == *"repeat: off"* ]]; then
    urgent=""
else
    tog_repeat=" Parsing error"
fi
# Display if random mode is on / off
tog_random="🔀"
if [[ $status == *"random: on"* ]]; then
    [ -n "$active" ] && active+=",5" || active="-a 5"
elif [[ $status == *"random: off"* ]]; then
    [ -n "$urgent" ] && urgent+="" || urgent=""
else
    tog_random=" Parsing error"
fi
stop="💣"
next="⏩"
previous="⏪"
# Variable passed to rofi
options="$previous\n$play_pause\n$stop\n$next\n$tog_repeat\n$tog_random"

# Get the current playing song
current=$(mpc current)
# If mpd isn't running it will return an empty string, we don't want to display that
if [[ -z "$current" ]]; then
    current="-"
fi

# Spawn the mpd menu with the "Play / Pause" entry selected by default
chosen="$(echo -e "$options" | $rofi_command -p "$current" -dmenu $active $urgent -selected-row 1 -columns 6 active-row 4)"
case $chosen in
    $previous)
        mpc prev
        ;;
    $play_pause)
        mpc toggle
        ;;
    $stop)
        mpc stop
        ;;
    $next)
        mpc next
        ;;
    $tog_repeat)
        mpc repeat
        ;;
    $tog_random)
        mpc random
        ;;
esac

