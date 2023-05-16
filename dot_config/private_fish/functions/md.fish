function md -d "megadl file in drive"
    cd /mnt/40A0F49975F46FE1
    #megadl $argv[1]
    megadl (wl-paste)
    notify-send -a liked --hint=string:x-dunst-stack-tag:mpd -u normal ( ls /mnt/40A0F49975F46FE1/ --sort time | head -1) --icon $HOME/.icons/Suru/48x48/places/folder-download.png -t 1000
end
