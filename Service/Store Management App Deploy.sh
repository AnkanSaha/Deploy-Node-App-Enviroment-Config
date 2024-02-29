#!/bin/bash

# Go to Home Directory
cd ~

# Directory Variables
ClientFolder="client" # Frontend Project Name
ServerFolder="server" # Backend Project Name
StaticDirectoryPATH="/var/www/html/Store-Management" # Static Directory to check
StaticDirectoryName="Store-Management" # Directory Name to check

# Git Link Variables
GithubLink="https://github.com/AnkanSaha/Store-Management.git" # Store Management Project Link

# Check if Store Management-Frontend directory exists
if [ -d "$StaticDirectoryName" ]; then
  # Delete Store Management-Frontend directory
  sudo rm -rf "$StaticDirectoryName"
  echo "$StaticDirectoryName directory deleted."
fi


# # Import All Required Files form Github
git clone $GithubLink # Clone Store Management Project from Github

#Build Frontend
cd "$StaticDirectoryName/$ClientFolder" # Go to Store Management Frontend Project Directory

# Start building Frontend App
npm install # Install all dependencies
npm run build # Build Frontend

# If Directory Exists then Remove Directory else Create Directory

if [ -d "$StaticDirectoryPATH" ]; then
    echo "Directory exists. Deleting..." # Directory Exists Message
    sudo rm -rf "$StaticDirectoryPATH" # Remove Directory
    echo "Recreating Directory..." # Recreating Directory Message
    sudo mkdir "$StaticDirectoryPATH" # Create Directory
    echo "Directory Recreated." # Directory Created Message
else
    echo "Directory does not exist. Creating..." # Directory Does Not Exist Message
    sudo mkdir "$StaticDirectoryPATH" # Create Directory
    echo "Directory created." # Directory Created Message
fi

# Move Frontend to /var/www/html/Store Management
sudo mv "$StaticDirectoryName"/* "$StaticDirectoryPATH"/ # Move the Frontend App to the Directory

# Register All Environment Variables
cd ~ # Go to Home Directory
cd "$StaticDirectoryName/$ServerFolder" # Go to Store Management Frontend Project Directory
npm install # Install all dependencies
npm run build # Build Backend

cd Build # Go to Build Directory

# Create Enviromental variables File for the Backend App
touch .env # Create the .env file

# Add the enviromental variables to the .env file
read -p "Enter PORT Number (only value) To Run Backend APP: " PORT # Ask the user to enter the PORT
echo "PORT=$PORT" >> .env # Add the PORT to the .env file

read -p "Enter the MongoDB Database URL (only value): " DB_URL # Ask the user to enter the DB_URL
echo "MONGODB_URL=$DB_URL" >> .env # Add the DB_URL to the .env file

read -p "Enter the LIVE URL for CORS: " LIVE_URL # Ask the user to enter the LIVE_URL
echo "CORS_ORIGIN=$LIVE_URL" >> .env # Add the LIVE_URL to the .env file

read -p "Enter JWT Secret Key : " JWT_SECRET_KEY # Ask the user to enter the JWT_SECRET_KEY
echo "JWT_SECRET=$JWT_SECRET_KEY" >> .env # Add the JWT_SECRET_KEY to the .env file

read -p "Enter Database Name: " DB_NAME # Ask the user to enter the DB_NAME
echo "DB_NAME=$DB_NAME" >> .env # Add the DB_NAME to the .env file

read -p "Enter How many workers you want to run: " WORKERS # Ask the user to enter the WORKERS
echo "CPU_COUNT_MULTIPLIERENV=$WORKERS" >>.env # Add the WORKERS to the.

# Start Backend
npm install # Install all dependencies

npm start # Start Backend
pm2 ls # List all running processes

#PM2
sudo  pm2 startup # Start PM2 on Boot
sudo pm2 save --force # Save the PM2 Process
