#!/bin/bash

rm -f /tmp/colorgrab
color=$(grabc 2> /tmp/colorgrab)
colorrgb=$(cat /tmp/colorgrab)
choices="copy ${color}\ncopy ${colorrgb}\nexit"
choice=$( echo -e $choices | ~/Documents/.tmuxrc/dmenu/dmenu)

case $choice in
    "copy ${color}")
        echo $color | xclip -selection clipboard
        ;;
    "copy ${colorrgb}")
        echo $colorrgb | xclip -selection clipboard
        ;;
    *)
esac
