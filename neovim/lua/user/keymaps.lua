local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap comma as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- open file explorer
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +5<CR>", opts)
keymap("n", "<C-Down>", ":resize -5<CR>", opts)
keymap("n", "<Left>", ":vertical resize -5<CR>", opts)
keymap("n", "<Right>", ":vertical resize +5<CR>", opts)

-- get out of insert mode quickly
keymap("i", "jj", "<ESC>", opts)
keymap("i", "kk", "<ESC>", opts)

-- toggle relative numbers
keymap("n", "rn", ":set relativenumber!<CR>", opts)
keymap("n", "tn", ":set relativenumber!<CR>", opts)

-- use spacebar to add space
keymap("n", "<space>", "i<space><ESC>", opts)

-- fast saving of a buffer
keymap("n", "<leader>w", ":w<CR>", opts)

-- disabling and remapping the arrow keys
-- move a line up/down on normal mode
keymap("n", "<Up>", ":m .-2<CR>==", opts)
keymap("n", "<Down>", ":m .+1<CR>==", opts)
-- let vim retain yanked content in visual mode even after pasting on top of another content
keymap("v", "p", '"_dP', opts)

-- move selected lines up/down in visual mode
keymap("v", "<Up>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "<Down>", ":m '>+1<CR>gv=gv", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- nerdtreeToogle shortcut
keymap("n", '<C-a>', ':NERDTreeToggle<CR>', opts)

--telescope
keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)

