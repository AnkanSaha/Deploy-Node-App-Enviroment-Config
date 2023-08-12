# Let's Import the Frontend App from Github
# Go to Home Directory
cd ~

# Directory Variables
GithubFrontendPATH="Store-Management-Frontend"
GithubBackendPATH="Store-Management-Backend"
StaticDirectoryPATH="/var/www/html/StoreManagement" # Directory to check
StaticDirectoryName="StoreManagement" # Directory Name

# Git Link Variables
GithubFrontendLink="https://github.com/AnkanSaha/Store-Management-Frontend.git"
GithubBackendLink="https://github.com/AnkanSaha/Store-Management-Backend.git"

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

git clone $GithubFrontendLink # Import the Frontend App from Github
cd "$GithubFrontendPATH"/ # Go to Frontend Folder

# Let's build our Production ready version of the app
npm install # Install all the dependencies
npm run build # Build the Frontend App

# import the Backend App from Github
cd # Go to the parent folder
git clone $GithubBackendLink # Import the Backend App from Github

# Let's Build our Production ready version of Backend App
cd "$GithubBackendPATH"/ # Go to Backend Folder
npm install # Install all the dependencies
npm run build # Build the Backend App

# Lets copy the build folder to the backend folder
cd ../"$GithubFrontendPATH" # Go to Frontend Folder

# Move Frontend to /var/www/html/StoreManagement


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

# Move Frontend to /var/www/html/StoreManagement
sudo mv "$StaticDirectoryName"/* "$StaticDirectoryPATH" # Move the Frontend App to the Directory

# Let's start the Backend App and serve the Frontend App
cd ../"$GithubBackendPATH"/Build # Go to Backend Folder

# Create Enviromental variables File for the Backend App
touch .env # Create the .env file

# Add the enviromental variables to the .env file
read -p "Enter PORT Number (only value) To Run Backend APP: " PORT # Ask the user to enter the PORT
echo "STORE_MANAGEMENT_BACKEND_PORT=$PORT" >> .env # Add the PORT to the .env file

read -p "Enter the MongoDB Database URL (only value): " DB_URL # Ask the user to enter the DB_URL
echo "STORE_MANAGEMENT_BACKEND_MONGOURL=$DB_URL" >> .env # Add the DB_URL to the .env file

read -p "Enter the LIVE URL for CORS: " LIVE_URL # Ask the user to enter the LIVE_URL
echo "STORE_MANAGEMENT_LIVE_URL=$LIVE_URL" >> .env # Add the LIVE_URL to the .env file

read -p "Enter JWT Secret Key : " JWT_SECRET_KEY # Ask the user to enter the JWT_SECRET_KEY
echo "STORE_MANAGEMENT_JWT_SECRET=$JWT_SECRET_KEY" >> .env # Add the JWT_SECRET_KEY to the .env file

# Permission to env file
sudo chmod -w .env # Remove Write Permission from .env file

# Let's start the Backend App and serve the Frontend App
cd ../"$GithubBackendPATH"/Build # Go to Backend Folder
npm run start # Start the Backend App

# Let's Restart the Nginx Service
sudo systemctl restart nginx

#PM2
sudo  pm2 startup # Start PM2 on Boot
sudo pm2 save --force # Save the PM2 Process
