#!/usr/bin/env bash
set -euo pipefail

# commondot bootstrap -- Phase 1
# Installs core tools and clones the repo.
# Phase 2 is handled by Claude Code (see AGENTS.md).

echo "commondot bootstrap -- Phase 1"
echo ""

# --- Platform detection ---
OS="$(uname -s)"
case "$OS" in
    Darwin) PLATFORM="macos" ;;
    Linux)
        if grep -qi microsoft /proc/version 2>/dev/null; then
            PLATFORM="wsl"
        else
            PLATFORM="linux"
        fi
        ;;
    *) echo "Unsupported platform: $OS"; exit 1 ;;
esac
echo "Platform: $PLATFORM"

# --- Homebrew ---
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [[ "$PLATFORM" == "macos" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi
else
    echo "Homebrew already installed"
fi

# --- Formulae ---
echo "Installing formulae..."
brew install git neovim starship zsh-autosuggestions zsh-syntax-highlighting topgrade fzf

# --- Casks (macOS only) ---
if [[ "$PLATFORM" == "macos" ]]; then
    echo "Installing casks..."
    brew install --cask font-hack-nerd-font
    if ! command -v claude &>/dev/null; then
        brew install --cask claude-code
    fi
fi

# --- Oh My Zsh ---
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh already installed"
fi

# --- Clone commondot ---
REPO_DIR="$HOME/Development/commondot"
if [[ ! -d "$REPO_DIR" ]]; then
    echo "Cloning commondot..."
    mkdir -p "$HOME/Development"
    git clone git@github.com:mpawliszyn/commondot.git "$REPO_DIR"
else
    echo "commondot already cloned at $REPO_DIR"
fi

# --- SSH sockets directory ---
mkdir -p "$HOME/.ssh/sockets"

# --- Done ---
echo ""
echo "Phase 1 complete!"
echo ""
echo "Next: cd $REPO_DIR && claude"
echo ""
echo "Claude Code will handle Phase 2: review machine state,"
echo "present a plan, and set up symlinks with your confirmation."
