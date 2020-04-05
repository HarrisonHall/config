#! /bin/bash

# Laptop touch click
# scroll delta is inversly proportional to
# scroll speed
synclient MaxTapTime=0
synclient VertScrollDelta=-250  
synclient HorizScrollDelta=-250  

# Background
feh --bg-scale ~/Pictures/Wallpapers/nord_rocket.png

pc=$(hostname)

dte(){
    dte="$(date +'%d %b - %H:%M')"
    echo -e "$dte"
}

bat0() {
    bat="$(acpi -b | grep -o '[0-9]\{1,\}%')"
    echo -e "$bat"
}

# Custom title
while true; do
    name="[$(dte)]"
    
    if [ "$pc" == "harrisonmac" ]
    then
        name="[$(bat0)] ${name}";
    fi
    
    xsetroot -name "${name}"
    sleep 5s
done &
