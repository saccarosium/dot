{ config, pkgs, ... }:

let pkgsunstable = import <nixpkgs-unstable> { };

in {
  home.username = "sacca";
  home.homeDirectory = "/Users/sacca";
  # home.homeDirectory = "/home/sacca";

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
    pkgs.tree
    pkgs.wget
    pkgsunstable.asciidoctor-with-extensions
    pkgsunstable.bash-completion
    pkgsunstable.btop
    pkgsunstable.ccls
    pkgsunstable.clang-tools
    pkgsunstable.efm-langserver
    pkgsunstable.ffmpeg
    pkgsunstable.gh
    pkgsunstable.git
    pkgsunstable.gnused
    pkgsunstable.jq
    pkgsunstable.lf
    pkgsunstable.neovim
    pkgsunstable.peco
    pkgsunstable.pythonFull
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
