local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify('[lua/treesitter.lua]: require("nvim-treesitter.configs") error!')
  return
end

-- NOTE:  2022 05 04
-- ref: www.reddit.com/r/neovim/comments/u6eu0q/treesitter_breaking_plugins/
-- nvim-treesitter.ts_utils.get_node_text is deprecated, now use vim.treesitter.query.get_node_text instead
-- However, some plugins have not change this API, the warning above aprears.
-- So the two lines aim to eliminate warning.
-- you can delete the two lines until plugin authors chage the API.
local ts_utils = require("nvim-treesitter.ts_utils")
ts_utils.get_node_text = vim.treesitter.query.get_node_text

configs.setup {
  ensure_installed = {'lua', 'comment', 'vim', 'bash', 'fish',
    'c', 'cpp', 'cmake', 'make',
    -- 'rust', 'ruby',
    'python', 'json', 'json5', 'jsonc',
    'http', 'html', 'css', 'vue', 'markdown'},
  -- ensure_installed = "maintained",
  -- one of "all", "maintained"(parsers with maintainer), or a list of language

  sync_install = false,    -- install language synchronously(only apply to ensure_installed)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = { enable = true },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    use_languagetree = true,
    -- this option may slow down editor
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable = { },              -- optional, list of language that will be disabled
    -- [options
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
