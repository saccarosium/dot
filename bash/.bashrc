case $- in
    *i*) ;;
      *) return ;;
esac

# ----------------------- environment variables ----------------------

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_CACHE_HOME="$HOME/.cache"
    export XDG_STATE_HOME="$HOME/.local/state"
    export XDG_DATA_DIRS="/usr/local/share:/usr/share"
    export XDG_CONFIG_DIRS="/etc/xdg"
    export XDG_RUNTIME_DIR="/run/user/$UID"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export XDG_DATA_HOME="$HOME/Library/Application Support"
    export XDG_CACHE_HOME="$HOME/Library/Caches"
    export XDG_STATE_HOME="$HOME/Library/Application Support"
    export XDG_RUNTIME_DIR="/tmp"
    export BASH_SILENCE_DEPRECATION_WARNING=1
fi

export XDG_CONFIG_HOME="$HOME/.config"
export DOCUMENTS="$HOME/Documents"
export PROJECTS="$HOME/Projects"
export DOTFILES="$HOME/.dot"
export SCRIPTS="$DOTFILES/scripts"
export SYNC="$DOCUMENTS/nextcloud"
export NOTES="$SYNC/notes"
export EDITOR="nvim"
export CLI_BROWSER="w3m"
export VIMVER="nvim"
export MANPAGER="less"
export CLICOLOR=1
export LSCOLORS=excxfxdxfxexDxDxDxDx
export LESSHISTFILE=-
export FILE_MANAGER="nnn"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export LANG="en_US.UTF-8"
export PATH="$SCRIPTS:/usr/local/bin:/usr/local/opt:/opt/local/bin:/opt/local/sbin:/usr/local/opt/emacs-plus@25/bin:$PATH" 


set -o vi

# ------------------------------ cdpath ------------------------------

export CDPATH=".:$HOME:$DOTFILES:$PROJECTS:$SYNC:$NOTES:$PROJECTS/IaP"

# ------------------------------ history -----------------------------

HISTCONTROL=ignorebot
HISTSIZE=50
HISTFILE="$XDG_CACHE_HOME/bash_history"

# ------------------------------- prompt -----------------------------

PROMPT_LONG=20

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

    G=$(git branch --show-current 2>/dev/null)
    local P='$'
    [[ $EUID == 0 ]] && P='#'
    [[ $G = master || $G = main ]] 
    [[ -n "$G" ]] && G="($G)"

    PS1="$gr\u$x:$bl\W$x$r$G$x$x$P$x "
}

PROMPT_COMMAND="__ps1"

# ------------------------------ aliases -----------------------------

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias scratch='vi $SYNC/scratchpad.md'
alias vi='nvim'
alias rm='trash'
alias rss='newsboat'
alias '?'='duck'

# ----------------------------- autostart ----------------------------

# if tmux is executable and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
#[ -x "$(command -v tmux)" ] \
#  && [ -z "${TMUX}" ] \
#  && { tmux attach || tmux; } >/dev/null 2>&1

# -------------------------------- nnn -------------------------------

export NNN_PLUG='p:preview-tui;o:fzopen'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_OPTS="QHed"
export NNN_BMS="D:$HOME/Downloads;d:$DOCUMENTS;S:$SYNC;p:$PROJECTS;.:$DOTFILES;l:~/.local/share/"
BLK="04" CHR="04" DIR="04" EXE="05" REG="00" HARDLINK="02" SYMLINK="02" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
