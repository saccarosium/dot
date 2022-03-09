#!/bin/sh

[ -f $HOME/.bashrc ] && rm $HOME/.bashrc
[ -f $HOME/.bash_history ] && rm $HOME/.bash_history
[ -f $HOME/.profile ] && rm $HOME/.profile
[ -f $HOME/.inputrc ] && rm $HOME/.inputrc
[ -f $HOME/.zshenv ] && rm $HOME/.zshenv
[ -f $HOME/.zsh_history ] && rm $HOME/.zsh_history
[ -f $HOME/.lesshst ] && rm $HOME/.lesshst

exit 0
