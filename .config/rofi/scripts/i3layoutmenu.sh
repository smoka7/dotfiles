#!/bin/bash

rofi_command="rofi -theme themes/i3layoutmenu.rasi"

### Options ###
stacked="stack"
tabbed="tab"
split="split"
horizontal="split horizontal"
vertical="split vertical"
# Variable passed to rofi
options="$stacked\n$tabbed\n$split\n$horizontal\n$vertical"

chosen="$(echo -e "$options" | $rofi_command -dmenu -p layout -selected-row 1)"
case $chosen in
    $stacked)
        i3-msg layout stacked
        ;;
    $tabbed)
        i3-msg layout tabbed
        ;;
    $split)
        i3-msg layout toggle split
        ;;
    $horizontal)
        i3-msg layout splith
        ;;
    $vertical)
        i3-msg layout splitv
        ;;
esac

