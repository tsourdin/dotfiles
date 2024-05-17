#!/bin/sh

alacritty_config_file=/home/thibault/dotfiles/.config/alacritty/alacritty.toml
alacritty_dark_theme=catppucin-frappe
alacritty_light_theme=catppuccin-latte

tmux_config_file=/home/thibault/dotfiles/.tmux.conf
tmux_dark_theme=frappe
tmux_light_theme=latte

gtk_theme=$(gsettings get org.gnome.desktop.interface gtk-theme)

if [ "$gtk_theme" = "'Yaru-dark'" ]
then
    gsettings set org.gnome.desktop.interface gtk-theme 'Yaru'
    gsettings set org.gnome.desktop.interface color-scheme 'default'
    gsettings set org.gnome.desktop.interface icon-theme 'Yaru'
    sed -i "s/$alacritty_dark_theme/$alacritty_light_theme/" "$alacritty_config_file"
    sed -i "s/$tmux_dark_theme/$tmux_light_theme/" "$tmux_config_file"
elif [ "$gtk_theme" = "'Yaru'" ] # if light theme : we switch to dark
then
    gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.desktop.interface icon-theme 'Yaru-dark'
    sed -i "s/$alacritty_light_theme/$alacritty_dark_theme/" "$alacritty_config_file"
    sed -i "s/$tmux_light_theme/$tmux_dark_theme/" "$tmux_config_file"
fi
tmux source-file "$tmux_config_file"
