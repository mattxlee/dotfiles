#!/bin/bash
cd "$(dirname "$0")" || exit 1

if ! command -v fzf >/dev/null 2>&1; then
    echo "command 'fzf' cannot be found, you need to install it."
fi

source ./utils.sh

ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
clone_plugin https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions"
clone_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting"
linkfile .zshrc .zshrc
