function gv -d "nvim in wezterm"
    wezterm start --cwd (pwd) nvim 2>/dev/null &
    disown
end
