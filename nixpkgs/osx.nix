{ config, pkgs, ... }:
{
    home.packages = [
        pkgs.gnumake
    ];
}
