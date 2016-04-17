#!/bin/bash

echo "Installing dotfiles"
cp ~/git/dotfiles/bashrc ~/.bashrc
cp ~/git/dotfiles/zshrc ~/.zshrc
cp ~/git/dotfiles/vimrc ~/.vimrc
cp -R ~/git/dotfiles/vim ~/
cp -R ~/git/dotfiles/i3 ~/.config/
cp -R ~/git/dotfiles/i3status ~/.config/
cp ~/git/dotfiles/Xresources ~/.Xresources
echo "dotfiles installed"
