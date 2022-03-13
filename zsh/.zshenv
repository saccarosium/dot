# ----------------------- environment variables ----------------------

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
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
  export XDG_RUNTIME_DIR="/tmp"
  export BASH_SILENCE_DEPRECATION_WARNING=1
fi

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
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export FZF_DEFAULT_OPTS='-m --bind=ctrl-a:toggle-all'
export FZF_DEFAULT_COMMAND='fd . --hidden'
export LANG="en_US.UTF-8"
export NNN_OPTS="QHed"
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export KEYTIMEOUT=1
export PATH="$SCRIPTS:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/llvm/bin:$REPOS:/usr/local/bin:/usr/local/opt:/opt/local/bin:/opt/local/sbin:$PATH" 

# ------------------------------ cdpath ------------------------------

export CDPATH=".:$HOME:$REPOS:$DOCUMENTS:$PROJECTS:$DOTFILES:$SYNC"
