# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
setopt interactive_comments
setopt PROMPT_SUBST

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# History in cache directory:
HISTCONTROL=ignorebot
HISTSIZE=50
HISTFILE="$XDG_CACHE_HOME/zsh-history"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{red}(%b)%f'
zstyle ':vcs_info:*' enable git
PS1='%F{green}%n%f:%F{blue}%1~%f${vcs_info_msg_0_}%f%# '

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey '^[[P' delete-char
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward
bindkey '^e' edit-command-line
bindkey -s '^f' 'tmux-sessionaizer\n'
autoload edit-command-line; zle -N edit-command-line

alias scratch="$EDITOR $SYNC/scratchpad.md"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias vi='nvim'
alias ls='ls --color'
alias g='git'

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-hightlighting/zsh-syntax-highlighting.zsh 
