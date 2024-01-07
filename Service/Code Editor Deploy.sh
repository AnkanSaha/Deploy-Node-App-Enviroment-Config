#!/bin/bash

# Go to Home Directory
cd ~

# Directory Variables
ClientFolder="client" # Frontend Project Name
ServerFolder="server" # Backend Project Name
StaticDirectoryPATH="/var/www/html/Code-Editor" # Static Directory to check
StaticDirectoryName="Code-Editor" # Directory Name to check

# Git Link Variables
GithubLink="https://github.com/AnkanSaha/Code-Editor.git" # PaisaPay Project Link

# Check if PaisaPay-Frontend directory exists
if [ -d "$StaticDirectoryName" ]; then
  # Delete PaisaPay-Frontend directory
  sudo rm -rf "$StaticDirectoryName"
  echo "$StaticDirectoryName directory deleted."
fi


# # Import All Required Files form Github
git clone $GithubLink # Clone PaisaPay Project from Github

#Build Frontend
cd "$StaticDirectoryName/$ClientFolder" # Go to PaisaPay Frontend Project Directory

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

# Move Frontend to /var/www/html/PaisaPay
sudo mv "$StaticDirectoryName"/* "$StaticDirectoryPATH"/ # Move the Frontend App to the Directory

# Register All Environment Variables
cd ~ # Go to Home Directory
cd "$StaticDirectoryName/$ServerFolder" # Go to PaisaPay Frontend Project Directory
npm install # Install all dependencies

# Create .env file
touch .env # Create .env File

# Get Environment Variables
read -p "Enter MongoDB URL: " MONGODB_URI # Get MongoDB URL
read -p "Enter MongoDB Database Name: " MONGODB_DB_NAME # Get MongoDB Database Name
read -p "Enter PORT Number: " PORT # Get PORT Number
read -p "Enter Live URL: " ALLOWED_ORIGINS # Get Live URL for CORS
read -p "Enter JWT Secret : " JWT_SECRET # Get JWT Secret
read -p "Enter JWT Expiry Time (ex: 1d, 1h, 1m, 1s): " JWT_EXPIRY_TIME # Get JWT Expiry Time
read -p "Enter IPINFO API KEY: " IPINFO_API_KEY # Get Razorpay Merchant ID
read -p "How Many Processes do you want to run? (ex: 1, 2, 3): " PROCESS_COUNT # Get Number of Processes to run

# Insert Environment Variables to .env file
echo "MONGODB_URI=$MONGODB_URI" >> .env # Write MongoDB URL to .env file
echo "DB_NAME=$MONGODB_DB_NAME" >> .env # Write MongoDB Database Name to .env file
echo "PORT=$PORT" >> .env # Write PORT Number to .env file
echo "ALLOWED_ORIGINS=$ALLOWED_ORIGINS" >> .env # Write Live URL to .env file
echo "JWT_SECRET=$JWT_SECRET" >> .env # Write JWT Secret to .env file
echo "JWT_EXPIRES_IN=$JWT_EXPIRES_IN" >> .env # Write JWT Expiry Time to .env file
echo "IPINFO_API_KEY=$IPINFO_API_KEY" >> .env # Write Razorpay Merchant ID to .env file
echo "CPU_COUNT_MULTIPLIERenv=$PROCESS_COUNT" >> .env # Write Number of Processes to run to .env file

# Start Backend
npm install # Install all dependencies

npm start # Start Backend
pm2 ls # List all running processes

#PM2
sudo  pm2 startup # Start PM2 on Boot
sudo pm2 save --force # Save the PM2 Process
