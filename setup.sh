#!/bin/bash

BASE_DIR=~/dotfiles
FILE_LIST=( ".gvimrc" ".inputrc" ".vimrc" ".zshrc" );

for file in "${FILE_LIST[@]}"
do
  ln -s $BASE_DIR/$file ~/$file
done

ln -s ~/dotfiles/.vim ~/.vim
