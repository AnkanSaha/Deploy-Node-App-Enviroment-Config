# Let's Copy Nginx Config File to the Nginx Config Folder
sudo cp 'Store Management App Nginx Router' /etc/nginx/sites-available/
# Let's Create a Symbolic Link to the Nginx Config Folder
sudo ln -s /etc/nginx/sites-available/'Store Management App Nginx Router' /etc/nginx/sites-enabled/
# Let's Test the Nginx Config File
sudo nginx -t
# Let's Restart the Nginx Service
sudo systemctl restart nginx
# Let's Import the Frontend App from Github
cd ../ # Go to the parent folder
git clone https://github.com/AnkanSaha/Store-Management-Frontend.git
cd Store-Management-Frontend/ # Go to Frontend Folder

# Let's build our Production ready version of the app
npm install # Install all the dependencies
npm run build # Build the Frontend App

# import the Backend App from Github
cd ../ # Go to the parent folder
git clone https://github.com/AnkanSaha/Store-Management-Backend.git

# Let's Build our Production ready version of Backend App
cd Store-Management-Backend/ # Go to Backend Folder
npm install # Install all the dependencies
npm run build # Build the Backend App

# Lets copy the build folder to the backend folder
cd ../Store-Management-Frontend # Go to Frontend Folder

# copy the build folder to the backend folder
sudo mv ./dist ../Store-Management-Backend/Build/public


# Create Enviromental variables File for the Backend App
cd ../Store-Management-Backend/Build # Go to Backend Folder
touch .env # Create the .env file
sudo chmod +rwx .env # Give the .env file the permission to read and write

# Add the enviromental variables to the .env file
read -p "Enter PORT Number (only value) To Run Backend APP: " PORT # Ask the user to enter the PORT
echo "STOREMANAGEMENTBACKENDPORT=$PORT" >> .env # Add the PORT to the .env file

read -p "Enter the MongoDB Database URL (only value): " DB_URL # Ask the user to enter the DB_URL
echo "STOREMANAGEMENTBACKENDMONGOURL=$DB_URL" >> .env # Add the DB_URL to the .env file

# Let's start the Backend App and serve the Frontend App
cd ../Store-Management-Backend/Build # Go to Backend Folder
npm run start # Start the Backend App
