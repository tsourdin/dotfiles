#!/bin/sh

ALACRITTY_CONFIG_FILE=/home/thibault/dotfiles/.config/alacritty/alacritty.toml
ALACRITTY_DARK_THEME=catppuccin_frappe
ALACRITTY_LIGHT_THEME=catppuccin_latte

TMUX_CONFIG_FILE=/home/thibault/dotfiles/.tmux.conf
TMUX_DARK_THEME=frappe
TMUX_LIGHT_THEME=latte

NVIM_CONFIG_FILE=/home/thibault/.config/nvim/init.lua
NVIM_SERVER_PIPE=/home/thibault/.cache/nvim/server.pipe
NVIM_DARK_THEME=catppuccin-frappe
NVIM_LIGHT_THEME=catppuccin-latte

CURRENT_MODE=$(gsettings get org.gnome.desktop.interface color-scheme)

if [ "$CURRENT_MODE" = "'prefer-dark'" ]
then
    gsettings set org.gnome.desktop.interface gtk-theme 'Yaru'
    gsettings set org.gnome.desktop.interface color-scheme 'default'
    gsettings set org.gnome.desktop.interface icon-theme 'Yaru'
    sed -i "s/$ALACRITTY_DARK_THEME/$ALACRITTY_LIGHT_THEME/" "$ALACRITTY_CONFIG_FILE"
    sed -i "s/$TMUX_DARK_THEME/$TMUX_LIGHT_THEME/" "$TMUX_CONFIG_FILE"
    sed -i "s/$NVIM_DARK_THEME/$NVIM_LIGHT_THEME/" "$NVIM_CONFIG_FILE"
    /opt/nvim-linux64/bin/nvim --remote-send ":colorscheme $NVIM_LIGHT_THEME<CR>" --server "$NVIM_SERVER_PIPE"
elif [ "$CURRENT_MODE" = "'default'" ] # if light theme : we switch to dark
then
    gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.desktop.interface icon-theme 'Yaru-dark'
    sed -i "s/$ALACRITTY_LIGHT_THEME/$ALACRITTY_DARK_THEME/" "$ALACRITTY_CONFIG_FILE"
    sed -i "s/$TMUX_LIGHT_THEME/$TMUX_DARK_THEME/" "$TMUX_CONFIG_FILE"
    sed -i "s/$NVIM_LIGHT_THEME/$NVIM_DARK_THEME/" "$NVIM_CONFIG_FILE"
    /opt/nvim-linux64/bin/nvim --remote-send ":colorscheme $NVIM_DARK_THEME<CR>" --server "$NVIM_SERVER_PIPE"
fi
tmux source-file "$TMUX_CONFIG_FILE"
ls "$HOME/.cache/nvim/"
