2021.4.17

# 安装配置文件
```
ln -s ~/dotfiles/nvim/ ~/.config/nvim
ln -s ~/dotfiles/fish/ ~/.config/fish
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux/.tmux/ ~/.tmux/
```

# 克隆仓库 
先从网站上创建仓库，然后克隆到本地

git clone /path/to/repository  

后面是仓库地址

# 工作流
本地仓库由三部分组成。
1. working directory: 持有项目的实际文件
2. Index :暂存区，临时保存改动
3. Head : 指向最后一次提交的结果

working dir --(add/rm)--> Index --(commit)--> Head --(push)--> 远程

push之前的操作都是在本地进行的

# 工作步骤

1. 提出更改：(把修改过的文件添加到暂存区)

在修改代码后，可以提出更改,使用以下命令：

git add <filename>

<filename> 可以用`*`表示所有文件.

2. 实际提交更改：让HEAD指向Index

git commit -m "代码提交信息"

这时候改动已经提交到本地仓库的head，但是还没到远程仓库

3. 推送更改: 将更改推送到远程仓库

git push origin master

master可以换成想要的分支

# git删除命令
删除本地以及远程上文件(夹)的步骤：
working dir --(rm)--> Index --(commit)--> Head --(push)--> 远程
git rm <filename>
git rm 可以查看参数：
    -n, --dry-run         dry run
    -q, --quiet           do not list removed files
    --cached              only remove from the index
    -f, --force           override the up-to-date check
    -r                    allow recursive removal
    --ignore-unmatch      exit with a zero status even if nothing matched

# 修改zsh为默认shell
1. 显示存在的bash

`cat /etc/shells`

2. 取代bash，设为默认shell
``` 
chsh -s `which zsh`
```

# vim的配置

neovim的配置文件及插件所在位置：
插件位置:
直接把vim-site.zip解压到`~/.local/share/nvim/site`处就行了.

```
~/.config/nvim/init.vim
~/.local/share/nvim/site/plugins/   # 普通插件
~/.local/share/nvim/site/autoload/  # vim-plug位置
```

包含插件:

# vim-plug 插件管理的使用

https://github.com/junegunn/vim-plug

# tmux配置

  9
配置文件位置：`~/.tmux.conf`

插件位置：`~/.tmux/plugins/`

插件已经打包，解压即可

打包命令：`zip -q -r package.zip folder1 folder2`
解压命令：`unzip package.zip`

# Trash-cli 使用

```
trash-put [filename]： 删除文件和目录（仅放入回收站中）
trash-list ：列出被删除了的文件和目录
trash-restore：从回收站中恢复文件或目录 trash.
trash-rm [fileInTrashList]：删除回收站中的文件
trash-empty：清空回收站
trash-empty [n]：清空回收站中n天以前的文件
```

在Mac下，回收站就是系统回收站，命令格式：
```
trash [filename]
trash -l
trash -e
```

# 需要自己下载的东西

1. zsh : sudo apt install zsh
2. oh-my-zsh : sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
3. neovim : sudo apt install neovim
4. LSP: clangd (如果下载llvm/clang会自带）: sudo apt install clangd
5. trash-cli: sudo apt install trash-cli
6. autojump: sudo apt
7. ranger:sudo apt
8. lazygit: brew / github

# 字体
在`/misc/fonts/`下面有nerd font字体

# ToDos !!!! @20240902
`ln -s /path/to/origin /path/to/destination` must use full path, eg. `ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish`

# Fish最新版下载
支持Ubuntu 16.04 LTS及以后的Ubuntu版本
```bash
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
More info: https://launchpad.net/~fish-shell/+archive/ubuntu/release-3
```

# Tmux最新版下载
> Todo：配置文件应该是基于3.2a的，现在是3.4a，需要更新配置文件. https://github.com/tmux/tmux/wiki


# ranger配置
配置文件位置：
```bash
➜  codetest ranger --copy-config=all
creating: /home/devnew/.config/ranger/rifle.conf
creating: /home/devnew/.config/ranger/commands.py
creating: /home/devnew/.config/ranger/commands_full.py
creating: /home/devnew/.config/ranger/rc.conf
creating: /home/devnew/.config/ranger/scope.sh

> Please note that configuration files may change as ranger evolves.
  It's completely up to you to keep them up to date.

> To stop ranger from loading both the default and your custom rc.conf,
  please set the environment variable RANGER_LOAD_DEFAULT_RC to FALSE.
```

使用ranger --copy-config=all将在~/.config/ranger中生成一系列配置文件

rc.conf 常用于设置选项和绑定快捷键.(最常用)
scope.sh 常用于设置文件的预览方式
rifle.conf 常用于设置使用那个软件来打开文件
commands.py python文件,增强和改进ranger的各种功能


# fzf
从github官方仓库安装fzf，不要使用`sudo apt install fzf`(版本太旧)

https://github.com/junegunn/fzf/releases

使用`fzf --fish | source`让fish加载fzf自带的shell配置。该配置提供三个快捷键：
- Ctrl+r 搜索历史命令（fish本来就带）
- Ctrl+t 在命令行中搜索并放置文件名
- alt+c  切换目录

> PS: 在fish中，Ctrl+t alt+c只能搜索当前路径下面的子文件. 
想搜索指定路径下的文件，先写路径，然后再按Ctrl+t.

# nnn (todo)
依赖安装：
