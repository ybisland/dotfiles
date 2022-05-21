
-- schemes: onedarkpro vscode neon
-- 2022.3.9: onedarkpro don't support bufferline
local color_scheme = 'onedarkpro'

-- vscode scheme:
vim.g.vscode_style = "dark"
vim.g.vscode_transparent = 0
vim.g.vscode_italic_comment = 0 -- Enable italic comment
vim.g.vscode_disable_nvimtree_bg = true -- Disable nvim-tree background color

-- onedarkpro
if color_scheme == 'onedarkpro' then
  require("onedarkpro").setup({
    colors = {
      -- my_new_red = "#f44336"
    },
    hlgroups = { -- Overriding the Comment highlight group
      -- Comment = { fg = "${white}", bg = "${yellow}", style = "bold,italic" }, -- 2

      -- Label  = { fg = "${white}"},
      -- Error = { fg = "${white}"},
      -- ErrorMsg = { fg = "${white}"},

      diffAdded = { fg = "${blue}" },

      TSVariable = { fg = "${white}" },-- white"#abb2bf"
      BufferVisible = { fg = "#8f8f8f" },
      -- TODO: color of blame, style of LSPError
    },

    transparency = false,
  })
end

-- neon
vim.g.neon_style = "doom" -- default or doom
vim.g.neon_italic_boolean = false -- italic for all text
vim.g.neon_italic_keyword = false
vim.g.neon_italic_comment = false
vim.g.neon_italic_function = true
vim.g.neon_italic_variable = false
vim.g.neon_bold = false
vim.g.neon_transparent = false

-- use protected call to avoid erroring out when the colorscheme is not found
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. color_scheme)
if not status_ok then
  vim.notify('colorscheme' .. color_scheme .. 'not found!')
  return
end

--[[
some scheme plugins(most are writen in vimL) contains many colorschemes, we can ues vim.cmd "colorscheme xxx" to change colorscheme
however, some scheme plugins(most are writen in lua, eg. onedark) only contains one colorscheme with many style.
For these plugins, we can change its style to change the color shown in nvim.
--]]
