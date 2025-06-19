#!/bin/bash

# Make sure the starting point is the home dir
cd ~

# Install JetBrainsMono Nerd Font
echo "Installing JetBrainsMono..."
curl -O https://github.coprom/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
mkdir -p .fonts
unzip JetBrainsMono.zip -d ~/.fonts/
rm JetBrainsMono.zip
fc-cache -f

# Enable RPM Fusion
echo "Enabling RPM Fusion..."
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install Brave Browser
echo "Installing the Browser..."
curl -fsS https://dl.brave.com/install.sh | sh

# RPM Packages
dnf copr enable pgdev/ghostty
rpm_packages=(
    go
    python3
    pip
    indent
    neovim
    fd
    fzf
    ripgrep
    ghostty
    stow
    zsh
    gnome-tweaks
    fragments
)
flatpak_packages=(
    com.usebottles.bottles
    com.mattjakeman.ExtensionManager
    com.github.tchx84.Flatseal
)

echo "Installing packages..."
for package in "${rpm_packages[@]}"; do
    sudo dnf install -y "${package}"
done
for package in "${flatpak_packages[@]}"; do
    flatpak install -y flathub "${package}"
done

# Clone Neovim config
echo "Setting up Neovim..."
mkdir -p .config/nvim
cd .config
git clone git@github.com:VladanT3/neovim_config.git nvim
cd nvim
git switch lazynvim
cd ~

# Clone dotfiles repo
echo "Setting up dotfiles..."
git clone git@github.com:VladanT3/dotfiles.git
mkdir -p .config/ghostty
mkdir -p .config/ohmyposh
cd dotfiles
stow .
cd ~

# Gnome customization
echo "Setting up Gnome for cusotmizing"
cd get_started_anywhere
dconf load /org/gnome/shell/extensions/ <"gnome_config.txt"
cd ~
mkdir -p .config/gtk-3.0
mkdir -p .config/gtk-4.0
