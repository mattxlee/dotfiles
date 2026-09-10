linkfile() {
    if [ -L "$HOME/$2" ] || [ -f "$HOME/$2" ]; then
        echo "$1 exists"
    else
        ln -s $PWD/$1 $HOME/$2
        echo "linked $1"
    fi
}

clone_plugin() {
    SOURCE_URL=$1
    DEST_DIR=$2
    if [ ! -d $DEST_DIR ]; then
        git clone $SOURCE_URL $DEST_DIR
    fi
}

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
