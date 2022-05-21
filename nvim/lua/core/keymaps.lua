-- Author            : YinBin
-- Date              : 20 Feb 2022
-- Encoding format   : UTF-8

--> default keymaps  :
-- <C-w>s     :split
-- <C-w>v     :vsplit
-- :bd        close buffer
-- ==         indent line automatically


local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- local keymap = vim.api.nvim_set_keymap -- Shorten function name
local keymap = vim.keymap.set       -- since nvim 0.7, use vim.keymap.set instead of vim.api.nvim_set_keymap

--Remap space as Leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- CHAR MODE (see vim-modes [mode intro](https://zhuanlan.zhihu.com/p/100196990)
--  <Space>/<empty>  Normal, Visual, Select and Operator-pending
--  n  Normal
--  x  Visual (almost same as v
--  !  Insert and Command-line
--  i  Insert
--  c  Command-line
--  t  Terminal-Job
--  o  Operator-pending(wait for {motion} after pressing operator e.g. c d y ...)

-- == Normal ==
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
-- keymap('n', '<C-j>', '<C-w>j', opts)
-- keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Navigate tab
-- for i = 1, 9 do
--   keymap('n', '<Leader>' .. i, i .. 'gt', opts) -- e.g keymap('n', '<Leader>1', '1gt', opts)
-- end
keymap('n', '<Leader>j', 'gT',  opts)
keymap('n', '<Leader>k', 'gt',  opts)

-- Resize window
keymap('n', '<C-Up>',    '<cmd>resize +2<CR>',          opts)
keymap('n', '<C-Down>',  '<cmd>resize -2<CR>',          opts)
keymap('n', '<C-Left>',  '<cmd>vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', '<cmd>vertical resize +2<CR>', opts)
keymap('n', '<C-w>d',    '<cmd>q<CR>',                  opts)

-- Scroll horizontally
keymap('n', 'zh', 'zH', opts)
keymap('n', 'zl', 'zL', opts)

-- Others
keymap('n', '0',  '^', opts)
keymap('n', '^',  '0', opts)
keymap('n', '；', ';', opts)

-- keymap('n', '<Leader>n', '<cmd>noh<CR>',    opts)  -- this map set in whichkey

-- == Insert ==
keymap('i', '<C-d>', '<Del>',   opts)
keymap('i', '<C-a>', '<Esc>I',  opts)
keymap('i', '<C-e>', '<End>',   opts)
keymap('i', '<C-b>', '<Left>',  opts)
keymap('i', '<C-f>', '<Right>', opts)
keymap('i', '<C-j>', '<Nop>',   opts)
keymap('i', '<C-k>', '<Nop>',   opts)

-- == Visual ==
-- Batter indent
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move mappings are substituted by plugin `gomove`
--[[ -- Move text up and down
keymap('v', 'p',     '"_dP', opts)                           -- replace the selected text with yanked text
keymap('v', '<A-j>', ':move .+1<CR>==', opts)                -- == means reindent
keymap('v', '<A-k>', ':move .-2<CR>==', opts)
keymap('x', 'J',     ":move '>+1<CR>gv-gv", opts)            -- gv means enter Visual mode with the same area as the previous area
keymap('x', 'K',     ":move '<-2<CR>gv-gv", opts)            -- - + means move to next/previous line
keymap('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
keymap('x', '<A-k>', ":move '<-2<CR>gv-gv", opts) ]]

--[[ -- Move cursor line
keymap('n', '<A-j>', '<cmd>move .+1<CR>==', opts)
keymap('n', '<A-k>', '<cmd>move .-2<CR>==', opts) ]]

-- == Command ==
keymap('c', 'tn'   , 'tabnew' , opts)
keymap('c', '<C-a>', '<Home>' , opts)
keymap('c', '<C-e>', '<End>'  , opts)
keymap('c', '<C-b>', '<Left>' , opts)
keymap('c', '<C-f>', '<Right>', opts)

