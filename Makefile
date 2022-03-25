PAQ_URL := https://github.com/savq/paq-nvim.git
XDG_CONFIG := $(HOME)/.config
XDG_DATA := $(HOME)/.local
XDG_CACHE := $(HOME)/.cache
LN := ln -vsf

build_env: setup_repo build_bash build_editors build_terminal

build_bash: clean
	$(LN) $(PWD)/bash/.bashrc $(HOME)
	$(LN) $(PWD)/bash/.profile $(HOME)
	$(LN) $(PWD)/bash/.inputrc $(HOME)

build_editors:
	$(LN) $(PWD)/nvim $(XDG_CONFIG)
	$(LN) $(PWD)/emacs $(XDG_CONFIG)
	$(LN) $(PWD)/.vimrc $(HOME)/.vimrc

build_terminal:
	# $(LN) $(PWD)/alacritty $(XDG_CONFIG)
	$(LN) $(PWD)/kitty $(XDG_CONFIG)
	$(LN) $(PWD)/tmux $(XDG_CONFIG)
	$(LN) $(PWD)/htop $(XDG_CONFIG)
	$(LN) $(PWD)/fd $(XDG_CONFIG)
	$(LN) $(PWD)/git $(XDG_CONFIG)
	$(LN) $(PWD)/.npmrc $(HOME)/.npmrc

setup_repo:
	test -d $(XDG_CONFIG) || mkdir $(XDG_CONFIG)
	test -d $(XDG_DATA) || mkdir $(XDG_DATA)
	test -d $(XDG_CACHE) || mkdir $(XDG_CACHE)

clean:
	/bin/sh $(PWD)/scripts/clean-home.sh
