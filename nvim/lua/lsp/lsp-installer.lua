local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  vim.notify('[lua/lsp/lsp-installer]: require("nvim-lsp-installer") error!')
  return
end

-- Register a handler(callback) that will be called for each installed servers when it's ready.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- see more server configuration : https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
lsp_installer.on_server_ready(function(server)
  local handlers = require('lsp.handlers')

  local opts = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,  -- enanble cmp-nvim-lsp
  }

  -- specify server setups
  if server.name == "jsonls" then
    local jsonls_opts = require("lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "pyright" then
    local pyright_opts = require("lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  -- When server is ready, call the lsp.setup() by server:setup().
  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    },
    -- The directory in which to install servers.
    -- install_root_dir = path.concat { vim.fn.stdpath "data", "lsp_servers" },
})
