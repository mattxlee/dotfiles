#!/bin/bash

rmpath() {
    if [ -d $1 ]; then
        echo "removing dir $1"
        rm -rf $1
    fi
}

rmlink () {
    if [ -L $1 ]; then
        echo "removing link $1"
        rm -rf $1
    fi
}

rmpath ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
rmpath ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

rmlink $HOME/.zshrc
