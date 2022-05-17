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
    pkgs.htop
    pkgs.mpv
    pkgs.neofetch
    pkgs.nixfmt
    pkgs.pandoc
    pkgs.ripgrep
    pkgs.shfmt
    pkgs.tree
    pkgsunstable.bash-completion
    pkgsunstable.clangStdenv
    pkgsunstable.docker
    pkgsunstable.efm-langserver
    pkgsunstable.ffmpeg
    pkgsunstable.gdb
    pkgsunstable.gh
    pkgsunstable.git
    pkgsunstable.gnupg
    pkgsunstable.luaformatter
    pkgsunstable.mysql80
    pkgsunstable.neovim
    pkgsunstable.nixFlakes
    pkgsunstable.nodePackages.bash-language-server
    pkgsunstable.nodejs
    pkgsunstable.peco
    pkgsunstable.shellcheck
    pkgsunstable.silver-searcher
    pkgsunstable.texinfo
    pkgsunstable.tmux
    pkgsunstable.tree-sitter
  ];

  programs = {
    bat = {
      enable = true;
      config = {
        italic-text = "always";
        theme = "Dracula";
      };
    };

    fzf = {
      enable = false;
      defaultCommand = "fd --hidden --type f --size -1m .";
      defaultOptions = [ "-m" "--bind=ctrl-a:toggle-all,ctrl-y:print-query" ];
    };
  };
}
