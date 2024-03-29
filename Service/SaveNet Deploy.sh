#Global Variables
ServiceFolder="SaveNet" # Github Project Name
GithubLink="https://github.com/AnkanSaha/SaveNet.git"

# Import All Files
cd # Go to Home Directory

# Check if the Service Folder Exists
if [ -d "$ServiceFolder" ]; then
  # Delete the Service Folder
  sudo rm -rf "$ServiceFolder"
  echo "$ServiceFolder directory deleted."
fi

git clone $GithubLink # Clone the Repository

cd $ServiceFolder # Go to the Repository

# Install All Dependencies
npm install

# Install Environment Variables
read -p "Enter the LIVE URL: " LIVE_URL # Get the LIVE URL
read -p "Enter MongoDB URL: " MONGODB_URL # Get the MongoDB URL
read -p "Enter PORT Number: " PORT # Get the PORT Number
read -p "Enter Database Name: " DB_NAME # Get the Database Name

# Create .env File
touch .env # Create .env File
echo "CORS_ORIGIN=$LIVE_URL" >> .env # Add LIVE_URL to .env File
echo "MONGODB_URL=$MONGODB_URL" >> .env # Add MONGODB_URL to .env File
echo "PORT=$PORT" >> .env # Add PORT to .env File
echo "DB_NAME=$DB_NAME" >> .env # Add DB_NAME to .env File

# Start the Server
npm start # Start the Server

#PM2
sudo  pm2 startup # Start PM2 on Boot
sudo pm2 save --force # Save the PM2 Process
