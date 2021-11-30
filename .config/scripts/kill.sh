#!/bin/bash
Options="
    swaylock.sh \n
    systemctl hibernate && swaylock.sh\n
    systemctl poweroff \n
    systemctl reboot "
echo -e $Options |fzf |xargs -r swaymsg -t command exec
