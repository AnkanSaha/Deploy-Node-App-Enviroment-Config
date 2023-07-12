cd # Go to Home Directory
# # Import All Required Files form Github
git clone https://github.com/AnkanSaha/PaisaPay-Backend.git # PaisaPay Backend Project
git clone https://github.com/AnkanSaha/PaisaPay-Frontend.git # PaisaPay Frontend Project

#Build Frontend
cd PaisaPay-Frontend # Go to PaisaPay Frontend Project Directory
npm install # Install all dependencies
npm run build # Build Frontend

# If Directory Exists then Remove Directory else Create Directory
DirectoryPATH="/var/www/html/PaisaPay" # Directory to check
DirectoryName="PaisaPay" # Directory Name

if [ -d "$DirectoryPATH" ] # Check if Directory Exists
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
# Move Frontend to /var/www/html/PaisaPay
sudo mv $DirectoryName/* $DirectoryPATH # Move Frontend to /var/www/html/PaisaPay

# Register All Environment Variables
cd # Go to Home Directory
cd ./PaisaPay-Backend # Go to PaisaPay Backend Project Directory
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