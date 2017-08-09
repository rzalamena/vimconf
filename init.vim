" VIM configuration file
"
" Author: Rafael Zalamena <rzalamena at gmail dot com>

" === PLUGINS BEGIN ===
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'juanpabloaj/vim-pixelmuerto'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'

Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'davidhalter/jedi-vim'

Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'

" Initialize plugin system
call plug#end()
" === PLUGINS END ===

" Add UTF-8 support
set encoding=utf8
scriptencoding utf-8

" Fix console display
if !has('gui_running')
  set t_Co=256
	colorscheme default
else
	colorscheme pixelmuerto
endif

" Visual
syntax enable
set background=dark
set cursorline

" Don't highlight on search, underline instead.
highlight Search guibg=NONE guifg=NONE gui=underline

" Airline
set laststatus=2 " always show status bar
let g:airline_theme='base16_eighties'
let g:airline_detect_spell=0 " hide spell indicator

" Show nice markings (e.g. '>').
" Requires patched powerline fonts installed:
" Patched fonts: https://github.com/powerline/fonts
" Font Patcher: https://github.com/powerline/fontpatcher
let g:airline_powerline_fonts=1

" NERDTree
let g:NERDTreeShowBookmarks=1
let g:NERDTreeWinPos='left'

" UI
set showtabline=2 " show tabs
set tabpagemax=100 " bump tab limit
set wildmode=longest,list:full " menu behaviour
set textwidth=72 " amount of text before breaking line

set incsearch " search as we type
set hlsearch " highlight results
set ignorecase " make search case insensitive...
set smartcase " ... except when we specify upper case items

set showfulltag " show C function template
set completeopt=menu,menuone,preview " required for previous option

set scrolloff=16 " show at least 16 lines of context

" Editing
set spell " enable spelling check
set spelllang=en,pt " supported languages
set spellfile=~/.vim/spell/custom.add " accepted/rejected words

set tabstop=2 " tabs are at the proper location
set shiftwidth=2 " indenting is 2 spaces
set cindent " stricter rules for C programs
set autoindent " automatic indentation
set smartindent " does the right thing (mostly) in programs
set smarttab " figure out tab/spaces by looking around
set expandtab " expand tab into spaces

" Tab properties per language
autocmd Filetype c setlocal noexpandtab tabstop=8 shiftwidth=8 colorcolumn=80
autocmd Filetype cpp setlocal noexpandtab tabstop=8 shiftwidth=8 colorcolumn=80
autocmd Filetype lex setlocal noexpandtab tabstop=8 shiftwidth=8 colorcolumn=80
autocmd Filetype yacc setlocal noexpandtab tabstop=8 shiftwidth=8 colorcolumn=80
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

" Bindings
map <TAB>n :tabn<CR>
map <TAB>p :tabp<CR>

set pastetoggle=<F2>
map <F3> :NERDTreeToggle<CR>
