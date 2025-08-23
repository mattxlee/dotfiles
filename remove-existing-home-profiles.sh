#!/bin/sh
./install.sh | awk '{print $1}' | grep ^\\. | xargs -I {} rm $HOME/{}
