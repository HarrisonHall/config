#! /bin/bash

dte(){
    dte="$(date +'%d %b - %H:%M')"
    echo -e "🕒 $dte"
}

# Custom title
while true; do
    xsetroot -name "| $(dte)"
    sleep 5
done &
