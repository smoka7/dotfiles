#!/bin/fish

set file (mpc current -f "%file%")
set liked (mpc sticker $file get liked)
echo $liked
if test "$liked" = "liked=true"
        mpc sticker $file set liked false
        notify-send -a mpd --hint=string:x-dunst-stack-tag:mpd -t 700 "DisLiked"
    else
        mpc sticker $file set liked true
        notify-send -a mpd --hint=string:x-dunst-stack-tag:mpd -t 700 -u critical "liked"
end

