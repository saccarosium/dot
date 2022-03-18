case $- in
    *i*) ;;
      *) return ;;
esac

# --------------------------- functions ------------------------------

# This functions are ispired by rwxrob and is bashrc 
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
} && export pathappend

ppath() {
  for arg in "$@"; do
    test -d "$arg" || continue
    PATH=${PATH//:"$arg:"/:}
    PATH=${PATH/#"$arg:"/}
    PATH=${PATH/%":$arg"/}
    export PATH="$arg${PATH:+":${PATH}"}"
  done
} && export pathprepend

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

# ----------------------- environment variables ----------------------

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
export REPOS="$HOME/Repos"
export DOCUMENTS="$HOME/Documents"
export PROJECTS="$SYNC/Projects"
export DOTFILES="$REPOS/dot"
export SCRIPTS="$DOTFILES/scripts"
export SYNC="$DOCUMENTS/nextcloud"
export NOTES="$SYNC/notes"
export EDITOR="nvim"
export MANPAGER="less"
export CLICOLOR=1
export LESSHISTFILE=-
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export FZF_DEFAULT_OPTS='-m --bind=ctrl-a:toggle-all,ctrl-y:print-query'
export FZF_DEFAULT_COMMAND='fd . --hidden'
export LANG="en_US.UTF-8"
export BAT_THEME="Nord"
export NNN_OPTS="QHed"
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

# ------------------------------- path -------------------------------

ppath /usr/local/opt/llvm/bin /usr/local/opt/coreutils/libexec/gnubin "$SCRIPTS"
apath /usr/local/opt /opt/local/bin /opt/local/sbin

# ------------------------------ cdpath ------------------------------

export CDPATH=".:$HOME:$REPOS:$DOCUMENTS:$PROJECTS:$DOTFILES:$SYNC"

# ------------------------------ history -----------------------------

HISTCONTROL=ignorebot
HISTSIZE=100
HISTFILE="$XDG_CACHE_HOME/bash_history"

# ------------------------------- prompt -----------------------------

PROMPT_COMMAND="__ps1"

# ------------------------------ aliases -----------------------------

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ed='ed -p ":"'
alias ls='ls --color'
alias vi='nvim'

# if neovim is unaveilable use vim or vi
[[ -n $(which nvim) ]] || unalias vi

# -------------------------------- completion ------------------------

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[[ -r "/etc/profile.d/bash_completion.sh" ]] && . "/etc/profile.d/bash_completion.sh"
