#! /bin/bash

# Start notifications
dunst &

# Start polkit poller
## This is important in case a user application needs to run something with higher
## privileges
lxqt-policykit-agent &

# Do custom macbook script
if lspci | grep Apple; then
	souce ~/config/installation/custom/macbook.sh
fi

# Start emacs
#echo "Starting emacs"
#emacs --daemon &

# Get monitors set up
source ~/.screenlayout/default.sh
feh --bg-scale ~/media/pictures/Wallpapers/clear_mountain.jpg

# Start compositor
if pacman -Qs picom-tryone-git; then
	picom --experimental-backends --backend glx --config ~/config/.config/picom/picom.conf --daemon &
elif pacman -Qs picom; then
	picom --config ~/config/.config/picom/picom.conf --daemon &
fi
