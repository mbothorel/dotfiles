# dotfiles
Configuration files

## Install
	cd ~; mkdir git && cd git
	git clone git://github.com/mbothorel/dofiles.git
	bash install.sh

## Vim plugins
Vim plugins are install with git submodules

	cd ~/.vim
	mkdir ~/.vim/bundle
	git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
	git add .
	git commit -m "Install Fugitive.vim bundle as a submodule."`

## Submodules
Lors du clone, les submodule ne sont pas récupérés.
Il faut effectuer ces deux commandes :

	git submodule init
	git submodule update

## Son thinkpad t450
Installer les paquets suivants :

    zita-alsa-pcmi
    alsa-lib
	alsa-utils
	pulseaudio
	pavucontrol

Puis créer le fichier /etc/modprobe.d/alsa-base.conf :

	options snd_hda_intel index=1,0
