### Deprecated!!

2023.5.5

准备搞Windows下的嵌入式开发了，Windows下没有tmux等unix-like常用软件，
所以全面换成VsCode开发了。该仓库封存，若以后换到unix-like环境，再考虑重启该仓库。

若重启，建议使用lunarVim或lazy.nvim项目，而该仓库仅作为一种配置示例。


## trick 1

How to get the filetype in lua in nvim?

filetype is a buffer-local option, use `:lua print(vim.bo.filetype)` to access it.

## trick 2

`luafile %`

执行当前lua文件，用于修改配置时不需要重新进入nvim就可生效，如果无效的话再用退出重进的方法。

## trick 3

`:echo executable()`
return: exist 1,  not exist 0

测试二进制程序是否在path中, eg:
```lua
if vim.api.nvim_call_function("executable", { v }) == 0 then
```

## trick 4

`vim.api.nvim_call_function`

调用vim script function


## nvim 0.7 new freatures: 

**not finished!**

new api:
- vim.keymap instead of nvim.api.nvim_set(del)_keymap
- vim.spell
- notify.once()

print expr `:lua =expr` 


## get filetype of the current window
`:lua =vim.bo.filetype`

## trick 5
`nvim --startuptime output.txt`
will print startuptime of neovim0.8 to the file `output.txt`

## trick 6
First select some chars in visual mode, then `*` and `#` can search the content since neovim0.8
