# Vim Configuration Migration Guide

## Overview
This guide helps you migrate from Pathogen to vim-plug with modernized plugins.

## What Changed

### Package Manager
- **Old:** Pathogen with git submodules
- **New:** vim-plug (auto-installs plugins, easier to manage)

### Removed Plugins (Outdated/Not Needed)
- ❌ `syntastic` → Replaced with **ALE** (async, modern)
- ❌ `pyflakes-vim` → Covered by ALE
- ❌ `vim-scala` → Not needed
- ❌ `vim-fireplace` → Clojure support (not needed)
- ❌ `vim-sexp*` → S-expression plugins (not needed)
- ❌ `rainbow_parentheses` → Old implementation
- ❌ `tabline.vim` → Redundant with airline

### Kept Plugins (Still Excellent)
- ✅ `vim-fugitive` → Best Git integration
- ✅ `vim-airline` → Popular statusline
- ✅ `rust.vim` → Rust support
- ✅ `vim-markdown` → Markdown support
- ✅ `ultisnips` → Snippet engine
- ✅ `nerdtree` → File explorer
- ✅ `nerdcommenter` → Commenting tool
- ✅ `vim-devicons` → File icons
- ✅ `vimtex` → LaTeX support

### New Plugins Added
- ➕ **ALE** → Modern async linting/fixing for all languages
- ➕ **vim-polyglot** → Language pack (Python, Rust, YAML, JSON, Markdown, etc.)
- ➕ **fzf.vim** → Fuzzy finder (fast file/buffer search)
- ➕ **vim-surround** → Text object manipulation
- ➕ **auto-pairs** → Auto-close brackets
- ➕ **vim-snippets** → Snippet collection

## Migration Steps

### 1. Backup Current Configuration
```bash
# Backup any existing ~/.vim or ~/.vimrc
cd ~/
[ -e .vim ] && mv .vim .vim.backup.old
[ -e .vimrc ] && mv .vimrc .vimrc.backup.old
```

### 2. Create Symlinks to This Repository
```bash
# Link this directory as ~/.vim
ln -s /Users/marcin.cylke/dotvim ~/.vim

# Link the new config as ~/.vimrc
ln -s ~/.vim/vimrc.modern ~/.vimrc
```

### 3. Install vim-plug
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### 4. Clean Up Old Pathogen Bundles
```bash
cd ~/.vim
# Remove all old bundles (git submodules)
rm -rf bundle/

# Remove pathogen
rm autoload/pathogen.vim

# Optional: Clean up .gitmodules after removing submodules
# You can keep it for history or remove it
git rm .gitmodules
git add -A
git commit -m "Migrate from Pathogen to vim-plug"
```

### 5. Install Plugins with vim-plug
Open vim and run:
```vim
:PlugInstall
```

Wait for all plugins to install. You should see a progress window.

### 6. Install External Dependencies (Optional but Recommended)

#### For Python Support:
```bash
# Install linters and formatters
pip install flake8 pylint mypy black isort
```

#### For Rust Support:
```bash
# Install rustfmt and clippy
rustup component add rustfmt clippy
```

#### For YAML/JSON Support:
```bash
# Install linters (optional)
pip install yamllint
npm install -g jsonlint
```

#### For FZF (Fuzzy Finder):
```bash
# FZF is included in the plugin, but for shell integration:
brew install fzf ripgrep  # macOS
# or
# apt install fzf ripgrep  # Linux
```

#### For Markdown:
```bash
npm install -g markdownlint-cli
```

### 7. Verify Installation
Open vim and check:
```vim
:PlugStatus        " See installed plugins
:ALEInfo           " Check ALE configuration
:checkhealth       " If using Neovim
```

## New Key Mappings

### File Navigation (FZF)
- `Ctrl+p` → Search files
- `Ctrl+b` → Search buffers
- `Ctrl+f` → Search in files (requires ripgrep)

### NERDTree
- `Ctrl+n` → Toggle file explorer (same as before)

### ALE (Linting/Fixing)
- `,f` → Fix code with ALE
- Errors show automatically with `✘` and warnings with `⚠`

### General
- `jj` → Quick escape from insert mode (same as before)
- `,<space>` → Clear search highlighting
- `Ctrl+h/j/k/l` → Navigate between windows

## Configuration Tips

### Enable Auto-Fix on Save
Edit vimrc and change:
```vim
let g:ale_fix_on_save = 1  " Currently set to 0
```

### Disable Plugins You Don't Need
Comment out in the `Plug` section:
```vim
" Plug 'lervag/vimtex'  " Comment out if you don't use LaTeX
```

Then run `:PlugClean` in vim.

### Add More Languages
ALE supports many languages. Check available linters:
```vim
:ALEInfo
```

## Troubleshooting

### Fonts Look Broken (Devicons/Airline)
Install a Nerd Font:
```bash
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```

Then set your terminal to use "Hack Nerd Font".

### ALE Not Working
Check if linters are installed:
```bash
which flake8  # For Python
which rustc   # For Rust
```

### FZF Not Finding Files
Install ripgrep for better performance:
```bash
brew install ripgrep  # macOS
```

### Slow Startup
Disable plugins you don't use:
```vim
:PlugClean
```

## Useful Commands

### vim-plug Commands
- `:PlugInstall` → Install plugins
- `:PlugUpdate` → Update plugins
- `:PlugClean` → Remove unused plugins
- `:PlugStatus` → Check plugin status
- `:PlugDiff` → Review changes from last update

### ALE Commands
- `:ALEFix` → Fix current file (or use `,f`)
- `:ALEInfo` → Show ALE configuration
- `:ALEGoToDefinition` → Jump to definition
- `:ALEHover` → Show documentation

### FZF Commands
- `:Files` → Find files
- `:Buffers` → List buffers
- `:Rg <pattern>` → Search in files
- `:History` → Recent files

## Rolling Back

If you need to go back to the old configuration:
```bash
cd ~/
# Remove symlinks
rm .vim .vimrc

# Restore old config if you backed it up
mv .vim.backup.old .vim
mv .vimrc.backup.old .vimrc

# Or revert to the old vimrc in the repo
ln -s /Users/marcin.cylke/dotvim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc  # Use old vimrc instead
```

## Quick Migration Script

Here's a one-liner to do the entire migration:
```bash
# Backup, link, install vim-plug, and clean up
cd ~ && \
[ -e .vim ] && mv .vim .vim.backup.old; \
[ -e .vimrc ] && mv .vimrc .vimrc.backup.old; \
ln -s /Users/marcin.cylke/dotvim ~/.vim && \
ln -s ~/.vim/vimrc.modern ~/.vimrc && \
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
echo "Done! Now open vim and run :PlugInstall"
```

## Next Steps

1. ✅ Try opening vim and run `:PlugInstall`
2. ✅ Install recommended external tools (flake8, rustfmt, etc.)
3. ✅ Clean up old bundle/ directory and commit changes
4. ✅ Customize the config to your preferences
5. ✅ Read `:help ale` and `:help fzf` for more features

Enjoy your modernized vim setup!
