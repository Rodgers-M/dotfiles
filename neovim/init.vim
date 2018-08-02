"Note to self
"to see file-type icons on file names, install ITerm Nerd fonts
"brew tap caskroom/fonts
"brew cask install font-hack-nerd-font
"then change your ITerm2 Non-ASCII font to Hack Regular Nerd Font Complete 
syntax on

"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree', {'on': 'nerdtreetoggle'}
"silence  powerline error on python 3.7
"if has('python3')
"  silent! python3 1
"endif

so  ~/.config/nvim//plugins.vim

call plug#end()            " required
"filetype plugin indent on    " required
let mapleader=',' "make comma the mapleader
"show filename on status line
set number relativenumber
" toggle ralative line numbers
nmap <leader>rn :set relativenumber!<CR>
nmap <leader>tn :set relativenumber!<CR>
nmap <leader>a :q<CR>
"automatically toggle relative numbers on different situeations
"when in insert mode or buffer loses focus, turn off relative number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set foldmethod=syntax
"set this for fuzzy explorer
set hidden
"colorscheme atom-dark-256  "gruvbox   
set background=dark 
colorscheme gruvbox  
let g:gruvbox_contrast_dark='hard'
set cursorline
set scrolloff=3
set autochdir
"specify buffers for autocomplete
set complete=.,w,b,u
"settings for auto saving files
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

"white space
set backspace=eol,start,indent
set wrap
set textwidth=79
"default number of spaces for tabs
set expandtab ts=2 sw=2 ai
"number of spaces when edditing specific files 
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
"flag any whitespace in a python file

"searching
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase
nnoremap <F5> :grep <C-R><C-W> *<CR>
"a shortcut to edit vimrc file"
map <leader>ev :e ~/.config/nvim/init.vim<CR>
map <leader>pv :e ~/.config/nvim//plugins.vim<CR>
map <leader>sv :so ~/.config/nvim/init.vim<CR>
map <leader><space> :nohlsearch<cr>
 " adding new lines in normal mode
"add a new line below the current
nmap <leader>nl o<ESC>
"add a new line above  the current
nmap <leader>nL O<ESC>
"nmap <leader>q :q<cr>
nmap <space> i<space><ESC>

"fast saving of a buffer
nmap <leader>w :w<cr>

"disabling and remapping the arrow keys
noremap <Up> :m .-2<CR>==
noremap <Down> :m .+1<CR>==
"noremap <Left> <NOP>
"noremap <Right> <NOP>
"do nothing in insert mode
"imap <Up> <NOP>
"imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>
"move selected lines up/down in visual mode
vmap <Up> :m '<-2<CR>gv=gv
vmap <Down> :m '>+1<CR>gv=gv

"quick pairs
imap <leader>" ""<ESC>i
imap <leader>' ''<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>( ()<ESC>i
imap <leader>< <><ESC>i
imap jj <ESC>
imap kk <ESC>

"vim-sorround mappings
nmap <leader>mm) ysiw)
nmap <leader>mm] ysiw]
nmap <leader>mm} ysiw}
"custom sorround mappings
nmap <leader>qw bcw''<ESC>hp
nmap <leader>dq bcw""<ESC>hp
vmap <leader>qw c''<ESC>hp
vmap <leader>dq c""<ESC>hp
"sorround selected text in brackets, parenthesis, e.t.c
vmap <leader>{ c{}<esc>hp
vmap <leader>[ c[]<esc>hp
vmap <leader>( c()<esc>hp

"moving between windows/splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l
"nerdtreeToogle shortcut
nmap <C-a> :NERDTreeToggle<CR>
"when you delete or rename a file, always delete its associated buffer
let NERDTreeAutoDeleteBuffer=1

"add spaces after comment delimiters by default 'Nerd commenter'
let g:NERDSpaceDelims = 1
"resize splits 
nmap <Left> :vertical resize -5<CR>
nmap <Right> :vertical resize +5<CR>

let g:ale_linters = {'javascript': ['eslint']}
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_emit_conflict_warnings = 0

"cnfigurations for closetag plugin
"enable autoclose in the following file types
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.js,*.jsx'
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
" mappings for vim-js-import
nnoremap <F5> :call JsFileImport()<CR>
nnoremap <F6> :call SortJsFileImport()<CR>
"
let g:closetag_emptyTags_caseSensitive = 1
" Shortcut for closing tags, default is '>'
"
" Trigger configuration (Optional)
let g:UltiSnipsExpandTrigger='<c-l>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

let g:deoplete#enable_at_startup = 1

imap ;d <div className=''><ESC>li
imap ;p <p>
imap ;a <a href=''><ESc>hi
imap ;ul <ul><esc>li
imap ;li <li><esc>li
map ;h1 <h1><ESC>li
map ;h2 <h2<ESC>li
map ;h3 <h3><ESC>li
map ;h4 <h4><ESC>li
map ;h5 <h5><ESC>li
imap ;sp <span><ESC>li
imap ;i <input type='text' placeholder=''><ESC>2hi
imap ;bt <button className=''><ESC>li
imap ;im import  from '';<ESC>8hi
"importing objects
imap ;cim import {  } from '';<ESC>10hi

"Invoke CtrlP with starting directory
nmap <leader>p <C-p>
" ignore git files, node_modules and bower_components
" it will load faster this way
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = 'node_modules\|bower_compnents\|DS_Store\|git'

"lightline colorscheme
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

augroup autoSourceMyvimrc
    au!
    au BufWritePost init.vim so ~/.config/nvim/init.vim
augroup END
