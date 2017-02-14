" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'nginx.vim'
Plugin 'gnupg.vim'
Plugin 'saltstack/salt-vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()

colorscheme molokai
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
set ignorecase			" Ignore la casse lors d'une recherche
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
" la syntaxe et l'indentation
filetype on
filetype plugin on
filetype indent on

" Bindigs
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Display hidden characters
set listchars=nbsp:¤,tab:>-,trail:¤,extends:>,precedes:<,eol:¶
set list

" NerdTree
autocmd vimenter * NERDTree	" Start Nerdtree
autocmd BufNew * wincmd l	" Focus to file
autocmd VimEnter * wincmd p	" Focus to file
