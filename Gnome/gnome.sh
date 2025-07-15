# NOTE: Commands work if the extensions are installed beforehand
echo "Setting up Gnome..."
cd ~/Get_Started_Anywhere
dconf load /org/gnome/shell/extensions/ <gnome_config.conf
# Keybindings did not work
# dconf load / <gnome_keybindings.conf
dconf load /org/gnome/desktop/interface/ <gnome_extra_settings.conf
cd ~

# Theme, Icons and Cursor
echo "Installing theme, icons and cursor..."
mkdir -p ~/.config/gtk-3.0
mkdir -p ~/.config/gtk-4.0
mkdir -p ~/.themes
mkdir -p ~/.icons

echo "Done, have fun!"
