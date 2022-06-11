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
    pkgs.fd
    pkgs.mpv
    pkgs.neofetch
    pkgs.nixfmt
    pkgs.ripgrep
    pkgs.shfmt
    pkgs.speedtest-cli
    pkgs.tree
    pkgs.htop
    pkgs.wget
    pkgs.alejandra
    pkgsunstable.bash-completion
    pkgsunstable.ccls
    pkgsunstable.clang-tools
    pkgsunstable.efm-langserver
    pkgsunstable.ffmpeg
    pkgsunstable.gh
    pkgsunstable.git
    pkgsunstable.jq
    pkgsunstable.lf
    pkgsunstable.neovim
    pkgsunstable.asciidoctor
    pkgsunstable.tmux
    pkgsunstable.peco
    pkgsunstable.pythonFull
    pkgsunstable.python39Packages.pynvim
    pkgsunstable.shellcheck
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
