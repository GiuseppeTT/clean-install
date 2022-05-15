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
# Gnome additional settings
# `materia-gtk-theme` is not working in Gnome 42
# Icon theme
sudo dnf install gnome-tweaks papirus-icon-theme
```

## Install flatpaks

> Based on https://flatpak.org/setup/Fedora

Add the Flathub remote:

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Install flatpaks:

```bash
flatpak install flathub \
    com.google.Chrome \                # Google chrome
    com.slack.Slack \                  # Slack
    com.transmissionbt.Transmission \  # For torrenting
    com.visualstudio.code              # VSCode
    org.gnome.Extensions \             # Gnome extensions
    org.videolan.VLC \                 # VLC
    org.zotero.Zotero \                # Zotero
    us.zoom.Zoom                       # Zoom
```

## Setup python

## Setup R

## Setup docker

## Extras

- Change to dark theme
- Change icon theme
- Add fingerprint authentication
