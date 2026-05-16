"
" Editing preferences
"

" Enable file type detection, indentation and plugins
filetype indent plugin on

" Enable spell checking
set spell

" Enable syntax highlighting
syntax on

" C editing settings
autocmd Filetype c setlocal
	\ cindent cinoptions=:0,Ls noexpandtab tabstop=8 shiftwidth=8
	\ colorcolumn=80

let g:c_space_errors=1
let g:c_syntax_for_h=1

" Remember last position
autocmd BufReadPost *
  \ let line = line("'\"")
  \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
  \      && index(['xxd', 'gitrebase', 'tutor'], &filetype) == -1
  \ |   execute "normal! g`\""
  \ | endif

" Start searching while typing
set incsearch


"
" Aesthetics
"

" Increase amount of colors to be displayed if available
if has('termguicolors')
  set termguicolors
endif

" Keep some lines of contexts around the cursor
set scrolloff=5


"
" Bottom lines customizations
"

" Always disable the status line (CTRL+G to obtain file info)
set laststatus=0

" Show partial commands
set showcmd
" Show current line and column
set ruler

" Better completion system: show entries and wait for input
set wildmode=longest:full
