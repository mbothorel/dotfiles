#!/bin/bash

echo "Installing symlinks"
ln -s ~/git/dotfiles/bashrc ~/.bashrc
ln -s ~/git/dotfiles/zshrc ~/.zshrc
ln -s ~/git/dotfiles/vimrc ~/.vimrc
ln -s ~/git/dotfiles/vim ~/.vim
ln -s ~/git/dotfiles/i3 ~/.config/i3
ln -s ~/git/dotfiles/i3status ~/.config/i3status
ln -s ~/git/dotfiles/Xresources ~/.Xresources
echo "Symlinks installed"
