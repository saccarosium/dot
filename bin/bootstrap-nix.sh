#!/bin/sh

: "${EDITOR:=vi}"

nix_script_url="https://nixos.org/nix/install"
script="tmp/install_nix"
seconfig="/etc/selinux/config"


_have() {
    type "$1" &>/dev/null ||
        echo "$1 not found in PATH" >&2
}

# ---------------------------------- SELinux ---------------------------------

if _have setenforce; then
    echo "==> Disabling SELinux"
    sudo setenforce 0
    sudo "$EDITOR" "$seconfig"
fi

# ------------------------------------ NIX -----------------------------------

echo "==> Installing Nix"

[ -f "$script" ] || curl -L "$nix_script_url" > "$script"
if [ -x "$script"]; then
    sh "$script" --daemon
else
    chmod +x "$script"
    sh "$script" --daemon
fi
