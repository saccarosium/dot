#!/usr/bin/env bash

name="$1"
data="$DOTFILES/etc/packages/$name"

populate() {
    : > "$data"
    for args in "$@"; do
        [[ $args == "$name" ]] && continue
        echo "$args" >> "$data"
    done
}

populate "$@"
