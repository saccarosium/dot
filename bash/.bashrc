case $- in
    *i*) ;;
      *) return ;;
esac

# ----------------------- environment variables ----------------------

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_CACHE_HOME="$HOME/.cache"
    export DOCUMENTS="$HOME/docs/" #Linux 
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export XDG_CONFIG_HOME="$HOME/Library/Preferences"
    export XDG_DATA_HOME="$HOME/Library"
    export XDG_CACHE_HOME="$HOME/Library/Caches"
    export DOCUMENTS="$HOME/Documents" #MacOS 
    export BASH_SILENCE_DEPRECATION_WARNING=1
    export PATH="/Users/sacca/.dot/scripts:/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH:" 
fi

export PROJECTS="$HOME/Projects"
export DOTFILES="$HOME/.dot"
export SCRIPTS="$DOTFILES/scripts"
export SYNC="$DOCUMENTS/nextcloud"
export NOTES="$SYNC/notes"
export SNIPPETS="$DOTFILES/snippets"
export EDITOR=nvim
export CLI_BROWSER=lynx
export MANPAGER="less"
export CLICOLOR=1
export LSCOLORS=excxfxdxfxexDxDxDxDx
export LESSHISTFILE=-
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# ------------------------------ cdpath ------------------------------

export CDPATH=".:$HOME:$DOTFILES:$PROJECTS:$SYNC:$NOTES"

# ------------------------------ history -----------------------------

HISTCONTROL=ignorebot
HISTSIZE=50
HISTFILE="$XDG_CACHE_HOME/bash_history"

# ------------------------------- prompt -----------------------------

PS1='\[\e[0;1;32m\]\u\[\e[0;1;32m\]@\[\e[0;1;32m\]\h\[\e[0m\]:\[\e[0;34m\]\W\[\e[0;97m\]\$ \[\e[0m\]'


# ------------------------------ aliases -----------------------------

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias projects='source $SCRIPTS/projects'
alias scratch='vi $SYNC/scratchpad.md'
alias ls='ls -a'
alias vi='nvim'
alias nnn='n'
alias '?'='duck'

# ----------------------------- autostart ----------------------------

# if tmux is executable and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
[ -x "$(command -v tmux)" ] \
  && [ -z "${TMUX}" ] \
  && { tmux attach || tmux; } >/dev/null 2>&1

# -------------------------------- nnn -------------------------------

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
    nnn "$@"
    if [ -f "$NNN_TMPFILE" ]; then
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

export NNN_PLUG='p:preview-tui;o:fzopen'
export NNN_FIFO='/tmp/nnn/nnn.fifo'
export NNN_TMPFILE='/tmp/nnn/lastd'
export NNN_OPTS="QHed"
export NNN_BMS="D:$HOME/Downloads;d:$DOCUMENTS;S:$SYNC;p:$PROJECTS;.:$DOTFILES;l:~/.local/share/"
BLK="04" CHR="04" DIR="04" EXE="05" REG="00" HARDLINK="02" SYMLINK="02" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

