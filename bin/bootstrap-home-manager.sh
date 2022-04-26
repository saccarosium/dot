#!/bin/sh

_have() {
    type "$1" &>/dev/null ||
        echo "$1 not found in PATH" >&2
}

if _have nix-channel; then
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
fi

if _have nix-shell; then
    nix-shell '<home-manager>' -A install
fi
