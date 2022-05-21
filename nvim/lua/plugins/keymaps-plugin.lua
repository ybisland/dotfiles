-- Author            : YinBin
-- Date              : 22 Feb 2022
-- Encoding format   : UTF-8

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap.set -- Shorten function name

-- ==BufferNavigator==
keymap("n", "<C-j>", "<cmd>BufferPrevious<cr>", opts)
keymap("n", "<C-k>", "<cmd>BufferNext<cr>", opts)
keymap('n', '<A-,>', ':BufferMovePrevious<CR>', opts)
keymap('n', '<A-.>', ' :BufferMoveNext<CR>', opts)

-- ==SnipRun==
keymap("n", "<F1>", "<cmd>lua require'sniprun'.run('n')<cr>", opts)
keymap("x", "<F1>", "<Plug>SnipRun<cr>", opts) 

--[[ ==Nvim-Tree==
  ?        see all keymaps
--]]
--[[ ==telescope==
  ?        see all keymaps(normal mode)
  <C-/>    see all keymaps(insert mode)
--]]

-- == Hop == (Easymotion plugin)
local hop_status, h = pcall(require, 'hop')
if not hop_status then
  vim.notify("[lua/Keymaps-plugin.lua] require'hop' error!")
else
  _Hop = h
  _Hop.setup {
    quit_key = '<Esc>',
    teasing = false,
    char2_fallback_key = '<CR>',  -- press a key and a <CR>, hint_char2 fallback to hint_char1
  }
  _Hop1 = _Hop.hint_char1
  _HopHint = require'hop.hint'
  _AC = _HopHint.HintDirection.AFTER_CURSOR
  _BC = _HopHint.HintDirection.BEFORE_CURSOR

  -- TODO: wait for Hop updating
  -- for now, there are 2 drawbacks in Hop
  -- 1. hint_char1() doesn't ignore char that under cursor  (github.com/phaazon/hop.nvim/issues/201)
  -- 2. hint_char2() can't be aborted by <Esc> (github.com/phaazon/hop.nvim/issues/212)

  -- <empty>  Normal, Visual, Select and Operator-pending
  keymap('o', 'f', "<cmd>lua _Hop1({ direction = _AC, current_line_only = true, inclusive_jump = true })<CR>", {})
  keymap('o', 'F', "<cmd>lua _Hop1({ direction = _BC, current_line_only = true, inclusive_jump = true })<CR>", {})
  keymap('o', 't', "<cmd>lua _Hop1({ direction = _AC, current_line_only = true})<CR>", {})
  keymap('o', 'T', "<cmd>lua _Hop1({ direction = _BC, current_line_only = true})<CR>", {})
  keymap('n', 'f', "<cmd>lua _Hop1({ direction = _AC, current_line_only = true})<CR>", {})
  keymap('n', 'F', "<cmd>lua _Hop1({ direction = _BC, current_line_only = true})<CR>", {})
  keymap('v', 'f', "<cmd>lua _Hop1({ direction = _AC, current_line_only = true})<CR>", {})
  keymap('v', 'F', "<cmd>lua _Hop1({ direction = _BC, current_line_only = true})<CR>", {})
  keymap('', '?', "<cmd>lua _Hop.hint_patterns()<CR>", {})
  keymap('n', '?', "<cmd>lua _Hop.hint_patterns({multi_windows = true})<CR>", {})
  -- these keymaps set in whichkey
  -- keymap('', '<Leader>f', "<cmd>lua _Hop.hint_char1()<CR>", {})
  -- keymap('', '<Leader>s', "<cmd>lua _Hop.hint_char2()<CR>", {})
  -- keymap('', '<Leader>d', "<cmd>lua _Hop.hint_patterns()<CR>", {})
  -- Search in multi_windows, only works in normal mode.
  -- if you want to search in multi_windows, just override the keymaps below
  -- keymap('n', '<Leader>f', "<cmd>lua _Hop.hint_char1({multi_windows = true})<CR>", {})
  -- keymap('n', '<Leader>s', "<cmd>lua _Hop.hint_char2({multi_windows = true})<CR>", {})
  -- keymap('n', '<Leader>d', "<cmd>lua _Hop.hint_patterns({multi_windows = true})<CR>", {})
end

--[[ ==Surround==
- ds{char}                     delete char
- cs{char1}{char2}             change char1 to char2
- ys{motion}{char}             wrap Vim motion or text object with char
- yss{char}                    wrap current line with char, ignoring leading whitespace
- [(line/block)visual]S{char}  wrap the selected part with char
{char} :
  t -> html tag
  b -> )
  B -> }
  a -> >
  - -> -
  * -> *

  Old text:                 Command:    New text:                * -> cursor position
  "Hello *world!"           ds"         Hello world!
  <div>Yo!*</div>           dst         Yo!
  "Hello *world!"           cs"'        'Hello world!'
  "Hello *world!"           cs"<q>      <q>Hello world!</q>
  (123+4*56)/2              cs)]        [123+456]/2
  (123+4*56)/2              cs)[        [ 123+456 ]/2
  <div>Yo!*</div>           cst<p>      <p>Yo!</p>
  Hello w*orld!             ysiw)       Hello (world)!
      Hello w*orld!         yssB            {Hello world!}
--]]

--[[ ==Marks==
  mx              Set mark x
  m,              Set the next available alphabetical (lowercase) mark
  m;              Toggle the next available mark at the current line
  dmx             Delete mark x
  dm-             Delete all marks on the current line
  dm<space>       Delete all marks in the current buffer
  m]              Move to next mark
  m[              Move to previous mark
  m:              Preview mark. This will prompt you for a specific mark to
                  preview; press <cr> to preview the next mark.

  m[0-9]          Add a bookmark from bookmark group[0-9].
  dm[0-9]         Delete all bookmarks from bookmark group[0-9].
  m}              Move to the next bookmark having the same type as the bookmark under
                  the cursor. Works across buffers.
  m{              Move to the previous bookmark having the same type as the bookmark under
                  the cursor. Works across buffers.
  dm=             Delete the bookmark under the cursor.
--]]

--[[ ==Matchup==
  %               Jump forward to next matching word or the ending of nearest inner block
  g%              Jump backforward to previous matching word
  [%              Jump to nearest outer open word(parenthese)
  ]%              Jump to nearest outer close word(parenthese)
  z%              Jump to the begginning of nearest inner contained block 
--]]
