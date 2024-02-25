#!/bin/sh

theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
if [[ $theme == "'Breeze-Dark'" ]]
then
    gsettings set org.gnome.desktop.interface gtk-theme 'Breeze'
    export GTK2_RC_FILES=/usr/share/themes/Breeze/gtk-2.0/gtkrc
    export GTK_THEME=Breeze
    rm ~/.config/gtk-4.0
    ln -s /usr/share/themes/Breeze/gtk-4.0 ~/.config/gtk-4.0
elif [[ $theme == "'Breeze'" ]]
then
    gsettings set org.gnome.desktop.interface gtk-theme 'Breeze-Dark'
    export GTK2_RC_FILES=/usr/share/themes/Breeze-Dark/gtk-2.0/gtkrc
    export GTK_THEME=Breeze-Dark
    rm ~/.config/gtk-4.0
    ln -s /usr/share/themes/Breeze-Dark/gtk-4.0 ~/.config/gtk-4.0
fi
echo $GTK2_RC_FILES
echo $GTK_THEME
