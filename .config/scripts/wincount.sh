#!/bin/fish

set count (xdotool search --all --onlyvisible --desktop (xprop -notype -root _NET_CURRENT_DESKTOP) "" 2>/dev/null | count)
if [ $count -le 1 ]
	echo ""
else
    echo $count
end

