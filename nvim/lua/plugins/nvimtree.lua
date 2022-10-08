local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  vim.notify('[nvimtree-cfg.lua] require"nvim-tree" error!')
  return
end

nvim_tree.setup {
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  open_on_setup = false,
  open_on_tab = false,
  ignore_buf_on_tab_change = {},
  view = {
    adaptive_size = false,
    centralize_selection = false,
    width = 35,
    side = "right",
    signcolumn = "yes",
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
    float = {
      enable = true,
      open_win_config = {
        relative = "editor", -- cursor editor win
        border = "rounded",
        width = 35,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    full_name = false,
    highlight_opened_files = "all",
    root_folder_modifier = ":~",
    indent_width = 1,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_root = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
} -- END_DEFAULT_OPTS
