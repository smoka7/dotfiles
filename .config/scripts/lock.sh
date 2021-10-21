#!/bin/sh
tmp="/tmp/shot.png"
sleep 0.08
scrot "$tmp"
convert  "$tmp" -blur 4,4 -normalize -5% "$tmp"
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
i3lock \
  --insidevercolor=$base00 \
  --insidewrongcolor=$base00 \
  --insidecolor=$base00 \
  --ringvercolor=$green$alpha \
  --ringwrongcolor=$red$alpha \
  --ringvercolor=$green$alpha \
  --ringwrongcolor=$red$alpha \
  --ringcolor=$blue$alpha \
  --line-uses-ring \
  --keyhlcolor=$yellow \
  --bshlcolor=$orange \
  --separatorcolor=$base01$alpha \
  --verifcolor=$green \
  --wrongcolor=$red \
  --layoutcolor=$blue \
  --datecolor=$base01 \
  --timecolor=$base01 \
  --screen 1 \
  --clock \
  --indicator \
  --timestr="%H:%M" \
  --datestr="%a %b %e %Y" \
  --veriftext="bebinim chi mishe..." \
  --wrongtext="nashod" \
  --noinput="aval ye chi bezan" \
  --locktext="daram mibandam" \
  --lockfailed="baste nashod" \
  --layout-font="Iosevka" \
  --date-font="Iosevka" \
  --time-font="Iosevka" \
  --verif-font="Iosevka" \
  --wrong-font="Iosevka" \
  --radius=200 \
  --ring-width=70 \
  --pass-media-keys \
  --pass-screen-keys \
  --pass-volume-keys \
  -i "$tmp" 
rm "$tmp"
