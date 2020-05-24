#!/bin/bash

choices="screenshot\nscreenrecording\nexit"
choice=$( echo -e $choices | rofi -dmenu -p "Screenshot Applications")

case $choice in
    "screenshot")
        scrot -s /tmp/tmp.png && xclip -selection clipboard -t image/png -i /tmp/tmp.png && rm /tmp/tmp.png
        ;;
    "screenrecording")
        kazam
        ;;
    *)
esac

