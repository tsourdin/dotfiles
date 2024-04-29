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

# Some more completion
autoload -U +X bashcompinit && bashcompinit
# Terraform completion
# complete -o nospace -C '/usr/bin/terraform' terraform
# AWS completion
complete -C '/usr/local/bin/aws_completer' aws

### Keybindings : Usefull if I want to go back to vi keybindings. For now emacs is ok
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
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey -s ^f "tmux-sessionizer\n"

# Prompt
# Append local prompts themes directory to fpath
fpath=(~/.config/zsh/.zprompts $fpath)
# Load promptinit function and call it (search promptinit in the man)
autoload -U promptinit
promptinit
# Set theme
prompt perso1

# To make colors work when sshed
export TERM=xterm-256color

# Aliases
alias -g L=less
alias -g B=bat
alias -g CP=wl-copy
alias vi=nvim
alias ls='ls --color=auto'
alias ll='ls -al'
alias chromium='chromium --ozone-platform-hint=auto'
alias dpa='docker ps --all'
alias di='docker images'
alias vstop='virsh shutdown'
alias vstart='virsh start'
# Kubernetes
# Verbs:
# g=get c=create d=delete dc=describe a=apply e=edit
# Nouns :
# p=pod d=deploy s=service c=configmap sc=secret st=statefulset
alias k='kubectl'

alias kg='kubectl get'
alias kgp='kubectl get pods -o wide'
alias kgpa='kubectl get pods -o wide --all-namespaces'
alias kgd='kubectl get deployments.apps -o wide'
alias kgs='kubectl get services -o wide'
alias kgc='kubectl get configmaps'
alias kgsc='kubectl get secrets'

alias kc='kubectl create'
alias kcp='kubectl create pod'
alias kcd='kubectl create deployment'
alias kcs='kubectl create service'
alias kcc='kubectl create configmap'
alias kcsc='kubectl create secret'

alias kde='kubectl delete'
alias kdep='kubectl delete pods'
alias kded='kubectl delete deployments.app'
alias kdes='kubectl delete services'
alias kdec='kubectl delete configmaps'
alias kdesc='kubectl delete secrets'

alias kdc='kubectl describe'
alias kdcp='kubectl describe pods'
alias kdcd='kubectl describe deployments.apps'
alias kdcs='kubectl describe services'
alias kdcc='kubectl describe configmaps'
alias kdcsc='kubectl describe secrets'

alias kedp='kubectl edit pods'
alias kedd='kubectl edit deployments.apps'
alias keds='kubectl edit services'
alias kedc='kubectl edit configmaps'
alias kedsc='kubectl edit secrets'

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

# Environment variables
export EDITOR=nvim
export VISUAL=nvim
# Coloured manpages with bat : https://github.com/sharkdp/bat#man
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# export MANROFFOPT="-c"
# Add go binaries and nvim path to PATH
export GOPATH="$HOME/.go/bin"
export NVIMPATH="/opt/nvim-linux64/bin"
export LOCALPATH="$HOME/.local/bin"
export PATH="$PATH:$GOPATH:$NVIMPATH:$LOCALPATH"

# Use autosuggestions. See https://github.com/zsh-users/zsh-autosuggestions
# (Installed with package extra/zsh-autosuggestions)
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(completion)

# Use syntax coloration plugin. See https://github.com/zsh-users/zsh-syntax-highlighting
# (Installed with package community/zsh-syntax-highlighting)
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# color brackets
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets)
# customize colors
typeset -A ZSH_HIGHLIGHT_STYLES
# available colors : command and aliases colored in cyan instead of green
ZSH_HIGHLIGHT_STYLES[command]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[comment]='fg=white'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=underline'
