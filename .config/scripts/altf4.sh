#!/bin/fish
if test $argv[1] = "close"
    xdotool getwindowfocus getwindowname > ~/.cache/altf4.txt
else
echo $argv
    notify-send -a closed --hint=string:x-dunst-stack-tag:closed -t 1000 -u critical "\
        ----------------------------------"\
            (cat ~/.cache/altf4.txt)
end

