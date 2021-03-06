{ config, pkgs, ... }:

let
  pkgsunstable = import <nixpkgs-unstable> {};
  machine = import ~/.config/nixpkgs/machine.nix;
  isDarwin = machine.operatingSystem == "Darwin";
  isLinux = machine.operatingSystem == "Linux";
in {
  programs.home-manager.enable = true;
  home.username = "sacca";
  home.homeDirectory = if isDarwin then "/Users/sacca" else "/home/sacca";
  imports = if isDarwin then [./osx.nix] else [./linux.nix];
  home.packages = [
    pkgs.R
    pkgs.fd
    pkgs.htop
    pkgs.mpv
    pkgs.ripgrep
    pkgs.shfmt
    pkgs.speedtest-cli
    pkgs.tree
    pkgsunstable.asciidoctor
    pkgsunstable.bash-completion
    pkgsunstable.clang-tools
    pkgsunstable.fzf
    pkgsunstable.gh
    pkgsunstable.git
    pkgsunstable.lf
    pkgsunstable.neovim
    pkgsunstable.pythonFull
    pkgsunstable.shellcheck
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
