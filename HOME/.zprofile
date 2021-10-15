#!/bin/zsh
source .zshrc
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx > /dev/null
fi
