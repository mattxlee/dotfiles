#!/bin/bash
cd "$(dirname "$0")" || exit 1

if ! command -v git >/dev/null 2>&1; then
    echo "command 'git' cannot be found, you need to install it."
fi

if [ ! -d "$HOME/.config" ]; then
    mkdir -p "$HOME/.config"
fi

if [ ! -e "$HOME/.config/kitty" ] && [ ! -L "$HOME/.config/kitty" ]; then
    ln -s "$PWD/kitty" "$HOME/.config/kitty"
    echo "Kitty config linked"
else
    echo "Kitty config exists"
fi

source ./utils.sh

linkfile .clang-format .clang-format
linkfile .clang-tidy .clang-tidy
linkfile .editorconfig .editorconfig
linkfile .gitconfig .gitconfig
linkfile .gitignore_global .gitignore_global
linkfile .tmux.conf .tmux.conf
