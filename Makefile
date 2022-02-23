XDG_CONFIG = $(HOME)/.config
LN = ln -vsf
PACKAGES = $(shell cat data/packages)
PACKAGES_OSX = $(shell cat data/packages-osx)

osx:
	brew install $(PACKAGES)
	brew install $(PACKAGES_OSX)
	/bin/sh $(PWD)/scripts/plist-osx.sh

debian:
	sudo apt update
	sudo apt install -y $(PACKAGES)

build_env:
	$(LN) $(PWD)/nvim $(XDG_CONFIG)
	$(LN) $(PWD)/alacritty $(XDG_CONFIG)
	$(LN) $(PWD)/emacs $(XDG_CONFIG)
	$(LN) $(PWD)/tmux $(XDG_CONFIG)
	$(LN) $(PWD)/htop $(XDG_CONFIG)
	$(LN) $(PWD)/git $(XDG_CONFIG)
	$(LN) $(PWD)/.bashrc $(HOME)/.bashrc
	$(LN) $(PWD)/.profile $(HOME)/.profile
	$(LN) $(PWD)/.vimrc $(HOME)/.vimrc
	$(LN) $(PWD)/.npmrc $(HOME)/.npmrc
	$(LN) $(PWD)/.inputrc $(HOME)/.inputrc

remove_env:
	rm $(XDG_CONFIG)/htop
	rm $(XDG_CONFIG)/nvim
	rm $(XDG_CONFIG)/alacritty
	rm $(XDG_CONFIG)/emacs
	rm $(XDG_CONFIG)/tmux
	rm $(XDG_CONFIG)/git
	rm $(HOME)/.bashrc
	rm $(HOME)/.profile
	rm $(HOME)/.vimrc
	rm $(HOME)/.npmrc
	rm $(HOME)/.inputrc

