#!/bin/bash

# Go to Home Directory
cd ~

# Directory Variables
GithubFrontendPATH="PaisaPay-Frontend" # Frontend Project Name
GithubBackendPATH="PaisaPay-Backend" # Backend Project Name
StaticDirectoryPATH="/var/www/html/PaisaPay" # Static Directory to check
StaticDirectoryName="PaisaPay" # Directory Name to check

# Git Link Variables
GithubFrontendLink="https://github.com/AnkanSaha/PaisaPay-Frontend.git" # Frontend Git Link
GithubBackendLink="https://github.com/AnkanSaha/PaisaPay-Backend.git" # Backend Git Link

# Check if PaisaPay-Frontend directory exists
if [ -d "$GithubFrontendPATH" ]; then
  # Delete PaisaPay-Frontend directory
  sudo rm -rf "$GithubFrontendPATH"
  echo "$GithubFrontendPATH directory deleted."
fi

# Check if PaisaPay-Backend directory exists
if [ -d "$GithubBackendPATH" ]; then
  # Delete PaisaPay-Backend directory
  rm -rf "$GithubBackendPATH"
  echo "$GithubBackendPATH directory deleted."
fi


# # Import All Required Files form Github
git clone $GithubBackendLink # PaisaPay Backend Project
git clone $GithubFrontendLink # PaisaPay Frontend Project

#Build Frontend
cd $GithubFrontendPATH # Go to PaisaPay Frontend Project Directory
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
    sudo mkdir "$DirectoryPATH" # Create Directory
    echo "Directory created." # Directory Created Message
fi

# Move Frontend to /var/www/html/PaisaPay
sudo mv "$StaticDirectoryName"/* "$StaticDirectoryPATH"/ # Move the Frontend App to the Directory

# Register All Environment Variables
cd # Go to Home Directory
cd ./"$GithubBackendPATH" # Go to PaisaPay Backend Project Directory
read -p "Enter MongoDB URL: " MONGODB_URL # Get MongoDB URL
read -p "Enter PORT Number: " PORT # Get PORT Number
read -p "Enter Live URL: " CORS_ORIGIN # Get Live URL for CORS

# Create .env file
echo "MONGODB_URL=$MONGODB_URL" >> .env # Write MongoDB URL to .env file
echo "PORT=$PORT" >> .env # Write PORT Number to .env file
echo "CORS_ORIGIN=$CORS_ORIGIN" >> .env # Write Live URL to .env file

# Permission to env file
sudo chmod 777 .env # Give Permission to .env file

# Start Backend
npm install # Install all dependencies
npm start # Start Backend
pm2 ls # List all running processes
#PM2
sudo  pm2 startup # Start PM2 on Boot
sudo pm2 save --force # Save the PM2 Process
