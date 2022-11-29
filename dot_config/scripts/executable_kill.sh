#!/bin/bash

OPTIONS="🔒 Lock\n🔁 Reboot\n☕ Power-off\n🍩 suspend\n😴 Hibernate"
option=$(echo -e $OPTIONS | fzf)
if [ ${#option} -gt 0 ]; then
    case $option in
    "🔁 Reboot")
        systemctl reboot
        ;;
    "🍩 suspend")
        systemctl suspend
        ;;
    "☕ Power-off")
        systemctl poweroff
        ;;
    "🔒 Lock")
        swaylock.sh
        ;;
    "😴 Hibernate")
        systemctl hibernate
        ;;
    esac
fi
