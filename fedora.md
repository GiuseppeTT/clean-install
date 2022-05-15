# Fedora clean install

## Initial setup

Go through the initial setup window. This is important to enable third party repositories.

## Configure DNF

Change DNF configuration for faster download.

Access configurations:

```bash
sudo gnome-text-editor /etc/dnf/dnf.conf
```

Add this:

```bash
# Added for speed
fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True
```

## Update system

Update system for the first time.

Update system:

```bash
sudo dnf update
```

## Install packages

Install packages:

```
# Gnome new console
# Gnome additional settings
# Dash to dock extension
# `materia-gtk-theme` is not working in Gnome 42
# Icon theme
sudo dnf install gnome-console gnome-shell-extension-dash-to-dock gnome-tweaks papirus-icon-theme
```

## Install flatpaks

> Based on https://flatpak.org/setup/Fedora

Add the Flathub remote:

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Install flatpaks:

```bash
flatpak install flathub
    com.google.Chrome                # Google chrome
    com.slack.Slack                  # Slack
    com.transmissionbt.Transmission  # For torrenting
    org.gnome.Extensions             # Gnome extensions
    org.gtk.Gtk3theme.Adwaita-dark   # Adwaita-dark theme
    org.videolan.VLC                 # VLC
    org.zotero.Zotero                # Zotero
    us.zoom.Zoom                     # Zoom
```

## Setup VSCode

> Based on https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions

Install VSCode:

```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
sudo dnf install code
```

## Setup python

Install pip:

```bash
sudo dnf install python3-pip
```

Update pip:

```bash
pip install --upgrade pip
```

Install python packages:

```bash
pip install -U \
    numpy \
    scipy \
    pandas \
    matplotlib \
    statsmodels \
    scikit-learn
```

## Setup R

> For the VSCode part, it is based on https://code.visualstudio.com/docs/languages/r

Install R and other dependencies:

```bash
sudo dnf install R libcurl-devel openssl-devel
```

On R console, install packages:

> First time needs to run on R console to create and use personal library

```R
install.packages(c(
    "BiocManager",
    "bookdown",
    "devtools",
    "gt",
    "rmarkdown",
    "shiny",
    "targets",
    "tidymodels",
    "tidyverse",
    "tinytex"
))
```

Install tinytex:

```bash
Rscript -e "tinytex::install_tinytex()"
```

Install radian:

```bash
pip install -U radian
```

Install R language server (for VSCode):

```bash
Rscript -e 'devtools::install_github("REditorSupport/languageserver")'
```

Install RStudio:

```bash
sudo dnf install rstudio-desktop
```

## Setup docker

> Based on https://docs.docker.com/engine/install/fedora/ and https://docs.docker.com/engine/install/linux-postinstall/

Install docker using the convenience script:

```bash
cd Downloads
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

Enable docker for non-privileged users:

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world  # For checking if everything is alright
``` 

## Extras

### Settings and Gnome Tweaks

Do the following:

- Change style to dark in `Settings` > `Appearance` > `Style`
- Disable hot corner in `Settings` > `Multitasking` > `General`
- Fix `Alt + Tab` to workspace in `Settings` > `Multitasking` > `Application Switching`
- Activate night light in `Settings` > `Displays`
- Activate tap to click in `Settings` > `Touchpad`
- Set compose key to `right alt` in `Settings` > `Keyboard` > `Special Character Entry`
- Enable fingerprint in `Settings` > `Users`
- Change default applications in `Settings` > `Default Applications`
- Change icon theme in `Gnome Tweaks` > `Appearance`
- Add weekday to top bar in `Gnome Tweaks` > `Top Bar`
- Enable dash to dock in `Extensions`
- Sync VSCode to GitHub to import settings and extensions from cloud

### Dash app order

Order the apps on dash as follows:

- Chrome
- Files
- PDF reader
- Slack
- Zoom
- Terminal
- VSCode
- Zotero
- Transmission
- VLC
- System monitor

### Chrome pinned tabs order

Order the pinned tabs on chrome as follows:

- Gmail
- Google calendar
- Notion
- Stat email
- Spotify
