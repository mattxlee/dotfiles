#!/bin/sh

if [ ! -d "$HOME/.config" ]; then
    mkdir -p $HOME/.config
fi

if [ ! -d "$HOME/.config/nvim" ]; then
    ln -s $PWD/nvim $HOME/.config/nvim
    echo "Neovim config linked"
else
    echo "Neovim config exists"
fi
