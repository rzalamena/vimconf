" Rafael Zalamena <rzalamena@gmail.com> - vim configuration
" Custom settings
set nocompatible
set backspace=indent,eol,start

" enconding stuff
"set termencoding=utf8
"set encoding=utf8
"try
"	lang en_US
"	catch
"endtry
"
" or
"
"set termencoding=iso-8859-1
"set encoding=iso-8859-1

" spelling stuff
set nospell
set spl=pt_br
set ve=block

" aliases latex
ia ~a \~{a}
ia 'a \'{a}
ia `a \`{a}
ia ^a \^{a}
ia ~e \~{e}
ia 'e \'{e}
ia `e \`{e}
ia ^e \^{e}
ia ~i \~{i}
ia 'i \'{i}
ia `i \`{i}
ia ^i \^{i}
ia ~o \~{o}
ia 'o \'{o}
ia `o \`{o}
ia ^o \^{o}
ia ~u \~{u}
ia 'u \'{u}
ia `u \`{u}
ia ^u \^{u}

" misc
set title
set ruler " always display the cursos current position

" ident
set tabstop=4 " tabs are at the propper location
set shiftwidth=4 " indenting is 4 spaces - we aint gona use this...
set cindent " stricter rules for C programs
set autoindent " automatic indentation
"set smartindent " does the right thing (mostly) in programs
"set expandtab " replaces tab charactes by spaces
set nosmartindent " or maybe not
set nosmarttab " tab by using space
set noexpandtab " why the hell would i want space instead of tabs

" cool stuff
colorscheme molokai " color scheme pack installed, see ~/.vim/colors
filetype on
filetype plugin on

syn on			" syntax highlight
set nonumber	" line numbers
set wmnu		" wild menu - cool stuff
set wildmode=longest,list:full
set hi=5000		" hostory size
set hidden		" dont unload buffer on window close
set showtabline=2 " how tabs are displayed - minibuff explorer doesnt use this
set list		" show hidden characters like tabs and lost spaces
set listchars=tab:\_\_,trail:-	" whats gonna be shown instead of those specified stuff
set completeopt=menu,menuone,preview " completion stuff
set incsearch	" search as im typing - damn good
set ignorecase	" ignore case
set showfulltag	" C stuff
set hlsearch	" highlight search occurences
set tabpagemax=100 " max tabs

" tricky stuff to put pointer the last place you were when you closed the file
set viminfo='100,\"1000,:40,%,n~/.viminfo
au BufReadPost * if line("'\"")|execute("normal `\"")|endif
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

" file specific
"set tw=72
au FileType Mail set fo=ctq tw=72 et " respect the netiquette while mailing

" deactivate indentation and other formatting stuff to prevent
" shit from happening while pasting things
set pastetoggle=<F2>

" plugins bindings
map <F3> :NERDTreeToggle<CR>
map <F4> :TlistToggle<CR>
map <F5> :s/^\(.*\)$/\/\/ \1/g<CR>:nohlsearch<CR>
map <F6> :s/^\/\/ //g<CR>:nohlsearch<CR>
map <F12> :!cscope -qRb<CR>:!ctags -R .<CR>:cscope kill 0<CR>:cscope add cscope.out<CR>

" plugin settings
let g:Tlist_Sort_Type='name'
let g:Tlist_Auto_Highlight_Tag=1
let g:Tlist_Display_Prototype=0
let g:Tlist_Display_Tag_Scope=1
let g:Tlist_Compact_Format=1
let g:Tlist_Use_Right_Window=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Show_One_File=0
let g:Tlist_WinWidth=40
let g:Tlist_Enable_Fold_Column=0

let g:NERDTreeChDirMode=0
let g:NERDTreeWinSize=40
let g:NERDTreeWinPos="left"
let g:bufExplorerUseCurrentWindow=1

let tlist_d_settings='c++;d:macro;g:enum;s:struct;u:union;t:typedef;v:variable;f:function;c:class;T:template;p:abstract;X:mixin;m:member;M:module'
let tlist_htmljinja_settings='html;a:anchor;f:javascript function'

" misc stuff
map <TAB>s :A<CR>
map <TAB>n :tabn<CR>
map <TAB>p :tabp<CR>
inoremap <SPACE><TAB> <TAB>

" Versioning commands
map <TAB>a :VCSAdd<CR>
map <TAB>l :VCSLog<CR>
map <TAB>c :VCSCommit<CR>
map <TAB>d :VCSDiff<CR>
map <TAB>D :VCSVimDiff<CR>
map <TAB>r :VCSRevert<CR>
map <TAB>b :VCSBlame<CR>
map <TAB>R :VCSRemove<CR>
"map <TAB>s :VCSStatus<CR>
map <TAB>i :VCSInfo<CR>


" inoremapping, easen stuff
" my latex stuff
inoremap #document \documentclass[11pt]{article}<CR><CR>\usepackage[utf8]{inputenc}<CR>\usepackage[brazilian]{babel}<CR><CR>\title{}<CR>\author{}<CR>\date{}<CR>\begin{document}<CR>\maketitle<CR>\tableofcontents<CR>\abstract{}<CR><CR>\end{document}<UP>
inoremap #itemize \begin{itemize}<CR>\item<SPACE><CR>\end{itemize}
inoremap #lst \begin{lstlisting}<CR>\end{lstlisting}

" my web stuff
inoremap !script <script><CR><TAB><!--<CR><TAB><CR><BACKSPACE>//--><CR><BACKSPACE></script><CR><noscript><CR><TAB>SUPPORT MESSAGE<CR><BACKSPACE></noscript>
inoremap !html <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"<CR>"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><CR><html><CR><TAB><head><CR><TAB><title><CR><TAB><CR><BACKSPACE></title><CR><link rel="stylesheet" href="main.css" type="text/css" media="screen" charset="utf-8"/><CR><BACKSPACE></head><CR><body><CR><TAB><CR><BACKSPACE></body><CR><BACKSPACE></html>
inoremap !url <a href="http://"></a><LEFT><LEFT><LEFT><LEFT>
inoremap !ita <i></i><LEFT><LEFT><LEFT><LEFT>
inoremap !par <p></p><LEFT><LEFT><LEFT><LEFT>
inoremap !br <br />
inoremap !form <form action='' method=''><CR><TAB><CR><BACKSPACE></form><UP>
inoremap !input <input type= name='' value=''>
inoremap !select <select name=''><CR><TAB><option value='' SELECTED><CR><BACKSPACE></select>
inoremap !textarea <textarea name= cols= rows= ></textarea><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
inoremap !div <div></div><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
inoremap !css <style media="" title=""><CR><TAB><!--<CR><TAB><CR><BACKSPACE>--><CR><BACKSPACE></style><UP><UP>
inoremap !xhr function nome_da_funcao() {<CR><TAB>var xhr = null;<CR>if (window.XMLHttpRequest) {<CR><TAB>xmlhttprequest = new XMLHttpRequest();<CR><BACKSPACE>} else if (window.ActiveXObject) {<CR><TAB>xmlhttprequest = new ActiveXObject("Microsoft.XMLHTTP");<CR>if (xmlhttprequest == null) {<CR><TAB>xmlhttprequest = new ActiveXObject("Msxml2.XML");<CR><BACKSPACE>}<CR><BACKSPACE>}<CR>if (xmlhttprequest != null){<CR><TAB>xmlhttprequest.onreadystatechange = stateChange;<CR>xmlhttprequest.open("GET", TARGET_URL, true);<CR>xmlhttprequest.send(null);<CR><BACKSPACE>}<CR>else {<CR><TAB>alert('SUPPORTED BROWSER MESSAGE.');<CR><BACKSPACE>}<CR>function stateChange() {<CR><TAB>if (xmlhttprequest.readyState == 4) {<CR><TAB>if (xmlhttprequest.status == 200) {<CR><TAB>// Do what you have to do<CR><BACKSPACE>}<CR>else {<CR><TAB>alert('ERROR MESSAGE.');<CR><BACKSPACE>}<CR><BACKSPACE>}<CR><BACKSPACE>}<CR><BACKSPACE>}
