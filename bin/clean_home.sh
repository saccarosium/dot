#!/bin/sh

cleaner() {
    for args in "$@"
    do
        [ -e "$args" ] && rm -rf "$args"
    done
}

cd "$HOME" || exit 1

cleaner .bash_history .bash_logout .bash_profile .lesshst .DS_Store
