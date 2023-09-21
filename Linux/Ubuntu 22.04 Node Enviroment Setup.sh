#!/bin/bash

# Ubuntu 22.04 LTS (Jammy Jellyfish) Node Enviroment Setup
cd ~ # change directory to home

# Update APT
sudo apt update # update apt
sudo apt upgrade -y # upgrade apt

# install all dependencies
sudo apt install -y git # git
sudo apt install -y nginx # nginx
sudo apt install -y curl # curl
sudo apt install -y wget # wget
sudo apt install -y unzip # unzip
sudo apt install -y zip # zip
sudo apt install -y nano # nano
sudo apt install -y vim # vim
sudo apt install -y ufw # ufw


# install python & pip
sudo apt install -y python3 # python3
sudo apt install -y python3-pip # python3-pip
sudo apt install -y python # python
sudo apt install -y python-pip # python-pip
sudo apt install -y python2 # python2
sudo apt install -y python2-pip # python2-pip


# installing NodeJS 20 for Ubuntu 22.04 LTS
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# install npm
sudo npm install -g npm@latest # install npm

# Ask User is user want to install other compilers or not
read -p "Do you want to install other compilers? (y/n): " choice

if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
    # Perform GUI-related tasks here
    echo "Installing other compilers..."
    sudo apt install -y build-essential # build-essential
    sudo apt install -y gcc # gcc for C
    sudo apt install -y g++ # g++ for C++
    sudo apt install -y make # make for C
    sudo apt install -y cmake # cmake for C++
    sudo apt install -y autoconf # autoconf for C
    sudo apt install -y automake # automake for C
    sudo apt install -y libtool # libtool for C
    sudo apt install -y pkg-config # pkg-config for C
    sudo apt install -y nasm # nasm for C
    sudo apt install -y libpng-dev # libpng-dev for C
    sudo apt install -y libjpeg-dev # libjpeg-dev for C
    sudo apt install -y libtiff-dev # libtiff-dev for C
    sudo apt install -y zlib1g-dev # zlib1g-dev for C
    sudo apt install -y libicu-dev # libicu-dev for C
    sudo apt install -y libpango1.0-dev # libpango1.0-dev for C
    sudo apt install -y libcairo2-dev # libcairo2-dev for C
    sudo apt install -y libglib2.0-dev # libglib2.0-dev for C
    sudo apt install -y libgdk-pixbuf2.0-dev # libgdk-pixbuf2.0-dev for C
    sudo apt install -y libgtk2.0-dev # libgtk2.0-dev for C
    sudo apt install -y libatk1.0-dev # libatk1.0-dev for C
    sudo apt install -y libghc-x11-dev # libghc-x11-dev for C
    sudo apt install -y libxtst-dev # libxtst-dev for C
    sudo apt install -y libxss-dev # libxss-dev for C
    sudo apt install -y libasound2-dev # libasound2-dev for C
    sudo apt install -y libnss3-dev # libnss3-dev for C
    sudo apt install -y libgconf-2-4 # libgconf-2-4 for C
    sudo apt install -y libgbm-dev # libgbm-dev for C
    sudo apt install -y libgtk-3-dev # libgtk-3-dev for C

    # install Java 11
    sudo apt install openjdk-11-jre-headless -y # openjdk-11-jre-headless for Java
    sudo apt install -y openjdk-11-jdk-headless -y # openjdk-11-jdk-headless for Java
    sudo apt install -y openjdk-11-jre -y # openjdk-11-jre for Java

    # Fotran
    sudo apt install -y gfortran -y # gfortran for Fortran

    # Haskell
    sudo apt install -y haskell-platform -y # haskell-platform for Haskell

    # Rust
    sudo apt install rustc -y # rustc for Rust

    # Go
    sudo apt install golang-go -y # golang-go for Go

    # Ruby
    sudo apt install ruby-full -y # ruby-full for Rubyv

    # TypeScript
    sudo npm install -g typescript@latest # typescript@latest for TypeScript

    # Swift
    sudo apt install swift -y # swift for Swift

    # Lua
    sudo apt install lua5.3 -y # lua5.3 for Lua

    # Erlang
    sudo apt install erlang -y # erlang for Erlang

    # C#
    sudo apt install mono-complete -y # mono-complete for C#
    sudo apt install mono-runtime -y # mono-runtime for C#

    # R
    sudo apt install r-base -y # r-base for R

    # Dart
    sudo apt-get update # update apt
    sudo apt-get install apt-transport-https # apt-transport-https
    wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg # add key for dart
    echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list # add repo for dart
    sudo apt-get update # update apt again
    sudo apt-get install dart -y # install dart

else
    echo "Skipping other compilers installation."
fi

## install typescript & tslint & ts-node globally
sudo npm install -g typescript@latest # install typescript
sudo npm install -g tslint # install tslint
sudo npm install -g ts-node # install ts-node
sudo npm install -g eslint # install eslint


#ufw configuration
sudo ufw enable # enable ufw
sudo ufw allow 'Nginx Full' # allow nginx full
sudo ufw allow 'Nginx HTTP' # allow nginx http
sudo ufw allow 'Nginx HTTPS' # allow nginx https
sudo ufw allow 'OpenSSH' # allow openssh
sudo apt allow '3389' # allow rdp
sudo ufw status # check ufw status

# installing MongoDB for Ubuntu 20.04 LTS
sudo apt-get install gnupg curl -y # gnupg & curl
curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor - # add key for mongodb
sudo touch /etc/apt/sources.list.d/mongodb-org-7.0.list # create file
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list # add repo
sudo apt-get update # update
sudo apt-get install -y mongodb-org # install mongodb
sudo systemctl enable mongod # enable mongodb
sudo systemctl start mongod # start mongodb


# install certbot for nginx and create ssl certificate
sudo apt install certbot python3-certbot-nginx -y # install certbot for nginx

# install Docker
sudo apt update # update apt
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y # install dependencies for docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg # add key for docker
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null # add repo for docker
sudo apt update # update apt again
sudo apt install docker-ce docker-ce-cli containerd.io -y # install docker
sudo usermod -aG docker $USER # add user to docker group for docker
sudo systemctl enable docker # enable docker
sudo systemctl start docker # start docker
docker --version # check docker version

# install docker-compose
sudo apt install docker-compose -y # install docker-compose
docker-compose --version # check docker-compose version

# install pm2
sudo npm install -g pm2 # install pm2
sudo pm2 update # update pm2
sudo pm2 startup # pm2 startup
sudo pm2 save # pm2 save

# Install GUI (Optional)
read -p "Do you want to install a GUI? (y/n): " choice

if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
    # Perform GUI-related tasks here
    echo "Installing GUI..."
    echo "Choose an option:"
echo "1. Install GUI via Tasksel"
echo "2. Install GUI via apt"
read choice

if [ "$choice" == "1" ]; then
    # Perform tasks for GUI installation
    sudo apt update # update apt
    sudo apt install tasksel -y # install tasksel
    sudo tasksel # Select the GUI you want to install
    sudo reboot # reboot
elif [ "$choice" == "2" ]; then
echo "Choose an option:"
echo "1. Install GUI"
echo "2. Install Xfce"
read choice

if [ "$choice" == "1" ]; then
    # Perform tasks for GUI installation
    sudo apt update # update apt
    sudo apt install ubuntu-desktop -y # install ubuntu desktop
    sudo apt install lightdm -y # install lightdm
    sudo /usr/lib/lightdm/lightdm-set-defaults -s ubuntu # set default desktop to ubuntu

elif [ "$choice" == "2" ]; then
    # Perform tasks for Xfce installation
    sudo apt update # update apt
    sudo apt install xfce4 -y # install xfce4
    sudo apt install lightdm -y # install lightdm
    sudo /usr/lib/lightdm/lightdm-set-defaults -s xfce # set default desktop to xfce
    
else
    echo "Invalid choice."
fi

else
    echo "Invalid choice."
fi

# Install XRDP
sudo apt install xrdp -y # install xrdp
sudo systemctl enable xrdp # enable xrdp
sudo reboot # reboot
else
    echo "Skipping GUI installation."
fi

# Continue with the rest of your script
# End of Script
echo "MERN Server Ready 😄 Happy Deployment 🇮🇳 🛕 Jay Hind 🛕 🇮🇳" # End of Script