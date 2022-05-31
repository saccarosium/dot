XDG_CONFIG := $(HOME)/.config
XDG_DATA := $(HOME)/.local
XDG_CACHE := $(HOME)/.cache
LN := ln -vsf

env: setup_repo bash nvim vim terminal_env

terminal_env: # Build my terminal enviroment
	$(LN) $(PWD)/tmux $(XDG_CONFIG)
	$(LN) $(PWD)/fd $(XDG_CONFIG)
	$(LN) $(PWD)/git $(XDG_CONFIG)
	$(LN) $(PWD)/lf $(XDG_CONFIG)
	$(LN) $(PWD)/bin $(XDG_DATA)

bash: # Symlink bash configuration and clean all the junk in the home
	$(LN) $(PWD)/bash/.bashrc $(HOME)
	$(LN) $(PWD)/bash/.profile $(HOME)
	$(LN) $(PWD)/bash/.inputrc $(HOME)

neovim:
	$(LN) $(PWD)/nvim $(XDG_CONFIG)

vim:
	$(LN) $(PWD)/.vimrc $(HOME)/.vimrc

terminal_emulators:
	$(LN) $(PWD)/alacritty $(XDG_CONFIG)
	$(LN) $(PWD)/wezterm $(XDG_CONFIG)

nix:
	/bin/sh $(PWD)/bin/bootstraps/nix.sh
	/bin/sh $(PWD)/bin/bootstraps/home-manager.sh
	$(LN) $(PWD)/nixpkgs $(XDG_CONFIG)

brew:
	/bin/sh $(PWD)/bin/bootstraps/homebrew.sh

setup_fonts: setup_repo
	$(LN) $(PWD)/etc/fonts/* $(XDG_DATA)/share/fonts

setup_repo: # Makes shure that xdg dir exists
	mkdir -p $(XDG_CONFIG)
	mkdir -p $(XDG_DATA)
	mkdir -p $(XDG_CACHE)
	mkdir -p $(XDG_DATA)/share/fonts
	/bin/sh $(PWD)/bin/clean_home.sh
