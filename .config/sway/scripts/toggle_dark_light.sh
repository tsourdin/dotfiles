#!/bin/sh

ALACRITTY_CONFIG_FILE=/home/thibault/dotfiles/.config/alacritty/alacritty.toml
ALACRITTY_DARK_THEME=catppuccin_frappe
ALACRITTY_LIGHT_THEME=catppuccin_latte

TMUX_CONFIG_FILE=/home/thibault/dotfiles/.tmux.conf
TMUX_DARK_THEME=frappe
TMUX_LIGHT_THEME=latte

CURRENT_MODE=$(gsettings get org.gnome.desktop.interface color-scheme)

if [ "$CURRENT_MODE" = "'prefer-dark'" ]
then
    gsettings set org.gnome.desktop.interface gtk-theme 'Yaru'
    gsettings set org.gnome.desktop.interface color-scheme 'default'
    gsettings set org.gnome.desktop.interface icon-theme 'Yaru'
    sed -i "s/$ALACRITTY_DARK_THEME/$ALACRITTY_LIGHT_THEME/" "$ALACRITTY_CONFIG_FILE"
    sed -i "s/$TMUX_DARK_THEME/$TMUX_LIGHT_THEME/" "$TMUX_CONFIG_FILE"
elif [ "$CURRENT_MODE" = "'default'" ] # if light theme : we switch to dark
then
    gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.desktop.interface icon-theme 'Yaru-dark'
    sed -i "s/$ALACRITTY_LIGHT_THEME/$ALACRITTY_DARK_THEME/" "$ALACRITTY_CONFIG_FILE"
    sed -i "s/$TMUX_LIGHT_THEME/$TMUX_DARK_THEME/" "$TMUX_CONFIG_FILE"
fi
tmux source-file "$TMUX_CONFIG_FILE"
