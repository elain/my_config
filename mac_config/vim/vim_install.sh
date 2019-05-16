#!/bin/bash

#Installation
#Backup your old vim configuration files:
mv ~/.vim ~/.vim.orig
mv ~/.vimrc ~/.vimrc.orig

#Clone and install this repo:
git clone git://github.com/humiaozuzu/dot-vimrc.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

#Setup Vundle:
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle


#Install bundles. 
echo "------------------------------------------ "
echo "Launch vim(ignore the errors and they will disappear after installing needed plugins)and run:
#####################
# :BundleInstall    #
#####################
"
