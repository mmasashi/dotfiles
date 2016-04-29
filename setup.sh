#!/bin/bash

BASE_DIR=$(cd $(dirname $0);pwd)
FILE_LIST=(
.gvimrc
.inputrc
.vimrc
.zshrc
.zlogout
.tmux.conf
.gitconfig
.gitignore
.hgrc
.gemrc
.vim
.bundle
.octaverc
)
# .sshrc, .ssh/config is not copied.

for file in "${FILE_LIST[@]}"
do
  if [[ ! -f ~/$file ]] && [[ ! -d ~/$file ]]; then
    ln -s $BASE_DIR/$file ~/$file
  fi
done

# setup directories
mkdir -p ~/logs/iterm2

# setup ./ssh/config
mkdir -p ~/.ssh
if [[ ! -f ~/.ssh/config ]]; then
  ln -s $BASE_DIR/.ssh/config ~/.ssh/config
fi

# Setup vim plugins
#   Run `git submodule update --init` in dotfiles
#   directory to clone NeoBundle.
#   Launch "vim"
#   Run ":NeoBundleInstall" to install vim plugins
