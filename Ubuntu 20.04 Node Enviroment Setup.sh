# Ubuntu 20.04 LTS (Focal Fossa) Node Enviroment Setup

# install all dependencies
sudo apt install -y git # git
sudo apt install -y nginx # nginx
sudo apt install -y curl # curl
sudo apt install -y wget # wget
sudo apt install -y unzip # unzip
sudo apt install -y zip # zip

# install python & pip
sudo apt install -y python3 # python3
sudo apt install -y python3-pip # python3-pip
sudo apt install -y python # python
sudo apt install -y python-pip # python-pip
sudo apt install -y python2 # python2
sudo apt install -y python2-pip # python2-pip

# installing MongoDB for Ubuntu 20.04 LTS
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -   # add key
sudo apt-get install gnupg # gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -  # add key
sudo touch /etc/apt/sources.list.d/mongodb-org-6.0.list # create file
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list # add repo
sudo apt-get update # update
sudo apt-get install -y mongodb-org # install mongodb
sudo service mongod start # start mongodb
sudo service mongod status # check status
sudo service mongod restart # reload
sudo systemctl enable mongod # enable mongodb
sudo systemctl restart mongod # restart mongodb

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

# install certbot for nginx and create ssl certificate
sudo apt install certbot python3-certbot-nginx -y # install certbot for nginx

# Transfer nginx config file project wise to /etc/nginx/sites-available/
sudo cp 'Store Management App Nginx Router' /etc/nginx/sites-available/ # Store Management App Nginx Router for Store Management Project
sudo cp 'Portfolio App Nginx Router' /etc/nginx/sites-available/ # Portfolio App Nginx Router for Portfolio Project
sudo cp 'SaveNet App Nginx Router' /etc/nginx/sites-available/ # SaveNet App Nginx Router for SaveNet Project
sudo cp 'Video Downloader App Nginx Router' /etc/nginx/sites-available/ # Video Downloader App Nginx Router for Video Downloader Project
sudo cp 'University Result App Nginx Router' /etc/nginx/sites-available/ # University Result App Nginx Router for University Result Project
sudo cp 'Donation Tracker App Nginx Router' /etc/nginx/sites-available/ # Donation Tracker App Nginx Router for Donation Tracker Project
sudo cp 'PaisaPay Nginx Router' /etc/nginx/sites-available/ # PaisaPay Ngix Router for PaisaPay Project

# Create Symbolic Link for nginx config file
sudo ln -s /etc/nginx/sites-available/'Store Management App Nginx Router' /etc/nginx/sites-enabled/ # Symbolic Link for Store Management App Nginx Router
sudo ln -s /etc/nginx/sites-available/'Portfolio App Nginx Router' /etc/nginx/sites-enabled/ # Symbolic Link for Portfolio App Nginx Router
sudo ln -s /etc/nginx/sites-available/'SaveNet App Nginx Router' /etc/nginx/sites-enabled/ # Symbolic Link for SaveNet App Nginx Router
sudo ln -s /etc/nginx/sites-available/'Video Downloader App Nginx Router' /etc/nginx/sites-enabled/ # Symbolic Link for Video Downloader App Nginx Router
sudo ln -s /etc/nginx/sites-available/'University Result App Nginx Router' /etc/nginx/sites-enabled/ # Symbolic Link for University Result App Nginx Router
sudo ln -s /etc/nginx/sites-available/'Donation Tracker App Nginx Router' /etc/nginx/sites-enabled/ # Symbolic Link for Donation Tracker App Nginx Router
sudo ln -s /etc/nginx/sites-available/'PaisaPay Nginx Router' /etc/nginx/sites-enabled/ # Symbolic Link for PaisaPay Nginx Router

# Start nginx
sudo nginx -t # Test nginx config
sudo systemctl enable nginx # Enable nginx
sudo systemctl restart nginx # Restart nginx

## issue ssl certificate
 #All Domain
sudo certbot --nginx -d store.theankan.live # Store Management App
sudo certbot --nginx -d theankan.live # Portfolio App
sudo certbot --nginx -d docs.theankan.live # SaveNet App
sudo certbot --nginx -d video.theankan.live # Video Downloader App
sudo certbot --nginx -d result.theankan.live # University Result App
sudo certbot --nginx -d donate.theankan.live # Donation Tracker App
sudo certbot --nginx -d paisapay.theankan.live # PaisaPay App

# Enable Certbot Auto Renewal
sudo systemctl enable certbot.timer # Enable Certbot Auto Renewal
sudo systemctl restart certbot.timer # Start Certbot Auto Renewal

# End of Script
echo "Server Ready 😄 Happy Deployment 🇮🇳 🛕 Jay Hind 🛕 🇮🇳" # End of Script