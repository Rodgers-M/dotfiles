local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap comma as leader key
keymap("", ",", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = ","
vim.g.maplocalleader = ","

require('lazy').setup({
  {import= "plugins"},
  {import = "plugins.lsp"}
}, {

  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false
  }
})

-- require "user.plugins"
require "user.autocommands"
require "user.keymaps"
require "user.options"
-- require "user.cmp"
-- require "user.telescope"
--require "user.lsp_config"
--require "user.treesitter"
--require "user.null-ls"
