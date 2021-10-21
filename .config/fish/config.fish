starship init fish | source
source ~/.config/fish/conf.d/done.fish
set MPD_HOST "0.0.0.0"
set MPD_PORT 6601
set EDITOR "nvim"
set VISUAL "$EDITOR"


alias vim="nvim"
alias pas="sudo pacman -S"
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
