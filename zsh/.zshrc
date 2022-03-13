# ------------------------------ autoload ------------------------------

autoload -U colors && colors	# Load colors
autoload edit-command-line; zle -N edit-command-line
autoload -Uz vcs_info
autoload -Uz compinit && compinit

# ------------------------------ setopt ------------------------------
 
setopt interactive_comments
setopt PROMPT_SUBST
setopt prompt_subst

# ------------------------------ zstyle ------------------------------
 
zstyle ':completion:*' menu select
zstyle ':vcs_info:git:*' formats '%F{red}(%b)%f'
zstyle ':vcs_info:*' enable git
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist

# ------------------------------ vcs_git ------------------------------

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
 
# ------------------------------ history -----------------------------

HISTCONTROL=ignorebot
HISTSIZE=200
HISTFILE="$XDG_CACHE_HOME/zsh-history"

# ------------------------------- prompt -----------------------------
 
PS1='%F{green}%n%f:%F{blue}%1~%f${vcs_info_msg_0_}%f%# '
 
# ------------------------------ keybindings ----------------------------------

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v
bindkey '^[[P' delete-char
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward
bindkey '^e' edit-command-line
bindkey '^ ' autosuggest-accept
bindkey -s '^f' 'tmux-sessionaizer\n'

# ------------------------------ aliases -----------------------------
#
alias scratch="$EDITOR $SYNC/scratchpad.md"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias vi='nvim'
alias ls='ls --color'
alias g='git'

# ---------------------------- plugins ----------------------------------------
#
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-hightlighting/zsh-syntax-highlighting.zsh 
