source ~/.config/fish/conf.d/*.fish

starship init fish | source
mcfly init fish | source
zoxide init fish | source

set GOPATH /home/smoka/go
fish_add_path -a $GOPATH/bin:$HOME/.node_modules/bin:$HOME/.cargo/bin:$HOME/.config/composer/vendor/bin
# fish_add_path -a $HOME/.node_modules/bin
# fish_add_path -a $HOME/.cargo/bin
# fish_add_path -a $HOME/.config/composer/vendor/bin
set -gx npm_config_prefix ~/.node_modules
set -gx MPD_HOST "0.0.0.0"
set -gx MPD_PORT 6601
set -gx EDITOR nvim
set -gx VISUAL "$EDITOR"
set -gx NEOVIDE_MULTIGRID

#set -gx MANPAGER "nvim -R"


# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
