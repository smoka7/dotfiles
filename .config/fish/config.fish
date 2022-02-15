starship init fish | source
mcfly init fish | source

source ~/.config/fish/conf.d/done.fish
source ~/.config/fish/colors.fish

set GOPATH /home/smoka/go
fish_add_path -a $GOPATH/bin
fish_add_path -a $HOME/.node_modules/bin
fish_add_path -a $HOME/.cargo/bin
fish_add_path -a $HOME/.config/composer/vendor/bin 
set -gx npm_config_prefix ~/.node_modules
set -gx MPD_HOST "0.0.0.0"
set -gx MPD_PORT 6601
set -gx EDITOR nvim
set -gx VISUAL "$EDITOR"

#set -gx MANPAGER "nvim -R"

alias vim="nvim"
alias sublime_text="/opt/sublime_text/sublime_text" 
alias sublime_merge="/opt/sublime_merge/sublime_merge" 



alias arti="php artisan"
alias pf="php artisan test --filter"
alias pe="php artisan test --stop-on-error"

alias la='ls -a'
alias lla='ls -la'
alias cpr='cp -r'

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
