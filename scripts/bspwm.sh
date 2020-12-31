#!/bin/sh


if [ $1 = "count" ];
then
	count=$(bspc query -N -d $somedesktop -n .window.\!hidden | wc -l)
	if [ $count -le 1 ];then
		echo ""
	fi
	echo $count
fi
