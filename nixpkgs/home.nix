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
    pkgs.trash-cli
    pkgs.tree
    pkgs.wget
    pkgsunstable.bash-completion
    pkgsunstable.btop
    pkgsunstable.cargo
    pkgsunstable.clang-tools
    pkgsunstable.docker
    pkgsunstable.efm-langserver
    pkgsunstable.ffmpeg
    pkgsunstable.gh
    pkgsunstable.git
    pkgsunstable.gnupg
    pkgsunstable.gnused
    pkgsunstable.luaformatter
    pkgsunstable.lf
    pkgsunstable.mysql80
    pkgsunstable.neovim
    pkgsunstable.nodejs
    pkgsunstable.peco
    pkgsunstable.recutils
    pkgsunstable.rustc
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
        color = "always";
        decorations = "never";
      };
    };
  };
}
