{ config, pkgs, ... }:

let pkgsunstable = import <nixpkgs-unstable> { };

in {
  home.username = "sacca";
  home.homeDirectory = "/Users/sacca";
  # home.homeDirectory = "/home/sacca";

  programs.home-manager.enable = true;

  home.packages = [
    # pkgsunstable.texlive.combined.scheme-medium
    pkgs.exiftool
    pkgs.fd
    pkgs.mpv
    pkgs.neofetch
    pkgs.nixfmt
    pkgs.pandoc
    pkgs.ripgrep
    pkgs.shfmt
    pkgs.tree
    pkgsunstable.bash-completion
    pkgsunstable.btop
    pkgsunstable.clang-tools
    pkgsunstable.docker
    pkgsunstable.efm-langserver
    pkgsunstable.ffmpeg
    pkgsunstable.gh
    pkgsunstable.git
    pkgsunstable.gnupg
    pkgsunstable.gnused
    pkgsunstable.luaformatter
    pkgsunstable.mysql80
    pkgsunstable.neovim
    pkgsunstable.nodejs
    pkgsunstable.peco
    pkgsunstable.recutils
    pkgsunstable.shellcheck
    pkgsunstable.texinfo
    pkgsunstable.tmux
    pkgsunstable.tree-sitter
  ];

  programs = {
    bat = {
      enable = true;
      config = {
        italic-text = "always";
        theme = "Visual Studio Dark+";
      };
    };
  };
}
