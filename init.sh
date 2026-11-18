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

if ! command -v unzip &> /dev/null; then
    echo "Error: unzip is not installed. Please install unzip first."
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

bash ~/Repos/personal/dotfiles/install.sh

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
vim -c 'PlugInstall | quitall'

# Install pixi (idempotent - the script checks if already installed)
# The binary is added to the $PATH in .bashrc.d/pixi so we
# disable the installer adding it to .bashrc
export PIXI_NO_PATH_UPDATE=1
curl -fsSL https://pixi.sh/install.sh | bash

"$HOME/.pixi/bin/pixi" global sync

# Install Monaspace fonts
FONT_DIR="${HOME}/.local/share/fonts/monaspace"
if grep -qi microsoft /proc/version 2>/dev/null; then
    # Running under WSL — install into Windows user font directory
    FONT_DIR="$(wslpath "$(cmd.exe /c 'echo %LOCALAPPDATA%' 2>/dev/null | tr -d '\r')")/Microsoft/Windows/Fonts"
else
    FONT_DIR="${HOME}/.local/share/fonts/monaspace"
fi
MONASPACE_API="https://api.github.com/repos/githubnext/monaspace/releases/latest"

echo "Fetching latest Monaspace release..."
DOWNLOAD_URL=$(curl -fsSL "$MONASPACE_API" \
    | grep "browser_download_url" \
    | grep -i "\.zip" \
    | grep -i "monaspace-static" \
    | head -1 \
    | cut -d '"' -f 4)

if [ -z "$DOWNLOAD_URL" ]; then
    echo "Error: Could not determine Monaspace download URL." >&2
    exit 1
fi

echo "Downloading Monaspace from ${DOWNLOAD_URL}..."
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT
curl -fsSL "$DOWNLOAD_URL" -o "$TMP_DIR/monaspace.zip"
unzip -q "$TMP_DIR/monaspace.zip" -d "$TMP_DIR"

mkdir -p "$FONT_DIR"
find "$TMP_DIR" -name "*.otf" -exec cp {} "$FONT_DIR/" \;
if grep -qi microsoft /proc/version 2>/dev/null; then
    find "$FONT_DIR" -name "*.otf" | while read -r font; do
        fname=$(basename "$font")
        reg.exe add \
            "HKCU\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Fonts" \
            /v "${fname%.otf} (OpenType)" /t REG_SZ /d "$fname" /f > /dev/null
    done
    echo "Fonts registered in Windows registry."
fi

if command -v fc-cache &> /dev/null; then
    fc-cache -f "$FONT_DIR"
    echo "Font cache updated."
fi
echo "Monaspace fonts installed to ${FONT_DIR}."
