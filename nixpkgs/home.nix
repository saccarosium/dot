{ config, pkgs, ... }:

let
  pkgsunstable = import <nixpkgs-unstable> {};
in



{
  home.username = "sacca";
  home.homeDirectory = "/Users/sacca";
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.neofetch
    pkgs.pandoc
    pkgs.python38Packages.pynvim
    pkgs.tree
    pkgsunstable.bash-completion
    pkgsunstable.docker
    pkgsunstable.exiftool
    pkgsunstable.fd
    pkgsunstable.gdb
    pkgsunstable.gh
    pkgsunstable.gnupg
    pkgsunstable.htop
    pkgsunstable.llvm
    pkgsunstable.mpv
    pkgsunstable.neovim
    pkgsunstable.nixFlakes
    pkgsunstable.nixfmt
    pkgsunstable.ripgrep
    pkgsunstable.shellcheck
    pkgsunstable.shfmt
    pkgsunstable.texinfo
    pkgsunstable.texlive.combined.scheme-minimal
    pkgsunstable.tmux
    pkgsunstable.tree-sitter
  ];

  programs = {
    bat = {
      enable = true;
      config = {
          italic-text = "always";
          theme = "gruvbox-dark";
      };
    };

    fzf = {
      enable = true;
      defaultCommand = "fd --hidden --type f --size -1m .";
      defaultOptions = [ "-m" "--bind=ctrl-a:toggle-all,ctrl-y:print-query" ];
    };
  };
}
