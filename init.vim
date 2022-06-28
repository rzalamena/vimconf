" VIM configuration file.

" UTF-8 support
set encoding=utf8
scriptencoding utf-8

"
" User Interface.
"
if !has("gui_running")
  " Fix terminal true colors. Don't forget to set your tmux default-terminal
  " variable to tmux-256color or screen-256color (also works on regular
  " terminal).
  set t_8b=[48;2;%lu;%lu;%lum
  set t_8f=[38;2;%lu;%lu;%lum
endif

" Use a light theme with 24bit colors.
set termguicolors
set background=dark
let g:tokyonight_style="night"
colorscheme tokyonight

" show C function template.
set showfulltag
" Disable status bar: we have the same information without it already.
set laststatus=0
" Show completion menus with informational pop up.
set completeopt=menu,menuone

" Show current key combinations (right bottom corner).
set showcmd

" Tweak search:
set ignorecase      " default to case insensitive
set smartcase       " prefer upper case if used
"set incsearch      " search as you type.
set nohlsearch      " don't highlight searched term

" Show all completion options for commands.
set wildmenu
set wildmode=list:longest
set wildignore=*.o
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v(\.git|node_modules|_build|build)$',
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
" disable swap files
set noswapfile
" disable undo files
set noundofile
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

" Configure extra C indentation options.
set cinoptions=(0,:0,Ls

let g:clang_format#code_style = 'llvm'
let g:clang_format#style_options = {
  \ "AlignAfterOpenBracket": "Align",
  \ "AlignConsecutiveAssignments": "false",
  \ "AlignConsecutiveBitFields": "true",
  \ "AlignConsecutiveDeclarations": "false",
  \ "AlignConsecutiveMacros": "true",
  \ "AlignEscapedNewlines": "Right",
  \ "AlignOperands": "Align",
  \ "AllowShortCaseLabelsOnASingleLine": "false",
  \ "AllowShortEnumsOnASingleLine": "false",
  \ "AllowShortIfStatementsOnASingleLine": "Never",
  \ "AllowShortLoopsOnASingleLine": "false",
  \ "AlwaysBreakAfterReturnType": "TopLevelDefinitions",
  \ "BreakBeforeBraces": "Linux",
  \ "ColumnLimit": 80,
  \ "ContinuationIndentWidth": 8,
  \ "ForEachMacros": ["TAILQ_FOREACH", "LIST_FOREACH", "LIST_FOREACH_SAFE"],
  \ "IndentCaseLabels": "false",
  \ "IndentGotoLabels": "true",
  \ "IndentWidth": 8,
  \ "IndentWrappedFunctionNames": "false",
  \ "KeepEmptyLinesAtTheStartOfBlocks": "false",
  \ "Language": "Cpp",
  \ "MaxEmptyLinesToKeep": 1,
  \ "PointerAlignment": "Right",
  \ "SpaceAfterCStyleCast": "false",
  \ "SpaceAfterLogicalNot": "false",
  \ "SpaceBeforeAssignmentOperators": "true",
  \ "SpaceBeforeParens": "ControlStatementsExceptForEachMacros",
  \ "SpacesInCStyleCastParentheses": "false",
  \ "UseTab": "Always",
  \ }

"
" Vue settings.
"
let g:vim_vue_plugin_load_full_syntax = 1


"
" Ale settings.
"
let g:ale_lint_on_text_changed=0

let s:cflags  = "-std=c11 -Wall -Wextra -Wshadow -I. "
  \ . "-Wstrict-prototypes -Wmissing-prototypes "
  \ . "-Wpointer-arith -Wconversion -Wpacked -Wswitch-enum "
  \ . "-Wwrite-strings -Wundef -Wsign-conversion -Wconversion "
let g:ale_c_clangd_options=s:cflags
let g:ale_c_cc_options=s:cflags

let g:ale_linters={
  \ 'c': ['cc', 'clangd'],
  \ }


"
" Generate doc links.
"
silent! helptags ALL

lua <<EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'clangd' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
EOF
