#!/usr/bin/zsh
tmp="/tmp/shot.png"
sleep 0.08
scrot "$tmp"
convert  "$tmp" -scale 10% -scale 1000%  "$tmp"
alpha='ff'
base03='#002b36'
base02='#073642'
base01='#586e75'
base00='#657b83'
base0='#839496'
base1='#93a1a1'
base2='#eee8d5'
base3='#fdf6e3'
yellow='#b58900'
orange='#cb4b16'
red='#dc322f'
magenta='#d33682'
violet='#6c71c4'
blue='#268bd2'
cyan='#2aa198'
green='#859900'
i3lock \
  --insidevercolor=$base2$alpha \
  --insidewrongcolor=$base2$alpha \
  --insidecolor=$base2$alpha \
  --ringvercolor=$green$alpha \
  --ringwrongcolor=$red$alpha \
  --ringvercolor=$green$alpha \
  --ringwrongcolor=$red$alpha \
  --ringcolor=$blue$alpha \
  --line-uses-ring \
  --keyhlcolor=$magenta$alpha \
  --bshlcolor=$orange$alpha \
  --separatorcolor=$base1$alpha \
  --verifcolor=$green \
  --wrongcolor=$red \
  --layoutcolor=$blue \
  --datecolor=$blue \
  --timecolor=$blue \
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
  --time-font="Iosevka" \
  --date-font="Iosevka" \
  --layout-font="Iosevka" \
  --verif-font="Iosevka" \
  --wrong-font="Iosevka" \
  --radius=200 \
  --ring-width=50 \
  --pass-media-keys \
  --pass-screen-keys \
  --pass-volume-keys \
  -i "$tmp" 
rm "$tmp"
