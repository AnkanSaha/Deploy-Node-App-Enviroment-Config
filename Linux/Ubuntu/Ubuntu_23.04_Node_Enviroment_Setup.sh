#!/bin/bash

Ubuntu23.04NodeEnviromentSetup() {
    # Ubuntu 23.04 LTS (Luner Lemur) Node Enviroment Setup
    cd ~ # change directory to home

    # Define the colors which will be used in the script
    if [ -t 1 ]; then
        RED=$(tput setaf 1)
        GREEN=$(tput setaf 2)
        YELLOW=$(tput setaf 3)
        BLUE=$(tput setaf 4)
        GRAY=$(tput setaf 8)
        SAFERED=$(tput setaf 9)
        MAGENTA=$(tput setaf 5)
        BOLD=$(tput bold)
        NORMAL=$(tput sgr0)
    else
        RED=""
        GREEN=""
        YELLOW=""
        BLUE=""
        GRAY=""
        SAFERED=""
        MAGENTA=""
        BOLD=""
        NORMAL=""
    fi

    # Update APT
    sudo apt update     # update apt
    sudo apt upgrade -y # upgrade apt

    # install all dependencies
    sudo apt install -y git   # git
    sudo apt install -y nginx # nginx
    sudo apt install -y curl  # curl
    sudo apt install -y wget  # wget
    sudo apt install -y unzip # unzip
    sudo apt install -y zip   # zip
    sudo apt install -y nano  # nano
    sudo apt install -y vim   # vim
    sudo apt install -y ufw   # ufw

    # Install Snapd
    # Define the directory path
    SNAP_DIRECTORY_PATH="/etc/apt/preferences.d/nosnap.pref" # nosnap.pref file path

    # Check if the directory is empty or not
    if [ -n "$(ls -A $SNAP_DIRECTORY_PATH)" ]; then
        echo "Directory is not empty."
        # Delete all nginx config file from /etc/nginx/conf.d/
        sudo rm -r $SNAP_DIRECTORY_PATH # Remove nosnap.pref file
        echo "nosnap.pref file is removed."
        sudo apt update           # update apt
        sudo apt install snapd -y # install snapd
    else
        echo "Directory is empty."
        echo "No need to remove nosnap.pref file"
        sudo apt update           # update apt
        sudo apt install snapd -y # install snapd
    fi

    # install python & pip
    sudo apt install -y python3     # python3
    sudo apt install -y python3-pip # python3-pip
    sudo apt install -y python      # python
    sudo apt install -y python-pip  # python-pip
    sudo apt install -y python2     # python2
    sudo apt install -y python2-pip # python2-pip

    # installing NodeJS 21 for Ubuntu 23.04 LTS
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl gnupg
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

    NODE_MAJOR=21 # set node major version
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

    sudo apt-get update            # update apt
    sudo apt-get install nodejs -y # install nodejs

    # Ask User is user want to install other compilers or not
    read -p "$BOLD Do you want to install other compilers? (y/n): " choice

    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        InstallCompiler # Install all compilers
    else
        echo "Skipping other compilers installation."
    fi

    ## install typescript & tslint & ts-node globally
    sudo npm install -g typescript@latest # install typescript
    sudo npm install -g tslint            # install tslint
    sudo npm install -g ts-node           # install ts-node
    sudo npm install -g eslint            # install eslint
    sudo npm install -g @types/node       # install @types/node
    sudo npm install -g pm2               # install pm2
    sudo npm install -g nodemon           # install nodemon
    sudo npm install -g yarn              # install yarn

    #ufw configuration
    sudo ufw enable              # enable ufw
    sudo ufw allow 'Nginx Full'  # allow nginx full
    sudo ufw allow 'Nginx HTTP'  # allow nginx http
    sudo ufw allow 'Nginx HTTPS' # allow nginx https
    sudo ufw allow 'OpenSSH'     # allow openssh
    sudo ufw allow '3389'        # allow rdp
    sudo ufw status              # check ufw status

    # Install Some Softwares
    sudo apt install -y gparted  # gparted
    sudo apt install -y neofetch # neofetch
    sudo apt install -y htop     # htop
    sudo apt install -y wget     # wget

    # Setup Ngrok
    sudo apt install -y unzip         # unzip
    sudo apt install -y zip           # zip
    sudo apt install install -y snapd # snapd
    sudo snap install ngrok           # ngrok

    # inject ngrok authtoken in ngrok.yml file
    read -p "$BOLD Do you want to inject ngrok authtoken in ngrok.yml file? (y/n): " choice

    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        read -p " Enter Ngrok authtoken : " ngrokauthtoken # ask user to enter ngrok authtoken
        ngrok config add-authtoken "$ngrokauthtoken"       # inject ngrok authtoken in ngrok.yml file

        echo "$BOLD $GREEN Ngrok authtoken is injected in ngrok.yml file."
    else
        echo "Skipping ngrok authtoken injection."
    fi

    # install certbot for nginx and create ssl certificate
    sudo apt install certbot python3-certbot-nginx -y # install certbot for nginx

    # Ask User is user want to install Docker or not
    read -p "$BOLD Do you want to install Docker? (y/n): " choice

    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        # install Docker
        sudo apt update                                                                                                                                                                                               # update apt
        sudo apt install apt-transport-https ca-certificates curl software-properties-common -y                                                                                                                       # install dependencies for docker
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg                                                                                # add key for docker
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null # add repo for docker
        sudo apt update                                                                                                                                                                                               # update apt again
        sudo apt install docker-ce docker-ce-cli containerd.io -y                                                                                                                                                     # install docker
        sudo usermod -aG docker $USER                                                                                                                                                                                 # add user to docker group for docker
        sudo systemctl enable docker                                                                                                                                                                                  # enable docker
        sudo systemctl start docker                                                                                                                                                                                   # start docker
        docker --version                                                                                                                                                                                              # check docker version

        # install docker-compose
        sudo apt install docker-compose -y # install docker-compose
        docker-compose --version           # check docker-compose version

        # Ask user to set port for MongoDB
        read -p "Enter Port for MongoDB (Default: 4442): " mongodbport # ask user to enter port for mongodb

        # Check if the user has entered the port or not
        if [ -z "$mongodbport" ]; then
            echo "Port is not set. Using default port 4442."
            mongodbport=4442 # set default port for mongodb
        else
            echo "Port is set to $mongodbport."
        fi

        # installing MongoDB for Ubuntu 20.04 LTS
        sudo docker run -d --restart always -p $mongodbport:27017 --name MongoDB mongodb/mongodb-community-server:latest # install mongodb in docker                                                                                                                                                                                    # start mongodb
        sudo ufw allow "$mongodbport"                                                                                    # allow mongodb port in ufw after installing mongodb

        # install other Databases
        read -p "$BOLD Do you want to install other databases? (y/n): " choice

        if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
            InstallDatabase # Install all databases
        else
            echo "$YELLOW Skipping other databases installation."
        fi

    else
        echo "$YELLOW Skipping Docker installation."
    fi

    # install pm2
    sudo npm install -g pm2 # install pm2
    sudo pm2 update         # update pm2
    sudo pm2 startup        # pm2 startup
    sudo pm2 save           # pm2 save

    # install openvpn
    read -p "$BOLD Do you want to install OpenVPN? (y/n): " choice
    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        # install openvpn
        wget https://git.io/vpn -O openvpn-install.sh # download openvpn-install.sh
        chmod +x openvpn-install.sh                   # make openvpn-install.sh executable
        sudo ./openvpn-install.sh                     # install openvpn
    else
        echo "$YELLOW Skipping OpenVPN installation."
    fi

    # Install GUI (Optional)
    read -p "$BOLD Do you want to install a GUI? (y/n): " choice

    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        InstallGUI # Install GUI
    else
        echo "Skipping GUI installation."
    fi

    # Continue with the rest of your script
    # End of Script
    echo "MERN Server Ready 😄 Happy Deployment 🇮🇳 🛕 Jay Hind 🛕 🇮🇳" # End of Script
}
