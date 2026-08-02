#!/bin/bash

if [[ "$(uname -m)" = "x86_64" ]]; then
    url="https://github.com/neovim/neovim/releases/download/v0.11.6/nvim-linux-x86_64.appimage"
else
    url="https://github.com/neovim/neovim/releases/download/v0.11.6/nvim-linux-arm64.appimage"
fi
deletar=false

while getopts "l:d" opt; do
	case $opt in
		l) url="$OPTARG" ;;
		d) deletar=true ;;
	esac
done

if [ "$deletar"=true ]; then
	rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim && rm -rf ~/.cache/nvim
	rm -rf ~/.local/share/nvim/site/pack/packer/start/* && rm -rf ~/.local/share/nvim/site/pack/packer/opt/*
	rm -rf ~/apps/nvim
fi

mkdir -p ~/apps/nvim && cd ~/apps/nvim
aria2c -x 16 -s 16 "$url"

chmod +x nvim*.appimage
sudo ln -sf ~/apps/nvim/nvim*.appimage /usr/bin/nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

rm -rf ~/.config/nvim
ln -s ~/repos/dotfiles/nvim ~/.config/
cd ~/repos/dotfiles/nvim
