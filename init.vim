" VIM configuration file.

" UTF-8 support
set encoding=utf8
scriptencoding utf-8

"
" User Interface.
"
set background=dark

" show C function template.
set showfulltag
" Disable status bar: we have the same information without it already.
set laststatus=0
" Show completion menus with informational pop up.
set completeopt=menu,menuone,popup,noinsert,noselect

" Show current key combinations (right bottom corner).
set showcmd

" Show all completion options for commands.
set wildmenu
set wildmode=list
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
" Always use spaces instead of tabs (only C wants tabs)
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

" Man page reading support.
runtime ftplugin/man.vim

" Open man pages vertically.
let g:ft_man_open_mode="vert"


"
" Bindings.
"
set pastetoggle=<F2>
map <F3> :NERDTreeToggle<CR>

" Fix gvim man page reading.
if has("gui_running")
  nnoremap K :<C-U>exe "Man" v:count "<C-R><C-W>"<CR>
endif


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
autocmd FileType sh setlocal expandtab tabstop=2 shiftwidth=2 colorcolumn=80
autocmd FileType man setlocal nolist
autocmd FileType nftables setlocal tabstop=2 shiftwidth=2 colorcolumn=80

"
" Vue settings.
"
let g:vim_vue_plugin_load_full_syntax = 1


"
" Ale settings.
"
let g:ale_lint_on_text_changed=0

let s:cflags  = "-std=c11 -Wall -Wextra -Wshadow -I."
  \ . " -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations"
  \ . " -Wpointer-arith -Wconversion -Wpacked -Wswitch-enum"
let g:ale_c_clangd_options=s:cflags
let g:ale_c_cc_options=s:cflags

let g:ale_linters={
  \ 'c': ['cc', 'clangd'],
  \ }

"
" global/gtags
"
set cscopetag


"
" Generate doc links.
"
silent! helptags ALL
