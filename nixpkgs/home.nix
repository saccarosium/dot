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
    rpi-imager
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

    git = {
    enable = true;
    userName = "saccarosium";
    userEmail = "github.e41mv@aleeas.com";
    extraConfig = {
      core = {
        editor = "nvim";
      };
      color = {
        ui = true;
      };
      init = {
        defaultBranch = "main";
      };
    };
    ignores = [
      ".DS_Store"
      "*.pyc"
    ];};

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

    lf = {
        enable = true;
        settings = {
            hidden = true;
            preview = true;
        };
        keybindings = {
            D = "delete";
            p = "paste";
            y = "yank";
            x = "cut";
            gh = "cd ~";
            "." = "set hidden!";
            n = null;
            f = null;
            nf = "mkfile";
            nd = "mkdir";
        };
        extraConfig = ''
            cmd mkdir %{{
              printf "Directory Name: "
              read ans
              mkdir $ans
            }}

            cmd mkfile %{{
              printf "File Name: "
              read ans
              $EDITOR $ans
            }}
        '';
    };
  };
}
