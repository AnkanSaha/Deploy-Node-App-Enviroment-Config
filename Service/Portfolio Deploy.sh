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

# Write the .env file
touch .env # Create the .env file

# Insert the .env variables
read -p "Enter the value of PORT: " PORT # PORT
echo "PORT=$PORT" >> .env
read -p "Enter the value of MONGODB_URI: " MONGODB_URI # MONGODB_URI
echo "MONGODB_URI=$MONGODB_URI" >> .env
read -p "Enter Database Name: " DB_NAME # DB_NAME
echo "DB_NAME=$DB_NAME" >> .env

#PM2
sudo  pm2 startup # Start PM2 on Boot
sudo pm2 save --force # Save the PM2 Process
