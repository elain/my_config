# my_vim_config

```
/bin/cp ~/.vimrc ~/.vimrc.bak`date +%F`
git clone https://github.com/elain/my_config.git ~/tmp/my_config
/bin/mv ~/tmp/my_config/vim_config/vimrc ~/.vimrc
```

安装bundle
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

打开vim,执行下面命令安装插件
```
PluginInstall
```

安装YouCompleteMe
```
cd ~/.vim/bundle/YouCompleteMe/
python3 install.py
```
