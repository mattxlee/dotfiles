#!/bin/bash
if [ ! -x $(command -v fzf) ]; then
    echo "command `fzf` cannot be found, you need to install it."
fi

if [ ! -x $(command -v git) ]; then
    echo "command `git` cannot be found, you need to install it."
fi

clone_plugin() {
    SOURCE_URL=$1
    DEST_DIR=$2
    if [ ! -d $DEST_DIR ]; then
        git clone $SOURCE_URL $DEST_DIR
    fi
}

clone_plugin https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
clone_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

linkfile() {
    if [ -L "$HOME/$2" ] || [ -f "$HOME/$2" ]; then
        echo "$1 exists"
    else
        ln -s $PWD/$1 $HOME/$2
        echo "linked $1"
    fi
}

linkfile .clang-format .clang-format
linkfile .clang-tidy .clang-tidy
linkfile .editorconfig .editorconfig
linkfile .gitconfig .gitconfig
linkfile .gitignore_global .gitignore_global
linkfile .zshrc .zshrc
linkfile .tmux.conf .tmux.conf

if [ ! -d "$HOME/.config" ]; then
    mkdir -p $HOME/.config
fi

if [ ! -d "$HOME/.config/nvim" ]; then
    ln -s $PWD/nvim $HOME/.config/nvim
    echo "Neovim config linked"
else
    echo "Neovim config exists"
fi