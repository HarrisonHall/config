#! /bin/bash

# Destroy if already running
[ "$( pgrep autostart.sh | head -1 )" != "$$" ] && echo "Already Running" && exit 0

# Start emacs
#echo "Starting emacs"
#emacs --daemon &

# Start notifications
dunst &

# Start compositor
if pacman -Qs picom-tryone-git; then
	picom --experimental-backends --backend glx --config ~/config/.config/picom/picom.conf --daemon &
elif pacman -Qs picom; then
	picom --config ~/config/.config/picom/picom.conf --daemon &
fi

pc=$(hostname)

if [ "$pc" == "harrison-archmbp" ]
then
    # Laptop touch click
    # scroll delta is inversly proportional to
    # scroll speed
    #synclient MaxTapTime=0
    #synclient VertScrollDelta=-250  
    #synclient HorizScrollDelta=-250  
    
    # Background
    source ~/.screenlayout/default.sh
    feh --bg-scale ~/config/media/rdark.png
fi
if [ "$pc" == "archlinux" ]
then
    #source ~/.screenlayout/default.sh
	feh --bg-scale ~/media/pictures/Wallpapers/ice_village.jpg
	source ~/config/installation/custom/macbook.sh
fi
if [ "$pc" == "harrison-archssd" ]
then
    #feh --bg-scale ~/config/media/rdark.png
	feh --bg-scale ~/media/pictures/Wallpapers/clear_mountain.jpg &
    source ~/.screenlayout/default.sh &
fi

## Colors (Nord)
b1="#2e3440"
b2="#3b4252"
b3="#434c5e"
b4="#4c566a"
w1="#d8dee9"
w2="#e5e9f0"
w3="#eceff4"
bl1="#8fbcbb"
bl2="#88c0d0"
bl3="#81a1c1"
bl4="#5e81ac"
a1="#bf616a" #red
a2="#d08770" #orange
a3="#ebcb8b" #yellow
a4="#a3be8c" #green
a5="#b48ead" #purple

dte(){
    dte="$(date +'%d %b - %H:%M')"
    echo -e "⧗ $dte"
}

bat0() {
    bat="$(acpi -b | grep -o '[0-9]\{1,\}%')"
    echo -e "☇ $bat"
}

vol() {
    vol="$(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }')"
    echo -e "⏆ $vol"
}

# Custom title
while true; do
    name="^c${a4}^$(dte) "
    name="^c${a3}^$(vol)^c${w1}^ | ${name}"
    
    if [ "$pc" == "harrison-archmbp" ]
    then
        name="^c${a5}^$(bat0)^c${w1}^ | ${name}";
    fi

    if [ "$pc" ==  "harrison-lb-ssd5" ]
    then
        name="${name}";
    fi

    if [ "$pc" == "harrison-archssd" ]
    then
	name=" ${name}";
    fi
    
    xsetroot -name "${name}"
    sleep 5s
done &
