#!/bin/bash
# Vim Configuration Migration Script
# Migrates from Pathogen to vim-plug

set -e  # Exit on error

echo "=== Vim Configuration Migration ==="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

DOTVIM_DIR="/Users/marcin.cylke/dotvim"

# Check if we're in the right directory
if [ ! -f "$DOTVIM_DIR/vimrc.modern" ]; then
    echo -e "${RED}Error: vimrc.modern not found in $DOTVIM_DIR${NC}"
    exit 1
fi

# Step 1: Backup existing configuration
echo -e "${YELLOW}Step 1: Backing up existing configuration...${NC}"
cd ~

if [ -e ~/.vim ] || [ -L ~/.vim ]; then
    echo "  Backing up ~/.vim -> ~/.vim.backup.old"
    rm -rf ~/.vim.backup.old
    mv ~/.vim ~/.vim.backup.old
fi

if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]; then
    echo "  Backing up ~/.vimrc -> ~/.vimrc.backup.old"
    rm -f ~/.vimrc.backup.old
    mv ~/.vimrc ~/.vimrc.backup.old
fi

# Step 2: Create symlinks
echo -e "${YELLOW}Step 2: Creating symlinks...${NC}"
ln -s "$DOTVIM_DIR" ~/.vim
echo "  Created: ~/.vim -> $DOTVIM_DIR"

ln -s ~/.vim/vimrc.modern ~/.vimrc
echo "  Created: ~/.vimrc -> ~/.vim/vimrc.modern"

# Step 3: Install vim-plug
echo -e "${YELLOW}Step 3: Installing vim-plug...${NC}"
if [ -f ~/.vim/autoload/plug.vim ]; then
    echo "  vim-plug already installed, skipping..."
else
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "  vim-plug installed successfully"
fi

# Step 4: Clean up old bundles
echo -e "${YELLOW}Step 4: Cleaning up old Pathogen bundles...${NC}"
cd "$DOTVIM_DIR"

if [ -d bundle ]; then
    echo "  Found bundle/ directory"
    echo "  This will be removed. Old plugins are in git submodules."
    read -p "  Remove bundle/ directory? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf bundle/
        echo "  Removed bundle/ directory"
    else
        echo "  Skipped removing bundle/"
    fi
fi

if [ -f autoload/pathogen.vim ]; then
    echo "  Removing pathogen.vim..."
    rm autoload/pathogen.vim
fi

# Step 5: Instructions
echo ""
echo -e "${GREEN}=== Migration Complete! ===${NC}"
echo ""
echo "Next steps:"
echo "  1. Open vim and run:  :PlugInstall"
echo "  2. Wait for all plugins to install"
echo "  3. Restart vim"
echo ""
echo "Optional: Install external tools for better support"
echo "  Python:   pip install flake8 black isort"
echo "  Rust:     rustup component add rustfmt clippy"
echo "  Tools:    brew install fzf ripgrep"
echo ""
echo "To clean up git submodules, run:"
echo "  cd $DOTVIM_DIR"
echo "  git rm .gitmodules"
echo "  git add -A"
echo "  git commit -m 'Migrate from Pathogen to vim-plug'"
echo ""
echo -e "See ${GREEN}MIGRATION_GUIDE.md${NC} for more details."
