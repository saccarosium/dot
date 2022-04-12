{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];
  home.username = "sacca";
  home.homeDirectory = "/Users/sacca";
  programs.home-manager.enable = true;
  
  home.packages = with pkgs; [
    # CLI 
    fd
    ripgrep
    htop
    gh
    llvm
    gnused
    gnupg
    gdb
    tmux
    shellcheck
    pandoc
    tree
    neofetch
    mpv
    nixFlakes
    texlive.combined.scheme-medium
    bash-completion
    neovim-nightly
  ];

  programs = {
    bat = {
      enable = true;
      config = {
        italic-text = "always";
      };
    };

    fzf = {
      enable = true;
      defaultCommand = "fd --hidden --type f --size -1m .";
      defaultOptions = [ "-m" "--bind=ctrl-a:toggle-all,ctrl-y:print-query" ];
    };

    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        llvm-vs-code-extensions.vscode-clangd
      ];
    };
  };
}
