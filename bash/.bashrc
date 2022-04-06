#!/usr/bin/env bash

case $- in
  *i*) ;;
      *) return ;;
esac

# --------------------------- functions ------------------------------

# apath, ppath and __ps1 are ispired by rwxrob and is bashrc 
# https://github.com/rwxrob/dot/blob/main/.bashrc

apath() {
  declare arg
  for arg in "$@"; do
    [[ -d "$arg" ]] || continue
    PATH=${PATH//":$arg:"/:}
    PATH=${PATH/#"$arg:"/}
    PATH=${PATH/%":$arg"/}
    export PATH="${PATH:+"$PATH:"}$arg"
  done
} && export apath

ppath() {
  for arg in "$@"; do
    [[ -d "$arg" ]] || continue
    PATH=${PATH//:"$arg:"/:}
    PATH=${PATH/#"$arg:"/}
    PATH=${PATH/%":$arg"/}
    export PATH="$arg${PATH:+":${PATH}"}"
  done
} && export ppath

__ps1() {
    b='\[\e[30m\]' 
    r='\[\e[31m\]' 
    gr='\[\e[0;32m\]' 
    y='\[\e[33m\]' 
    bl='\[\e[34m\]' 
    p='\[\e[35m\]'
    c='\[\e[36m\]' 
    g='\[\e[0;90m\]' 
    x='\[\e[0m\]'

    local G=$(git branch --show-current 2>/dev/null)
    local P='$'
    [[ $EUID == 0 ]] && P='#'
    [[ $G = master || $G = main ]] 
    [[ -n "$G" ]] && G="($G)"

    PS1="$gr\u$x:$bl\W$x$r$G$x$x$P$x "
}

export_dir() {
  [[ -d "$2" ]] && export "$1"="$2"
}

# ----------------------- environment variables ----------------------

# Make the editor variable portable in every system
if [[ -n $(which nvim) ]]; then 
  export EDITOR="nvim"
elif [[ -n $(which vi) ]]; then
  export EDITOR="vi" 
else 
  export EDITOR="ed -p ':'"
fi

export BASH_SILENCE_DEPRECATION_WARNING=1
export XDG_RUNTIME_DIR="/tmp"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"
export XDG_CONFIG_HOME="$HOME/.config" 
export XDG_DATA_HOME="$HOME/.local/share" 
export XDG_STATE_HOME="$HOME/.local/state" 
export XDG_CACHE_HOME="$HOME/.cache" 
export MANPAGER="less" 
export CLICOLOR=1 
export LESSHISTFILE=- 
export GNUPGHOME="$XDG_DATA_HOME/gnupg" 
export CARGO_HOME="$XDG_DATA_HOME/cargo" 
export GOPATH="$XDG_DATA_HOME/go" 
export LSCOLORS="exgxcxdxCxegedabagacad"
export LANG="en_US.UTF-8"

export_dir SYNC "$XDG_DOCUMENTS_DIR/nextcloud" 
export_dir PROJECTS "$SYNC/Projects" 
export_dir NOTES "$SYNC/notes"
export_dir REPOS "$HOME/Repos" 
export_dir DOTFILES "$REPOS/dot" 
export_dir SCRIPTS "$DOTFILES/scripts"

if [[ -n $(which nnn) ]]; then
  export NNN_OPTS="QHed"
  BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
  export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
  export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    OPEN="open"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OPEN="xdg-open"
fi

# ------------------------------- path -------------------------------

ppath "$SCRIPTS"
apath /usr/local/opt /opt/local/bin /opt/local/sbin

# ------------------------------ cdpath ------------------------------

export CDPATH=".:$HOME:$REPOS:$PROJECTS:$DOTFILES:$SYNC"

# ------------------------------ history -----------------------------

HISTCONTROL=ignorebot
HISTSIZE=100
HISTFILE="$XDG_CACHE_HOME/bash_history"

# ------------------------------- prompt -----------------------------

PROMPT_COMMAND="__ps1"
PS1="\W"

# ------------------------------ aliases -----------------------------

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ed='ed -p ":"'
alias ls='ls --color'
alias vi='nvim'
alias g='git'
alias gs='git status '
alias ga='git add '
alias gu='git restore --stagged '
alias gc='git commit '
alias gp='git push '
alias update='caffeinate update'
alias tree='tree --gitignore'

# Preserve TAB compeltition for git
complete -o nospace -F __git_wrap__git_main g
# if neovim is unaveilable use vim or vi
[[ -n $(which nvim) ]] || unalias vi

# -------------------------------- keybinding ------------------------

bind -x '"\C-b":"tm"'
bind -x '"\C-f":"search"'
bind -x '"\C-o":"$OPEN ."'

# -------------------------------- completion ------------------------

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[[ -r "/etc/profile.d/bash_completion.sh" ]] && . "/etc/profile.d/bash_completion.sh"
[[ -r "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh" ]]  && . $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
eval "$(gh completion -s bash)"
