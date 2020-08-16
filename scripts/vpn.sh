#!/usr/bin/env sh
output() {
    if [ "$(pgrep -x pppd)" ]; then
        echo ""
    elif [ "$(pgrep -x openconnect)" ]; then
        echo ""
    else
        echo ""
    fi
}
case "$1" in
    --output)
        output
        ;;
esac
