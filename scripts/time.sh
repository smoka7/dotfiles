#!/bin/sh


clock() {
echo  `date +"%a  %H:%M"`
}

while :; do
    clock
    sleep 60
done
