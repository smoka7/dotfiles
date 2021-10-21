#!/usr/bin/env sh
toggle() {
    if [ "$(pgrep -x redshift)" ]; then
        pkill redshift
        echo %{F#fdd835}""
    else
        pkill redshift
        redshift -c ~/.config/redshift/redshift.conf & 
        echo %{F#80D0C7}""
        echo ""
    fi
}
output() {
    if [ "$(pgrep -x redshift)" ]; then
        echo %{F#80D0C7}""
        echo ""
    else
        echo %{F#fdd835}""
    fi
}
case "$1" in
    --toggle)
        toggle
    ;;
    --output)
        output
        ;;
esac
