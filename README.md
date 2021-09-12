# Linux workspace (debian based distros - 2021)
This is the greatest management of all time.
## Screenshots
|Preview|
|:-|
|![Desktop](home/.homemade/rice/screenshots/preview.png)|
|![Desktop](home/.homemade/rice/screenshots/preview.gif)|
## Setup
```bash
# Update and install dependencies
sudo apt update
sudo apt upgrade -y
sudo apt install git stow

# Clone repo
mkdir Github
cd Github
git clone https://github.com/AguilarLagunasArturo/linux-workspace.git

# Change directory and remove unneeded files
cd linux-workspace
rm -r krita README.md

# Create symlinks in the system and restore deleted files
stow -Svt ~ *
git fetch
```
# System configuration
|Utility|Name|
|:-|:-|
|Desktop enviroment|`gnome`|
|Window manager|`i3-gaps`|
|Bar|`i3bar`, `i3status`|
|Compositor|`picom`|
|Launcher|`rofi`|
|Terminal|`kitty`, `urxvt`|
|Notifications|`notify-send`|
## Notes
_home/.homemade_ is a directory for my custom resources, scrips and projects.
## Stuff I have to do manually
- Install third party software
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
### Change default terminal emulator
```bash
sudo update-alternatives --config x-terminal-emulator
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
nohup commmand > /dev/null 2>$1
# redirects output and disown
nohup commmand > /dev/null 2>$1 & disown
```
### Change grub screen
```bash
# TODO
```
### TODO
- mv -i / rm -i
- bat
- gdu
- dmenu
- test setup
