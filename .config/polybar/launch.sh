#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
# polybar white
polybar bottom &
sleep 3
polybar date &
polybar stat &
polybar media &
# polybar volume --reload &
polybar-msg cmd hide
#polybar bottom &
# echo "Bars launched..."
