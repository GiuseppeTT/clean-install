# Remember to activate "gnome on Xorg" on the log screen!
pip install -U poetry numpy scipy pandas statsmodels scikit-learn

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

# Install python packages
#

# Install R and some packages
sudo dnf install R libcurl-devel openssl-devel
Rscript -e "install.packages(c('devtools', 'tidyverse', 'tidymodels', 'rmarkdown', 'tinytex'))"
Rscript -e "tinytex::install_tinytex()"

# Install RStudio
# Uncomment \/
#sudo dnf install rstudio-desktop

# Install radian (alternative R console) and languageserver (R language server) for VSCode
pip install -U radian
Rscript -e 'devtools::install_github("REditorSupport/languageserver")'

# Install VSCode
# https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions
# Remember to change title bar settings: https://github.com/microsoft/vscode/issues/43154
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code

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
