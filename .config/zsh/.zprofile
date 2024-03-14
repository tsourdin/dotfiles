# This is sourced by SDDM when logging in (after .zshrc is sourced)
export MOZ_ENABLE_WAYLAND=1
# GTK backend defaults to wayland, no need to set GDK_BACKEND=wayland
export QT_QPA_PLATFORM=wayland # "wayland;xcb" # allow to fallback on X11 if needed
export QT_QPA_PLATFORMTHEME=gtk2 # needed to use GTK theme, see https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications#QGnomePlatform
export SDL_VIDEODRIVER="wayland,x11"
export GTK2_RC_FILES=/usr/share/themes/Breeze/gtk-2.0/gtkrc
export ZDOTDIR=.config/zsh
