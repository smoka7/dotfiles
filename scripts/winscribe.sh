#!/usr/bin/zsh
output() {
tunnel=$(networkctl -s | grep tun0|head -n1) 
	if [ "$tunnel" ];then 
        echo ""
    else
        echo ""
    fi
}
connect(){
tunnel=$(networkctl -s | grep tun0|head -n1) 
    	if [ "$tunnel" ];then 
            windscribe disconnect
        else
            windscribe connect bucharest
        fi
}
case "$1" in
    --output)
        output
        ;;
	--click)
        connect
        ;;
esac
