#!/bin/bash

if [ ! -x $(command -v fzf) ]; then
    echo "command `fzf` cannot be found, you need to install it."
fi

source ./utils.sh

clone_plugin https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
clone_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
linkfile .zshrc .zshrc
