# Let's Import the Frontend App from Github
cd # Go to the parent folder
git clone https://github.com/AnkanSaha/Store-Management-Frontend.git
cd Store-Management-Frontend/ # Go to Frontend Folder

# Let's build our Production ready version of the app
npm install # Install all the dependencies
npm run build # Build the Frontend App

# import the Backend App from Github
cd # Go to the parent folder
git clone https://github.com/AnkanSaha/Store-Management-Backend.git

# Let's Build our Production ready version of Backend App
cd Store-Management-Backend/ # Go to Backend Folder
npm install # Install all the dependencies
npm run build # Build the Backend App

# Lets copy the build folder to the backend folder
cd ../Store-Management-Frontend # Go to Frontend Folder

# Move Frontend to /var/www/html/StoreManagement
DirectoryPATH="/var/www/html/StoreManagement" # Directory to check
DirectoryName="StoreManagement" # Directory Name

if [-d "$DirectoryPATH"] # Check if Directory Exists
then
    echo "Directory exists. Deleting..." # Directory Exists Message
    sudo rm -rf $DirectoryPATH # Remove Directory
    echo "Recreating Directory..." # Recreating Directory Message
    sudo mkdir $DirectoryPATH # Create Directory
    echo "Directory Recreated." # Directory Created Message
else
    echo "Directory does not exist. Creating..." # Directory Does Not Exist Message
    sudo mkdir $DirectoryPATH # Create Directory
    echo "Directory created." # Directory Created Message
fi
# Move Frontend to /var/www/html/StoreManagement
sudo mv ./dist/* $DirectoryPATH # Move the Frontend App to the Directory


# Create Enviromental variables File for the Backend App
cd ../Store-Management-Backend/Build # Go to Backend Folder
touch .env # Create the .env file
sudo chmod +rwx .env # Give the .env file the permission to read and write

# Add the enviromental variables to the .env file
read -p "Enter PORT Number (only value) To Run Backend APP: " PORT # Ask the user to enter the PORT
echo "STOREMANAGEMENTBACKENDPORT=$PORT" >> .env # Add the PORT to the .env file

read -p "Enter the MongoDB Database URL (only value): " DB_URL # Ask the user to enter the DB_URL
echo "STOREMANAGEMENTBACKENDMONGOURL=$DB_URL" >> .env # Add the DB_URL to the .env file

read -p "Enter the LIVE URL for CORS: " LIVE_URL # Ask the user to enter the LIVE_URL
echo "STORE_MANAGEMENT_LIVE_URL=$LIVE_URL" >> .env # Add the LIVE_URL to the .env file

read -p "Enter JWT Secret Key : " JWT_SECRET_KEY # Ask the user to enter the JWT_SECRET_KEY
echo"STORE_MANAGEMENT_JWT_SECRET=$JWT_SECRET_KEY" >> .env # Add the JWT_SECRET_KEY to the .env file

# Let's start the Backend App and serve the Frontend App
cd ../Store-Management-Backend/Build # Go to Backend Folder
npm run start # Start the Backend App

# Let's Restart the Nginx Service
sudo systemctl restart nginx
