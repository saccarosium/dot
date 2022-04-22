XDG_CONFIG := $(HOME)/.config
XDG_DATA := $(HOME)/.local
XDG_CACHE := $(HOME)/.cache
LN := ln -vsf

build_env: setup_repo build_bash build_nix build_nvim build_vim build_terminal_env
build_minimal_env: setup_repo build_bash build_vim build_terminal_env

build_bash: # Symlink bash configuration and clean all the junk in the home
	$(LN) $(PWD)/bash/.bashrc $(HOME)
	$(LN) $(PWD)/bash/.profile $(HOME)
	$(LN) $(PWD)/bash/.inputrc $(HOME)

build_nvim: # Symlink all the config of the text editor that I use
	$(LN) $(PWD)/nvim $(XDG_CONFIG)

build_vim:
	$(LN) $(PWD)/.vimrc $(HOME)/.vimrc

build_terminal_env: # Build my terminal enviroment
	$(LN) $(PWD)/tmux $(XDG_CONFIG)
	$(LN) $(PWD)/fd $(XDG_CONFIG)
	$(LN) $(PWD)/git $(XDG_CONFIG)
	$(LN) $(PWD)/bin $(XDG_DATA)

build_terminal_emulators:
	$(LN) $(PWD)/alacritty $(XDG_CONFIG)

build_nix:
	$(LN) $(PWD)/nixpkgs $(XDG_CONFIG)

setup_repo: # Makes shure that xdg dir exists
	test -d $(XDG_CONFIG) || mkdir $(XDG_CONFIG)
	test -d $(XDG_DATA) || mkdir $(XDG_DATA)
	test -d $(XDG_CACHE) || mkdir $(XDG_CACHE)
