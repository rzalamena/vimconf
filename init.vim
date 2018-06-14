" VIM configuration file
"
" Author: Rafael Zalamena

" Work as vim and not vi
set nocompatible
set backspace=indent,eol,start

" Detect async support
" Trick copied from:
" https://github.com/thoughtbot/dotfiles/blob/master/vimrc.bundles
let g:has_async = v:version >= 800 || has('nvim')

" === PLUGINS BEGIN ===
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'rcabralc/monokai-airline.vim'

Plug 'scrooloose/nerdtree'

Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'avdgaag/vim-phoenix'

Plug 'posva/vim-vue'

Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'airblade/vim-gitgutter'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'Valloric/YouCompleteMe'

Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

Plug 'lervag/vimtex'

if g:has_async
  Plug 'w0rp/ale'
endif

call plug#end()
" === PLUGINS END ===


" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = []


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
    " Lint on text changes?
    let g:ale_lint_on_text_changed = 'never'
    " Lint on buffer opening?
    let g:ale_lint_on_enter = 0
    " Lint on buffer save?
    let g:ale_lint_on_save = 1
  else
    echoerr "ale requires async to work"
  endif
augroup END


" Add UTF-8 support
set encoding=utf8
scriptencoding utf-8


" Fix console display
if !has('gui_running')
  set t_Co=256
  set termguicolors
endif


" Visual
syntax enable
colorscheme sublimemonokai
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
let g:airline_theme='monokai'
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
set showtabline=1 " show tabs when multiple are available
set tabpagemax=100 " bump tab limit
set wildmode=list:longest,list:full " menu behaviour
set textwidth=72 " amount of text before breaking line
set colorcolumn=80

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


" Language specific settings
autocmd Filetype c setlocal noexpandtab tabstop=8 shiftwidth=8 colorcolumn=80
autocmd Filetype cpp setlocal noexpandtab tabstop=8 shiftwidth=8 colorcolumn=80
autocmd Filetype lex setlocal noexpandtab tabstop=8 shiftwidth=8 colorcolumn=80
autocmd Filetype yacc setlocal noexpandtab tabstop=8 shiftwidth=8 colorcolumn=80
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd FileType gitcommit setlocal colorcolumn=50,80
autocmd FileType elixir setlocal colorcolumn=120
autocmd FileType eelixir setlocal colorcolumn=120


" Bindings
map <TAB>n :tabn<CR>
map <TAB>p :tabp<CR>

set pastetoggle=<F2>
map <F3> :NERDTreeToggle<CR>
map <F4> :TagbarToggle<CR>
