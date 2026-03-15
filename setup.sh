#!/bin/bash

BASE_DIR=$(cd $(dirname $0);pwd)
FILE_LIST=(
.inputrc
.vimrc
.zshrc
.zlogout
.tmux.conf
.gitconfig
.gitignore
.vim
)
# .sshrc, .ssh/config is not copied.

for file in "${FILE_LIST[@]}"
do
  if [[ ! -f ~/$file ]] && [[ ! -d ~/$file ]]; then
    ln -s $BASE_DIR/$file ~/$file
  fi
done

# set up directories
mkdir -p ~/logs/iterm2

# set up ./ssh/config
mkdir -p ~/.ssh
if [[ ! -f ~/.ssh/config ]]; then
  ln -s $BASE_DIR/.ssh/config ~/.ssh/config
fi

# set up nvim
mkdir -p ~/.config
if [[ ! -d ~/.config/nvim ]]; then
  ln -s $BASE_DIR/.config/nvim ~/.config/nvim
fi
