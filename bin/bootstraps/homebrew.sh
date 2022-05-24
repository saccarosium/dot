#!/bin/sh

brew_script_url="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
script="/tmp/install_brew.sh"

_have() {
    type "$1" >/dev/null 2>&1 ||
        echo "$1 not found in PATH" >&2
}

_have brew && exit 0

echo "==> Installing Brew"

if [ -e "$script" ]; then
    bash "$script"
else
    curl -L "$brew_script_url" -o "$script"
    bash "$script"
fi
