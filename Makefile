XDG_CONFIG = $(HOME)/.config
LN = ln -vsf

osx:

debian:

build_env: build_zsh build_editors build_terminal

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

clean:
	/bin/sh $(PWD)/scripts/clean-home.sh
