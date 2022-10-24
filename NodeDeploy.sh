  # for ubuntu 20.04 LTS

# install packages for recuiement
sudo apt install -y git # git
sudo apt install -y nginx # nginx
sudo apt install -y curl # curl
sudo apt install -y python3 # python3
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
# NGINX Configuration for Ubuntu Server 20.04 LTS (Focal Fossa)
cd /etc/nginx/sites-available/ # go to nginx config
sudo touch network && sudo chmod 777 network # create file
echo "Give me the Nginx Configuration script" # print
read ConScript # read script from user
echo $ConScript > network # write script to file
sudo ln -s /etc/nginx/sites-available/network /etc/nginx/sites-enabled/ # create link
sudo systemctl restart nginx # restart 
sudo systemctl enable nginx # enable nginx
# install npm
sudo npm install -g npm@latest
# install pm2
sudo npm install pm2 -g
# clone project
git clone https://github.com/AnkanSaha/Portfolio.git
git clone https://github.com/AnkanSaha/University-Result.git
git clone https://github.com/AnkanSaha/DataStore.git
git clone https://github.com/AnkanSaha/Video-Downloader.git
# install project
cd Portfolio && npm install
cd ../University-Result && npm install
cd ../DataStore && npm install
cd ../Video-Downloader && npm install
# run project
cd ../Portfolio && npm deploy
cd ../University-Result && npm deploy
cd ../DataStore && npm deploy
cd ../Video-Downloader && npm deploy
#ufw configuration
sudo ufw enable
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 22/tcp
sudo ufw allow 20
sudo ufw allow 21