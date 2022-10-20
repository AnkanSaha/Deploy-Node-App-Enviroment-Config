#All Installs Commands #
sudo apt install -y git # install git

sudo apt install -y python3-pip # install pip

curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - &&\
sudo apt-get install -y nodejs #install Node.js 19.x

sudo apt install -y npm # install npm

sudo apt install python3 -y # install python3

sudo apt install nginx -y # install nginx

sudo npm install pm2 -g # install pm2

# install MongoDB Community Edition 5.0 for Ubuntu 20.04 #

wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add - # import the public key used by the package management system

sudo apt-get install gnupg # install gnupg

wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

sudo touch /etc/apt/sources.list.d/mongodb-org-6.0.list # create a file

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list # install MongoDB Community Edition 5.0 for Ubuntu 20.04

sudo apt-get update # update apt

sudo apt-get install -y mongodb-org # install MongoDB

#Set up MongoDB 5.0 to start automatically on boot and start the service
sudo systemctl start mongod # start MongoDB

sudo systemctl daemon-reload # reload daemon

sudo systemctl enable mongod # enable MongoDB

sudo systemctl stop mongod # stop MongoDB

sudo systemctl restart mongod # restart MongoDB

# NGINX #
#nginx Configuration
sudo touch /etc/nginx/sites-available/network # create a file
sudo nano /etc/nginx/sites-available/network # open the file
# paste the following code
server{
        server_name theankan.live;
    location / {
        proxy_pass http://localhost:5678;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
server{
        server_name data.theankan.live;
    location / {
        proxy_pass http://localhost:8000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
server{
        server_name video.theankan.live;
    location / {
        proxy_pass http://localhost:5500;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

server{
        server_name result.theankan.live;
    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
# save the file
ctl + x
y
enter
sudo ln-s /etc/nginx/sites-available/network /etc/nginx/sites-enabled/network # create a symbolic link

sudo systemctl restart nginx # restart nginx

#ufw Configuration
sudo ufw enable # enable ufw
sudo ufw allow 'Nginx Full' # allow Nginx Full

sudo ufw allow 'Ngix HTTP' # allow Nginx HTTP

sudo ufw allow 'Nginx HTTPS' # allow Nginx HTTPS

sudo ufw allow 22 # allow ssh


# install certbot
sudo apt-get install software-properties-common # install software-properties-common

sudo add-apt-repository universe # add universe

sudo add-apt-repository ppa:certbot/certbot # add certbot

sudo apt-get update # update apt

sudo apt-get install certbot python3-certbot-nginx # install certbot

sudo certbot --nginx # get certificate

# import Node Applications
git clone https://github.com/AnkanSaha/Video-Downloader.git # clone Video-Downloader

git clone https://github.com/AnkanSaha/Portfolio.git # clone Portfolio

git clone https://github.com/AnkanSaha/University-Result.git # clone University-Result

git clone https://github.com/AnkanSaha/DataStore.git # clone DataStore

# activate Node Applications
cd Video-Downloader # go to Video-Downloader
npm install # install dependencies
npm run deploy # deploy Video-Downloader application

cd ../Portfolio # go to Portfolio
npm install # install dependencies
npm run deploy # deploy Portfolio application

cd ../University-Result # go to University-Result
npm install # install dependencies
npm run deploy # deploy University-Result application

cd ../DataStore # go to DataStore
npm install # install dependencies
npm run deploy # deploy DataStore application