
配置文件位置和插件位置

cp ./tmux.conf ~/.tmux.conf

unzip -q ./tmux-plugins.zip -d ./tmux

tmux 开启了真色，需要手动设置一下tmux的$TERM变量，使其与Shell的$TERM相同。

## installation

ln -s ~/.tmux.conf ~/dotfiles/tmux/tmux.conf
ln -s ~/.tmux ~/dotfiles/tmux/tmux.plugins
