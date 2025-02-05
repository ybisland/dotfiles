#   Modify Date    :  2022 05 12
#   File Location  :  ~/.config/fish/config.fish
#   Revision :  
#   2024 08 05, add config item `show_username/hostname` (not finished)
#   2024 09 02, add abbr `cat batcat`



# input mode
fish_default_key_bindings # fish_vi_key_bindings

# canel greeting
set fish_greeting 


# PATH
# set -x PATH /new/path1/ /new/path2/ $PATH
#set -x PATH ~/.local/share/nvim/lsp_servers/clangd/clangd/bin/ $PATH
#set -x PATH /home/bynn/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin $PATH
set -x PATH /home/bynn/.local/bin $PATH

# set neovim as default editor
#set -x EDITOR /usr/bin/nvim

# TODO
# comment out to hide username or hostname.
#set -g show_username
#set -g show_hostname


# 检测软件是否已经安装
if [ -z (fzf --version) ]  # -z 判断字符串长度是否为0
    echo "fzf is not installed."
else
    fzf --fish | source
end



# alias
alias l "ls -alh"
alias la "ls -a"
# alias vi "nvim"  # TODO: use abbr not alias
alias j "jobs"
abbr - "cd -"

abbr rm "trash"

switch (uname)
case Linux
    abbr tl "trash-list"
    abbr tr "trash-restore"
    abbr te "trash-empty"
    abbr trm "trash-rm"
# alias rm "echo -e 'Can not use the command: `rm`, may be you will need: trash'"
case Darwin
    abbr tl "trash -l"
    abbr tr "trash -r"
    abbr te "trash -e"
case FreeBSD NetBSD DragonFly
    echo Hi Beastie!
case '*'
    echo Hi, stranger!
end

# git
abbr gs "git status"
abbr ga "git add"
abbr gc "git commit -m \""
abbr gp "git push -u origin master"
abbr g "git"
# tmux
abbr tm "tmux"
abbr tma "tmux attach-session"
abbr tml "tmux list-session"
abbr tmn "tmux new"
abbr tmns "tmux new -s"
# ranger
abbr ra "ranger"
abbr rg "ranger"
# lazygit
abbr lg "lazygit"
# batcat
abbr cat "batcat"
abbr fd "fdfind"


abbr rmswap "trash ~/.local/share/nvim/swap/"
abbr fu "fuck"
abbr trl "tree -L"
abbr tr2 "tree -L 2"
abbr tr3 "tree -L 3"
abbr sour "source ~/.config/fish/config.fish"
abbr vimrc "vi ~/.config/nvim/init.vim"
abbr viconf "vi ~/.config/fish/config.fish"

thefuck --alias | source
