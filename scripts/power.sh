#!/usr/bin/env bash
if [ $1 = "menu" ];
    then
OPTIONS="Lock \n Reboot \n Power Off \n Hibernate"
LAUNCHER="rofi -theme ~/.config/rofi/themes/powermenu.rasi -dmenu -i -p powermenu"
LOCKER="$HOME/.config/scripts/lock.sh"
option=`echo -e $OPTIONS | $LAUNCHER | awk '{print $1}' | tr -d '\r\n'`
if [ ${#option} -gt 0 ]
then
    case $option in
      Exit)
        eval $1
        ;;
      Reboot)
        systemctl reboot
        ;;
      Power-off)
        systemctl poweroff
        ;;
      Lock)
          $LOCKER;
        ;;
      Hibernate)
        pkill picom
        systemctl hibernate && mantablockscreen -sc
        picom -b --experimental-backend
        ;;
      *)
        ;;
    esac
fi
fi
