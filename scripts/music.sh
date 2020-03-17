#!/bin/bash
# music player

if tmux ls | grep -q "music"
then
    ~/config/st/st -e tmux new-session -A -s music
else
    tmux new-session -d -s music 'cmus';
    tmux split-window -t music -p 20 'cava' \;
    ~/config/st/st -e tmux a -t music
fi
