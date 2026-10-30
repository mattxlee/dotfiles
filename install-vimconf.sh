#!/bin/bash
cd "$(dirname "$0")" || exit 1

if ! command -v curl >/dev/null 2>&1; then
    echo "Install curl first!"
    exit 1
fi

if ! command -v git >/dev/null 2>&1; then
    echo "Install git first!"
    exit 1
fi

if ! command -v vim >/dev/null 2>&1; then
    echo "Install vim first!"
    exit 1
fi

source ./utils.sh

echo " vim - link .vimrc"
linkfile init.vim .vimrc

echo " vim - plugin manager"
curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo " vim - plugins"
vim +PlugInstall +qa >/dev/null 2>&1
echo " vim - done"
