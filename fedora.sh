# Upgrade already installed packages
sudo dnf upgrade

# Force alt + tab to switch only on current workspace in GNOME shell
# https://askubuntu.com/questions/464946/force-alt-tab-to-switch-only-on-current-workspace-in-gnome-shell
gsettings set org.gnome.shell.app-switcher current-workspace-only true

# Add flathub
# https://flatpak.org/setup/Fedora/
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Change appearance (disable animation, change theme, change icon theme, etc)
# You have to manually open gnome tweaks to do that
# https://github.com/nana-4/materia-theme
# https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
sudo dnf install gnome-tweaks materia-gtk-theme papirus-icon-theme

# Install flatpackages
flatpak install flathub \
    org.gnome.Extensions \ 
    com.spotify.Client \
    com.transmissionbt.Transmission \
    org.videolan.VLC

# Install R and Rstudio and some packages
sudo dnf install R rstudio-desktop openssl-devel libcurl-devel
Rscript -e "install.packages('tidyverse', 'tidymodels', 'tidytext', 'lubridate', 'readxl', 'rmarkdown', 'shiny', 'tinytex', 'renv', 'drake')"
Rscript -e "tinytext::install_tinytex()"

# Install docker and add sudo priveldge
# https://docs.docker.com/engine/install/fedora/
# https://docs.docker.com/engine/install/linux-postinstall/
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo docker run hello-world
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
