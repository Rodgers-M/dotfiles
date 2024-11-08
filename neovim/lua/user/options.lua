-- :help options
vim.cmd([[syntax on]])
vim.cmd([[set encoding=UTF-8]])

vim.opt.backup = false -- creates a backup file
-- vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0
vim.cmd([[set modifiable]]) -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
-- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.number = true -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 4
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications

vim.opt.shortmess:append("c")

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
-- specify buffers for autocomplete
vim.cmd([[set complete=.,w,b,u]])
-- white space
vim.cmd([[set backspace=eol,start,indent]])
vim.cmd([[set wrap]])
vim.cmd([[set linebreak]])
vim.cmd([[set textwidth=79]])
-- default number of spaces for tabs
vim.cmd([[set expandtab ts=2 sw=2 ai]])

-- searching
vim.cmd([[set hlsearch]])
vim.cmd([[set incsearch]])

-- change current directory
vim.cmd([[set autochdir]])

-- open vertical splits to the right
vim.cmd([[set splitright]])
-- open git diff splits to the right
vim.cmd([[set diffopt+=vertical]])

vim.cmd([[set wildignore+=*.pyc,*.swp,*.DS_Store,*.tags*,]])

vim.cmd([[set background=dark ]])

vim.cmd([[set termguicolors]])
---vim.cmd("colorscheme rose-pine")
-- vim.cmd [[colorscheme miasma]] -- xero/miasma.nvim
-- vim.cmd [[colorscheme ennui]] --- Myagko/ennui
-- vim.cmd [[colorscheme darkplus]] --- lunarvim/darkplus.nvim
-- vim.cmd([[colorscheme gruvbox]]) ---

-- vim.cmd [[
-- let g:coc_global_extensions = [ 'coc-prettier', 'coc-css', 'coc-tslint-plugin', 'coc-html' ]
-- ]]

-- add :Prettier command
-- vim.cmd[[ command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument ]]

-- nerdcommenter
-- add space delimiters after comment
vim.cmd([[let g:NERDSpaceDelims = 1]])
vim.cmd([[let g:NERDCommentEmptyLines = 1]])
-- typescript
vim.cmd([[ au BufNewFile,BufRead *.ts setlocal filetype=typescript]])
