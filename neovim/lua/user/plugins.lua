local fn = vim.fn


-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded"}
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "preservim/nerdtree" -- file explorer
  use "wesQ3/vim-windowswap" -- window swap
  use "jiangmiao/auto-pairs"  -- close matching pairs
  use({
	"Pocco81/auto-save.nvim",
	config = function()
		 require("auto-save").setup {
			-- your config goes here
			-- or just leave it empty :)
		 }
	end,
})
  use 'machakann/vim-highlightedyank' -- highlight yanked text"
  use  'itchyny/lightline.vim' -- show  mode, name of file and other file stats on status line
  use 'Xuyuanp/nerdtree-git-plugin' -- show git status flags on files
  
  -- Colorschemes
 use "morhetz/gruvbox" 
 use "lunarvim/darkplus.nvim"
 use({ 'rose-pine/neovim', as = 'rose-pine' })
 use "KeitaNakamura/neodark.vim"


  -- dev icons
  use "ryanoasis/vim-devicons"

  -- cmp plugins
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use  

  -- treesitter
  use ('nvim-treesitter/nvim-treesitter', {run  = ':TSUpdate'})
  -- autocompletion and intelisence
  -- use { 'neoclide/coc.nvim', branch='release' }


  -- LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use "neovim/nvim-lspconfig" -- enable LSP
  use "jose-elias-alvarez/null-ls.nvim"

  -- improve vim.ui interface
  use "stevearc/dressing.nvim"


  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- javascript development
  -- use "leafgarland/typescript-vim"
  use "ianks/vim-tsx"
  use "maxmellon/vim-jsx-pretty"
  use 'peitalin/vim-jsx-typescript'
  -- use 'isRuslan/vim-es6'
  -- use 'pangloss/vim-javascript'
  -- use 'dikiaap/minimalist'

  -- vim soround
  use 'tpope/vim-surround'
  use 'alvan/vim-closetag'

  -- comments
  use 'scrooloose/nerdcommenter'

  -- Version control and  Git
  use  'airblade/vim-gitgutter'
  use  'tpope/vim-fugitive'

  -- undotree
  use 'mbbill/undotree'
  

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
