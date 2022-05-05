# Ubuntu clean install

## Install chrome

Link: https://www.google.com/intl/en_ca/chrome/

## Enable extra repositories

Use `Software & Updates` program for that.

## Run first update/upgrade

```
sudo apt update
sudo apt upgrade
```

## Change theme

```
sudo apt install gnome-tweaks materia-gtk-theme papirus-icon-theme
```

## Install programs

### Snap

```
sudo snap install vlc
sudo snap install code --classic
sudo snap install slack
```

## Install python

```
sudo apt install python-is-python3
sudo apt install python3-pip
pip install --upgrade pip
pip install -U \
    numpy \
    scipy \
    pandas \
    matplotlib \
    statsmodels \
    scikit-learn
```

## Install R

### R

```
sudo apt install r-base libxml2-dev libssl-dev libcurl4-openssl-dev
```

In `R` console

```
install.packages(c('devtools', 'tidyverse', 'gt', 'rmarkdown', 'tinytex', 'tidymodels', 'shiny', 'targets'))
tinytex::install_tinytex()
```

### For VSCode

```
pip install -U radian
Rscript -e 'devtools::install_github("REditorSupport/languageserver")'
```

### For RStudio

Link: https://www.rstudio.com/products/rstudio/download/#download

## Install docker

## Configure

### Change settings

`Settings` > `Appearance` > `Dock` > Change everything : )

`Settings` > `Multitasking` > `Include applications from the current workspace only`
