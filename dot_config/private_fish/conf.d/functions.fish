function sublime_text
    /opt/sublime_text/sublime_text $argv
end

function sublime_merge
    /opt/sublime_merge/sublime_merge $argv
end

function mkcd
    mkdir $argv
    and cd $argv
end

function cpgo
    cp -r $argv
    and cd $argv[2]
end

function backup
    cp $argv[1] $argv[1].back
end

function likee
    set file (mpc current -f "%file%")
    set liked (mpc sticker -h 0.0.0.0 -p 6601 $file get liked)
    if test "$liked" = "liked=true"
        mpc sticker $file set liked false
        notify-send -a disliked --hint=string:x-dunst-stack-tag:mpd -t 700 -u critical "liked:d"
    else
        mpc sticker $file set liked true
        notify-send -a liked --hint=string:x-dunst-stack-tag:mpd -t 700 "liked:s"
    end
end
