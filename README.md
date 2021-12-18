# Linux workspace (debian based distros - 2021)
This is the greatest management of all time.
## Screenshots
|Preview|
|:-|
|![Desktop](home/.homemade/assets/screenshots/preview.png)|
|![Desktop](home/.homemade/assets/screenshots/preview.gif)|

## Setup
```bash
# Update and install dependencies
sudo apt update
sudo apt upgrade -y
sudo apt install git stow jq

# Clone repo
cd ~
mkdir -p Github
cd Github
git clone https://github.com/AguilarLagunasArturo/linux-workspace.git

# Change directory and remove unneeded files
cd linux-workspace
rm README.md .gitignore

# Install main packages (basic dependencies)
bash home/.homemade/bin/management/install-main-apt-packages

# Create symlinks in the system and restore deleted files
stow --adopt -Svt ~ *
git checkout .

# Add settings to zshrc (optional)
echo "source ~/.rc_config &>/dev/null" >> ~/.zshrc

# Set default shell and terminal emulator (optional)
chsh
sudo update-alternatives --config x-terminal-emulator

# Reboot into an i3 session
systemctl reboot
```
## Troubleshooting
If your distribution does not packages `i3-gaps` (check by running `sudo apt policy i3-gaps`) you can either:
1. Install [i3-gaps](https://github.com/Airblader/i3) from source.
2. Install [i3](https://i3wm.org/) (without gaps) and remove the gaps settings from the config file.
    - `sudo apt install i3-wm i3status`
    - `cat ~/.config/i3/config-no-gaps.bak > ~/.config/i3/config`

Once in an i3 `super+enter` to open a terminal, see the shortcuts in [~/.config/i3/config](i3/.config/i3/config) config file.
## Notes
1. [home/.homemade](home/.homemade) is a directory for my custom resources, scrips, etc.
2. Some scrips from [home/.homemade/bin](home/.homemade/bin) might not work properly.

# System configuration
|Utility|Name|
|:-|:-|
|Desktop enviroment|`gnome`|
|Window manager|`i3-gaps`|
|Login screen|`sddm`, `sugar-candy`|
|Bar|`i3bar`, `i3status`|
|Compositor|`picom`|
|Launcher|`rofi`|
|Terminal|`kitty`, `urxvt`|
|Notifications|`dunst`, `notify-send`|

## Stuff I have to do manually
- Install third party software
- Set up grub2 theme
- Set default terminal and shell
    - Set up powerlevel10k for zsh
- Set up sddm theme
- Set up crontab
    - Twitter bot

## Tutorials
### Usefull stow commands
```bash
stow --adopt --nvt ~ <stow-folder> # Adds new config files to stow directory
stow --nSvt ~ <stow-folder>        # Symlink config files to $HOME directory
stow --nDvt ~ <stow-folder>        # Removes symlinks from $HOME directory
```
### Read manpages
```bash
# Case: 0
man <program-name>
# Case: 1
man -P "less -p 'CONFIGURATION SETTINGS'" <program-name>
```
### Load Xresources
```bash
xrdb ~/.Xresources
```
### Set default applications
```bash
# fetch the default mimetype from file
xdg-mime query filetype <file.ext>

# fetch the default application from mimetype
xdg-mime query default <mimetype>

# set default application for a mimetype
xdg-mime default </usr/share/applications/app.desktop> <mimetype>

# alternatively for gnome desktop enviroment edit this file
nano ~/.config/mimeapps.list
```
### Set default terminal emulator
```bash
sudo update-alternatives --config x-terminal-emulator
```
### Set default shell
```bash
# Manual
chsh -s /bin/shell <user>
# Interactive
chsh
```
### Get application name
```bash
xprop WM_CLASS
```
### ImageMagick allow Image to PDF
```bash
sudo nano /etc/ImageMagick-6/policy.xml
```
```xml
  <!-- disable ghostscript format types -->
  <policy domain="coder" rights="none" pattern="PS" />
  <policy domain="coder" rights="none" pattern="EPS" />
  <policy domain="coder" rights="none" pattern="PDF" /> <!-- CHANGE THIS -->
  <policy domain="coder" rights="none" pattern="XPS" />
```
```xml
  <policy domain="coder" rights="read | write" pattern="PDF" /> <!-- TO THIS -->
```
### Install language support
```bash
sudo nano /etc/locale.gen  # Uncomment lines
sudo locale-gen            # Install uncommented languages
```
### Install snap
```bash
sudo apt update
sudo apt install -y snapd
sudo systemctl enable --now snapd apparmor
```
### Cache Github credentials
```bash
git config --global credential.helper 'cache --timeout 1200'
```
### Reset PulseAudio
```bash
pulseaudio -k && sudo alsa force-reload
```
### Manage monitors
```bash
# List monitors
xrandr

# Configure position
xrandr --output HDMI-0 --left-of eDP --auto
```
### Change hardware properties
```bash
# Install xinput
sudo apt install xinput

# List devices
xinput list

# Lits device properties
xinput list-props <device id>

# Set property
xinput set-prop <device id> <property id> <state 1/0>
```
### Set wallpapers
```bash
# using feh
feh --bg-fill <img>

# using hydrapaper
hydrapaper -c <img>
```
### Video conversion
```bash
# .mkv -> .avi
ffmpeg -i "input.mkv" -f avi -c:v mpeg4 -b:v 4000k -c:a libmp3lame -b:a 320k "out.avi"

# .mkv -> .avi (dual audio -> single audio)
ffmpeg -i "input.mkv" -map 0:v -map 0:a:1 -f avi -c:v mpeg4 -b:v 4000k -c:a libmp3lame -b:a 320k "out.avi"

# speed change
ffmpeg -i input.mp4 -filter:v "setpts=0.005*PTS" output.mp4

# crop video
ffmpeg -i input.mp4 -filter:v "crop:1920:1080:100:50" output.mp4

# Change container
ffmpeg -i input.mkv -codec copy output.mp4
```
### Usefull LaTex commands
```bash
# interactive compiler
latexmk -pdf -pvc <file.tex>
latexmk -lualatex -pvc <file.tex>

# just compile
latexmk -pdf <file.tex>
latexmk -lualatex <file.tex>
```
### Redirect output
```bash

# redirects output
nohup commmand >/dev/null

# redirects stderr
nohup commmand 2>/dev/null

# redirects all
nohup commmand >/dev/null 2>&1
nohup commmand &>/dev/null

# redirects all and disown
nohup commmand > /dev/null 2>&1 & disown
```
### Add .desktop file
```bash
# path to user .desktop files
cd /usr/share/applications

# path to snap .desktop files
cd /var/lib/snapd/desktop/applications
```
```
[Desktop Entry]
Type=Application
Name=A name
GenericName=Generic name
Comment=A comment
Exec=/path/to/bin
Icon=icon-name
Terminal=false
Categories=Development;IDE;Programming;
Keywords=software;programming;coding;
```
### Change grub screen
```bash
# open config file
sudo nano /etc/default/grub
```
```bash
# Edit or add this lines
GRUB_BACKGROUND="/boot/grub/themes/your-theme/image.png"
GRUB_THEME="/boot/grub/themes/your-theme/theme.txt"
```
```bash
# update grub
sudo update-grub
```
### Change timezone
```bash
# lists timezones
timedatectl list-timezones
# set new timezone
sudo timedatectl set-timezone <timezone>
```
### Turn off screen saver for X Window Systems
```bash
xset s off
```
### Sync clock with online services
```bash
# maintains the system time in synchronism with Internet standard time servers
sudo ntpd -qg
```
# TODO
- rlwrap
- gdu
- dmenu
