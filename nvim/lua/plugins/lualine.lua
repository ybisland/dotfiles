local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("[lualine-cfg.lua] require'lualine' error!")
  return
end

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

local filename = {
  "filename",
  cond = conditions.buffer_not_empty and conditions.hide_in_width,
  file_status = false, -- Displays file status (readonly status, modified status)
  path = 1, -- 0: Just the filename
  -- 1: Relative path
  -- 2: Absolute path
  -- 3: Absolute path, with tilde as the home directory
  shorting_target = 40, -- Shortens path to leave 40 spaces in the window
  -- for other components. (terrible name, any suggestions?)
}

local diff = {
  "diff",
  colored = false,
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = conditions.hide_in_width,
}

local mode = {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
}

local filetype = {
  "filetype",
  colored = true, -- Displays filetype icon in color if set to true
  icons_enabled = false,
  icon = nil,
}

local filesize = {
  "filesize",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.green, gui = "bold" },
}

local fileformat = {
  "fileformat",
  fmt = string.upper,
  icons_enabled = false,
  color = { fg = colors.green, gui = "bold" },
}

local encoding = {
  "o:encoding", -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = "bold" },
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
  color = { fg = colors.violet, gui = "bold" },
}

local location = {
  "location",
  padding = 0,
  color = { fg = colors.yellow, gui = "bold" },
}

-- cool function for showing progress
local progress = {
  function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { "  ", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  color = { fg = colors.yellow, gui = "bold" },
}

local spaces = {
  function()
    return "sp:" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
  color = { fg = colors.green, gui = "bold" },
}

local lsp_name = {
  function()
    local msg = "No Active"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = " LSP:",
  color = { fg = "#ffffff", gui = "bold" },
}

local leftsidebar = {
  -- NOTE: The way to show string directly is to return string by function.
  function()
    return "▊"
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}
local rightsidebar = {
  function()
    return "▊"
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

-- local navic = require("nvim-navic")

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {},
    lualine_b = {
      -- mode,
    },
    lualine_c = {
      leftsidebar,
      branch,
      diagnostics,
    },
    lualine_x = {
      lsp_name,
      encoding,
      fileformat,
      filesize,
      spaces,
      progress,
      location,
      rightsidebar,
    },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    -- lualine_a = { "windows" },
    -- lualine_z = { "tabs" },
  },
  -- NOTE: winbar is local to each window
  -- NOTE: use lsasaga(lua/lsp/lspsaga) to set up winbar
  -- winbar = {
  --   lualine_a = {}, lualine_b = {}, lualine_c = { { navic.get_location, cond = navic.is_available }, },
  --   lualine_x = { filename, }, lualine_y = {}, lualine_z = {},
  -- },
  -- inactive_winbar = {
  --   lualine_a = {}, lualine_b = {}, lualine_c = { { navic.get_location, cond = navic.is_available }, },
  --   lualine_x = { filename, }, lualine_y = {}, lualine_z = {},
  -- },
  extensions = {
    "toggleterm",
  },
})
