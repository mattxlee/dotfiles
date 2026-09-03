#!/bin/bash

clone_plugin() {
    SOURCE_URL=$1
    DEST_DIR=$2
    if [ ! -d $DEST_DIR ]; then
        git clone $SOURCE_URL $DEST_DIR
    fi
}

if [ ! -x $(command -v fzf) ]; then
    echo "command `fzf` cannot be found, you need to install it."
fi

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

linkfile .zshrc .zshrc
