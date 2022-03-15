UNIVERSAL_PKGS := gdb pandoc fzf neofetch tmux alacritty keepassxc anki ripgrep 
UNIVERSAL_PKGS += nnn shellcheck mpv
PKGS_OSX := fd rust mactex firefox ferdi little-snitch alfred amethyst nextcloud 
PKGS_OSX += signal coreutils bat bash bash-completion@2
FLATHUB := org.onlyoffice.desktopeditors org.mozilla.firefox com.getferdi.Ferdi
PKGS_POP := fd-find rust-all nextcloud-desktop torbrowser-launcher awesome rofi
PKGS_POP += python-dev python-pip python3-dev python3-pip flatpack
PPAS := ppa:neovim-ppa/unstable

BREW_URL := https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
PAQ_URL := https://github.com/savq/paq-nvim.git
FLATHUB_URL := https://flathub.org/repo/flathub.flatpakrepo
XDG_CONFIG := $(HOME)/.config
XDG_DATA := $(HOME)/.local
XDG_CACHE := $(HOME)/.cache
LN := ln -vsf
USER := $(shell whoami)
SUDO := sudo -e

osx: setup_brew setup_repo
	brew install $(UNIVERSAL_PKGS) $(PKGS_OSX) 
	sh $(PWD)/scripts/splist.sh
	make build_env

ubuntu: setup_apt setup_repo
	sudo apt install $(UNIVERSAL_PKGS) $(PKGS_POP)
	flatpack remote-add --user --if-not-exists flathub $(FLATHUB_URL)
	make build_env

build_env: build_bash build_editors build_terminal

build_bash: clean
	$(LN) $(PWD)/bash/.bashrc $(HOME)
	$(LN) $(PWD)/bash/.profile $(HOME)
	$(LN) $(PWD)/bash/.inputrc $(HOME)

build_zsh: clean
	test -d $(XDG_CONFIG)/zsh || mkdir $(XDG_CONFIG)/zsh
	$(LN) $(PWD)/zsh/.zshrc $(XDG_CONFIG)/zsh
	$(LN) $(PWD)/zsh/.zshenv $(HOME)

build_editors:
	$(LN) $(PWD)/nvim $(XDG_CONFIG)
	$(LN) $(PWD)/emacs $(XDG_CONFIG)
	$(LN) $(PWD)/.vimrc $(HOME)/.vimrc

build_terminal:
	$(LN) $(PWD)/alacritty $(XDG_CONFIG)
	$(LN) $(PWD)/tmux $(XDG_CONFIG)
	$(LN) $(PWD)/htop $(XDG_CONFIG)
	$(LN) $(PWD)/fd $(XDG_CONFIG)
	$(LN) $(PWD)/git $(XDG_CONFIG)
	$(LN) $(PWD)/.npmrc $(HOME)/.npmrc

setup_brew:
	curl -fsSL $(BREW_URL) | /bin/bash
	brew update
	brew upgrade

setup_apt:
	sudo apt update
	sudo add-apt-repository $(PPAS)
	sudo apt update
	sudo apt upgrade

setup_repo:
	sudo find $(PWD) | xargs -I {} chown $(USER) {}
	find $(PWD) | xargs -I {} chmod o-rwx {}
	test -d $(XDG_CONFIG) || mkdir $(XDG_CONFIG)
	test -d $(XDG_DATA) || mkdir $(XDG_DATA)
	test -d $(XDG_CACHE) || mkdir $(XDG_CACHE)

clean:
	/bin/sh $(PWD)/scripts/clean-home.sh
