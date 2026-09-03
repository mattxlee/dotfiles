# Dotfiles

Personal configuration files and setup scripts for my development environment. All configs are managed as symlinks so updates are instantly reflected in `$HOME`.

## Contents

- **Shell** – `.zshrc` (Oh My Zsh) with autosuggestions and syntax highlighting plugins.
- **Neovim** – Lazy.nvim-driven setup: LSP, Copilot, fugitive/gitsigns (git), fzf-lua, oil, barbar, lualine, autopairs, surround, trim, wrappers, themes and more (`nvim/`).
- **Kitty** – terminal config with a themed color scheme (`kitty/`).
- **Editor / tooling defaults** – `.clang-format`, `.clang-tidy`, `.editorconfig`, `.gitconfig`, `.gitignore_global`, `.tmux.conf`.

## Requirements

- `git`
- `fzf` (for shell plugins)
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
| `install-neoconf.sh` | `nvim/` → `~/.config/nvim` |
| `install-zsh.sh` | `.zshrc` + clones zsh-autosuggestions and zsh-syntax-highlighting |

For example:

```bash
./install-env.sh
./install-neoconf.sh
./install-zsh.sh
```

## Uninstall

Corresponding `uninstall-*.sh` scripts remove the symlinks they created:

```bash
./uninstall-env.sh      # remove env/kitty links
./uninstall-neoconf.sh  # remove nvim link + shell plugin dirs
./uninstall-zsh.sh      # remove .zshrc link + shell plugin dirs
```

## License

MIT
