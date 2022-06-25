#!/bin/sh

target="$(find /System/Applications /Applications /System/Applications/Utilities -maxdepth 1 -name "*.app" | ~/.nix-profile/bin/fzf)"
[ -n "$target" ] || exit 1
open "$target"
