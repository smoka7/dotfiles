#!/bin/sh
# tmp="/tmp/shot.png"
# sleep 0.08
# scrot "$tmp"
# convert  "$tmp" -blur 4,4 -normalize -5% "$tmp"
alpha='00'
base00='#39465E'
base01='#ffffff'
yellow='#fdd835'
orange='#cb4b16'
red='#dc322f'
magenta='#d33682'
violet='#6c71c4'
blue='#268bd2'
cyan='#2aa198'
green='#859900'
swaylock \
  --bs-hl-color=$orange \
  --font="Iosevka" \
  --font-size=16\
  --indicator-radius=200 \
  --indicator-thickness=60 \
  --inside-clear-color=$base00 \
  --inside-ver-color=$blue \
  --inside-wrong-color=$red \
  --inside-color=$base00$alpha \
  --key-hl-color=$yellow \
  --ring-ver-color=$green$alpha \
  --ring-wrong-color=$red$alpha \
  --ring-clear-color=$orange$alpha \
  --ring-wrong-color=$red$alpha \
  --separator-color=$base00 \
  --ring-color=$blue$alpha \
  --line-uses-ring \
  --layout-bg-color=$base00 \
  --layout-text-color=$yellow \
  -i "~/Pictures/wallpaper" 
  # --separatorcolor=$base01$alpha \
  # --verifcolor=$green \
  # --wrongcolor=$red \
  # --layoutcolor=$blue \
  # --datecolor=$base01 \
  # --timecolor=$base01 \
  # --screen 1 \
  # --clock \
  # --indicator \
  # --veriftext="bebinim chi mishe..." \
  # --wrongtext="nashod" \
  # --noinput="aval ye chi bezan" \
  # --locktext="daram mibandam" \
  # --lockfailed="baste nashod" \
  # --layout-font="Iosevka" \
  # --ring-width=70 \
  # --pass-media-keys \
  # --pass-screen-keys \
  # --pass-volume-keys \
# rm "$tmp"
