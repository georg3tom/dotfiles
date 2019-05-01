#!/bin/sh

clip=$(xclip -o -selection clipboard)
prim=$(xclip -o -selection primary)

[ -n "$clip" ] && notify-send "Clipboard:" "$clip"
[ -n "$prim" ] && notify-send "Primary:" "$prim"
