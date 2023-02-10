# Ubuntu 20.04 LTS (Focal Fossa)
cd ..
sudo apt install -y git # git
sudo apt install -y nginx # nginx
sudo apt install -y curl # curl
sudo apt install -y python3 # python3
sudo apt install -y python # python2
sudo apt install -y python3-pip # pip3
# installing MongoDB for Ubuntu 20.04 LTS
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -   # add key
sudo apt-get install gnupg # gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -  # add key
sudo touch /etc/apt/sources.list.d/mongodb-org-6.0.list # create file
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list # add repo
sudo apt-get update # update
sudo apt-get install -y mongodb-org # install mongodb
sudo systemctl start mongod # start mongodb
sudo systemctl daemon- reload # reload
sudo systemctl enable mongod # enable mongodb
sudo systemctl restart mongod # restart mongodb
# installing NodeJS 19 for Ubuntu 20.04 LTS
curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
# installing yarn for Ubuntu 20.04 LTS
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - &&\
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list &&\
sudo apt-get update && sudo apt-get install yarn
# install npm
sudo npm install -g npm@latest
# install pm2
sudo npm install -g pm2
# import a file single file from github
sudo pm2 update

#ufw configuration
sudo ufw enable
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 22/tcp
sudo ufw allow 20
sudo ufw allow 21
sudo ufw allow 'Nginx Full'
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
sudo pm2 startup
sudo pm2 save
# certificate configuration
sudo apt install certbot python3-certbot-nginx
# create nginx configuration
cd Node-Deployment-Configuration
pm2 start auto_Updater.py
sudo cp NginxProxyRouter /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/NginxProxyRouter /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl enable nginx
sudo systemctl restart nginx
