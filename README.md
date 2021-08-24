# Linux workspace (debian based distros - 2021)
This is the greatest management of all time.
## Setup
```bash
sudo apt update;
sudo apt upgrade -y;
sudo apt install git stow;

git clone https://github.com/AguilarLagunasArturo/linux-workspace.git;
cd linux-workspace;
# rm README.md; TODO: test and resolve conflicts

stow -Svt ~ *;
```

## List of content
- scripts
- shortcuts
- tutorials

# System configuration
Optional system configurations (*manual*).
## Shortcuts
|Shortcut|Description|Command|
|:-|:-|:-|
|TODO|TODO|TODO|
## Tutorials
### Stow commands
```bash
stow --adopt --nvt ~ <stow-folder>; # Adds new config files to stow directory
stow --nSvt ~ <stow-folder>;        # Symlink config files to $HOME directory
stow --nDvt ~ <stow-folder>;        # Removes symlinks from $HOME directory
```
### Install language support
```bash
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
