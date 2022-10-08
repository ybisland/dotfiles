local navic = require("nvim-navic")


navic.setup({ -- default
  icons = {
    File = ' ',
    Module = ' ',
    Namespace = ' ',
    Package = ' ',
    Class = ' ',
    Method = ' ',
    Function = ' ',
    Constructor = ' ',
    Property = ' ',
    Field = ' ',
    Enum = ' ',
    Interface = ' ',
    Variable = ' ',
    Constant = ' ',
    String = ' ',
    Number = ' ',
    Boolean = ' ',
    Array = ' ',
    Object = ' ',
    Key = ' ',
    Null = ' ',
    EnumMember = ' ',
    Struct = ' ',
    Event = ' ',
    Operator = ' ',
    TypeParameter = ' '
  },
  highlight = true,
  separator = " > ",
  depth_limit = 0,
  depth_limit_indicator = "..",
})

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
-- TODO:
vim.api.nvim_set_hl(0, "NavicIconsFile",          {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsModule",        {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsNamespace",     {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsPackage",       {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsClass",         {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsMethod",        {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsProperty",      {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsField",         {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsConstructor",   {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsEnum",          {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsInterface",     {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsFunction",      {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsVariable",      {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsConstant",      {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsString",        {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsNumber",        {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsBoolean",       {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsArray",         {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsObject",        {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsKey",           {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsNull",          {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsEnumMember",    {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsStruct",        {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsEvent",         {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsOperator",      {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicText",               {default = true, fg = "#ffffff"})
vim.api.nvim_set_hl(0, "NavicSeparator",          {default = true, fg = "#ffffff"})
