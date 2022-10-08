-- Author            : YinBin
-- Date              : 03 Oct 2022
-- Encoding format   : UTF-8

require 'plugins.impatient'  -- keep this at start
require 'core.options'
require 'core.keymaps'
require 'plugins.keymaps-plugin'
require 'plugins.plugins'
require 'plugins.colorscheme'
require 'plugins.indentline'
require 'plugins.cmp'
require 'plugins.telescope'
require 'plugins.nvim-treesitter'
require 'plugins.nvimtree'
require 'plugins.todo-comment'
require 'plugins.autopairs'
require 'plugins.gitsigns'
require 'plugins.lualine'
require 'plugins.marks'
require 'plugins.barbar'
require 'plugins.whichkey'
require 'plugins.hlslens'
require 'plugins.nvim-navic'
require 'plugins.sniprun'
require 'plugins.trouble'
require 'plugins.toggleterm'
require 'plugins.project'
require 'plugins.auto-session'
require 'lsp' -- auto load `lsp/init.lua`


-- require 'configs.pretty-fold'




--[[

- auto-session:
Automatically save & restore session when quit(:q) & enter nvim for the current `cwd`.
You have to **save buffer before quitting**, or your changes will be discarded.

====Key Maps : Comment====
Visual & Normal:
  gcc           linecomment
  gbc           blockcomment
  gcO           comment on the line above
  gco           comment on the line below
  gcA           comment at the end of line

gl            show the error message(lsp)
K             hover function or variable document


:messages               show the messages from nvim
====LSP====
:checkouthealth nvim-lsp-installer    checkout the requirements
:LspInfo                checkout if the ls is running
:LspInstallInfo         install lsp
:Format                 format file(lua/lsp/handlers.lua/keymaps)

keymaps are defined in lsp/handlers.lua

====nvim-lsp-installer====
i                       install server
u                       update  server
U                       update all servers
X                       uninstall server


====How to add a new language server====
1. choose and install language server by `:LspInstallInfo`
2. nvim-lsp-installer will download language server into `~/.local/share/nvim/lsp_servers/`,
  and installer won't add that path into $PATH
3. if you want a specific setups for new server, you can find server configuration
  in (github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
  and put it in a file `lsp/settings/server_name.lua`. Then specify this file in
  `lsp/lsp-installer.lua`


====How to check out reference?====

====telescope====
Use `:Telescope picker_name` to use pickers.
Telescope has many built-in pickers, here are some pickers that are most used.
  live_grep        -- search content in files
  find_file / fd   -- search file name

Telescope has two mode, insert mode and normal mode. Using <C-/> and ? in insert and normal mode to show keymaps.



nvim-lsp-installer put the installed language server(ls) into ~/.local/share/nvim/lsp_servers/, instead of put ls into $PATH


-- inspired by [LunarVim/Neovim-from-scratch](www.youtube.com/watch?v=gd_wapDL0V0&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)


need installed
for telescope
sharkdp/fd  (apt/brew install fd/fd-find) (https://github.com/sharkdp/fd)
BurntSushi/ripgrep (brew/apt install ripgrep)(https://github.com/BurntSushi/ripgrep)

need to install treesitter parser
put language name in treesitter.lua.setup.ensure_installed, and next time TS will download them automatically.


====null ls====
You have to install language formatter, if there are no formatter installed, NullLs use default formatter.
Use `NullLsInfo` in a file to checkout which formatters can format this kind of files, and 
which formatter you are using.

e.g. 
  cargo install stylua  -- lua formatter
  pip install codespell
  pip3 install black    -- py formatter
  TODO:
  brew/apt install cppcheck -- cpp diagnostics
  clang_format   -- cpp formatter

====sniprun====
Requirements: rust toolchain
  sniprun use compiler/interpreter in your $PATH
Installation: run `~/.local/share/nvim/site/pack/packer/start/sniprun/install.sh` to bulid rust project
  see m

--]]

