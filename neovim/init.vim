 """"Note to self
"to see file-type icons on file names, install ITerm Nerd fonts

""brew tap homebrew/cask-fonts
"brew cask install font-hack-nerd-font
"then change your ITerm2 Non-ASCII font to Hack Regular Nerd Font Complete 
"
"run this to enable python3 to be used by vim plugins
" python3 -m pip install --user --upgrade pynvim
"
"after installing dependencies also install the respective coc-server for your
"perffered language. e.g for js/ts install coc-tsserver, coc-prettier
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
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
"filetype plugin indent on    " required
let mapleader=',' "make comma the mapleader
"show filename on status line
set statusline=%t 
set number relativenumber
" toggle ralative line numbers
nmap <leader>rn :set relativenumber!<CR>
nmap <leader>tn :set relativenumber!<CR>
"automatically toggle relative numbers on different situeations
""when in insert mode or buffer loses focus, turn off relative number
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
set linebreak
set textwidth=79
"default number of spaces for tabs
set expandtab ts=2 sw=2 ai
"number of spaces when edditing specific files 
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 expandtab
autocmd Filetype php setlocal ts=2 sw=2 expandtab
"flag any whitespace in a python file

"searching
set hlsearch
set incsearch
let g:ags_agexe = 'ag'
"live substitution"
set inccommand=nosplit

"search configs
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
noremap <leader>cff :CtrlSF 
noremap <leader>fo :CtrlSFOpen 
noremap <leader>ft :CtrlSFToggle<CR> 
" let g:esearch = {
  " \ 'adapter':          'ag',
  " \ 'backend':          'nvim',
  " \ 'out':              'win',
  " \ 'batch_size':       1000,
  " \ 'use':              ['visual', 'hlsearch', 'last'],
  " \ 'default_mappings': 1,
  " \}

set showmatch
set ignorecase
set smartcase
noremap <F5> :grep <C-R><C-W> *<CR>
"search the word under the cursor in all files in current directory
map <F9> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
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
nmap <leader>q :q<CR>
nmap <space> i<space><ESC>
"console log shortcut"
imap <leader>clg console.log(

"fast saving of a buffer
nmap <leader>w :w<cr>

"disabling and remapping the arrow keys
"move a line up/down on normal mode
noremap <Up> :m .-2<CR>==
noremap <Down> :m .+1<CR>==
"do nothing in insert mode
"imap <Up> <NOP>
"imap <Down> <NOP>
"imap <Left> <NOP>
"imap <Right> <NOP>
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
"terminal mode mappings
"map Esc to switch back to normal mode
tnoremap <ESC> <C-\><C-n>
tmap <C-c> <C-w>c

" Plugins mappings
"vim-sorround 'mappings'
noremap <leader>mm) ysiw)
noremap <leader>mm] ysiw]
noremap <leader>mm} ysiw}w<space>lw<space>e
"custom sorround mappings
noremap <leader>qw bcw''<ESC>hp
noremap <leader>dq bcw""<ESC>hp
vnoremap <leader>qw c''<ESC>hp
vnoremap <leader>dq c""<ESC>hp
"sorround selected text in  brackets, parenthesis, e.t.c
vnoremap <leader>{ c{ }<esc>hpli<space><esc>2l
vnoremap <leader>[ c[]<esc>hp
vnoremap <leader>( c()<esc>hp

"moving between windows/splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l
map <C-f> <C-w>f
"nerdtreeToogle shortcut
nmap <C-a> :NERDTreeToggle<CR>
"go to the location of the currently open file
map <leader>r :NERDTreeFind<cr>
"refresh Nerdtree to show newly added files
map <leader>rh :NERDTreeFocus<cr>R<c-w><c-p>
"when you delete or rename a file, always delete its associated buffer
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"mru mapping | most recently used files
nmap <leader>rf :MRU<CR>

"add spaces after comment delimiters by default 'Nerd commenter'
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
"resize splits 
nmap <Left> :vertical resize -5<CR>
nmap <Right> :vertical resize +5<CR>
"open vertical splits to the right 
set splitright
let g:ale_linters = {'javascript': ['eslint']}
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_emit_conflict_warnings = 0
let g:alet_completion = 1

"cnfigurations for closetag plugin
"enable autoclose in the following file types
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx, *.php, *.svelte'
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.js,*.jsx,*.ts,*.tsx'
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)

"javascript mappings
" mappings for vim-js-import
nnoremap <F5> :call JsFileImport()<CR>
nnoremap <F6> :call SortJsFileImport()<CR>
"mappings for tern vim
nmap <leader>df :TernDef
nmap <leader>ref :TernRefs
nmap <leader>ren :TernRename
"vim-node mappings
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif
"use <C-w>f to open the file under the cursor in a new vertical split
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif
"
let g:closetag_emptyTags_caseSensitive = 1
" Shortcut for closing tags, default is '>'

"gutentags settings
"when opening a file in a project that has no tags file, let Gutentags auto-generate that tags file.
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_write = 1
" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']
" config project root markers.
let g:gutentags_project_root = ['.root']
" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')
"
" Trigger configuration (Optional)
let g:UltiSnipsExpandTrigger='<c-l>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 3
let g:deoplete#file#enable_buffer_path=1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = [" — persistent"]
let g:deoplete#max_list = 20
"make the enter key select the suggested popup
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

imap ;im import  from '';<ESC>8hi
"importing objects
imap ;cim import {  } from '';<ESC>10hi

"Invoke CtrlP with starting directory
nmap <leader>p <C-p>
nmap <leader>s :Rg
let g:ctrlp_working_path_mode = 'r'
"ignore files in .gitignore file
" it will load faster this way
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = 'node_modules\|bower_compnents\|DS_Store\|git'
"make Gdiff always open vertical splits
set diffopt+=vertical

set wildignore+=*.pyc,*.swp,*.DS_Store,*.tags*,
"Nerdtree config for wildignore
let NERDTreeRespectWildIgnore=1

" coc-server settings
" plugins
" coc-prettier configuration
" coc extensions
"coc-extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-prettier', 'coc-css']
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)



"html and jsx
"indentLine plugin
let g:indentLine_enabled = 0

"terraform
let g:terraform_align=1
let g:terraform_fold_sections=1

" disable the red highlight on JSON comments
autocmd FileType json syntax match Comment +\/\/.\+$+

" let g:terraform_fmt_on_save=1
"lightline colorscheme
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

augroup autoSourceMyvimrc
    au!
    au BufWritePost init.vim so ~/.config/nvim/init.vim
augroup END
