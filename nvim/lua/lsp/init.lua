local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify('[lsp/init.lua]: require("lspconfig") error!')
  return
end

require("lsp.lsp-installer")
require("lsp.handlers").setup() -- a function defined in "lsp.handlerls"
require("lsp.null-ls")
require("lsp.lsp_signature")
require("lsp.lspsaga")

-- BUG: 
-- github.com/jose-elias-alvarez/null-ls.nvim/issues/428
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities })

--[[
If we just use nvim-lspconfig without nvim-lsp-installer, we need to 
use `require('lspconfig')[lsp_name].setup()` to start language server. And before this
we have to make sure that ls is in the $PATH. e.g:
```
local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
```

The darwback of this way is we have to change `local servers`, whenever 
we install a new ls, to make sure the new language server runs, which is too noisy.

When using nvim-lsp-installer, we can have the lsp-installer to `require('lspconfig').lsp.setup()`.
And lsp-installer help us to auto load all installed servers. We don't need to change `local servers`
any more. 


-
language server `sumneko_lua` has bug with formatting, it always use dos eol whatever the fileformat is
so I use NullLs with stylua to format, and disabled sumneko_lua formatting.

--]]
