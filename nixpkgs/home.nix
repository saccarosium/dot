{ config, pkgs, ... }:

{
  home.username = "sacca";
  home.homeDirectory = "/Users/sacca";
  programs.home-manager.enable = true;
  
  home.packages = with pkgs; [
    # CLI 
    fd
    ripgrep
    btop 
    gh
    llvm
    gnused
    gnupg
    gdb
    glow
    tmux
    shellcheck
    pandoc
    tree
    neofetch
    mpv
    bash-completion
    neovim-remote
    # GUI
    alacritty
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
      defaultCommand = "fd . -H -t f ";
      defaultOptions = [ "-m" "--bind=ctrl-a:toggle-all,ctrl-y:print-query" ];
    };

    vscode = {
      enable = true;
      package = pkgs.vscodium;
      userSettings = { 
        "editor.tabSize" = 4;
        "editor.minimap.enabled" = false;
        "breadcrumbs.enabled" = false;
        "workbench.statusBar.visible" = false;
        "files.autoSave" = "afterDelay";
        "editor.cursorStyle" = "block";
        "terminal.external.osxExec" = "Alacritty.app";
        "extensions.ignoreRecommendations" = true;
        "window.nativeFullScreen" = false;
        "window.restoreWindows" = "none";
      };
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        llvm-vs-code-extensions.vscode-clangd
        streetsidesoftware.code-spell-checker
      ];
    };
  };
}
