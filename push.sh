#!/bin/sh

pacman -Qqen >./packages

echo "copying pacman to dotfile folder"
cp -v -r /etc/pacman.d/hooks ./
echo "copying config files to dotfile folder"
config=(
    '.dual-function.yaml'
    'alacritty'
    'bspwm'
    'cantata'
    'cava'
    'dunst'
    'fish'
    'gtk-3.0'
    'gtk-4.0'
    'i3'
    'kitty'
    'mpd'
    'mpv'
    'nvim'
    'picom.conf'
    'picom.conf'
    'polybar'
    'redshift'
    'rofi'
    'scripts'
    'starship.toml'
    'sxhkd'
    'xob*'
    'waybar'
    'sway'
)
for i in "${config[@]}"; do
    cp -v -r $HOME/.config/${i} ./.config/
done
echo "-------------------------------" && echo ""
echo "commit and push the files"
git add -A
echo "-------------------------------"
git diff --staged --shortstat
