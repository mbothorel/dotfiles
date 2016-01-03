# dotfiles
Configuration files

## Install
`cd ~; mkdir git && cd git`

`git clone git://github.com/mbothorel/dofiles.git`

`bash install.sh`

## Vim plugins
Vim plugins are install with git submodules 

`cd ~/.vim`

`mkdir ~/.vim/bundle`

`git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive`

`git add .`

`git commit -m "Install Fugitive.vim bundle as a submodule."`
