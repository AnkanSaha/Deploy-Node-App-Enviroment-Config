#!/bin/bash

Ubuntu20.04NodeEnviromentSetup() {
    # Ubuntu 20.04 LTS (Focal) Node Enviroment Setup
    cd ~ # change directory to home

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
    if [ -n "$(sudo ls -A $SNAP_DIRECTORY_PATH)" ]; then
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

    # installing NodeJS 19 for Ubuntu 20.04 LTS
    sudo apt-get update                                  # update apt
    sudo snap install node --channel=19/stable --classic # install node 19 for NodeJS

    # Ask User is user want to install other compilers or not
    read -p "Do you want to install other compilers? (y/n): " choice

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

    #ufw configuration
    sudo ufw enable              # enable ufw
    sudo ufw allow 'Nginx Full'  # allow nginx full
    sudo ufw allow 'Nginx HTTP'  # allow nginx http
    sudo ufw allow 'Nginx HTTPS' # allow nginx https
    sudo ufw allow 'OpenSSH'     # allow openssh
    sudo ufw allow '3389'        # allow rdp
    sudo ufw allow '4442'        # allow custom port for mongodb
    sudo ufw status              # check ufw status

    # installing MongoDB for Ubuntu 20.04 LTS
    sudo apt-get install gnupg curl -y
    # install gnupg & curl
    curl -fsSL https://pgp.mongodb.com/server-6.0.asc |
        sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg \
            --dearmor
    # add key for mongodb
    sudo touch /etc/apt/sources.list.d/mongodb-org-7.0.list                                                                                                                                                           # create file
    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list # add repo
    sudo apt-get update                                                                                                                                                                                               # update
    sudo apt-get install -y mongodb-org                                                                                                                                                                               # install mongodb
    sudo systemctl enable mongod                                                                                                                                                                                      # enable mongodb
    sudo systemctl start mongod                                                                                                                                                                                       # start mongodb

    # install certbot for nginx and create ssl certificate
    sudo apt install certbot python3-certbot-nginx -y # install certbot for nginx

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

    # install pm2
    sudo npm install -g pm2 # install pm2
    sudo pm2 update         # update pm2
    sudo pm2 startup        # pm2 startup
    sudo pm2 save           # pm2 save

    # Install GUI (Optional)
    read -p "Do you want to install a GUI? (y/n): " choice

    if [ "$choice" == "y" ] || [ "$choice" == "Y" ]; then
        InstallGUI # Install GUI
    else
        echo "Skipping GUI installation."
    fi

    # Continue with the rest of your script
    # End of Script
    echo " Please Edit MongoDB Config File  with sudo nano /etc/mongod.conf command & set Bind IP to 0.0.0.0 with PORT 4442"
    echo "MERN Server Ready 😄 Happy Deployment 🇮🇳 🛕 Jay Hind 🛕 🇮🇳" # End of Script
}
