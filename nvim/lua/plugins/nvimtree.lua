vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "M", -- ✗ 
		staged = "✓",  -- 
		unmerged = "",
		renamed = "R", -- ➜ 
		deleted = "",
		untracked = "U",
		ignored = "◌",
	},
	folder = {
		arrow_open = "",
		arrow_closed = "",
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
	},
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	vim.notify('[nvimtree-cfg.lua] require"nvim-tree" error!')
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

nvim_tree.setup({
  auto_reload_on_write = true,
	disable_netrw = true,
	hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
	open_on_setup = false,
	ignore_ft_on_setup = { "startify", "dashboard", "alpha" },
	-- auto_close = false, -- BUG: when u close buffer with the nvim tree opening, whatever this set to false or true
	open_on_tab = false,
	hijack_cursor = true,
  sort_by = "name",
	update_cwd = true,
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 35,
		height = 30,
		hide_root_folder = false,
		side = "right", -- NOTE: left or right side
		mappings = {
			custom_only = false,
			list = {
				{ key = "l", action = "edit" }, -- open file or open dir node
				{ key = "h", action = "close_node" }, -- close dir node
				{ key = "v", action = "vsplit" },
				{ key = "?", action = "toggle_help" },
				{ key = "t", action = "tabnew" },
				{ key = "<Esc>", action = "close" },
				{
					key = {
						"<2-RightMouse>",
						"<2-LeftMouse>",
						"<C-]>",
						"<C-x>",
						"<C-v>",
						"g?",
						"<C-t>",
						"<BS>",
						"o",
						"<",
						">",
					},
				},
			},
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ", -- │  ├
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
    },
  },
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	actions = {
		change_dir = {
			global = false,
		},
		open_file = {
			quit_on_open = true,
			-- window_picker = {
			--   enable = true,
			--   chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
			--   exclude = {
			--   filetype = { "notify", "packer", "qf" }
		},
	},
})
