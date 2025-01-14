# History
HISTFILE=~/.zsh_history
HISTSIZE=7000
SAVEHIST=5000
setopt extended_history
# share histroy accross sessions
# (also replaces inc_append_history)
setopt share_history
# duplicated commands are removed first
setopt hist_expire_dups_first
# do not save in history if duplicate of the previous command
setopt hist_ignore_dups
# do not include duplicates when searching with ^R
setopt hist_find_no_dups
# remove useless blanks in commands when saving to history
setopt hist_reduce_blanks
# ask for confirmation before executing last command
setopt hist_verify
# allow background jobs (spawned with &) to stay up
# after exiting the shell
unsetopt hup
# cd in dir even without cd command
setopt autocd 
# deactivate beeping when error
unsetopt beep 
# allow comments with # on interactive shell
setopt interactivecomments 

# Initialize completion system
zstyle :compinstall filename '/home/thibault/.zshrc'

# eksctl completion (Amazon eks CLI)
fpath=($fpath ~/.zsh/completion)
autoload -Uz compinit
compinit

# Some more completion
autoload -U +X bashcompinit && bashcompinit
# Terraform completion
complete -o nospace -C '/usr/bin/terraform' terraform
# AWS completion
complete -C '/usr/local/bin/aws_completer' aws

# # Keybindings
# # First, some reading about keybindings :
# # https://unix.stackexchange.com/questions/560461/how-to-get-codes-for-zsh-bindkey
# # https://unix.stackexchange.com/a/444270/5132
# # https://unix.stackexchange.com/a/499139/5132
# # https://unix.stackexchange.com/questions/238406
# bindkey -v # vi mode
# # rebind DEL to delete-char (https://superuser.com/questions/983016/zsh-delete-keybinding)
# bindkey -M viins '\e[3~' delete-char 
# # vi mode deactivates Ctrl+R search, we reactivate it in insert mode
# bindkey -M viins '^R' history-incremental-search-backward 
# bindkey -M viins '^S' history-incremental-search-forward
# # deactivate terminal flow control to be able to use Ctrl + S
# stty -ixon
# # same for emacs-style move to beggining / end
# bindkey -M viins '^A' beginning-of-line
# bindkey -M viins '^E' end-of-line
# # default old-vi-mode doesn't allow backspace after A from vicmd mode
# bindkey -M viins '^?' backward-delete-char
# # to get last argument with <ESC>+. in command mode
# function _vi-yank-arg {
#   NUMERIC=1 zle .vi-add-next
#   zle .insert-last-word
# }
# zle -N _vi-yank-arg
# bindkey -M vicmd . _vi-yank-arg
# # no delay for cmd mode (1 100th of seconds)
# KEYTIMEOUT=1
# # disable ESC in cmd mode, by default ESC makes ZLE wait for another keystroke
# bindkey -M vicmd '^[' undefined-key
# # disable Ctrl+X widgets in insert mode, not usefull ?
# # bindkey -rM viins '^X'
# # toggle sudo at the beginning in viins mode with Alt+s
# function _toggle_sudo {
# 	if [[ "$BUFFER" =~ "^su.*" ]]
# 	then
# 		zle beginning-of-line
# 		zle delete-word
# 		zle delete-char
# 	else
# 		zle beginning-of-line
# 		BUFFER="sudo $BUFFER"
# 	fi
# 	zle end-of-line
# }
# zle -N _toggle_sudo
# bindkey  -M viins '\es' _toggle_sudo

# Use starship prompt
eval "$(starship init zsh)"

# To make colors work when sshed
export TERM=xterm-256color

# Aliases
alias -g L=less
alias -g B=bat
alias -g CP=wl-copy
alias -g vi=nvim
alias -g vim=nvim
alias ls='ls --color=auto'
alias ll='ls -al'
alias chromium='chromium --ozone-platform-hint=auto'
alias dpa='docker ps --all'
alias di='docker images'
alias vstop='virsh shutdown'
alias vstart='virsh start'
alias vu='vagrant up'
alias vd='vagrant destroy'

alias k='kubectl'

alias ka='kubectl apply -f'
alias kr='kubectl replace -f'
alias kga='kubectl get all'
alias kex='kubectl exec -it'

# User defined functions
mkcd() {
    if [[ -z "$1" ]] ; then
        echo "usage: \e[1;36mmkcd \e[1;0m< directory >"
        echo "       Creates the specified directory and then changes it to pwd"
    else
    if [[ ! -d "$1" ]] ; then
        mkdir -p $1 && cd $1
    else
        cd $1
    fi
    fi
}

# From https://github.com/gokcehan/lf/wiki/Tutorial
# allows to cd with lf
LFCD=".config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
bindkey -M viins -s '^o' 'lfcd\n'

# Environment variables
export EDITOR=nvim
export VISUAL=nvim
# Coloured manpages with bat : https://github.com/sharkdp/bat#man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
# Add go binaries path to PATH
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# Use autosuggestions. See https://github.com/zsh-users/zsh-autosuggestions
# (Installed with package extra/zsh-autosuggestions)
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(completion)

# Use syntax coloration plugin. See https://github.com/zsh-users/zsh-syntax-highlighting
# (Installed with package community/zsh-syntax-highlighting)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# color brackets
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets)
# customize colors
typeset -A ZSH_HIGHLIGHT_STYLES
# command and aliases colored in cyan instead of green
ZSH_HIGHLIGHT_STYLES[command]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[comment]='fg=white'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=red,underline'
