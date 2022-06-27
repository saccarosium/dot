#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2163,SC1090,SC2016,SC2139

case $- in
*i*) ;;
*) return ;;
esac

# -------------------------- local utility functions -------------------------

__export_dir() { [[ -d $2 ]] && export "$1"="$2"; }
__source_if() { [[ -r $1 ]] && source "$1"; }
__have() { type "$1" &>/dev/null; }
__export_osx() { [[ $OSTYPE == "darwin"* ]] && export "$1"; }
__export_linux() { [[ $OSTYPE == "linux-gnu"* ]] && export "$1"; }

# --------------------------- environment variables --------------------------

export XDG_DATA_DIRS="$HOME/.nix-profile/share:/usr/local/share:/usr/share"
export XDG_RUNTIME_DIR="$HOME/.local/runtime"
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
export LSCOLORS="exgxcxdxCxegedabagacad"
export COLORTERM=truecolor
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export GOPATH="$XDG_DATA_HOME/go"

__have wget && export WGETRC="$XDG_CONFIG_HOME/wgetrc"
__have atom && export ATOM_HOME="$XDG_DATA_HOME/atom"
__have gpg && export GNUPGHOME="$XDG_DATA_HOME/gnupg"
__have cargo && export CARGO_HOME="$XDG_DATA_HOME/cargo"
__have nnn && export NNN_OPTS="QHedc"

__export_osx BASH_SILENCE_DEPRECATION_WARNING=1
__export_osx OPEN="open"

__export_linux OPEN="xdg-open"

__export_dir SYNC "$XDG_DOCUMENTS_DIR/nextcloud"
__export_dir PROJECTS "$SYNC/Projects"
__export_dir NOTES "$SYNC/wiki"
__export_dir REPOS "$HOME/Repos"
__export_dir DOTFILES "$REPOS/dot"
__export_dir PLUGS "$XDG_DATA_HOME/bundle/"

# ---------------------------------- editor ----------------------------------

# Make editor environment variable portable in every system
__editor() {
    declare arg
    for arg in "$@"; do
        if __have "$arg"; then
            export EDITOR="$arg"
            [[ $EDITOR == "ed" ]] &&
                export EDITOR='ed -p ":"'
        else
            continue
        fi
    done
    [[ -z $EDITOR ]] &&
        echo "There is no editor installed" >&2
}

__editor ed nvi vi vim nvim

# ---------------------------------- cdpath ----------------------------------

export CDPATH=".:$HOME:$REPOS:$PROJECTS:$DOTFILES:$SYNC:$PLUGS"

# ----------------------------------- path -----------------------------------

# apath, ppath and __ps1 are ispired by rwxrob's bashrc
# https://github.com/rwxrob/dot/blob/main/.bashrc

apath() {
    declare arg
    for arg in "$@"; do
        [[ -d $arg ]] || continue
        PATH=${PATH//":$arg:"/:}
        PATH=${PATH/#"$arg:"/}
        PATH=${PATH/%":$arg"/}
        export PATH="${PATH:+"$PATH:"}$arg"
    done
} && export apath

ppath() {
    for arg in "$@"; do
        [[ -d $arg ]] || continue
        PATH=${PATH//:"$arg:"/:}
        PATH=${PATH/#"$arg:"/}
        PATH=${PATH/%":$arg"/}
        export PATH="$arg${PATH:+":${PATH}"}"
    done
} && export ppath

ppath /usr/local/bin "$HOME"/.local/bin /usr/local/opt/util-linux/bin /usr/local/opt/util-linux/sbin
apath /usr/local/opt /opt/local/bin /opt/local/sbin "$HOME"/Library/Python/3.8/bin

# ------------------------ bash shell options ------------------------

shopt -s expand_aliases
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
    local ma='\[\e[35m\]'
    local cy='\[\e[36m\]'
    local g='\[\e[0;90m\]'
    local x='\[\e[0m\]'

    local G
    G=$(git branch --show-current 2>/dev/null)
    local P='$'
    [[ $EUID == 0 ]] && P='#'
    [[ $G == master || $G == main ]]
    [[ -n $G ]] && G="($G)"

    PS1="$gr\u@\h$x:$bl\W$x$r$G$x$x$P$x "
}

PROMPT_COMMAND="__ps1"

# ----------------------------------- alias ----------------------------------

__have ed && alias ed='ed -p ":"'
__have grep && alias grep='grep --color=auto'
__have egrep && alias egrep='egrep --color=auto'
__have fgrep && alias fgrep='fgrep --color=auto'
__have git && alias ga='git add '
__have git && alias gc='git commit '
__have git && alias gg='git status'
__have git && alias gp='git push '
__have git && alias gs='git stage '
__have git && alias gu='git restore --stagged '
__have ls && alias ls='ls --color'
__have nvim && alias vi='nvim'
__have wget && alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts"

# ------------------------------------ nix -----------------------------------

# Preserve variable that nix do for you
__source_if "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
# Nix Completion
__source_if "$HOME/.nix-profile/etc/profile.d/nix.sh"
__source_if "$HOME/.nix-profile/etc/profile.d/bash_completion.sh"

# -------------------------------- completion --------------------------------

__source_if "$HOME/.local/bin/completions/brew-completion.sh"
__source_if "/usr/local/etc/profile.d/bash_completion.sh"
__source_if "/etc/profile.d/bash_completion.sh"
__have gh && . <(gh completion -s bash)
__have pandoc && . <(pandoc --bash-completion)
__have make && complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' ?akefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make

# --------------------------------- autostart --------------------------------

if [[ -n "$ALACRITTY" ]]; then
    tm 0
fi
