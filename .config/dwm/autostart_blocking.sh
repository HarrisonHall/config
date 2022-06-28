#! /bin/bash

# Start notifications
pgrep dunst || dunst &

# Start polkit poller
## This is important in case a user application needs to run something with higher
## privileges
pgrep lxqt-policykit-agent || lxqt-policykit-agent &

# Do custom macbook script
if lspci | grep Apple; then
	souce ~/config/installation/custom/macbook.sh
fi

# Start emacs
pgrep emacs || emacs --daemon &

# Get monitors set up
source ~/.screenlayout/default.sh
feh --bg-scale ~/media/pictures/Wallpapers/clear_mountain.jpg

# Start compositor
pgrep picom || picom --config ~/config/.config/picom/picom.conf --daemon --experimental-backends
