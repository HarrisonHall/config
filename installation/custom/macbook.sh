#!/bin/bash

# Setup stuff if on macbook
## Setup resolution
xrandr --output eDP-1 --primary --mode 1680x1050 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off
feh --bg-scale /home/harrison/media/pictures/Wallpapers/ice_village.jpg

## Setup wifi
sudo rmmod ssb
sudo rmmod bcma
sudo rmmod b43
sudo rmmod wl
sleep 5
sudo modprobe wl  # This is the right driver

