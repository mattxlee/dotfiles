#!/bin/bash
cd "$(dirname "$0")" || exit 1

source ./utils.sh

ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
rmpath "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions"
rmpath "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting"

rmlink "$HOME/.zshrc"
