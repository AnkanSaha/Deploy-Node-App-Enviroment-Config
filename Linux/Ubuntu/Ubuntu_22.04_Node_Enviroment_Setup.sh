#!/bin/bash

Ubuntu22.04NodeEnviromentSetup() {
    # Ubuntu 22.04 LTS (Jammy Jellyfish) Node Enviroment Setup
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

    # installing NodeJS 20 for Ubuntu 20.04 LTS
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl gnupg
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

    NODE_MAJOR=20 # set node major version
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

    # installing MongoDB for Ubuntu 22.04 LTS
    sudo apt-get install gnupg curl -y # gnupg & curl
    curl -fsSL https://pgp.mongodb.com/server-7.0.asc |
        sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
            --dearmor -                                                                                                                                                                                               # add key for mongodb
    sudo touch /etc/apt/sources.list.d/mongodb-org-7.0.list                                                                                                                                                           # create file
    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list # add repo
    sudo apt-get update                                                                                                                                                                                               # update
    sudo apt-get install -y mongodb-org                                                                                                                                                                               # install mongodb
    sudo systemctl enable mongod                                                                                                                                                                                      # enable mongodb
    sudo systemctl start mongod                                                                                                                                                                                       # start mongodb

    # Change MongoDB Config File Port & Bind IP
    # Define the directory path
    MONGODB_CONFIG_FILE_PATH="/etc/mongod.conf"                              # mongod.conf file path
    read "$BOLD Do you want to Change MongoDB Port? (y/n): " mongoPORTchoice # ask user to change mongodb port or not
    # Ask user To Enter MongoDB Port
    read -p "$BOLD Enter MongoDB Port: " mongoPORT # ask user to enter mongodb port

    if [ "$mongoPORTchoice" == "y" ] || [ "$mongoPORTchoice" == "Y" ]; then
        Port_line_number=$(grep -n "port:" $MONGODB_CONFIG_FILE_PATH | cut -d: -f1)      # get line number of port
        sudo sed -i "${Port_line_number}s/.*/port:$mongoPORT/" $MONGODB_CONFIG_FILE_PATH # change port
        read "$BOLD Do you want to Change MongoDB Bind IP? (y/n): " mongoBINDIPchoice    # ask user to change mongodb bind ip or not
        # Ask user To Enter MongoDB Bind IP
        read -p "$BOLD Enter MongoDB Bind IP: " mongoBINDIP # ask user to enter mongodb bind ip
        if [ "$mongoBINDIPchoice" == "y" ] || [ "$mongoBINDIPchoice" == "Y" ]; then
            BindIP_line_number=$(grep -n "bindIp:" $MONGODB_CONFIG_FILE_PATH | cut -d: -f1)        # get line number of bindIp
            sudo sed -i "${BindIP_line_number}s/.*/bindIp:$mongoBINDIP/" $MONGODB_CONFIG_FILE_PATH # change bindIp
        else
            echo "Skipping MongoDB Bind IP Change."
        fi
    else
        echo "Skipping MongoDB Port Change."
    fi
    # Tell User that MongoDB Config File is changed
    echo "$BOLD Your New MongoDB IP is: $NORMAL $mongoBINDIP & $BOLD Your New MongoDB Port is: $NORMAL $mongoPORT"

    # Restart MongoDB
    sudo systemctl restart mongod # restart mongodb

    #ufw configuration
    sudo ufw enable              # enable ufw
    sudo ufw allow 'Nginx Full'  # allow nginx full
    sudo ufw allow 'Nginx HTTP'  # allow nginx http
    sudo ufw allow 'Nginx HTTPS' # allow nginx https
    sudo ufw allow 'OpenSSH'     # allow openssh
    sudo ufw allow '3389'        # allow rdp
    sudo ufw allow $mongoPORT    # allow mongodb port
    sudo ufw status              # check ufw status

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
    read -p "$BOLD Do you want to install a GUI? (y/n): " choice

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
