{ config, pkgs, ... }:

let
  pkgsunstable = import <nixpkgs-unstable> { };
  machine = import ~/.config/nixpkgs/machine.nix;
  isDarwin = machine.operatingSystem == "Darwin";
  isFedora = machine.operatingSystem == "Fedora";
in {
  home.username = "sacca";
  home.homeDirectory = if isDarwin then "/Users/sacca" else "/home/sacca";

  programs.home-manager.enable = true;

  home.packages = [
    # pkgsunstable.texlive.combined.scheme-medium
    pkgs.fd
    pkgs.mpv
    pkgs.neofetch
    pkgs.nixfmt
    pkgs.pandoc
    pkgs.ripgrep
    pkgs.shfmt
    pkgs.speedtest-cli
    pkgs.tree
    pkgs.htop
    pkgs.wget
    pkgsunstable.asciidoctor-with-extensions
    pkgsunstable.bash-completion
    pkgsunstable.btop
    pkgsunstable.ccls
    pkgsunstable.clang-tools
    pkgsunstable.efm-langserver
    pkgsunstable.ffmpeg
    pkgsunstable.gnused
    pkgsunstable.gh
    pkgsunstable.git
    pkgsunstable.jq
    pkgsunstable.lf
    pkgsunstable.neovim
    pkgsunstable.nnn
    pkgsunstable.peco
    pkgsunstable.pythonFull
    pkgsunstable.python39Packages.pynvim
    pkgsunstable.shellcheck
    pkgsunstable.texinfo
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
