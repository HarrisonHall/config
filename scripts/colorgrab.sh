#!/bin/bash

rm -f /tmp/colorgrab
color=$(grabc 2> /tmp/colorgrab)
colorrgb=$(cat /tmp/colorgrab)
choices="${color}\n${colorrgb}\nNone"
choice=$( echo -e $choices | ~/Documents/.tmuxrc/dmenu/dmenu -p "Copy")

case $choice in
    "${color}")
        echo $color | xclip -selection clipboard
        ;;
    "${colorrgb}")
        echo $colorrgb | xclip -selection clipboard
        ;;
    *)
esac
