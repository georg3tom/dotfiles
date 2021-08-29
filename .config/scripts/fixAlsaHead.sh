#!/bin/sh

file=/usr/share/alsa-card-profile/mixer/paths/analog-input-internal-mic.conf
cat <<EOT >> $file

[Jack Headphone Mic]
state.plugged = no
state.unplugged = unknown

[Jack Headset Mic]
state.plugged = no
state.unplugged = unknown
EOT
