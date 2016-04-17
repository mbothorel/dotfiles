#!/bin/bash

echo "Installing dotfiles"
cp ~/git/dotfiles/bashrc ~/.bashrc
cp ~/git/dotfiles/zshrc ~/.zshrc
cp ~/git/dotfiles/vimrc ~/.vimrc
cp -R ~/git/dotfiles/vim ~/.vim
cp -R ~/git/dotfiles/i3 ~/.config/i3
cp -R ~/git/dotfiles/i3status ~/.config/i3status
cp ~/git/dotfiles/Xresources ~/.Xresources
echo "dotfiles installed"
