#!/bin/bash

BASE_DIR=~/dotfiles
FILE_LIST=( ".gvimrc" ".inputrc" ".vimrc" ".zshrc" ".tmux.conf");

for file in "${FILE_LIST[@]}"
do
  ln -s $BASE_DIR/$file ~/$file
done

ln -s ~/dotfiles/.vim ~/.vim

# Setup vim plugins
#   Run `git submodule update --init` in dotfiles
#   directory to clone NeoBundle.
#   Launch "vim"
#   Run ":NeoBundleInstall" to install vim plugins
