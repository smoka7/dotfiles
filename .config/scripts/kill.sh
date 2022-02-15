#!/bin/bash
# Options="
# swaylock.sh \n
# systemctl hibernate && swaylock.sh\n
# systemctl poweroff \n
# systemctl reboot "

OPTIONS="🔒Lock\n🔁 Reboot\n☕ Power-off\n😴 Hibernate"
option=$(echo -e $OPTIONS | fzf)
if [ ${#option} -gt 0 ]; then
    case $option in
    "🔁 Reboot")
        systemctl reboot
        ;;
    "☕ Power-off")
        systemctl poweroff
        ;;
    "🔒Lock")
        swaylock.sh
        ;;
    "😴 Hibernate")
            # notify-send -a "hibernate" -t 700 -u critical "hibernation faild"
        # systemctl hibernate && swaylock.sh
        systemctl hibernate
        ;;
    esac
fi
