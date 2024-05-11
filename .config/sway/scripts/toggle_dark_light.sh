#!/bin/sh

alacritty_config_file=/home/thibault/dotfiles/.config/alacritty/alacritty.toml
alacritty_dark_theme=afterglow
alacritty_light_theme=ayu_light

gtk_theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
if [ "$gtk_theme" = "'Yaru-dark'" ]
then
    gsettings set org.gnome.desktop.interface gtk-theme 'Yaru'
    gsettings set org.gnome.desktop.interface color-scheme 'default'
    gsettings set org.gnome.desktop.interface icon-theme 'Yaru'
    sed -i "s/\(.*$alacritty_dark_theme.*\)/# \1/g" "$alacritty_config_file" # comment afterglow theme
    sed -i "s/^# \(.*$alacritty_light_theme.*\)/\1/g" "$alacritty_config_file" # uncomment ayu_light theme
elif [ "$gtk_theme" = "'Yaru'" ] # if light theme : we switch to dark
then
    gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.desktop.interface icon-theme 'Yaru-dark'
    sed -i "s/\(.*$alacritty_light_theme.*\)/# \1/g" "$alacritty_config_file" # comment ayu_light theme
    sed -i "s/^# \(.*afterglow.*\)/\1/g" "$alacritty_config_file" # uncomment afterglow theme
fi

