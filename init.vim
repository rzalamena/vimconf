" VIM configuration file
"
" Author: Rafael Zalamena <rzalamena at gmail dot com>

" Work as vim and not vi
set nocompatible
set backspace=indent,eol,start

" Detect async support
" Trick copied from: https://github.com/thoughtbot/dotfiles/blob/master/vimrc.bundles
let g:has_async = v:version >= 800 || has('nvim')

" === PLUGINS BEGIN ===
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'

Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'avdgaag/vim-phoenix'

Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'airblade/vim-gitgutter'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'Valloric/YouCompleteMe'

if g:has_async
  Plug 'w0rp/ale'
endif

" Initialize plugin system
call plug#end()
" === PLUGINS END ===

" Recover buffer position and Ale linting support
augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " ALE linting events
  if g:has_async
    " Lint on file save only
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_enter = 0
    autocmd CursorHold * call ale#Lint()
    autocmd CursorHoldI * call ale#Lint()
    autocmd InsertEnter * call ale#Lint()
    autocmd InsertLeave * call ale#Lint()
  else
    echoerr "ale requires async to work"
  endif
augroup END

" Add UTF-8 support
set encoding=utf8
scriptencoding utf-8

" Fix console display
if has('gui_running')
  colorscheme base16-irblack
endif

" Visual
syntax enable
set background=dark
set cursorline
set list
set listchars=tab:»·,trail:·,nbsp:·
set number
set numberwidth=4

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
set wildmode=list:longest,list:full " menu behaviour
set textwidth=72 " amount of text before breaking line
set colorcolumn=80,120 " show 80 and 120 columns

set incsearch " search as we type
set hlsearch " highlight results
set ignorecase " make search case insensitive...
set smartcase " ... except when we specify upper case items

set showfulltag " show C function template
set completeopt=menu,menuone,preview " required for previous option

set scrolloff=16 " show at least 16 lines of context
set ruler " always show cursos position
set showcmd " always show current command

" Editing
set spell " enable spelling check
set spelllang=en,pt " supported languages
set spellfile=~/.vim/spell/custom.add " accepted/rejected words

filetype plugin indent on

set tabstop=2 " tabs are at the proper location
set shiftwidth=2 " indenting is 2 spaces
set cindent " stricter rules for C programs
set autoindent " automatic indentation
set smartindent " does the right thing (mostly) in programs
set smarttab " figure out tab/spaces by looking around
set expandtab " expand tab into spaces
set nobackup " disable backup files

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

" Don't use <tab> for YouCompleteMe, leave it for snippets
let g:ycm_key_list_select_completion = []
