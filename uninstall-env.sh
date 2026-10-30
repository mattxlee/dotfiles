#!/bin/bash
cd "$(dirname "$0")" || exit 1

source ./utils.sh

rmlink "$HOME/.clang-format"
rmlink "$HOME/.clang-tidy"
rmlink "$HOME/.editorconfig"
rmlink "$HOME/.gitconfig"
rmlink "$HOME/.gitignore_global"
rmlink "$HOME/.tmux.conf"
rmlink "$HOME/.config/kitty"
