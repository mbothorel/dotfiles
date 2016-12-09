#!/bin/bash

echo "Installing submodule"
git submodule init
git submodule update

echo "Installing dotfiles"
cp ~/git/dotfiles/bashrc ~/.bashrc
cp ~/git/dotfiles/bash_logout ~/.bash_logout
cp ~/git/dotfiles/vimrc ~/.vimrc
cp ~/git/dotfiles/vim ~/.vim
cp -R ~/git/dotfiles/i3 ~/.config/
cp -R ~/git/dotfiles/i3status ~/.config/
cp ~/git/dotfiles/Xresources ~/.Xresources
echo "dotfiles installed"
