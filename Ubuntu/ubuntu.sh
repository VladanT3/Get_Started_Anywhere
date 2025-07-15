#!/bin/bash

# Error handling
set -eo pipefail

# Make sure the starting point is the home dir
cd ~

# Install JetBrainsMono Nerd Font
# NOTE: doesnt work for some reason, the downloaded file isnt good
# echo "Installing JetBrainsMono..."
# curl -O https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
# mkdir -p .fonts
# unzip JetBrainsMono.zip -d ~/.fonts/
# rm JetBrainsMono.zip
# fc-cache -f

# Install Brave Browser
echo "Installing the Browser..."
curl -fsS https://dl.brave.com/install.sh | sh

# Install cargo
curl https://sh.rustup.rs -sSf | sh

# APT Packages
apt_packages=(
    vim
    go
    python3
    pip
    indent
    neovim
    fd-find
    fzf
    ripgrep
    stow
    zsh
    gnome-tweaks
    gtk2-engines-murrine
    sassc
    gnome-themes-extra
    flatpak
    gnome-software-plugin-flatpak
)
flatpak_packages=(
    com.mattjakeman.ExtensionManager
    com.github.tchx84.Flatseal
)

echo "Installing packages..."
for package in "${apt_packages[@]}"; do
    sudo apt install -y "${package}"
done

# Add flathub if needed
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

for package in "${flatpak_packages[@]}"; do
    flatpak install -y flathub "${package}"
done

# Clone Neovim config
echo "Setting up Neovim..."
mkdir -p ~/.config/nvim
git clone git@github.com:VladanT3/neovim_config.git ~/.config/nvim
cd ~/.config/nvim
git switch lazynvim
cd ~

# Install Oh-My-Posh
curl -s https://ohmyposh.dev/install.sh | bash -s

# Clone dotfiles repo
echo "Setting up dotfiles..."
git clone git@github.com:VladanT3/dotfiles.git
mkdir -p ~/.config/ghostty
mkdir -p ~/.config/ohmyposh
cd ~/dotfiles
stow .
cd ~

echo "Done, have fun!"
