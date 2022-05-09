#!/bin/sh

: "${EDITOR:=vi}"

nix_script_url="https://nixos.org/nix/install"
script="/tmp/install_nix"
seconfig="/etc/selinux/config"


_have() {
    type "$1" > /dev/null 2>&1 ||
        echo "$1 not found in PATH" >&2
}

_have nix-env && exit 0

# ---------------------------------- SELinux ---------------------------------

if _have setenforce; then
    echo "==> Disabling SELinux"
    sudo setenforce 0
    sudo "$EDITOR" "$seconfig"
fi

# ------------------------------------ NIX -----------------------------------

echo "==> Installing Nix"

if [ -e "$script" ]; then
    sh "$script" --daemon
else
    curl -L "$nix_script_url" > "$script"
    sh "$script" --daemon
fi

sudo reboot
