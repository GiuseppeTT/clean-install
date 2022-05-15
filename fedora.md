# Fedora clean install

## Initial setup window

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

## Flatpaks

> Based on https://flatpak.org/setup/Fedora

Add the Flathub remote

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Install flatpaks

```
```
