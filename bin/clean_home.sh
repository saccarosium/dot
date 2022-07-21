#!/bin/sh

cleaner() {
    for args in "$@"; do
        if [ -f "$args" ]; then
            rm "$args"
        elif [ -d "$args" ]; then
            rm -rf "$args"
        fi
    done
}

cd "$HOME" || exit 1

cleaner \
    .sh_history \
    .bash_sessions \
    .bash_history \
    .bash_logout \
    .bash_profile \
    .lesshst \
    .DS_Store \
    .python_history \
    .zshrc \
    .zsh_history \
    .zsh_sessions \
    .zcompdump \
    .terminfo \
    .viminfo
