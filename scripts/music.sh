#!/bin/bash
# audiovisualize

~/config/st/st -e bash -c 'tmux && cmus && tmux split-window -p 25 && cava'
