#!/bin/sh
if [ $1 = "menu" ]; then
    OPTIONS="🔒Lock\n🔁Reboot\n🙀Power-off\n😴Hibernate"

    LAUNCHER="rofi -theme $HOME/.config/rofi/themes/powermenu.rasi -dmenu -i -p powermenu"

    LOCKER="$HOME/.config/scripts/lock.sh"

    option=$(echo -e $OPTIONS | $LAUNCHER | awk '{print $1}' | tr -d '\r\n')
    if [ ${#option} -gt 0 ]; then
        case $option in
        🔁Reboot)
            systemctl reboot
            ;;
        🙀Power-off)
            systemctl poweroff
            ;;
        🔒Lock)
            $LOCKER
            ;;
        😴Hibernate)
            systemctl hibernate && $LOCKER
            ;;
        esac
    fi
fi
