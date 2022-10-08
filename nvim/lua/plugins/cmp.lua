-- Author            : YinBin
-- Date              : 21 Apr 2022
-- Encoding format   : UTF-8
--
-- when you install a new plugin about 'cmp', you need to add it in cmp.setup.sources
-- :CmpStatus to checkout status
--
-- # Luasnip
-- Luasnip do these things in this lua file.
-- 1. Provide snippets to nvim-cmp such as `main` -> `int main() { $1 return 0;}`,
-- then nvim-cmp expand snippet. Related code is `sources.name == "luasnip"`.
-- 2. Take lsp-syntax-snippet from nvim-cmp and expand it. Related code is `snippet.expand`.
-- 3. jump in snippet when press <Tab>

local cmp = require 'cmp' -- completion engine. Completion sources are installed from external repo and "sourced".
local luasnip = require 'luasnip' -- snip engine

-- require("luasnip/loaders/from_vscode").lazy_load()

local has_space_before = function() -- enhance supertab
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "", Method = "m", Function = "", Constructor = "", Field = "", Variable = "",
  Class = "", Interface = "", Module = "", Property = "", Unit = "", Value = "",
  Enum = "", Keyword = "", Snippet = "", Color = "", File = "", Reference = "",
  Folder = "", EnumMember = "", Constant = "", Struct = "", Event = "",
  Operator = "", TypeParameter = "",
} -- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  enabled = true,
  snippet = { -- integrate snippet engine plugin via this.
    expand = function(args)
      --[[ @function:
           If the item confirmed by`cmp.confirm` which comes from source `nvim_lsp`, this function will be called.
           `args` have only one member `body`, which is a lsp-syntax-snippet(lss) form string.
           We pass lss to luasnip, who are able to parse lss and expand it.
      --]]

      --[[ The lss for function provided from `nvim_lsp` is something like `func_name($1{para1}, $2{para2})`.
           It's annoying, so I change it. --]]
      -- local idx, _ = string.find(args.body, '%(')
      -- if idx == nil then -- Variable
      --   luasnip.lsp_expand(args.body)
      -- else -- Function
      --   --[[ According to the number of parameters, format lss to `func_name($1, $2,.. $n)` ]]
      --   local str = string.sub(args.body, 1, idx - 1) .. '('
      --   idx, _ = string.find(args.body, '%$', idx + 1)  -- %$ is escape character of $
      --   if idx ~= nil then
      --     str = str .. '$0)'
      --   else
      --     str = str .. ')'
      --   end
      --   -- print(str)
      --   luasnip.lsp_expand(str)
      -- end

      print(args.body)
      luasnip.lsp_expand(args.body)
    end,
  },
  preselect = cmp.PreselectMode.None,

  mapping = {  -- i->insert mode, c->command mode, s->select mode
    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(2), { "i", "c" }),

    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- TODO: not know what the two do
    -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    -- ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close(), },
    -- ["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
    ["<C-c>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }),
    -- ["<Esc>"] = cmp.mapping(cmp.mapping.close()),
    ["<CR>"] = cmp.mapping.confirm(), -- Accept currently selected item.
    ["<Tab>"] = cmp.mapping(function(fallback)   -- enhance <tab>
      -- if cmp.get_selected_entry() ~= nil then
      --   cmp.confirm({select = false})
      -- elseif luasnip.in_snippet() and luasnip.jumpable() then -- the same as the line below
      -- -- elseif luasnip.expand_or_locally_jumpable() then -- Only jump in the current snippet
      --   luasnip.expand_or_jump()
      -- elseif cmp.visible() then  -- cmp.visible() return if the completion menu is showing
      --   cmp.confirm({select = true}) -- Select the first item, when `select` is true.
      -- elseif has_words_before() and not cmp.visible() then
      --   cmp.complete_common_string()
      -- -- elseif has_space_before() then
      -- --   fallback()
      -- else
      --   fallback()
      -- end

      if cmp.visible() then
        -- TODO:
        -- local t = cmp.get_entries()
        -- print(#t)
        -- if #t <= 1 then
        --   cmp.confirm({select = true})
        -- else
        --   print(cmp.complete_common_string())
        --   -- if not cmp.complete_common_string() then
        --   --   cmp.confirm({select = true})
        --   -- end
        -- end
          
        -- print(#t)
        -- for i, v in ipairs(t) do print(i, v) end
        if not cmp.complete_common_string() then
          cmp.confirm({select = true})
        end
      else
        if luasnip.in_snippet() and luasnip.jumpable(1) then
          print("luasnip.in_snippet() and luasnip.jumpable(1) -> luasnip.jump(1)")
          luasnip.jump(1)
        else
          print("not (luasnip.in_snippet() and luasnip.jumpable(1)) -> fallback")
          fallback()
        end
      end
    end, { "i", "s", "c" }),  -- s -> select mode
    ["<S-Tab>"] = cmp.mapping(function(fallback)  -- enhance <shift-tab>
      if luasnip.in_snippet() and luasnip.jumpable(-1) then -- -1 means jump backward
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s", "c"}),
  },
  formatting = {
    -- NOTE: the order of fields that shown in cmp menu item. e.g. { "abbr", "kind", "menu" } -> word Text [LSP]
    -- fields = { "abbr", "kind", "menu" }, -- format of cmp menu items, menu - the source of item, abbr - whole completion words,
    fields = { "abbr", "kind", "menu" }, -- format of cmp menu items, menu - the source of item, abbr - whole completion words,
    format = function(entry, vim_item)
      -- NOTE: Appreance of Kind icons
      local kind = vim_item.kind
      -- vim_item.kind = kind_icons[kind] -- only show the icons
      -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- only show the icons
      vim_item.kind = string.format('%s%s', kind_icons[vim_item.kind], vim_item.kind) -- show icons and it's kind name e.g. Text
      vim_item.menu = ({ -- * sources name
        nvim_lsp = "[L]",
        -- nvim_lua = "[NVIM_LUA]",  -- TODO:
        luasnip = "[S]",
        buffer = "[B]",
        look = "[W]",
        path = "[P]",
      })[entry.source.name]
      if kind == 'Function' or kind == 'Method' then
        local idx, _ = string.find(vim_item.abbr, '%(')
        local t = string.sub(vim_item.abbr, 1, idx - 1)
        vim_item.abbr = t
      end
      -- NOTE: Truncate long items to a desired length
      local ELLIPSIS_CHAR = '…'
      local MAX_ITEM_LENGTH = 50
      local item = vim_item.abbr
      local truncated_item = vim.fn.strcharpart(item, 0, MAX_ITEM_LENGTH)
      if truncated_item ~= item then
        vim_item.abbr = truncated_item .. ELLIPSIS_CHAR
      end
      return vim_item
    end,
  },
  sources = { -- NOTE: the items' order below is the order of items showing in completion menu
    -- { name = "nvim_lsp", priority = 100 },
    { name = "nvim_lsp" },
    { name = "luasnip"},
    { name = "buffer"},
    { name = "path"},
    { name = "look",
      keyword_length = 4, -- num of char needed to trigger auto-completion
      option = {
        convert_case = true, --Convert the candidates to match the input characters in the case.
        loud = true, --Convert the candidates to UPPERCASE if all input characters are uppercase.
        --dict = '/usr/share/dict/words'
      },
    }
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    completion = {
      border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
      winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',
    },
    documentation = cmp.config.window.bordered(),
  },
  expandable_indicator = false, -- show the `~` expandable indicator in the completion menu
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
}

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

