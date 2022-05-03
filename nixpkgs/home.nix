{ config, pkgs, ... }:

let pkgsunstable = import <nixpkgs-unstable> { };

in {
  home.username = "sacca";
  home.homeDirectory = "/Users/sacca";
  programs.home-manager.enable = true;

  home.packages = [
    /* pkgsunstable.texlive.combined.scheme-medium */
    pkgs.exiftool
    pkgs.fd
    pkgs.htop
    pkgs.mpv
    pkgs.neofetch
    pkgs.nixfmt
    pkgs.pandoc
    pkgs.ripgrep
    pkgs.shellcheck
    pkgs.shfmt
    pkgs.tree
    pkgsunstable.bash-completion
    pkgsunstable.clangStdenv
    pkgsunstable.docker
    pkgsunstable.gdb
    pkgsunstable.gh
    pkgsunstable.git
    pkgsunstable.gnupg
    pkgsunstable.mysql80
    pkgsunstable.neovim
    pkgsunstable.nixFlakes
    pkgsunstable.nnn
    pkgsunstable.texinfo
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
