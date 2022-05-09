#!/bin/sh

cleaner() {
    for args in "$@"
    do
        if [ -e "$args" ]; then
            rm "$args"
        fi
    done
}

cd "$HOME" || exit 1

cleaner .bash_history .bash_logout .bash_profile .lesshst .DS_Store
