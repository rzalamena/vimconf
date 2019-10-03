" VIM configuration file.

" UTF-8 support
set encoding=utf8
scriptencoding utf-8

"
" User Interface.
"

" Show empty spaces, trailing lines and tabs.
set list
set listchars=tab:»·,trail:·,nbsp:·

" Fix theme colors.
"if !has('gui_running')
"  " Uncomment line below to fix color problems.
"  set t_Co=256
"  " Uncomment line below to support/use 24bit colors.
"  set termguicolors
"endif

set background=dark
colorscheme gruvbox

" show C function template.
set showfulltag
" required for previous option.
set completeopt=menu,menuone,preview
" Show status bar (lightline).
set laststatus=2
" Show tab bar.
set showtabline=2

" lightline tweaks.
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ }

" Show current key combinations (right bottom corner).
set showcmd

" Show all completion options for commands.
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v(\.git|node_modules|_build)$',
  \ 'file': '\v\.o$',
  \ }

" Color parantheses differently.
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" Auto scroll to keep cursor away from the screen edge.
set scrolloff=16


"
" Editing settings.
"

" disable backup files
set nobackup
" Always use tabs instead of spaces (only C wants tabs)
set expandtab
" tabs are at the proper location
set tabstop=2
" indenting is 2 spaces
set shiftwidth=2

" enable spelling check.
set spell
" supported languages.
set spelllang=en,pt
" accepted/rejected words.
set spellfile=~/.vim/spell/custom.add

" Use smart indentation (it requires `autoindent`).
set autoindent
set smartindent

" Disable modeline (security issue)
set nomodeline


"
" Bindings.
"
set pastetoggle=<F2>
map <F3> :NERDTreeToggle<CR>


"
" Language specifics.
"
filetype plugin on
autocmd Filetype c setlocal cindent noexpandtab tabstop=8 shiftwidth=8 colorcolumn=80
autocmd Filetype cpp setlocal cindent noexpandtab tabstop=8 shiftwidth=8 colorcolumn=80
autocmd Filetype lex setlocal cindent noexpandtab tabstop=8 shiftwidth=8 colorcolumn=80
autocmd Filetype yacc setlocal cindent noexpandtab tabstop=8 shiftwidth=8 colorcolumn=80
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 colorcolumn=100
autocmd FileType gitcommit setlocal colorcolumn=50,80
autocmd FileType elixir setlocal colorcolumn=120
autocmd FileType eelixir setlocal colorcolumn=120
autocmd FileType vue setlocal colorcolumn=120
autocmd FileType perl setlocal tabstop=4 shiftwidth=4
autocmd FileType ruby setlocal colorcolumn=80


"
" Ale settings.
"
let g:ale_lint_on_text_changed=0
let g:ale_c_parse_makefile=1
let g:ale_c_clang_options="-std=c99 -Wall -Wextra"
let g:ale_c_gcc_options="-std=c99 -Wall -Wextra"


"
" Generate doc links.
"
silent! helptags ALL
