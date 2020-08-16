#!/usr/bin/zsh

get_brightness ()
{
    Brightness=$(xrandr --verbose |grep Brightness | grep -oh "[0-9.]*" | head -n1)
    echo $Brightness
}
trim_brightness ()
{
    if (( $(echo "$1 > 1" |bc -l) ));
	then
        echo 1
    elif (( $(echo "$1 <= 1" |bc -l) )) && (( $(echo "$1 > 0.6" |bc -l) ));
    then
        echo $1
    else
        echo 0.6
    fi
}
set_brightness ()
{
xrandr --output LVDS-1-1 --brightness $1%
}
if [ $1 = "get" ];
then
    echo $(get_brightness)
elif [ $1 = "up" ];
then
    Current=$(($(get_brightness)+$2))
    trim=$(trim_brightness $Current)
    set_brightness $trim
elif [ $1 = "down" ];
then
    Current=$(($(get_brightness)-$2))
    trim=$(trim_brightness $Current)
    set_brightness $trim
fi
