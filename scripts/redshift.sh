#!/usr/bin/env sh
toggle() {
    if [ "$(pgrep -x redshift)" ]; then
        pkill redshift
    else
        redshift -c ~/.config/redshift/redshift.conf & 
    fi
}
output() {
    if [ "$(pgrep -x redshift)" ]; then
        echo ""
    else
        echo ""
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
