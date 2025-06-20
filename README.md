# Get Started Anywhere

Scripts to setup a newly installed Linux device to exactly what I need.

At the moment only for Fedora with Gnome, more will be added when I need it.

## Prerequisites
- Install Git
- Make a SSH key and add it to Github

## How to use
- Clone the repo
- chmod the script file you need
- Run it
- Set zsh as the default shell

### Editing
To configure Gnome use:
- For extensions:
```sh
dconf dump /org/gnome/shell/extensions/ > gnome_config.conf
```
- For keybindings:
```sh
dconf dump /org/gnome/desktop/wm/keybindings/ > gnome-keybindings.conf\
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ >> gnome-keybindings.conf\
dconf dump /org/gnome/shell/keybindings/ >> gnome-keybindings.conf\
dconf dump /org/gnome/mutter/keybindings/ >> gnome-keybindings.conf
```
