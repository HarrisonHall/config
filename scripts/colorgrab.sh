#!/bin/bash

rm -f /tmp/colorgrab
color=$(grabc 2> /tmp/colorgrab)
colorrgb=$(cat /tmp/colorgrab)
choices="${color}\n${colorrgb}\nExit"
sleep .2
choice=$( echo -e $choices | rofi -dmenu -p "Copy")

case $choice in
    "${color}")
        echo $color | xclip -selection clipboard
        ;;
    "${colorrgb}")
        echo $colorrgb | xclip -selection clipboard
        ;;
    *)
esac
