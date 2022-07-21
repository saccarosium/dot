XDG_CONFIG := $(HOME)/.config
XDG_DATA := $(HOME)/.local
XDG_CACHE := $(HOME)/.cache
MKDIR := mkdir -pv
LN := ln -vsf
SH := /usr/bin/env sh

build_env_full: setup_repo build_bash build_nvim build_terminal_env build_terminal_emulators build_git build_scripts
build_env_min: setup_repo build_bash build_git build_scripts

build_terminal_env: # Build my terminal enviroment
	$(LN) $(PWD)/fd $(XDG_CONFIG)
	$(LN) $(PWD)/lf $(XDG_CONFIG)
	$(LN) $(PWD)/htop $(XDG_CONFIG)
	$(LN) $(PWD)/bat $(XDG_CONFIG)

build_bash:
	$(MKDIR) $(XDG_CONFIG)/readline
	$(LN) $(PWD)/bash/.bashrc $(HOME)
	$(LN) $(PWD)/bash/.profile $(HOME)
	$(LN) $(PWD)/bash/.inputrc $(XDG_CONFIG)/readline/inputrc

build_git:
	$(LN) $(PWD)/git $(XDG_CONFIG)

build_scripts:
	$(LN) $(PWD)/bin $(XDG_DATA)

build_nvim:
	$(LN) $(PWD)/nvim $(XDG_CONFIG)

build_terminal_emulators:
	$(LN) $(PWD)/wezterm $(XDG_CONFIG)

build_osx:
	$(SH) $(PWD)/bin/bootstraps/homebrew.sh
	$(LN) $(PWD)/etc/osx/karabiner $(XDG_CONFIG)

setup_fonts:
	$(MKDIR) $(XDG_DATA)/share/fonts
	$(LN) $(PWD)/etc/fonts/* $(XDG_DATA)/share/fonts

setup_repo: # Makes shure that xdg dir exists
	$(MKDIR) $(XDG_CONFIG)
	$(MKDIR) $(XDG_DATA)
	$(MKDIR) $(XDG_CACHE)
	$(SH) $(PWD)/bin/clean_home.sh

# build_nix:
# 	$(MKDIR) $(XDG_CONFIG)/nixpkgs
# 	$(SH) $(PWD)/bin/bootstraps/nix.sh
# 	$(SH) $(PWD)/bin/bootstraps/home-manager.sh
# 	$(LN) $(PWD)/nixpkgs/* $(XDG_CONFIG)/nixpkgs
