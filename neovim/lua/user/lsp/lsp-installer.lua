local status_ok, lsp_installer = pcall(require("nvim-lsp-installer"))
if not status_ok then 
  return
end

-- Register a handler that will be called for all installed servers

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attatch = require("user.lsp.handlers").on_attatch,
    capabilities = require("user.lsp.handlers").capabilities
  }

  if server.name == "jsonls" then
    local jsonls_opts = require("user.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

 if server.name == "sumneko_lua" then
    local jsonls_opts = require("user.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end
 server.setup(opts) 
end)
