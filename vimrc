"
" Editing preferences
"

" Enable spell checking
set spell

" C editing settings
autocmd Filetype c setlocal
	\ cindent cinoptions=:0,Ls noexpandtab tabstop=8 shiftwidth=8
	\ colorcolumn=80

let g:c_space_errors=1
let g:c_syntax_for_h=1


"
" Aesthetics
"

" Increase amount of colors to be displayed if available
if has('termguicolors')
  set termguicolors
endif


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
set wildmode=list:longest
