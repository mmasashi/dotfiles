#!/bin/bash

for file in `find ~/dotfiles -name '.*' | grep -v 'dotfiles/.git$' | perl -nle 'm!dotfiles/(.+)$! and print $1'`; do
    ln -s ~/dotfiles/$file ~/$file
done
