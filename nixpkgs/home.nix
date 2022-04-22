{ config, pkgs, ... }:

{
  home.username = "sacca";
  home.homeDirectory = "/Users/sacca";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # CLI
    bash-completion
    docker
    exiftool
    fd
    gdb
    gh
    gnupg
    htop
    llvm
    mpv
    neofetch
    neovim
    nixFlakes
    nixfmt
    pandoc
    ripgrep
    shellcheck
    shfmt
    taskwarrior
    texlive.combined.scheme-minimal
    tmux
    tree
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

    taskwarrior = {
      enable = true;
    };
  };
}
