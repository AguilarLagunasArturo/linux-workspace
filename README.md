# Linux workspace (debian based distros - 2021)
This is the greatest management of all time.
## Setup
```bash
sudo apt update;
sudo apt upgrade -y;
sudo apt install git stow;

mkdir Github;
git clone 'dotfiles';
```

## List of content
- scripts
- shortcuts
- tutorials

# System configuration
These are the greatest config files of all time.
## Theming
- __config__ `($HOME/.config)`  
    Customised settings for various programs.
- __icons__`($HOME/.icons)`  
    Cursor themes.
- __fonts__ `($HOME/.local/share/fonts)`  
    Some fonts I like.
- __dotfiles__ `($HOME)`  
    Customised settings for system utilities.
## Shortcuts
|Shortcut|Description|Command|
|:-|:-|:-|
|TODO|TODO|TODO|
## Tutorials
### Install language support
```
sudo nano /etc/locale.gen;  # Uncomment lines
sudo locale-gen;            # Install uncommented languages
```
### Install snap
```bash
sudo apt update;
sudo apt install -y snapd;
sudo systemctl enable --now snapd apparmor;
```
### Cache Github credentials
```bash
git config --global credential.helper 'cache --timeout 1200'
```
### Chage sound effects
```bash
# TODO
```
### Create custom menus
```bash
# TODO
```
