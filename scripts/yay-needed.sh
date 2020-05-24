#!/bin/bash
yay -S --noconfirm $(yay -Qi $@ 2>&1 >/dev/null | grep "error: package" | grep "was not found" | cut -d"'" -f2 | tr "\n" " ")
