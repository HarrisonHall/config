#!/bin/bash

choices="screenshot\nexit"
choice=$( echo -e $choices | ~/Documents/.tmuxrc/dmenu/dmenu)

case $choice in
    "screenshot")
        scrot -s /tmp/tmp.png && xclip -selection clipboard -t image/png -i /tmp/tmp.png && rm /tmp/tmp.png
        ;;
    *)
esac

