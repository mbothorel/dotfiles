set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'tomasr/molokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Colors
colorscheme molokai 
"set background=dark " Si Solarized
" Lorsque TERM=rxvt, thème bugué : on ajoute les couleurs avec
set t_Co=256

syntax enable			" Active la coloration syntaxique
syntax on 

" Spaces & Tabs
set tabstop=4 			" number of spaces in tab when editing
set softtabstop=4		" tabs are spaces
" set ependtab 			" Tabs are spaces

" UI Config
set title				" Set Windows title VIM
set number				" Show line number
set ruler				" Show cursor
set cursorline			" Highlight curent line
set wildmenu			" Visual autocomplete for command menu
set wrap				" Affiche les lignes trop longues sur plusieurs
set scrolloff=3			" Affiche un minimum de 3 lignes autour du curseur (pour le scroll)

" Search
set ignorecase			" Ignore la casse lors d’une recherche
set smartcase			" Si une recherche contient une majuscule, re-active la sensibilite a la casse
set incsearch			" Surligne les resultats de recherche pendant la saisie
set hlsearch			" Surligne les resultats de recherche

" -- Beep
set visualbell			" Empeche Vim de beeper
set noerrorbells		" Empeche Vim de beeper

" Folding
set foldenable			" Enabling folding
set foldlevelstart=10	" Open most folds by default

" Active les comportements specifiques aux types de fichiers comme
" la syntaxe et l’indentation
filetype on
filetype plugin on
filetype indent on

" Bindigs
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Se passer de la touche Esc : deux fois sur :
:imap ;; <Esc>
:map ;; <Esc>


" Pour afficher les caractères spéciaux
set listchars=nbsp:¤,tab:>-,trail:¤,extends:>,precedes:<,eol:¶,trail:·
