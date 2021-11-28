case $- in
    *i*) ;;
      *) return ;;
esac
# ----------------------- environment variables ----------------------

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_CACHE_HOME="$HOME/.cache"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export XDG_CONFIG_HOME="$HOME/Library/Preferences"
    export XDG_DATA_HOME="$HOME/Library"
    export XDG_CACHE_HOME="$HOME/Library/Caches"
    export XDG_RUNTIME_DIR="/tmp"
    export BASH_SILENCE_DEPRECATION_WARNING=1
    export PATH="/Users/sacca/.dot/scripts:/Users/sacca/Library/cargo/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:$GOPATH/bin:$PATH:" 
fi
export DOCUMENTS="$HOME/Documents"
export PROJECTS="$HOME/Projects"
export DOTFILES="$HOME/.dot"
export SCRIPTS="$DOTFILES/scripts"
export SYNC="$DOCUMENTS/nextcloud"
export NOTES="$SYNC/notes"
export MEDIA="$HOME/media"
export SNIPPETS="$DOTFILES/snippets"
export EDITOR=nvim
export CLI_BROWSER=lynx
export MANPAGER="less"
export CLICOLOR=1
export LSCOLORS=excxfxdxfxexDxDxDxDx
export LESSHISTFILE=-
export FILE_MANAGER="nnn"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME"/go
export LANG="en_US.UTF-8"

set -o vi

# ------------------------------ cdpath ------------------------------

export CDPATH=".:$HOME:$DOTFILES:$PROJECTS:$SYNC:$NOTES:$PROJECTS/IaP"

# ------------------------------ history -----------------------------

HISTCONTROL=ignorebot
HISTSIZE=50
HISTFILE="$XDG_CACHE_HOME/bash_history"

# ------------------------------- prompt -----------------------------

PROMPT_LONG=40

__ps1() {
  b='\[\e[30m\]' 
  r='\[\e[31m\]' 
  gr='\[\e[0;32m\]' 
  y='\[\e[33m\]' 
  bl='\[\e[34m\]' 
  p='\[\e[35m\]'
  c='\[\e[36m\]' 
  g='\[\e[0;90m\]' 
  w='\[\e[0m\]'

  #T=$(todoist l | sed "/#Habbits/ d; /#Projects/ d" | wc -l | awk '{print $1}' 2>/dev/null)  

  B=$(git branch --show-current 2>/dev/null)
  DIR=$(basename $PWD)

  countme="$USER@$(hostname):$DIR($B)\$ "

  [[ $B = master || $B = main ]] 
  [[ -n "$B" ]] && B="$r($r$B)"

  if [ 0 = 0 ]; then
    short="$gr\u@\h$w:$bl\W$B$w\$$w "
    long="$gr\u@\h$w:$bl\W$B\n $w\$$w "
  else
    short="$w[$T] $gr\u@\h$w:$bl\W$B$w\$$w "
    long="$w[$T] $gr\u@\h$w:$bl\W$B\n $w\$$w "
  fi

  if (( ${#countme} > PROMPT_LONG )); then
    PS1="$long"
  else
    PS1="$short"
  fi
}

PROMPT_COMMAND="__ps1"

#PS1='\[\e[0;1;32m\]\u\[\e[0;1;32m\]@\[\e[0;1;32m\]\h\[\e[0m\]:\[\e[0;34m\]\W\[\e[0;97m\]\$ \[\e[0m\]'

# ------------------------------ aliases -----------------------------

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias projects='source $SCRIPTS/projects'
alias scratch='vi $SYNC/scratchpad.md'
alias ls='ls -a'
alias vi='nvim'
alias rm='trash'
alias t='todoist'
alias rss='newsboat'
alias '?'='duck'

# ----------------------------- autostart ----------------------------

# if tmux is executable and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
[ -x "$(command -v tmux)" ] \
  && [ -z "${TMUX}" ] \
  && { tmux attach || tmux; } >/dev/null 2>&1

# -------------------------------- nnn -------------------------------

export NNN_PLUG='p:preview-tui;o:fzopen'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_OPTS="QHed"
export NNN_BMS="D:$HOME/Downloads;d:$DOCUMENTS;S:$SYNC;p:$PROJECTS;.:$DOTFILES;l:~/.local/share/"
BLK="04" CHR="04" DIR="04" EXE="05" REG="00" HARDLINK="02" SYMLINK="02" MISSING="00" ORPHAN="01" FIFO="0F" SOCK="0F" OTHER="02"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

t_c() {
    todoist l | fzf -m | awk '{print $1}' | xargs todoist close
}

t_s() {
    todoist l | fzf -m | awk '{print $1}' | xargs todoist show
}

t_d() {
    todoist l | fzf -m | awk '{print $1}' | xargs todoist delete
}
