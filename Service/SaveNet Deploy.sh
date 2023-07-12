# Import All Files
cd # Go to Home Directory

git clone https://github.com/AnkanSaha/SaveNet.git # Clone the Repository

cd SaveNet # Go to the Repository

# Install All Dependencies
npm install

# Install Environment Variables
read -p "Enter the LIVE URL: " LIVE_URL # Get the LIVE URL
read -p "Enter MongoDB URL: " MONGODB_URL # Get the MongoDB URL
read -p "Enter PORT Number: " PORT # Get the PORT Number

# Create .env File
touch .env # Create .env File
echo "CORS_ORIGIN=$LIVE_URL" >> .env # Add LIVE_URL to .env File
echo "MONGO_URI=$MONGODB_URL" >> .env # Add MONGODB_URL to .env File
echo "PORT=$PORT" >> .env # Add PORT to .env File

# Start the Server
npm start # Start the Server

#PM2
sudo  pm2 startup # Start PM2 on Boot
sudo pm2 save # Save the PM2 Process
