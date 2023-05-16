source ~/.config/fish/conf.d/*.fish

starship init fish | source
zoxide init fish | source

set GOPATH /home/smoka/go
set -gx PNPM_HOME "/home/smoka/.local/share/pnpm"

fish_add_path -a $GOPATH/bin:$HOME/.local/share/pnpm/:$HOME/.cargo/bin:$HOME/.config/composer/vendor/bin


set -gx npm_config_prefix ~/.node_modules
set -gx MPD_HOST "0.0.0.0"
set -gx MPD_PORT 6601
set -gx EDITOR nvim
set -gx VISUAL "$EDITOR"
set -gx DIFFPROG delta
set -gx NEOVIDE_MULTIGRID true
alias ... "cd ../../"

#set -gx MANPAGER "nvim -R"

bind -M insert \cg forgetCmd
# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

#
#
set -gx ATUIN_SESSION (atuin uuid)

function _atuin_preexec --on-event fish_preexec
    if not test -n "$fish_private_mode"
        set -gx ATUIN_HISTORY_ID (atuin history start -- "$argv[1]")
    end
end

function _atuin_postexec --on-event fish_postexec
    set s $status
    if test -n "$ATUIN_HISTORY_ID"
        RUST_LOG=error atuin history end --exit $s -- $ATUIN_HISTORY_ID &>/dev/null &
        disown
    end
end

function _atuin_search
    set h (RUST_LOG=error atuin search $argv -i -- (commandline -b) 3>&1 1>&2 2>&3)
    commandline -f repaint
    if test -n "$h"
        commandline -r $h
    end
end

function _atuin_bind_up
    # Fallback to fish's builtin up-or-search if we're in search or paging mode
    if commandline --search-mode; or commandline --paging-mode
        up-or-search
        return
    end

    # Only invoke atuin if we're on the top line of the command
    set -l lineno (commandline --line)
    switch $lineno
        case 1
            _atuin_search --shell-up-key-binding
        case '*'
            up-or-search
    end
end

bind \cr _atuin_search
if bind -M insert > /dev/null 2>&1
bind -M insert \cr _atuin_search
end

