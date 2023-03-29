"file browsing and searching"
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'google/vim-searchindex'
Plug 'yegappan/mru' "show a list of most recently used files
"docs => https://github.com/epmatsw/ag.vim/blob/master/README.md
Plug 'rking/ag.vim' "install Ag on your machine: https://github.com/ggreer/the_silver_searcher
"Plug 'eugen0329/vim-esearch'
Plug 'dyng/ctrlsf.vim'
"Fuzzy finder
Plug '/usr/local/opt/fzf' "install fzf with brew for this to work
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pechorin/any-jump.vim'

"markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
"
"Plug 'vim-scripts/LustyExplorer'
Plug 'tpope/vim-vinegar'
"add file icons
Plug 'ryanoasis/vim-devicons'
"Plugin to comment and uncomment code
Plug 'scrooloose/nerdcommenter'
Plug 'tomtom/tcomment_vim'
"highlight yanked text"
Plug 'machakann/vim-highlightedyank'

"windows management
Plug 'wesQ3/vim-windowswap'

" handling undo and redo 
"Plug 'sjl/gundo.vim'

"colorschemes
"Plug 'bf4/vim-dark_eyes'
Plug 'HenryNewcomer/vim-theme-papaya'
Plug 'morhetz/gruvbox'
"status line
Plug 'itchyny/lightline.vim'

"intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"auto completion
Plug 'ervandew/supertab'
"close and delete matching pairs
Plug 'jiangmiao/auto-pairs'
Plug 'adelarsq/vim-matchit'
"auto save files
Plug 'vim-scripts/vim-auto-save'
"tab completions
Plug 'ajh17/VimCompletesMe'
"

"snippets and autocomplete
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"a plugin to configure vim in accordance to local .editorconfig file
Plug 'editorconfig/editorconfig-vim'

"Plugins for typescript/javascript development
Plug 'mxw/vim-jsx'
Plug 'peitalin/vim-jsx-typescript'
Plug 'isRuslan/vim-es6'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
" React code snippets
Plug 'epilande/vim-react-snippets'
"css plugin
Plug 'ap/vim-css-color'

"intellisense
Plug 'leafgarland/typescript-vim'

"Html plugins
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'othree/html5.vim'

"graphql plugins
Plug 'jparise/vim-graphql'

"linters
Plug 'w0rp/ale'

"version control
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"show git status flags on files"
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'APZelos/blamer.nvim'

Plug 'hashivim/vim-terraform'
" Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
"install ripgrep brew install ripgrep
"
"FUN
Plug 'Eandrju/cellular-automaton.nvim'

