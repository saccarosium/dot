#!/bin/sh

dst="$DOTFILES"/etc/packages

_have() {
    type "$1" > /dev/null
}

# homebrew
if _have brew; then
    brew list > "$dst"/brew
fi

# pip
if _have pip; then
    pip list | awk '{print $1}' | sed '1d;2d' > "$dst"/pip
fi
