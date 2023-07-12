# Ubuntu 20.04 LTS (Focal Fossa) Node Enviroment Setup
cd # change directory to home
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


# installing NodeJS 20 for Ubuntu 20.04 LTS
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
sudo apt-get install -y nodejs # install nodejs

# install npm
sudo npm install -g npm@latest # install npm

## install typescript & tslint & ts-node globally
sudo npm install -g typescript@latest # install typescript
sudo npm install -g tslint # install tslint
sudo npm install -g ts-node # install ts-node


# install pm2
sudo npm install -g pm2 # install pm2
sudo pm2 update # update pm2

#ufw configuration
sudo ufw enable # enable ufw
sudo ufw allow 80/tcp # allow port 80
sudo ufw allow 443/tcp # allow port 443
sudo ufw allow 22/tcp # allow port 22
sudo ufw allow 'Nginx Full' # allow nginx full
sudo ufw allow 'Nginx HTTP' # allow nginx http
sudo ufw allow 'Nginx HTTPS' # allow nginx https
sudo ufw allow 'OpenSSH' # allow openssh
sudo ufw status # check ufw status

# installing MongoDB for Ubuntu 20.04 LTS
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -   # add key
sudo apt-get install gnupg # gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -  # add key
sudo touch /etc/apt/sources.list.d/mongodb-org-6.0.list # create file
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list # add repo
sudo apt-get update # update
sudo apt-get install -y mongodb-org # install mongodb
sudo systemctl enable mongod # enable mongodb
sudo systemctl start mongod # start mongodb

# install certbot for nginx and create ssl certificate
sudo apt install certbot python3-certbot-nginx -y # install certbot for nginx

# End of Script
echo "MERN Server Ready 😄 Happy Deployment 🇮🇳 🛕 Jay Hind 🛕 🇮🇳" # End of Script