# Modern Vim Configuration

This is a modernized vim configuration using **vim-plug** for plugin management.

## Features

- 🚀 **vim-plug** - Fast, parallel plugin manager (no more git submodules!)
- 🔍 **FZF** - Fuzzy file finder and search
- ✨ **ALE** - Async linting and fixing for multiple languages
- 🎨 **Airline** - Beautiful statusline
- 📂 **NERDTree** - File explorer with icons
- 🌈 Language support: Python, Rust, YAML, JSON, Markdown, LaTeX

## Quick Setup

### New Installation

```bash
cd ~
git clone https://github.com/YOUR_USERNAME/dotvim.git /Users/marcin.cylke/dotvim
ln -s /Users/marcin.cylke/dotvim ~/.vim
ln -s ~/.vim/vimrc.modern ~/.vimrc

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Open vim and install plugins
vim +PlugInstall +qall
```

### Migrating from Old Setup

If you're upgrading from the old Pathogen-based configuration:

```bash
cd /Users/marcin.cylke/dotvim
./migrate.sh
```

Or follow the detailed guide in [MIGRATION_GUIDE.md](MIGRATION_GUIDE.md).

## Plugin Management

### Add a New Plugin

Edit [vimrc.modern](vimrc.modern) and add to the plugin section:
```vim
Plug 'author/plugin-name'
```

Then in vim:
```vim
:PlugInstall
```

### Update Plugins

```vim
:PlugUpdate
```

### Remove a Plugin

Comment out or remove the `Plug` line in vimrc.modern, then:
```vim
:PlugClean
```

### List Plugins

```vim
:PlugStatus
```

## External Dependencies (Optional but Recommended)

### Python Development
```bash
pip install flake8 black isort pylint mypy
```

### Rust Development
```bash
rustup component add rustfmt clippy
```

### Enhanced Search
```bash
brew install fzf ripgrep  # macOS
# or
apt install fzf ripgrep  # Linux
```

## Key Mappings

- `Ctrl+n` - Toggle NERDTree file explorer
- `Ctrl+p` - Fuzzy find files (FZF)
- `Ctrl+f` - Search in files (requires ripgrep)
- `Ctrl+b` - Switch buffers
- `,f` - Auto-fix code with ALE
- `jj` - Quick escape from insert mode
- `,<space>` - Clear search highlighting

## Fonts

For proper display of icons and powerline symbols, install a Nerd Font:

```bash
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```

Then configure your terminal to use "Hack Nerd Font".

More fonts: https://github.com/ryanoasis/nerd-fonts

## Configuration Files

- **vimrc.modern** - Main vim configuration (active)
- **vimrc** - Old Pathogen-based config (legacy)
- **README.md** - This file
- **MIGRATION_GUIDE.md** - Detailed migration instructions
- **QUICK_REFERENCE.md** - Quick reference for key bindings and commands
- **migrate.sh** - Automated migration script

## Troubleshooting

See [MIGRATION_GUIDE.md](MIGRATION_GUIDE.md) for detailed troubleshooting steps.

## Resources

- [vim-plug documentation](https://github.com/junegunn/vim-plug)
- [ALE documentation](https://github.com/dense-analysis/ale)
- [FZF.vim documentation](https://github.com/junegunn/fzf.vim)
