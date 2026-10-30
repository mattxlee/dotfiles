#!/bin/bash
cd "$(dirname "$0")" || exit 1

source ./utils.sh

rmlink "$HOME/.vimrc"
# also remove .vimrc created as a plain file by older install scripts
rm -f "$HOME/.vimrc"
rmpath "$HOME/.vim"
