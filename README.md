# dotfiles

This is meant to be managed with stow.
(See [this video](https://www.youtube.com/watch?v=y6XCebnB9gs&list=WL&index=6))

The structure is the following for now:
```
.
├── .config
│   ├── alacritty
│   │   ├── alacritty.toml
│   │   ├── alacritty.yml
│   ├── dunst
│   │   └── dunstrc
│   ├── gtk-3.0.old
│   │   └── settings.ini
│   ├── gtk-4.0 -> /usr/share/themes/Breeze/gtk-4.0
│   ├── i3status
│   ├── lf
│   ├── nvim
│   ├── sway
│   │   ├── config
│   │   ├── config.d
│   │   ├── icons
│   │   └── scripts
│   └── swaync
└── .zshrc
```

To install allacritty themes, clone this [repo]()
in `.config/alacritty/themes`:
```
mkdir -p .config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme .config/alacritty/themes
```

To apply the following configuration to your system, first make sure that any of
those directories are absent in your home directory. Then run
```
stow .
```
