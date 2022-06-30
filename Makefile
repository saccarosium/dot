XDG_CONFIG := $(HOME)/.config
XDG_DATA := $(HOME)/.local
XDG_CACHE := $(HOME)/.cache
MKDIR := mkdir -pv
LN := ln -vsf
SH := /usr/bin/env sh


build_env: setup_repo bash nvim vim terminal_env

build_terminal_env: # Build my terminal enviroment
	$(LN) $(PWD)/tmux $(XDG_CONFIG)
	$(LN) $(PWD)/fd $(XDG_CONFIG)
	$(LN) $(PWD)/git $(XDG_CONFIG)
	$(LN) $(PWD)/lf $(XDG_CONFIG)
	$(LN) $(PWD)/htop $(XDG_CONFIG)
	$(LN) $(PWD)/bin $(XDG_DATA)
	$(LN) $(PWD)/bat $(XDG_CONFIG)

build_bash:
	$(MKDIR) $(XDG_CONFIG)/readline
	$(LN) $(PWD)/bash/.bashrc $(HOME)
	$(LN) $(PWD)/bash/.profile $(HOME)
	$(LN) $(PWD)/bash/.inputrc $(XDG_CONFIG)/readline/inputrc

build_nvim:
	$(LN) $(PWD)/nvim $(XDG_CONFIG)

build_terminal_emulators:
	$(LN) $(PWD)/alacritty $(XDG_CONFIG)
	$(LN) $(PWD)/wezterm $(XDG_CONFIG)

build_nix:
	$(MKDIR) $(XDG_CONFIG)/nixpkgs
	$(SH) $(PWD)/bin/bootstraps/nix.sh
	$(SH) $(PWD)/bin/bootstraps/home-manager.sh
	$(LN) $(PWD)/nixpkgs/* $(XDG_CONFIG)/nixpkgs

build_brew:
	$(SH) $(PWD)/bin/bootstraps/homebrew.sh

build_osx:
	$(LN) $(PWD)/etc/osx/karabiner $(XDG_CONFIG)

setup_fonts:
	$(MKDIR) $(XDG_DATA)/share/fonts
	$(LN) $(PWD)/etc/fonts/* $(XDG_DATA)/share/fonts

setup_repo: # Makes shure that xdg dir exists
	$(MKDIR) $(XDG_CONFIG)
	$(MKDIR) $(XDG_DATA)
	$(MKDIR) $(XDG_CACHE)
	$(SH) $(PWD)/bin/clean_home.sh
