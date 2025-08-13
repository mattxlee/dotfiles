#!/bin/bash
if [[ $(id -u) -ne 0 ]]; then
  echo "root is required"
  exit 1
fi

apt install software-properties-common
add-apt-repository ppa:neovim-ppa/unstable