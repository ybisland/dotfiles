-- What is null-ls?
-- Nvim doesn't provide a way for non-LSP sources to hook into its LSP client. NullLs provide a bridge to do this.
-- So if you use LSP's formatting and diagnostics, you don't need to set this.

local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  vim.notify("[lsp/null-ls]: require'null-ls' error!")
  return
end

-- Disable null-ls when using firenvim,
if vim.g.started_by_firenvim then
  vim.g.null_ls_disable = true
end

-- See: github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion

-- check if binary files of sources listed above exist in $PATH
-- keep the same with table`sources`
local check_table = {
  "stylua",
  "cppcheck",
  "codespell",
}

local sources = {
  -- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
  -- formatting.black.with({ extra_args = { "--fast" } }),

  -- formatting.stylua,
  formatting.stylua.with({
    extra_args = {
      "--indent-type",
      "Spaces",
      "--indent-width",
      "2",
    },
  }),

  -- cppcheck invoke a [bug](lsp/init.lua line 14)
  diagnostics.cppcheck,
  diagnostics.codespell, -- TODO: sometimes this works
}

-- ↓↓↓↓↓↓↓↓↓ Ignore these ↓↓↓↓↓↓↓↓↓↓↓
-- check if binary files of sources listed above exist in $PATH
for _, v in ipairs(check_table) do
  -- check if the binary exists in $PATH
  if vim.api.nvim_call_function("executable", { v }) == 0 then
    vim.notify('[null-ls.lua]: Cannot find binary file "' .. v .. '" in $PATH')
  end
end
-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

null_ls.setup({
  debug = false,
  sources = sources,
})
