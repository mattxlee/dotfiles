#!/bin/bash

rmlink () {
    if [ -L $1 ]; then
        echo "removing link $1"
        rm -rf $1
    fi
}

rmlink $HOME/.clang-format
rmlink $HOME/.clang-tidy
rmlink $HOME/.editorconfig
rmlink $HOME/.gitconfig
rmlink $HOME/.gitignore_global
rmlink $HOME/.tmux.conf
