-- Author            : YinBin
-- Date              : 05 May 2022
-- Encoding format   : UTF-8

local options = {  -- :help options
  backup = false,                          -- creates a backup file
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- height of command line. must >= 1
  completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  mousemodel = "popup",
  mousefocus = true,
  pumheight = 12,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 500,                        -- time in milliseconds to wait for a mapped sequence to complete
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time. (e.g. lsp Error sign)
  wrap = false,                            -- display lines as one long line
  scrolloff = 5,                           -- is one of my fav
  sidescrolloff = 5,
  laststatus = 3,                          -- global status line
  spell = false,                           -- disable built-in spell check
  foldmethod = "expr",                     -- use treesitter to fold code
  foldlevelstart = 99,                     -- do not fold any code when entering a buffer
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- TODO: replace `treesitter_fold` with plugin `pretty-fold`
-- TODO: expectation: keep foldtext the same as last exit
vim.cmd [[ set foldexpr=nvim_treesitter#foldexpr() ]]
-- vim.cmd [[ autocmd VimEnter * normal zR ]]

-- disable vim built-in syntax highlight except help
vim.cmd [[ syntax off ]]
vim.cmd [[ autocmd FileType help syntax on ]]

-- vim.cmd [[ autocmd FileType help %foldopen ]]

vim.opt.shortmess:append "c"

-- vim.cmd [[ set whichwrap+=<,>,[,],h,l ]]             -- allow cursor to move across lines
vim.cmd [[ set iskeyword+=- ]]                          -- treat 'xxx-yyy' as one word

-- vim.cmd [[ autocmd InsertEnter * :set norelativenumber number ]]
-- vim.cmd [[ autocmd InsertLeave * :set relativenumber ]] -- show relative number in normal mode, show absolute number in insert mode
vim.cmd [[ autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]  -- position cursor at where you leave whenever you open files

vim.cmd [[ autocmd FileType make set noexpandtab ]]     -- don't expand tab in Makefile files

-- vim.cmd [[ autocmd VimEnter :messages ]]                -- show all messages whenever entering nvim

vim.cmd [[ autocmd FileType help wincmd L ]]            -- open help in vertical split
vim.cmd [[ autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no]]          -- turn off number line inside terminal

-- TODO: is this working?
vim.highlight.on_yank()                                 -- Highlight on yank, maybe not working with some colortheme

