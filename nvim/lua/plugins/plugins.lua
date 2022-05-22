-- Author            : YinBin
-- Date              : 21 Feb 2022
-- Encoding format   : UTF-8

-- Plugins List:
-- [o] colorscheme
-- [ ] lint code
-- [ ] nvim-treesitter/nvim-treesitter
-- [x] andymass/vim-matchup  --> highlight syntax pairs; insert { before 'abc', autocmp } after 'abc'; setup ,can this repleace surround
-- [o] barbar   TODO: how to show lsp info on barbar
-- [x] lualine
-- [x] Comment
-- [x] todo-comments        :Todoxxx use local list, quickfix, trouble, telescope to show the list
-- [o] cmp  change vscode icons
-- [x] nvim-autopairs        <M-m> choose where the close parathess are going to put in
-- [o] chentau/marks.nvim    For now I use the default setups. I wander how to use popup list
-- [ ] tabnine
-- [ ] 'sunjon/shade.nvim',
-- [ ] folke/which-key.nvim
-- [ ] AckslD/nvim-whichkey-setup.lua
-- [x] surround
-- [ ] quickfix
-- [x] Nvim-Tree  ? to see keymaps
-- [o] trouble    see repo to figure out if trouble need to be config
-- [x] Gitsigns
-- [x] hlslens
-- [o] null ls    TODO: disable null-ls in c cpp files
-- [o] gps        need to fix icons
--
-- Plugins that need to add which-key
-- - Gitsigns next_hunk, preview_hunk, blame_line, toggle_current_line_blame ...
-- - todo-comments
-- - Hop
-- - telescope live_group find_file
-- - Trouble
-- - LSP  lint, quickfix
-- - ranger.vim
-- - Barbar
-- - Marks

-- tree-sitter is a language syntax parser which nvim integrates. nvim-treesitter is abstraction layer
-- C-e close cmp menu
-- PERF:
-- TODO: disable_filetype, exclude_filetype, filetype_exclude, colorscheme
-- NOTE:
-- FIXME:
-- FIX:  this should be fixed
-- BUG:
-- HACK: werid code warning
-- WARNING:

local useSSH = true -- download plugins from Github through SSH
local plugins_table = {
	"wbthomason/packer.nvim", -- Have packer manage itself. :PackerSync will update and compile plugins
	-- lots of plugins relay on the following two plugins, although maybe these won't be needed in the future
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins, existing highlight groups from themes will never be overwritten

	"phaazon/hop.nvim",
	-- 'git@github.com:easymotion/vim-easymotion',
	"windwp/nvim-autopairs",
	-- Better Comment
	"numToStr/Comment.nvim",
	"folke/todo-comments.nvim",

	"norcalli/nvim-colorizer.lua", -- show colors on the hex colorcode

	-- colorscheme
	"olimorris/onedarkpro.nvim", -- colorscheme onedarkpro
	"Mofiqul/vscode.nvim", -- colorscheme vscode
	"rafamadriz/neon",
	"bluz71/vim-moonfly-colors",
	"ChristianChiarulli/nvcode-color-schemes.vim",

	"lukas-reineke/indent-blankline.nvim", -- indent-line
	"romgrk/barbar.nvim",
	"moll/vim-bbye",
	"nvim-lualine/lualine.nvim",
	"SmiteshP/nvim-gps",
	"goolord/alpha-nvim", -- startify or dashboard
	"andymass/vim-matchup", -- match and highlight syntax (eg. if .. then .. end)
	"yamatsum/nvim-cursorline", -- show underline below the current word
	"kevinhwang91/nvim-hlslens",

	-- completion         when adding a new cmp-plugins, you have to add sources in lua/cmp.lua/cmp.setup.sources
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-nvim-lsp",
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"octaltree/cmp-look", -- word completion

	-- snip
	"L3MON4D3/LuaSnip", -- snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use
	-- LSP
	"neovim/nvim-lspconfig", -- Quickstart configurations for the Nvim LSP client
	"williamboman/nvim-lsp-installer", -- language server installer↴
	"folke/trouble.nvim", -- a pretty list instead of nvim bulid-in local list
	"michaelb/sniprun", -- TODO:
	-- 'CRAG666/code_runner.nvim',
	"ray-x/lsp_signature.nvim", -- show func signature when typing
	"tami5/lspsaga.nvim", -- UI for lsp, see gif @ github.com/glepnir/lspsaga.nvim
	"folke/lsp-colors.nvim", -- creates missing LSP diagnostics highlight & undercurls

	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	"JoosepAlviste/nvim-ts-context-commentstring",
	-- 'nvim-treesitter/playground'  -- View treesitter information directly in Neovim!
	"p00f/nvim-ts-rainbow",

	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	"nvim-telescope/telescope-hop.nvim",
	"nvim-telescope/telescope-ui-select.nvim",

	"kyazdani42/nvim-web-devicons",
	"kyazdani42/nvim-tree.lua",

	"tpope/vim-surround",
	"lewis6991/gitsigns.nvim",
	"akinsho/toggleterm.nvim",

	"chentoast/marks.nvim",
	"folke/which-key.nvim",
	"jose-elias-alvarez/null-ls.nvim", -- a plugin to use non-LSP formatter or diagnostic.
	"lewis6991/impatient.nvim", -- Boost neovim startup time
	"ahmedkhalf/project.nvim",
	"rmagatti/auto-session",
	"anuvyklack/pretty-fold.nvim", -- TODO: not work
	"booperlv/nvim-gomove", -- Move(<A-h/j/k/l>) & duplicate(<A-S-h/j/k/l>) blocks and lines

	"rhysd/vim-grammarous", -- grammar check

  -- "wasden/cmp-flypy.nvim", -- chinese input method plugin
}

-- Setup some plugins with short setup table
require("nvim-autopairs").setup()
require("alpha").setup(require("alpha.themes.startify").config)
require("Comment").setup()
require("todo-comments").setup()
require("colorizer").setup()
-- matchup is not written by lua, so we have to setup it by traditional way
vim.g.matchup_matchparen_offscreen = {}
vim.g.matchup_matchparen_deferred = 1
vim.g.matchup_matchparen_hi_surround_always = 1

require("gomove").setup({
	-- whether or not to map default key bindings, (true/false)
	map_defaults = true,
	-- whether or not to reindent lines moved vertically (true/false)
	reindent = true,
	-- whether or not to undojoin same direction moves (true/false)
	undojoin = true,
	-- whether to not to move past end column when moving blocks horizontally, (true/false)
	move_past_end_col = false,
})

-- (see more plugins: awesome-neovim
--
--> pakcer.nvim tutorial:
-- use {                                      -- in the body of function(use) , which locate at the end of this file
-- 'git@github.com:xxx/yyy',                  -- installation by ssh is faster than http
-- cmd = {"Cmd1", "Cmd2"},                    -- Lazy loading on specific commands
-- event = 'BufEnter',                        -- Lazy loading on specific autocommand events
-- ft = {'sh', 'c', 'cpp', 'markdown'}        -- Lazy loading on specific filetypes
-- config = 'vim.cmd [[...]]'                 -- run code after loading plugins
-- requires = {
--  {'hrsh7th/vim-vsnip', opt = true},        -- opt is the abbreviation of optional plugins(lazy loading plugins)
--  {'hrsh7th/vim-vsnip-integ', opt = true}}  -- depend on other plugins
-- }                                          -- you can put the content of {} after `use` in `plugins_table`, and this plugin will work

-- ----------↓↓ no need to read ↓↓--------------

-- Disable some standard-plugin : nvim & vim have some built-in plugins, called standard-plugin. nvim also support global-plugin (used for all kinds of files) and filetype plugin(only for specific type of file).
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1 -- ? forbid vimrc/init.vim
vim.g.loaded_getscriptPlugin = 1 -- ? forbid .vim plugins
vim.g.loaded_2html_plugin = 1 -- open a new window to convert the current window into HTML
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1

local fn = vim.fn

-- Automatically install packer.nvim
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim" -- `data` stands for `~/.local/share/nvim`
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]]) -- run packer.nvim
end

-- Automatically reloads neovim whenever you save this plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install plugins here
return packer.startup(function(use)
	if useSSH then
		for idx, plugin in ipairs(plugins_table) do
			if type(plugin) == "string" then
				plugins_table[idx] = "git@github.com:" .. plugins_table[idx]
			else
				plugins_table[idx][1] = "git@github.com:" .. plugins_table[idx][1]
			end
		end
	end
	for _, plugin in pairs(plugins_table) do
		use(plugin)
	end
	-- Automatically set up your configuration after cloning(installing) packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
