# Dotfiles

Personal configuration files and setup scripts for my development environment. All configs are managed as symlinks so updates are instantly reflected in `$HOME`.

## Contents

- **Shell** – `.zshrc` (Oh My Zsh) with autosuggestions and syntax highlighting plugins.
- **Vim** – `init.vim` driven by vim-plug: git integration, fzf, tags, formatting and more.
- **Tmux** – `.tmux.conf` with omarchy-style keybindings.
- **Kitty** – terminal config with a themed color scheme (`kitty/`).
- **Editor / tooling defaults** – `.clang-format`, `.clang-tidy`, `.editorconfig`, `.gitconfig`, `.gitignore_global`.

## Requirements

- `git`
- `fzf` (for shell plugins and Vim)
- `vim` and `curl` (for vim-plug)
- [Oh My Zsh](https://ohmyz.sh/) for `.zshrc`
- [Kitty](https://sw.kovidgoyal.net/kitty/) terminal

## Installation

Clone the repository:

```bash
git clone https://github.com/mattxlee/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Configs are split into separate install scripts, each idempotent (existing files are left untouched):

| Script | What it links |
| --- | --- |
| `install-env.sh` | `.clang-format`, `.clang-tidy`, `.editorconfig`, `.gitconfig`, `.gitignore_global`, `.tmux.conf`, `kitty/` |
| `install-vimconf.sh` | `init.vim` → `~/.vimrc` + installs vim-plug and plugins |
| `install-zsh.sh` | `.zshrc` + clones zsh-autosuggestions and zsh-syntax-highlighting |

For example:

```bash
./install-env.sh
./install-vimconf.sh
./install-zsh.sh
```

## Uninstall

Corresponding `uninstall-*.sh` scripts remove the symlinks they created:

```bash
./uninstall-env.sh      # remove env/kitty links
./uninstall-vimconf.sh  # remove .vimrc link and ~/.vim
./uninstall-zsh.sh      # remove .zshrc link + shell plugin dirs
```

## License

MIT
