#!/bin/bash

deletar=false
install=false
alpine=false

while getopts "dia" opt; do
	case $opt in
		d) deletar=true ;;
        i) install=true ;;
        a) alpine=true ;;
	esac
done

if [ "$alpine" = true ]; then
    url=""
else
    if [[ "$(uname -m)" = "x86_64" ]]; then
        url="https://github.com/neovim/neovim/releases/download/v0.11.6/nvim-linux-x86_64.appimage"
    else
        url="https://github.com/neovim/neovim/releases/download/v0.11.6/nvim-linux-arm64.appimage"
    fi
fi

if [ "$deletar" = true ]; then
	rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
	rm -rf ~/.local/share/nvim/lazy
	rm -rf ~/apps/nvim
fi

if [ "$install" = true ]; then
    mkdir -p ~/apps/nvim && cd ~/apps/nvim
    aria2c -x 16 -s 16 "$url"
    chmod +x nvim*.appimage
    if [ "$alpine" = true ]; then
        tar -xzf nvim*.tar.gz
        ln -sf ~/apps/nvim/nvim-linux-x86_64/bin/nvim /usr/bin/nvim
    else
        sudo ln -sf ~/apps/nvim/nvim*.appimage /usr/bin/nvim
    fi
fi

rm -rf ~/.config/nvim
ln -s ~/repos/dotfiles/nvim ~/.config/
cd ~/repos/dotfiles/nvim
