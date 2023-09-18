require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "lua_ls" }
})

local lspconfig = require("lspconfig")

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require("vim.lsp.protocol")

local on_attatch = function(client, bufnr)
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd( "BufWritePre", {
      group = vim.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sunc() end
    } )
  end
end

nvim_lsp.lua_ls.setup {
  on_attatch = on_attatch,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      }
    }
  }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- nvim_lsp.tsserver.setup {
  -- on_attatch = on_attatch,
  -- filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  -- cmd = { "typescript-language-server", "--stdio" },
  -- capabilities = capabilities
-- }
lspconfig.tsserver.setup {
   filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
   on_attatch = on_attatch,
   -- allow lsp for javascript to 
   root_dir = function () return vim.loop.cwd() end
}

