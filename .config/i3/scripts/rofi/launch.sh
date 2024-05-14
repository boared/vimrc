#!/bin/bash

I3_CONFIG_PATH="$HOME/.config/i3"
menu="$1"

if [ "$menu" = "appmenu" ]; then
    rofi -show drun -theme clean
elif [ "$menu" = "powermenu" ]; then
    rofi -modi "Powermenu:$I3_CONFIG_PATH/scripts/rofi/powermenu.sh" -show Powermenu -theme powermenu
elif [ "$menu" = "filebrowser" ]; then
    rofi -modi "Filebrowser:$I3_CONFIG_PATH/scripts/rofi/filebrowser.sh $2" -show Filebrowser -theme music-launcher
elif [ "$menu" = "tabmenu" ]; then
    $I3_CONFIG_PATH/scripts/rofi/tabmenu.sh
elif [ "$menu" = "music" ]; then
    rofi -modi "Music:$I3_CONFIG_PATH/scripts/rofi/music.sh" -show Music -theme music-launcher
fi
