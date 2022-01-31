#!/bin/bash

umask ${UMASK:-0000}

[[ ! -f /root/.config/nicotine/config ]] && cp /root/.config/default/config /root/.config/nicotine/config

sed -i "s/login =.*/login = $LOGIN/g" /root/.config/nicotine/config
sed -i "s/passw =.*/passw = $PASSW/g" /root/.config/nicotine/config

nginx

# Doesn't seem to work
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

broadwayd :1 &
# gtk4-broadwayd :1 &
# NICOTINE_GTK_VERSION=4

export GDK_BACKEND=broadway
export BROADWAY_DISPLAY=:1

if [[ $DARKMODE == "true" ]]; then
	export GTK_THEME=Adwaita:dark
fi

nicotine
