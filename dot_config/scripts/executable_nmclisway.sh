#!/bin/bash
searchWifies() {
	wifi=$(nmcli -g device,signal,ssid device wifi list)
	connection=$(echo -e "$wifi" |
		sed -e 's#wlp9s0:#📶 #' \
			-e 's#:# #' |
		fzf)
	name=$(echo -e $connection | cut -d' ' -f3-)
}
searchAllConnections() {
	all=$(
		nmcli -g type,name connection show |
			sed -e 's#tun:#🔐 #' \
				-e 's#802-3-ethernet:#💻 #' \
				-e 's#vpn:#🔒 #' \
				-e 's#802-11-wireless:#📶 #'
	)
	connection=$(echo -e "$all" | fzf)
	name=$(echo -e $connection | cut -d' ' -f2-)
}

if [[ $1 == "search" ]]; then
	searchWifies
else
	searchAllConnections
fi

if [[ $name == "" ]]; then
	exit
fi

active=$(nmcli device show wlp9s0 | grep CONNECTION | awk '{print$2}')

if [[ $active == $name ]]; then
	nmcli connection down $active
	exit
fi

nmcli connection up $name
