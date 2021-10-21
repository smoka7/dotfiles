#!/usr/bin/zsh
tunnel=$(pgrep openconnect) 
output() {
	if [ "$tunnel" ];then 
        echo ""
    else
        echo ""
    fi
}
connect(){
    	if [ "$tunnel" ];then 
            nmcli connection down Germany
        else
            nmcli connection up Germany
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
