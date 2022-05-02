#!/usr/bin/env bash

case $- in
*i*) ;;
*) return ;;
esac

# ---------------------- local utility functions ---------------------

_export_dir() { [[ -d "$2" ]] && export "$1"="$2"; }
_source_if() { [[ -r "$1" ]] && . "$1"; }
_have() { type "$1" &>/dev/null; }
_export_osx() { [[ "$OSTYPE" == "darwin"* ]] && export "$1"; }
_export_linux() { [[ "$OSTYPE" == "linux-gnu"* ]] && export "$1"; }

# --------------------------- environment variables --------------------------

export XDG_DATA_DIRS="$HOME/.nix-profile/share:/usr/local/share:/usr/share"
export XDG_RUNTIME_DIR="/tmp"
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
export EDITOR="ed -p :"
export CLICOLOR=1
export LESSHISTFILE=-
export LSCOLORS="exgxcxdxCxegedabagacad"
export LANG="en_US.UTF-8"
export COLORTERM=truecolor
export GOPATH="$XDG_DATA_HOME/go"

_have vi && export EDITOR="vi"
_have nvim && export EDITOR="nvim"
_have atom && export ATOM_HOME="$XDG_DATA_HOME"/atom
_have gpg && export GNUPGHOME="$XDG_DATA_HOME/gnupg"
_have cargo && export CARGO_HOME="$XDG_DATA_HOME/cargo"
if _have nnn; then
    export NNN_OPTS="QHed"
    BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
    export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
    export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
fi

_export_osx BASH_SILENCE_DEPRECATION_WARNING=1
_export_osx OPEN="open"

_export_linux OPEN="xdg-open"

_export_dir SYNC "$XDG_DOCUMENTS_DIR/nextcloud"
_export_dir PROJECTS "$SYNC/Projects"
_export_dir NOTES "$SYNC/notes"
_export_dir REPOS "$HOME/Repos"
_export_dir DOTFILES "$REPOS/dot"
_export_dir PLUGS "$XDG_DATA_HOME/nvim/plugs"

# ---------------------------------- cdpath ----------------------------------

acdpath() {
    declare arg
    for arg in "$@"; do
        [[ -d "$arg" ]] || continue
        CDPATH=${CDPATH//":$arg:"/:}
        CDPATH=${CDPATH/#"$arg:"/}
        CDPATH=${CDPATH/%":$arg"/}
        export CDPATH="${CDPATH:+"$CDPATH:"}$arg"
    done
} && export apath

acdpath $PWD $HOME $REPOS $PROJECTS $DOTFILES $SYNC $PLUGS

# ------------------------------- path -------------------------------

# apath, ppath and __ps1 are ispired by rwxrob's bashrc
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

ppath /usr/local/bin "$HOME/.local/bin"
apath /usr/local/opt /opt/local/bin /opt/local/sbin "$HOME/Library/Python/3.8/bin"

# ------------------------ bash shell options ------------------------

# shopt -s expand_aliases
shopt -s dotglob
shopt -s extglob
shopt -s histappend

# ------------------------------ history -----------------------------

HISTCONTROL="ignoredups:erasedups"
HISTSIZE=1000
HISTFILE="$XDG_CACHE_HOME/bash_history"

# ------------------------------- prompt -----------------------------

__ps1() {
    local b='\[\e[30m\]'
    local r='\[\e[31m\]'
    local gr='\[\e[0;32m\]'
    local y='\[\e[33m\]'
    local bl='\[\e[34m\]'
    local p='\[\e[35m\]'
    local c='\[\e[36m\]'
    local g='\[\e[0;90m\]'
    local x='\[\e[0m\]'

    local G=$(git branch --show-current 2>/dev/null)
    local P='$'
    [[ $EUID == 0 ]] && P='#'
    [[ $G = master || $G = main ]]
    [[ -n "$G" ]] && G="($G)"

    PS1="$gr\u@\h$x:$bl\W$x$r$G$x$x$P$x "
}

PROMPT_COMMAND="__ps1"
PS1="\W"

# ----------------------------------- alias ----------------------------------

_have grep && alias grep='grep --color=auto'
_have egrep && alias grepegrep='egrep --color=auto'
_have egrep && grepfgrep='fgrep --color=auto'
_have ed && alias ed='ed -p ":"'
_have ls && alias ls='ls --color'
_have git && alias g='git'
_have git && alias gs='git status '
_have git && alias ga='git add '
_have git && alias gu='git restore --stagged '
_have git && alias gd='git diff '
_have git && alias gc='git commit '
_have git && alias gp='git push '
_have codium && alias code='codium'
_have nvim && alias vi='nvim'
_have nvim && alias view='nvim -R'
_have nvim && alias wiki='nvim $NOTES/index.md'

# -------------------------------- keybindings -------------------------------

_have tm && bind -x '"\C-b":"tm"'
_have search && bind -x '"\C-f":"search"'
_have fzf && bind -x '"\C-r":"eval $(fzf --height=50% --layout=reverse < $HISTFILE)"'
_have "$OPEN" && bind -x '"\C-o":"$OPEN ."'

# ------------------------------------ nix -----------------------------------

# Preserve variable that nix do for you
_source_if "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"

# -------------------------------- completion --------------------------------

_source_if "$HOME/.local/bin/brew-completion.sh"
_source_if "/usr/local/etc/profile.d/bash_completion.sh"
_source_if "/etc/profile.d/bash_completion.sh"
# Nix package manager
_source_if "$HOME/.nix-profile/etc/profile.d/nix.sh"
_source_if "$HOME/.nix-profile/etc/profile.d/bash_completion.sh"
# Preserve TAB compeltition for git
_have gh && . <(gh completion -s bash)
_have pandoc && . <(pandoc --bash-completion)
