starship init fish | source
source ~/.config/fish/conf.d/done.fish
set GOPATH /home/smoka/go
fish_add_path -a $GOPATH/bin
fish_add_path -a $HOME/.node_modules/bin
fish_add_path -a $HOME/.config/composer/vendor/bin 
set -gx npm_config_prefix ~/.node_modules
set -gx MPD_HOST "0.0.0.0"
set -gx MPD_PORT 6601
set -gx EDITOR nvim
#set -gx MANPAGER "nvim -R"
set -gx VISUAL "$EDITOR"

alias chromium="chromium --ozone-platform=wayland" 
alias brave-beta="brave-beta --ozone-platform=wayland" 
alias vim="nvim"
alias pas="sudo pacman -S"
alias pay="sudo pacman -Syu"
alias pau="sudo pacman -Sy"
alias pai="pacman -Si"
alias par="sudo pacman -Rusnc"

alias sail="./vendor/bin/sail"
alias arti="php artisan"
alias pf="php artisan test --filter"
alias pe="php artisan test --stop-on-error"

alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias cpr='cp -r'
alias down='wget -c'

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
