#variables
ProjectDir="Portfolio"
GithubLink="https://github.com/AnkanSaha/Portfolio.git"

# Import From Git
cd # Go to root

# Check if PaisaPay-Backend directory exists
if [ -d "$ProjectDir" ]; then
  # Delete PaisaPay-Backend directory
  rm -rf "$ProjectDir"
  echo "$ProjectDir directory deleted."
fi


git clone $GithubLink # Clone the repo

cd $ProjectDir # Go to the repo
npm install # Install dependencies
npm run start # Start the server
#PM2
sudo  pm2 startup # Start PM2 on Boot
sudo pm2 save --force # Save the PM2 Process
