#!/usr/bin/env bash

directory="/home/danielgm/Pictures/screenshots/"
file_name="$(date +'%m-%d-%Y-%H%M%S.png')"

scrot "$directory$file_name" --select --line mode=edge
xclip -selection clipboard -t image/png -i "$directory$file_name"

#mkdir -p /home/danielgm/Pictures/screenshots/ && scrot /home/danielgm/Pictures/screenshots/%m-%d-%Y-%H%M%S.png --select --line mode=edge && xclip -selection clipboard -t image/png -i "$directory$file_name"
