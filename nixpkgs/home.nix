{ config, pkgs, ... }:

{
  home.username = "sacca";
  home.homeDirectory = "/Users/sacca";
  programs.home-manager.enable = true;
  
  home.packages = with pkgs; [
    bat
    fd
    ripgrep
    neovim
    btop 
    gh
    llvm
    gnused
    gnupg
    gdb
    glow
    tmux
    nnn
    git
    shellcheck
    pandoc
    wget
    neofetch
    fzf
    mpv
  ];

  programs.bat = {
    enable = true;
    config = {
      italic-text = "always";
    };
  };

  programs.fzf = {
    enable = true;
    defaultCommand = "fd . --hidden";
    defaultOptions = [ "-m" "--bind=ctrl-a:toggle-all,ctrl-y:print-query" ];
  };

  programs.git = {
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
  ];
  };
}
