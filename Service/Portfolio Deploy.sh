# Import From Git
cd # Go to root
git clone https://github.com/AnkanSaha/Portfolio.git # Clone the repo
cd Portfolio # Go to the repo
npm install # Install dependencies
npm run start # Start the server
#PM2
sudo  pm2 startup # Start PM2 on Boot
sudo pm2 save --force # Save the PM2 Process
