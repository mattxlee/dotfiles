#!/bin/bash
if [ ! -x $(command -v git) ]; then
    echo "command `git` cannot be found, you need to install it."
fi

linkfile() {
    if [ -L "$HOME/$2" ] || [ -f "$HOME/$2" ]; then
        echo "$1 exists"
    else
        ln -s $PWD/$1 $HOME/$2
        echo "linked $1"
    fi
}

if [ ! -d "$HOME/.config/kitty" ]; then
    ln -s $PWD/kitty $HOME/.config/kitty
    echo "Kitty config linked"
else
    echo "Kitty config exists"
fi

linkfile .clang-format .clang-format
linkfile .clang-tidy .clang-tidy
linkfile .editorconfig .editorconfig
linkfile .gitconfig .gitconfig
linkfile .gitignore_global .gitignore_global
linkfile .tmux.conf .tmux.conf
