linkfile() {
    local src="$1"
    local dest="$HOME/$2"
    if [ -L "$dest" ] || [ -e "$dest" ]; then
        echo "$2 exists"
    else
        ln -s "$PWD/$src" "$dest"
        echo "linked $src"
    fi
}

clone_plugin() {
    local url="$1"
    local dest="$2"
    if [ ! -d "$dest" ]; then
        git clone "$url" "$dest"
    fi
}

rmpath() {
    if [ -d "$1" ]; then
        echo "removing dir $1"
        rm -rf "$1"
    fi
}

rmlink() {
    if [ -L "$1" ]; then
        echo "removing link $1"
        rm -rf "$1"
    fi
}
