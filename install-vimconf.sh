#!/bin/sh
if [ ! -x "$(command -v curl)" ]; then
    echo "Install curl first!"
    exit 1
fi

if [ ! -x "$(command -v git)" ]; then
    echo "Install git first!"
    exit 1
fi

instplugins() {
    $($1 +PlugInstall! +qa > /dev/null 2>&1)
}

echo "Installing plugins..."
if [ -x "$(command -v vim)" ]; then
    echo " vim - generate .vimrc"
    echo 'source ~/.dotfiles/init.vim' > $HOME/.vimrc
    echo " vim - plugin manager"
    $(curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > /dev/null 2>&1)
    echo " vim - plugins"
    instplugins vim
    echo " vim - done"
fi
