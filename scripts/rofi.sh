#!/usr/bin/zsh
if [ $1 = "clip" ];
then
    rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}'
fi
