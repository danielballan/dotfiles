#!/bin/bash
set -e  # Exit on error

# Check that curl and git are installed
if ! command -v curl &> /dev/null; then
    echo "Error: curl is not installed. Please install curl first."
    exit 1
fi

if ! command -v git &> /dev/null; then
    echo "Error: git is not installed. Please install git first."
    exit 1
fi

# Create directory if it doesn't exist
mkdir -p ~/Repos/personal

# Clone dotfiles repo (idempotent - only clone if not already present)
if [ ! -d ~/Repos/personal/dotfiles ]; then
    git clone https://github.com/danielballan/dotfiles ~/Repos/personal/dotfiles
else
    echo "Dotfiles repository already exists, skipping clone."
fi

# Install pixi (idempotent - the script checks if already installed)
# The binary is added to the $PATH in .bashrc.d/pixi so we
# disable the installer adding it to .bashrc
export PIXI_NO_PATH_UPDATE=1
curl -fsSL https://pixi.sh/install.sh | bash

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
vim -c 'PlugInstall | quitall'
