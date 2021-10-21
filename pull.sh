#!/bin/sh

sudo pacman -Syu
cat packages | sudo pacman -S -

# copy pacman hooks to its folder
sudo cp -r ./hooks/ /etc/pacman.d/
cp -r ./.config/ $HOME/.config/
