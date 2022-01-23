case $- in
    *i*) ;;
      *) return ;;
esac

# ----------------------- environment variables ----------------------

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export XDG_CACHE_HOME="$HOME/.cache"
  export XDG_DATA_DIRS="/usr/local/share:/usr/share"
  export XDG_CONFIG_DIRS="/etc/xdg"
  export XDG_RUNTIME_DIR="/run/user/$UID"
  export XDG_DESKTOP_DIR="$HOME/Desktop"
  export XDG_DOCUMENTS_DIR="$HOME/Documents"
  export XDG_DOWNLOAD_DIR="$HOME/Downloads"
  export XDG_MUSIC_DIR="$HOME/Music"
  export XDG_PICTURES_DIR="$HOME/Pictures"
  export XDG_VIDEOS_DIR="$HOME/Videos"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export XDG_CACHE_HOME="$HOME/Library/Caches"
  export XDG_RUNTIME_DIR="/tmp"
  export BASH_SILENCE_DEPRECATION_WARNING=1
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export REPOS="$HOME/Repos"
export DOCUMENTS="$HOME/Documents"
export PROJECTS="$HOME/Projects"
export DOTFILES="$REPOS/dot"
export SCRIPTS="$DOTFILES/scripts"
export SYNC="$DOCUMENTS/nextcloud"
export NOTES="$SYNC/notes"
export EDITOR="vim -N"
export MANPAGER="less"
export CLICOLOR=1
export LSCOLORS=excxfxdxfxexDxDxDxDx
export LESSHISTFILE=-
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export LANG="en_US.UTF-8"
export ATOM_HOME="$XDG_DATA_HOME"/atom
export PATH="$SCRIPTS:/usr/local/bin:/usr/local/opt:/usr/local/opt/llvm/bin:/opt/local/bin:/opt/local/sbin:/usr/local/opt/emacs-plus@28/bin:$PATH" 

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
alias em='emacsclient -nw'
alias vim='nvim'
alias rm='trash'
alias rss='newsboat'
alias '?'='duck'

# ------------------------- Setup cdg function -----------------------
unalias cdg 2> /dev/null
cdg() {
   local dest_dir=$(cdscuts_glob_echo | fzf )
   cd "$dest_dir"
}

cdg_add() {
	echo $PWD | ~/.dot/bookmarks
}
export -f cdg_add > /dev/null

# ----------------------------- autostart ----------------------------

# if tmux is executable and not inside a tmux session, then try to attach.
# if attachment fails, start a new session
# [ -x "$(command -v tmux)" ] \
#  && [ -z "${TMUX}" ] \
#  && { tmux attach || tmux; } >/dev/null 2>&1

# Setup cdg function

# -------------------------------- completion ------------------------

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
