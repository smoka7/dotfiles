function sublime_text
    /opt/sublime_text/sublime_text $argv
end

function sublime_merge
    /opt/sublime_merge/sublime_merge $argv
end

function submer -d "sublime merge current directory"
    /opt/sublime_merge/sublime_merge ./ $argv
end

function mkcd -d "mkdir and cd to it"
    mkdir --parents $argv
    and cd $argv
end

function cpgo
    cp -r $argv
    and cd $argv[2]
end

function backup
    cp $argv[1] $argv[1].back
end


function likee -d "like current playing song"
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

alias rm "rm -i"

function mark_prompt_start --on-event fish_prompt
    echo -en "\e]133;A\e\\"
end
#mark_prompt_start

