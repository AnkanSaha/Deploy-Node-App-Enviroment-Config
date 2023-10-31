#!/bin/bash

CentOS9NodeEnviromentSetup() {
    # CentOS 9 Stream Node Enviroment Setup
    cd ~

    # Define the colors
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

    # Update the system and install the dependencies
    sudo yum update -y
    sudo yum install -y git wget curl nano unzip tar nginx vim ufw

    # Install Snapd and Snapcraft
    sudo yum install -y snapd
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap
    sudo snap install snapcraft --classic

    # Install Python & Pip
    sudo yum install -y python3 python3-pip python python-pip python2 python2-pip

    # Install NodeJS using Yum
    curl -sL https://rpm.nodesource.com/setup_20.x | sudo bash -
    sudo yum install -y nodejs

    ## install typescript & tslint & ts-node globally
    sudo npm install -g typescript@latest # install typescript
    sudo npm install -g tslint            # install tslint
    sudo npm install -g ts-node           # install ts-node
    sudo npm install -g eslint            # install eslint
    sudo npm install -g @types/node       # install @types/node
    sudo npm install -g pm2               # install pm2
    sudo npm install -g nodemon           # install nodemon

    # Install MongoDB
    sudo touch /etc/yum.repos.d/mongodb-org-7.0.repo # Create the MongoDB Repo File
    sudo echo "[mongodb-org-7.0]
        name=MongoDB Repository
        baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/7.0/x86_64/\
        gpgcheck=1\
        enabled=1\
        gpgkey=https://www.mongodb.org/static/pgp/server-7.0.asc" >>/etc/yum.repos.d/mongodb-org-7.0.repo # Add the MongoDB Repo File

    sudo yum install -y mongodb-org # Install MongoDB

    # Start MongoDB
    sudo systemctl start mongod
    sudo systemctl enable mongod

    # Change MongoDB Config File Port & Bind IP
    # Define the directory path
    MONGODB_CONFIG_FILE_PATH="/etc/mongod.conf"                                 # mongod.conf file path
    read -p "$BOLD Do you want to Change MongoDB Port? (y/n): " mongoPORTchoice # ask user to change mongodb port or not

    if [ "$mongoPORTchoice" == "y" ] || [ "$mongoPORTchoice" == "Y" ]; then
        # Ask user To Enter MongoDB Port
        read -p "$BOLD Enter MongoDB Port: " mongoPORT                                   # ask user to enter mongodb port
        Port_line_number=$(grep -n "port:" $MONGODB_CONFIG_FILE_PATH | cut -d: -f1)      # get line number of port
        sudo sed -i "${Port_line_number}s/.*/port:$mongoPORT/" $MONGODB_CONFIG_FILE_PATH # change port

        read -p "$BOLD Do you want to Change MongoDB Bind IP? (y/n): " mongoBINDIPchoice # ask user to change mongodb bind ip or not
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
    sudo yum install -y certbot python3-certbot-nginx # install certbot for nginx

    # Install Docker & Docker Compose
    sudo yum install -y yum-utils device-mapper-persistent-data lvm2 # install docker dependencies
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo # add docker repo
    sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin # install docker & docker-compose
    sudo systemctl start docker # start docker
    sudo systemctl enable docker # enable docker
    sudo usermod -aG docker $USER # add user to docker group
    sudo systemctl restart docker # restart docker
    sudo systemctl status docker # check docker status

    # Check Docker Compose Version
    docker-compose --version


    # Install Redis
    sudo yum install -y redis # install redis
    sudo systemctl start redis # start redis
    sudo systemctl enable redis # enable redis
    sudo systemctl status redis # check redis status

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
    echo " Please Edit MongoDB Config File  with sudo nano /etc/mongod.conf command & set Bind IP to 0.0.0.0 with PORT 4442 if you don't update it on prompt"
    echo "MERN Server Ready 😄 Happy Deployment 🇮🇳 🛕 Jay Hind 🛕 🇮🇳" # End of Script
}
