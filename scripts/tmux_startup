#!/bin/sh

# start a new tmux session and detach from it
tmux new-session -d -s base


# Dashboard
tmux rename-window 'DASH'
tmux send-keys 'vtop' C-m

tmux select-window -t base:1
tmux split-window -h -p 40 -c "#{pane_current_path}"
tmux send-keys 'neofetch' C-m

tmux split-window -v -p 25 -c "#{pane_current_path}"
tmux send-keys 'date | cowsay | lolcat' C-m

tmux split-window -t 1 -v -p 10
tmux select-window -t 4


# Classwork window
tmux new-window 
tmux rename-window 'CLASS'

tmux select-window -t base:2.1

tmux send-keys 'cd ~/Documents/classes/' C-m
tmux send-keys 'clear' C-m
tmux send-keys 'ls' C-m

tmux select-window -t base:2.1
tmux split-window -h -p 50 -c ~/Documents/classes/
tmux send-keys 'cowsay Class' C-m


# Avionics window
tmux new-window
tmux rename-window 'AVIONICS'

tmux select-window -t base:3.1
tmux send-keys 'cd ~/Documents/projects/avionics/' C-m
tmux send-keys 'clear' C-m
tmux send-keys 'ls' C-m

tmux select-window -t base:3.1
tmux split-window -h -p 50 -c ~/Documents/projects/avionics/
tmux send-keys 'cowsay Avionics' C-m


# Finish
tmux select-window -t 1.2

# attach our terminal to the tmux session
tmux -2 attach-session -t 
