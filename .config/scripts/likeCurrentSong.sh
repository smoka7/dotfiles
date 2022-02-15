#!/bin/fish

set file (mpc current  -h 0.0.0.0 -p 6601 -f "%file%")
set liked (mpc sticker  -h 0.0.0.0 -p 6601 $file get liked)
if test "$liked" = "liked=true"
        mpc sticker  -h 0.0.0.0 -p 6601 $file set liked false
        notify-send -a mpd --hint=string:x-dunst-stack-tag:mpd -t 700 "\
            --------------------------------\
            DisLiked  --------------------------------"
    else
        mpc sticker  -h 0.0.0.0 -p 6601 $file set liked true
        notify-send -a mpd --hint=string:x-dunst-stack-tag:mpd -t 700 -u critical "\
            --------------------------------\
             ♥ Liked  --------------------------------"
end

