#!/usr/bin/env bash

monitor="$1"
change="$2"

current=$(ddcutil getvcp 10 --display "$monitor" | awk -F'current value = ' '{print $2}' | awk -F',' '{print $1}')

new=$((current + change))

if ((new > 100)); then
    new=100
fi

if ((new < 0)); then
    new=0
fi

ddcutil setvcp 10 "$new" --display "$monitor"
