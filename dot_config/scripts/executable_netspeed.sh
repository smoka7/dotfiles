#!/bin/sh
delta=1

print_bytes() {
	# if [ "$1" -eq 0 ] || [ "$1" -lt 1000 ]; then
	#     bytes="0 kB/s"
	# elif [ "$1" -lt 1000000 ]; then
	#     bytes="$(echo "scale=0;$1/1000" | bc -l ) kB/s"
	# else
	#     bytes="$(echo "scale=1;$1/1000000" | bc -l ) MB/s"
	# fi
	bscalc -H "$1"
	echo "$bytes"
}

sum_of() {
	sum_bytes=0
	for i_x in /sys/class/net/*?/statistics/"$1"; do
		[ "${i_x#*/lo/}" != "$i_x" ] && continue
		read -r i_x_bytes <"$i_x"
		sum_bytes="$((sum_bytes + i_x_bytes))"
	done
	echo "$sum_bytes"
}

prev_dl="$(sum_of "rx_bytes")"
prev_up="$(sum_of "tx_bytes")"
echo "NET_SPEED: 0 kB/s  0 kB/s"

is_zero=""
while true; do
	sleep $delta
	now_dl="$(sum_of "rx_bytes")"
	now_up="$(sum_of "tx_bytes")"
	dl_speed="$(((now_dl - prev_dl) / delta))"
	up_speed="$(((now_up - prev_up) / delta))"
	[ "$((dl_speed + up_speed))" -lt 1024 ] && {
		[ -z "$is_zero" ] && echo "NET_SPEED: 0 kB/s  0 kB/s" && is_zero=1
		continue
	}
	prev_dl="$now_dl"
	prev_up="$now_up"
	unset is_zero
	echo "NET_SPEED: $(print_bytes $dl_speed)  $(print_bytes $up_speed)"
done
