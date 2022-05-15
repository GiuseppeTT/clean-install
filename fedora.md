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
# New console
# Gnome additional settings
# `materia-gtk-theme` is not working in Gnome 42
# Icon theme
sudo dnf install gnome-console gnome-tweaks papirus-icon-theme
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
    com.visualstudio.code            # VSCode
    org.gnome.Extensions             # Gnome extensions
    org.videolan.VLC                 # VLC
    org.zotero.Zotero                # Zotero
    us.zoom.Zoom                     # Zoom
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

Install R and other dependencies:

```bash
sudo dnf install R libcurl-devel openssl-devel
```

Install packages:

```bash
Rscript -e "install.packages(c('bookdown', 'devtools', 'gt', 'rmarkdown', 'shiny', 'targets', 'tidymodels', 'tidyverse', 'tinytex'))"
```

Install tinytex:

```bash
Rscript -e "tinytex::install_tinytex()"
```

Install RStudio

```bash
sudo dnf install rstudio-desktop
```

## Setup docker

## Extras

- Change style to dark in `Settings` > `Appearance` > `Style`
- Disable hot corner in `Settings` > `Multitasking` > `General`
- Fix `Alt + Tab` to workspace in `Settings` > `Multitasking` > `Application Switching`
- Activate night light in `Settings` > `Displays`
- Activate tap to click in `Settings` > `Touchpad`
- Set compose key to `right alt` in `Settings` > `Keyboard` > `Special Character Entry`
- Enable fingerprint in `Settings` > `Users`
- Change icon theme in `Gnome Tweaks` > `Appearance`
- Add weekday to topbar in `Gnome Tweaks` > `Top Bar`
