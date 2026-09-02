#!/bin/bash


cd ..
git clone git@github.com:Varani07/kazer.git
rm ~/.bashrc && ln -s ~/repos/dotfiles/.bashrc ~/
ln -s ~/repos/dotfiles/.bash_aliases ~/
source ~/.bashrc
ln -s ~/repos/dotfiles/nvim ~/.config/nvim
cd ~/repos/dotfiles && actadd various && cd nvim && actadd lua
cd ~/repos/kazer && actadd odin && cd ~
sudo ln -sf ~/repos/dotfiles/prime-run /usr/local/bin/prime-run
mkdir -p ~/.config/kitty
ln -s ~/repos/dotfiles/kitty/kitty.conf ~/.config/kitty/
