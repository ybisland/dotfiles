
" Author          : YinBin
" Date            : 10 Oct 2021
" Encoding format : UTF-8
" Shortcut        :
"   F2 -> NERDtree
"   Tab -> coc completion
"   F5 -> build and run code (vim-runner)
"   F1 -> run code (custom script)

" ============================
" === For neovim (and vim) ===
" ============================
set number "显示行号
set relativenumber "显示相对行号
" 插入模式显示绝对行号，普通模式显示相对行号
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
set cursorline "高亮当前行
set ignorecase "搜索时忽略大小写
set smartcase "搜索中有大写字母时不忽略大小写
set showmatch "显示括号配对，当键入] )时，高亮匹配的括号
set laststatus=2 "总是显示状态栏
"set whichwrap+=<,>,h,l "允许光标跨行
set ruler "右下角显示光标位置
set helplang=cn "帮助语言设置中文
set langmenu=zh_CN.UTF-8
set sidescroll=10 "横向滚动最小列数
set scrolloff=5 "光标离上下界5行时自动滚动
set shiftwidth=4 "每一级缩进的宽度 >> 和 <<
set expandtab "把tab展开成4个空格
set tabstop=4 " 1tab = 4space
set softtabstop=4 "删除缩进时删除4个空格
set mouse=nv "允许使用鼠标
set mousemodel=popup
auto FileType make set noexpandtab
let mapleader= "\<space>" "leader 键
set termguicolors "如果颜色显示错误，就注释掉

" ============================
" == For vim (nvim default) ==
" ============================
"syntax on "语法高亮
"set autoread "文件修改后自动读入
"set noerrorbells visualbell t_vb= "关闭错误提示音
"set nocompatible "去掉对老版本的兼容性,减少bug
"set hlsearch  "高亮搜索
"set incsearch "增量搜索(输入同时搜索
"set showcmd "在状态栏显示正在输入的命令
"set autoindent "代码自动缩进
"set cindent "c代码自动缩进
"
"" ----auto change cursor-----
"let &t_SI.="\e[5 q" "SI = INSERT mode
"let &t_SR.="\e[4 q" "SR = REPLACE mode
"let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
" Cursor number:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar


"---按键映射----
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>j gT
nnoremap <leader>k gt
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap 0 ^
nnoremap <C-w>> <C-w>5>
nnoremap <C-w>< <C-w>5<
"emacs
inoremap <C-d> <Del>
inoremap <C-a> <Esc>I
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
"inoremap jk <ESC>
nnoremap <leader>n :noh<cr>
nnoremap ： :
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap sp set paste
cnoremap sour source ~/.config/nvim/init.vim
cnoremap tn tabnew


"vim打开文件，光标定位到上次退出的位置
if has("autocmd")
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"****************************
" 插件设置
"****************************
"" -----Vim-plug配置----------"
let PluginsLocation = "~/.local/share/nvim/site/plugins"
call plug#begin(PluginsLocation) "vim-plug下载插件的位置
if(has("gui_running"))
    call plug#begin("D:\\Program Files\\Vim\\vim82\\plugged") 
endif
Plug 'mhinz/vim-startify'  "启动页
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
""缩进线
Plug 'Yggdroot/indentLine'
Plug 'aben20807/vim-runner'
Plug 'lifepillar/vim-gruvbox8'
call plug#end()

" gruvbox8 gruvbox8_hard gruvbox8_soft
colorscheme gruvbox8_hard

"====NERDtree====
nnoremap <F2> :NERDTreeToggle<cr>
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let g:NERDTreeGitStatusIndicatorMapCustom= {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"**********************
" gvim设置
"**********************
if(has("gui_running"))
    cd d:/Desktop "启动目录
    set lines=30 columns=100  "窗口大小
    autocmd GUIEnter * simalt ~x "启动时窗口最大化
    set guifont=Consolas::h18 "字体:常规(空) 粗体b 斜体i:字号
    set guioptions-=m    "隐藏顶部菜单栏
    set guioptions-=T    "隐藏顶部工具栏
    set guioptions-=L    "隐藏左侧滚动条
    set guioptions-=l    "隐藏左侧滚动条
    set guioptions-=R    "隐藏右侧滚动条
    set guioptions-=r    "隐藏右侧滚动条
    "---关闭bell提示音---
    set visualbell t_vb= "关闭bell,但用闪屏替代bell
    au GuiEnter * set t_vb= "关闭闪屏
    inoremap <A-h> <Left>
    inoremap <A-j> <Down>
    inoremap <A-k> <Up>
    inoremap <A-l> <Right>

endif

"customsize status line 
function! Buf_total_num()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction
function! File_size(f)
    let l:size = getfsize(expand(a:f))
    if l:size == 0 || l:size == -1 || l:size == -2
        return ''
    endif
    if l:size < 1024
        return l:size.' bytes'
    elseif l:size < 1024*1024
        return printf('%.1f', l:size/1024.0).'kB'
    elseif l:size < 1024*1024*1024
        return printf('%.1f', l:size/1024.0/1024.0) . 'mB'
    else
        return printf('%.1f', l:size/1024.0/1024.0/1024.0) . 'gB'
    endif
endfunction
"set statusline=%<%1*[B-%n]%*
"set statusline+=%2*[TOT:%{Buf_total_num()}]%*  "TOT is an abbreviation for total
set statusline+=%1*\ %F\ %*
set statusline+=%=%4*\ %m%r%y\%* " show file type
" show : unix/dos | utf-8 | row:col
"set statusline+=%5*\ %{&ff}\ \|\ %{\"\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"\ \|\"}\ %-10.(%l:%c%V%)%*
" show : unix/dos | utf-8   "\|\" -> show: |
set statusline+=%5*\ %{&ff}\ \|\ %{\"\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"\\"}\ \|\%*
set statusline+=%6*\ %P\%*
set statusline+=%2*\ \|\ %{File_size(@%)}\ %*
" default bg for statusline is 236 in space-vim-dark
hi User1 cterm=bold ctermfg=232 ctermbg=179
hi User2 cterm=None ctermfg=214 ctermbg=242
hi User3 cterm=None ctermfg=251 ctermbg=240
hi User4 cterm=bold ctermfg=169 ctermbg=239
hi User5 cterm=None ctermfg=208 ctermbg=238
hi User6 cterm=None ctermfg=246 ctermbg=237
hi User7 cterm=None ctermfg=250 ctermbg=238
hi User8 cterm=None ctermfg=249 ctermbg=240


"*****************************
"  brackets auto-completion
"  {} braces; <> angle brackets;
"  () parentheses; [] brackets;
"  ' " quation marks
"*****************************
inoremap <TAB> <c-r>=SkipRightAll()<CR>
inoremap ( ()<ESC>i
inoremap ) <c-r>=SkipRightParentheses()<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=SkipRightBrackets()<CR>
""inoremap << <<
""inoremap < <><ESC>i
""inoremap > <c-r>=SkipRightAngleBrackets()<CR>
inoremap { {}<ESC>i
inoremap {<CR> {<CR>}<ESC>O
inoremap } <c-r>=SkipRightBraces()<CR>

inoremap ' <c-r>=SkipQuotation1()<CR>
inoremap " <c-r>=SkipQuotation2()<CR>

func SkipRightAll()  
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'  
        return "\<ESC>la"  
    else  
        return "\t"  
    endif  
endfunc  
func SkipRightParentheses()
    if getline('.')[col('.') - 1] == ')'
        return "\<ESC>la"
    else
        return ")"
    endif
endfunc
func SkipRightBrackets()
    if getline('.')[col('.') - 1] == ']'
        return "\<ESC>la"
    else
        return "]"
    endif
endfunc
func SkipRightAngleBrackets()
    if getline('.')[col('.') - 1] == '>'
        return "\<ESC>la"
    else
        return ">"
    endif
endfunc
func SkipRightBraces()
    if getline('.')[col('.') - 1] == '}'
        return "\<ESC>la"
    else
        return "}"
    endif
endfunc
func SkipQuotation1()
    if getline('.')[col('.') - 1] == "'"
        return "\<ESC>la"
    else
        return "''\<ESC>i"
    endif
endfunc
func SkipQuotation2()
    if getline('.')[col('.') - 1] == '"'
        return "\<ESC>la"
    else
        return "\"\"\<ESC>i"
    endif
endfunc


"********************************
" auto build/compile/interpret
" shortcut: F1
"********************************
" Get current filetype -> :echo &filetype or as variable &filetype
" C Compiler
autocmd FileType c nnoremap <buffer> <F1> :!gcc % -o %:r.out && ./%:r.out <CR>
" C++ Compiler
autocmd FileType cpp nnoremap <buffer> <F1> :!g++ % -o %:r.out && ./%:r.out <CR>
" Python Interpreter
autocmd FileType python nnoremap <buffer> <F1> :!python % <CR>
" Bash script
autocmd FileType sh nnoremap <buffer> <F1> :!sh % <CR>
" Executable
"nnoremap <buffer> <F1> :!./% <CR>
"nnoremap <buffer> <F1> :! %:p <CR>
" Configs
autocmd FileType vim,zsh,tmux,conf nnoremap <buffer> <F1> :source % <CR>

