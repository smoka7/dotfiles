#!/usr/bin/env bash
if [ $1 = "menu" ];
    then
OPTIONS="Lock \n Reboot \n Power Off \n Hibernate"
LAUNCHER="rofi -width 30 -theme ~/.config/rofi/themes/powermenu.rasi -dmenu -i -p kodom???"
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
            sleep 0.08
          $LOCKER;
        ;;
      Hibernate)
        systemctl hibernate
        $LOCKER;
        ;;
      *)
        ;;
    esac
fi
fi
